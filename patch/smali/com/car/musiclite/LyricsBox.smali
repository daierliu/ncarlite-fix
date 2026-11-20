.class public Lcom/car/musiclite/LyricsBox;
.super Landroid/view/View;
.implements Ljava/lang/Runnable;
.source "LyricsBox.java"


# instance fields
.field bmp:Landroid/graphics/Bitmap;
.field cover:Landroid/widget/ImageView;
.field private ctx:Landroid/content/Context;
.field private curId:J
.field private curLine:I
.field private handler:Landroid/os/Handler;
.field private lines:[Ljava/lang/String;
.field msg:Ljava/lang/String;
.field private pendingId:J
.field private times:[I
.field private trans:Ljava/util/HashMap;
.field private pMain:Landroid/graphics/Paint;
.field private pGlow:Landroid/graphics/Paint;
.field private pNbr:Landroid/graphics/Paint;
.field private pTr:Landroid/graphics/Paint;
.field private pMsg:Landroid/graphics/Paint;


# static cache: survives in-place UI rebuild (theme switch) so lyrics + cover
# are restored instantly instead of re-fetching from network (no flash)
.field static sBmp:Landroid/graphics/Bitmap;
.field static sId:J
.field static sLine:I
.field static sLines:[Ljava/lang/String;
.field static sTimes:[I
.field static sTrans:Ljava/util/HashMap;
# word-level lyric cache (NetEase yrc): per row String[] of word tokens + int[] of [s0,d0,s1,d1,...]
.field static sPat:Ljava/util/regex/Pattern;
.field static sYChars:[[Ljava/lang/String;
.field static sYW:[[I
.field static sYRowStart:[I
.field static sYRowText:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/widget/ImageView;)V
    .locals 4

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/car/musiclite/LyricsBox;->ctx:Landroid/content/Context;

    iput-object p2, p0, Lcom/car/musiclite/LyricsBox;->cover:Landroid/widget/ImageView;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/car/musiclite/LyricsBox;->handler:Landroid/os/Handler;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/car/musiclite/LyricsBox;->curId:J

    const-string v0, "\u25cf"

    iput-object v0, p0, Lcom/car/musiclite/LyricsBox;->msg:Ljava/lang/String;

    # paints (density already carries the global UI scale, see MainActivity.initScale)
    new-instance v0, Landroid/graphics/Paint;

    const/16 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/car/musiclite/LyricsBox;->pMain:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    const/16 v1, 0x6

    invoke-direct {p0, v1}, Lcom/car/musiclite/LyricsBox;->dpF(I)F

    move-result v1

    const/4 v2, 0x0

    const v3, 0x51ffffff    # ~32% white, tight glow under the main text

    invoke-virtual {v0, v1, v2, v2, v3}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    new-instance v0, Landroid/graphics/Paint;

    const/16 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/car/musiclite/LyricsBox;->pGlow:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    const/16 v1, 0x10

    invoke-direct {p0, v1}, Lcom/car/musiclite/LyricsBox;->dpF(I)F

    move-result v1

    const/4 v2, 0x0

    const v3, 0x35ffffff    # ~21% white, wide halo pass

    invoke-virtual {v0, v1, v2, v2, v3}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    new-instance v0, Landroid/graphics/Paint;

    const/16 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/car/musiclite/LyricsBox;->pNbr:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    new-instance v0, Landroid/graphics/Paint;

    const/16 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/car/musiclite/LyricsBox;->pTr:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Paint;

    const/16 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/car/musiclite/LyricsBox;->pMsg:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method

# design-px -> physical px using the global scale carried in density
.method private dpF(I)F
    .locals 2

    invoke-virtual {p0}, Lcom/car/musiclite/LyricsBox;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    int-to-float v1, p1

    mul-float/2addr v1, v0

    return v1
.end method

# filter target: credits block ("作词 : xxx" etc.) sits at the song start (<15s)
# and always contains a colon; real lyric lines that early almost never do
.method private parse(Ljava/lang/String;)Z
    .locals 12

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const-string v11, "\n"

    invoke-virtual {p1, v11}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v10, 0x0

    :goto_loop
    array-length v5, v3

    if-ge v4, v5, :cond_loop_end

    aget-object v5, v3, v4

    # per-line temp list for multi-timestamp lines: [t1][t2]text
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    :groups
    const-string v6, "["

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :have_text

    const/16 v6, 0x5d

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-ltz v7, :goto_next

    const/4 v6, 0x1

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    add-int/lit8 v6, v7, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    # [offset:ms] meta tag
    const-string v6, "offset:"

    invoke-virtual {v8, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :try_time

    :try_off
    const/4 v6, 0x7

    invoke-virtual {v8, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    add-int/2addr v10, v6

    :off_ok
    goto :groups

    :off_bad
    goto :goto_next

    :try_time
    const/16 v6, 0x3a

    invoke-virtual {v8, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v9

    if-ltz v9, :goto_next

    :try_tm
    const/4 v6, 0x0

    invoke-virtual {v8, v6, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    add-int/lit8 v7, v9, 0x1

    invoke-virtual {v8, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v7

    const/high16 v11, 0x447a0000    # 1000.0f

    mul-float/2addr v7, v11

    float-to-int v7, v7

    const/16 v8, 0xea60

    mul-int v8, v6, v8

    add-int/2addr v8, v7

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :tm_ok
    goto :groups

    :tm_bad
    goto :goto_next

    :have_text
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :goto_next

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-nez v6, :have_times

    goto :goto_next

    :have_times
    # credits filter: first timestamp < 15s and text contains a colon -> skip line
    const/4 v7, 0x0

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v8

    const/16 v6, 0x3a98    # 15000

    if-ge v8, v6, :gt_filter_ok

    const/16 v6, 0x3a      # ':'

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v11

    if-gez v11, :gt_filter_full

    goto :goto_next

    :gt_filter_full
    const v6, 0xff1a       # '\uff1a'

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v11

    if-gez v11, :gt_filter_ok

    goto :goto_next

    :gt_filter_ok
    const/4 v7, 0x0

    :gt_loop
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v7, v8, :goto_next

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    add-int/2addr v8, v10

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v7, v7, 0x1

    goto :gt_loop

    :goto_next
    add-int/lit8 v4, v4, 0x1

    goto :goto_loop

    :cond_loop_end
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_has

    const/4 v0, 0x0

    return v0

    :cond_has
    new-array v4, v3, [I

    iput-object v4, p0, Lcom/car/musiclite/LyricsBox;->times:[I

    new-array v4, v3, [Ljava/lang/String;

    iput-object v4, p0, Lcom/car/musiclite/LyricsBox;->lines:[Ljava/lang/String;

    const/4 v5, 0x0

    :goto_arr
    if-ge v5, v3, :cond_arr_end

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    iget-object v7, p0, Lcom/car/musiclite/LyricsBox;->times:[I

    aput v6, v7, v5

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    iget-object v7, p0, Lcom/car/musiclite/LyricsBox;->lines:[Ljava/lang/String;

    aput-object v6, v7, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_arr

    :cond_arr_end
    # sort by time ascending (some LRC files are out of order -> sync picks the wrong line)
    const/4 v5, 0x1

    :sort_i
    if-ge v5, v3, :sort_done

    iget-object v6, p0, Lcom/car/musiclite/LyricsBox;->times:[I

    aget v6, v6, v5

    iget-object v7, p0, Lcom/car/musiclite/LyricsBox;->lines:[Ljava/lang/String;

    aget-object v7, v7, v5

    add-int/lit8 v8, v5, -0x1

    :sort_j
    if-ltz v8, :sort_put

    iget-object v9, p0, Lcom/car/musiclite/LyricsBox;->times:[I

    aget v9, v9, v8

    if-le v9, v6, :sort_put

    add-int/lit8 v11, v8, 0x1

    iget-object v10, p0, Lcom/car/musiclite/LyricsBox;->times:[I

    aput v9, v10, v11

    iget-object v10, p0, Lcom/car/musiclite/LyricsBox;->lines:[Ljava/lang/String;

    aget-object v9, v10, v8

    aput-object v9, v10, v11

    add-int/lit8 v8, v8, -0x1

    goto :sort_j

    :sort_put
    add-int/lit8 v9, v8, 0x1

    iget-object v10, p0, Lcom/car/musiclite/LyricsBox;->times:[I

    aput v6, v10, v9

    iget-object v10, p0, Lcom/car/musiclite/LyricsBox;->lines:[Ljava/lang/String;

    aput-object v7, v10, v9

    add-int/lit8 v5, v5, 0x1

    goto :sort_i

    :sort_done
    const/4 v0, 0x1

    return v0

    .catch Ljava/lang/Throwable; {:try_off .. :off_ok} :off_bad
    .catch Ljava/lang/Throwable; {:try_tm .. :tm_ok} :tm_bad
.end method

# translation LRC (tlyric.lyric from /api/song/lyric) -> map time(ms) -> text
.method private parseTrans(Ljava/lang/String;)V
    .locals 10

    if-eqz p1, :t_ret

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "\n"

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    :t_line
    array-length v3, v1

    if-ge v2, v3, :t_store

    aget-object v3, v1, v2

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    :t_groups
    const-string v5, "["

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :t_have

    const/16 v5, 0x5d

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    if-ltz v6, :t_next

    const/4 v5, 0x1

    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    add-int/lit8 v5, v6, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    :t_try
    const/16 v5, 0x3a

    invoke-virtual {v7, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    if-ltz v8, :t_next

    const/4 v5, 0x0

    invoke-virtual {v7, v5, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v6, v8, 0x1

    invoke-virtual {v7, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v6

    const/high16 v7, 0x447a0000    # 1000.0f

    mul-float/2addr v6, v7

    float-to-int v6, v6

    const/16 v7, 0xea60

    mul-int/2addr v5, v7

    add-int/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :t_ok
    goto :t_groups

    :t_bad
    goto :t_next

    :t_have
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :t_next

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-nez v5, :t_put

    goto :t_next

    :t_put
    const/4 v5, 0x0

    :t_put_loop
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v5, v6, :t_next

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v0, v6, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v5, v5, 0x1

    goto :t_put_loop

    :t_next
    add-int/lit8 v2, v2, 0x1

    goto :t_line

    :t_store
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v1

    if-lez v1, :t_ret

    iput-object v0, p0, Lcom/car/musiclite/LyricsBox;->trans:Ljava/util/HashMap;

    :t_ret
    return-void

    .catch Ljava/lang/Throwable; {:t_try .. :t_ok} :t_bad
.end method

.method private postRender()V
    .locals 3

    new-instance v0, Lcom/car/musiclite/LyricsBox$Render;

    invoke-direct {v0, p0}, Lcom/car/musiclite/LyricsBox$Render;-><init>(Lcom/car/musiclite/LyricsBox;)V

    iget-object v1, p0, Lcom/car/musiclite/LyricsBox;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

# 7-row window around the current line; current row white/bold/1.3x with the
# translation underneath, neighbors fade out by distance (Apple-style)
.method private renderCore()V
    .locals 0

    invoke-virtual {p0}, Lcom/car/musiclite/LyricsBox;->postInvalidate()V

    return-void
.end method


.method private sync(I)V
    .locals 6

    iget-object v0, p0, Lcom/car/musiclite/LyricsBox;->times:[I

    if-eqz v0, :cond_ret

    array-length v0, v0

    if-nez v0, :goto_go

    :cond_ret
    return-void

    :goto_go
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_scan
    iget-object v3, p0, Lcom/car/musiclite/LyricsBox;->times:[I

    array-length v3, v3

    if-ge v1, v3, :cond_scan_end

    iget-object v3, p0, Lcom/car/musiclite/LyricsBox;->times:[I

    aget v3, v3, v1

    if-le v3, p1, :goto_next_i

    goto :cond_scan_end

    :goto_next_i
    move v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_scan

    :cond_scan_end
    # diagnostic log: pos / curLine / total
    const-string v0, "MusicLite.Lyric"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "pos="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " line="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/car/musiclite/LyricsBox;->times:[I

    array-length v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " id="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v4, p0, Lcom/car/musiclite/LyricsBox;->curId:J

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget v3, p0, Lcom/car/musiclite/LyricsBox;->curLine:I

    if-eq v2, v3, :cond_same

    iput v2, p0, Lcom/car/musiclite/LyricsBox;->curLine:I

    # only persist the line while the playing song matches the cached one
    iget-wide v0, p0, Lcom/car/musiclite/LyricsBox;->curId:J

    sget-wide v3, Lcom/car/musiclite/LyricsBox;->sId:J

    cmp-long v5, v0, v3

    if-nez v5, :cond_sline_skip

    sput v2, Lcom/car/musiclite/LyricsBox;->sLine:I

    :cond_sline_skip
    invoke-direct {p0}, Lcom/car/musiclite/LyricsBox;->renderCore()V

    :cond_same
    return-void
.end method


# virtual methods
.method public feed(JI)V
    .locals 5

    const-wide/16 v3, 0x0

    cmp-long v0, p1, v3

    if-lez v0, :cond_nosong

    iget-wide v0, p0, Lcom/car/musiclite/LyricsBox;->curId:J

    cmp-long v0, p1, v0

    if-eqz v0, :goto_sync

    iput-wide p1, p0, Lcom/car/musiclite/LyricsBox;->curId:J

    iput-wide p1, p0, Lcom/car/musiclite/LyricsBox;->pendingId:J

    # in-place UI rebuild: same song still cached -> restore instantly, no reload flash
    sget-wide v0, Lcom/car/musiclite/LyricsBox;->sId:J

    cmp-long v0, v0, p1

    if-nez v0, :no_cache

    sget-object v0, Lcom/car/musiclite/LyricsBox;->sTimes:[I

    if-eqz v0, :no_cache

    iput-object v0, p0, Lcom/car/musiclite/LyricsBox;->times:[I

    sget-object v0, Lcom/car/musiclite/LyricsBox;->sLines:[Ljava/lang/String;

    iput-object v0, p0, Lcom/car/musiclite/LyricsBox;->lines:[Ljava/lang/String;

    sget v0, Lcom/car/musiclite/LyricsBox;->sLine:I

    iput v0, p0, Lcom/car/musiclite/LyricsBox;->curLine:I

    sget-object v0, Lcom/car/musiclite/LyricsBox;->sTrans:Ljava/util/HashMap;

    iput-object v0, p0, Lcom/car/musiclite/LyricsBox;->trans:Ljava/util/HashMap;

    invoke-direct {p0}, Lcom/car/musiclite/LyricsBox;->postRender()V

    sget-object v0, Lcom/car/musiclite/LyricsBox;->sBmp:Landroid/graphics/Bitmap;

    if-eqz v0, :cache_ret

    iget-object v1, p0, Lcom/car/musiclite/LyricsBox;->cover:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cache_ret
    return-void

    :no_cache
    const/4 v0, 0x0

    iput v0, p0, Lcom/car/musiclite/LyricsBox;->curLine:I

    iput-object v0, p0, Lcom/car/musiclite/LyricsBox;->times:[I

    iput-object v0, p0, Lcom/car/musiclite/LyricsBox;->lines:[Ljava/lang/String;

    iput-object v0, p0, Lcom/car/musiclite/LyricsBox;->trans:Ljava/util/HashMap;

    # drop any word-level data of the previous song
    sput-object v0, Lcom/car/musiclite/LyricsBox;->sYChars:[[Ljava/lang/String;

    sput-object v0, Lcom/car/musiclite/LyricsBox;->sYW:[[I

    # diag: log every (re)load trigger
    const-string v0, "MusicLite.Lyric"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "reload sid="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "\u6b4c\u8bcd\u52a0\u8f7d\u4e2d\u2026"

    iput-object v0, p0, Lcom/car/musiclite/LyricsBox;->msg:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/car/musiclite/LyricsBox;->postInvalidate()V

    iget-object v0, p0, Lcom/car/musiclite/LyricsBox;->cover:Landroid/widget/ImageView;

    if-eqz v0, :cond_nocov

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_nocov
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void

    :goto_sync
    invoke-direct {p0, p3}, Lcom/car/musiclite/LyricsBox;->sync(I)V

    :cond_ret
    return-void

    :cond_nosong
    # keep current lyrics if we already loaded a song (sid may drop out briefly)
    iget-wide v3, p0, Lcom/car/musiclite/LyricsBox;->curId:J

    const-wide/16 v1, 0x0

    cmp-long v0, v3, v1

    if-eqz v0, :cond_show_none

    goto :cond_ret

    :cond_show_none
    const-string v0, "\u672a\u5728\u64ad\u653e"

    iput-object v0, p0, Lcom/car/musiclite/LyricsBox;->msg:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/car/musiclite/LyricsBox;->postInvalidate()V

    iget-object v0, p0, Lcom/car/musiclite/LyricsBox;->cover:Landroid/widget/ImageView;

    if-eqz v0, :cond_ret

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :cond_ret
.end method

.method public render()V
    .locals 0

    invoke-direct {p0}, Lcom/car/musiclite/LyricsBox;->renderCore()V

    return-void
.end method

.method public run()V
    .locals 6

    # ============ lyrics: POST /api/song/lyric {id, lv:-1, kv:-1, tv:-1, rv:-1} ============
    :try_start_a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{\"id\":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/car/musiclite/LyricsBox;->pendingId:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ",\"lv\":-1,\"kv\":-1,\"tv\":-1,\"rv\":-1,\"yv\":-1}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v0, p0, Lcom/car/musiclite/LyricsBox;->ctx:Landroid/content/Context;

    invoke-static {v0}, Lcom/car/musiclite/Api;->get(Landroid/content/Context;)Lcom/car/musiclite/Api;

    move-result-object v0

    if-eqz v0, :goto_cover

    const-string v2, "/song/lyric"

    invoke-virtual {v0, v2, v1}, Lcom/car/musiclite/Api;->post(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    if-eqz v5, :goto_cover

    const-string v1, "lrc"

    invoke-virtual {v5, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "lyric"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/car/musiclite/LyricsBox;->parse(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :goto_cover

    # word-level lyrics (yrc) - optional, failure must not block rendering
    :try_start_y
    const-string v1, "yrc"

    invoke-virtual {v5, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :y_done

    const-string v2, "lyric"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/car/musiclite/LyricsBox;->parseYrc(Ljava/lang/String;)V

    # yrc rows override the LRC row timeline (word-level rows are the same lines)
    sget-object v1, Lcom/car/musiclite/LyricsBox;->sYChars:[[Ljava/lang/String;

    if-eqz v1, :y_done

    array-length v1, v1

    if-lez v1, :y_done

    sget-object v1, Lcom/car/musiclite/LyricsBox;->sYRowStart:[I

    iput-object v1, p0, Lcom/car/musiclite/LyricsBox;->times:[I

    sget-object v1, Lcom/car/musiclite/LyricsBox;->sYRowText:[Ljava/lang/String;

    iput-object v1, p0, Lcom/car/musiclite/LyricsBox;->lines:[Ljava/lang/String;

    :y_done
    :try_end_y
    .catch Ljava/lang/Throwable; {:try_start_y .. :try_end_y} :goto_catch_a

    # persist for in-place rebuilds (theme switch restores without refetch)
    iget-wide v1, p0, Lcom/car/musiclite/LyricsBox;->pendingId:J

    sput-wide v1, Lcom/car/musiclite/LyricsBox;->sId:J

    iget-object v1, p0, Lcom/car/musiclite/LyricsBox;->times:[I

    sput-object v1, Lcom/car/musiclite/LyricsBox;->sTimes:[I

    iget-object v1, p0, Lcom/car/musiclite/LyricsBox;->lines:[Ljava/lang/String;

    sput-object v1, Lcom/car/musiclite/LyricsBox;->sLines:[Ljava/lang/String;

    iget v1, p0, Lcom/car/musiclite/LyricsBox;->curLine:I

    sput v1, Lcom/car/musiclite/LyricsBox;->sLine:I

    # translation (tlyric) - optional, failure must not block rendering
    :try_start_t
    const-string v1, "tlyric"

    invoke-virtual {v5, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :t_done

    const-string v2, "lyric"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/car/musiclite/LyricsBox;->parseTrans(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/car/musiclite/LyricsBox;->trans:Ljava/util/HashMap;

    sput-object v1, Lcom/car/musiclite/LyricsBox;->sTrans:Ljava/util/HashMap;

    :t_done
    :try_end_t
    .catch Ljava/lang/Throwable; {:try_start_t .. :try_end_t} :goto_catch_t

    # re-anchor translation keys to the yrc row timeline (after tlyric parsed)
    sget-object v1, Lcom/car/musiclite/LyricsBox;->sYChars:[[Ljava/lang/String;

    if-eqz v1, :skip_anchor

    invoke-direct {p0}, Lcom/car/musiclite/LyricsBox;->anchorTrans()V

    :skip_anchor
    goto :goto_render

    :goto_catch_t
    move-exception v1

    :goto_render
    invoke-direct {p0}, Lcom/car/musiclite/LyricsBox;->postRender()V
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :goto_catch_a

    goto :goto_cover

    :goto_catch_a
    move-exception v0

    # ============ cover ============
    :goto_cover
    :try_start_b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{\"ids\":\"["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/car/musiclite/LyricsBox;->pendingId:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "]\"}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v0, p0, Lcom/car/musiclite/LyricsBox;->ctx:Landroid/content/Context;

    invoke-static {v0}, Lcom/car/musiclite/Api;->get(Landroid/content/Context;)Lcom/car/musiclite/Api;

    move-result-object v0

    if-eqz v0, :cond_cover_end

    const-string v2, "/song/detail"

    invoke-virtual {v0, v2, v1}, Lcom/car/musiclite/Api;->post(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_cover_end

    const-string v1, "songs"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "al"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_try_album

    goto :goto_have_al

    :cond_try_album
    const-string v1, "album"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    :goto_have_al
    if-eqz v1, :cond_cover_end

    const-string v2, "picUrl"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_cover_end

    const-string v2, "http://"

    const-string v3, "https://"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    const-string v2, "User-Agent"

    const-string v3, "Mozilla/5.0 (Linux; Android 9; MI 10) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36"

    invoke-virtual {v1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x2710

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    iput-object v3, p0, Lcom/car/musiclite/LyricsBox;->bmp:Landroid/graphics/Bitmap;

    sput-object v3, Lcom/car/musiclite/LyricsBox;->sBmp:Landroid/graphics/Bitmap;

    new-instance v2, Lcom/car/musiclite/LyricsBox$Cover;

    invoke-direct {v2, p0}, Lcom/car/musiclite/LyricsBox$Cover;-><init>(Lcom/car/musiclite/LyricsBox;)V

    iget-object v3, p0, Lcom/car/musiclite/LyricsBox;->handler:Landroid/os/Handler;

    invoke-virtual {v3, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_b
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_b} :goto_catch_b

    return-void

    :goto_catch_b
    move-exception v0

    :cond_cover_end
    return-void
.end method


.method public static constructor <clinit>()V
    .locals 1

    const-string v0, "\\((\\d+),(\\d+),\\d+\\)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/car/musiclite/LyricsBox;->sPat:Ljava/util/regex/Pattern;

    return-void
.end method

# ---- extract words of one yrc row. returns joined row text, null = skip ----
# every failure path returns directly from its own label (no cross-type merges)
# ---- parseInt wrapper: returns -1 on failure (keeps parseRow free of try/catch) ----
.method private static safeParseInt(Ljava/lang/String;)I
    .locals 2

.catch Ljava/lang/Throwable; {:ts .. :te} :te
    :ts
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0

    :te
    move-exception v1

    const/4 v0, -0x1

    return v0
.end method

.method private static parseRow(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;I)Ljava/lang/String;
    .locals 8

    const/16 v0, 0x5d

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :f0

    add-int/lit8 v0, v0, 0x1    # prev = after ']'

    sget-object v1, Lcom/car/musiclite/LyricsBox;->sPat:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    :wfind
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :wdone

    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/car/musiclite/LyricsBox;->safeParseInt(Ljava/lang/String;)I

    move-result v4

    if-ltz v4, :f1

    const/4 v5, 0x2

    invoke-virtual {v1, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/car/musiclite/LyricsBox;->safeParseInt(Ljava/lang/String;)I

    move-result v5

    if-ltz v5, :f2

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->start()I

    move-result v6

    invoke-virtual {p0, v0, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :no_word

    invoke-virtual {p1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {p3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :no_word
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->end()I

    move-result v0

    goto :wfind

    :wdone
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {p0, v0, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lez v6, :f3

    const/16 v6, 0x3a98

    if-ge p4, v6, :r_join

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0x3a

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    if-gez v6, :f4

    :r_join
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :f0
    const/4 v0, 0x0

    return-object v0

    :f1
    const/4 v0, 0x0

    return-object v0

    :f2
    const/4 v0, 0x0

    return-object v0

    :f3
    const/4 v0, 0x0

    return-object v0

    :f4
    const/4 v0, 0x0

    return-object v0
.end method

# ---- int[] {s0,d0,s1,d1,...} from two Integer lists ----
.method private packPairs(Ljava/util/ArrayList;Ljava/util/ArrayList;)[I
    .locals 7

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    shl-int/lit8 v0, v0, 0x1

    new-array v1, v0, [I

    const/4 v2, 0x0

    :lp
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :done

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    shl-int/lit8 v6, v2, 0x1

    aput v4, v1, v6

    add-int/lit8 v6, v6, 0x1

    aput v5, v1, v6

    add-int/lit8 v2, v2, 0x1

    goto :lp

    :done
    return-object v1
.end method

# ---- yrc -> word arrays ----
.method private parseYrc(Ljava/lang/String;)V
    .locals 13

    const/4 v0, 0x0

    sput-object v0, Lcom/car/musiclite/LyricsBox;->sYChars:[[Ljava/lang/String;

    sput-object v0, Lcom/car/musiclite/LyricsBox;->sYW:[[I

    sput-object v0, Lcom/car/musiclite/LyricsBox;->sYRowStart:[I

    sput-object v0, Lcom/car/musiclite/LyricsBox;->sYRowText:[Ljava/lang/String;

    if-eqz p1, :p_end

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    const-string v4, "\n"

    invoke-virtual {p1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    :row_loop
    array-length v6, v4

    if-ge v5, v6, :rows_done

    aget-object v6, v4, v5

    add-int/lit8 v5, v5, 0x1

    const/16 v7, 0x5b

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-ltz v7, :norm_loop

    const/16 v8, 0x2c

    invoke-virtual {v6, v8, v7}, Ljava/lang/String;->indexOf(II)I

    move-result v8

    if-ltz v8, :norm_loop

    const/16 v9, 0x5d

    invoke-virtual {v6, v9, v8}, Ljava/lang/String;->indexOf(II)I

    move-result v9

    if-ltz v9, :norm_loop

    add-int/lit8 v10, v7, 0x1

    invoke-virtual {v6, v10, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

.catch Ljava/lang/Throwable; {:ps .. :xs} :xs
    :ps
    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    goto :pk
    :xs
    move-exception v11

    const/4 v11, 0x0

    goto :norm_loop
    :pk
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-static/range {v6 .. v10}, Lcom/car/musiclite/LyricsBox;->parseRow(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;I)Ljava/lang/String;

    move-result-object v11

    if-eqz v11, :norm_loop

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-lez v12, :norm_loop

    new-array v12, v12, [Ljava/lang/String;

    invoke-virtual {v7, v12}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v12

    check-cast v12, [Ljava/lang/String;

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-direct {p0, v8, v9}, Lcom/car/musiclite/LyricsBox;->packPairs(Ljava/util/ArrayList;Ljava/util/ArrayList;)[I

    move-result-object v12

    invoke-virtual {v1, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v2, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v3, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :norm_loop
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    goto :row_loop

    :rows_done
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :p_end

    new-array v6, v5, [I

    const/4 v7, 0x0

    :frs
    if-ge v7, v5, :frs_done

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    aput v8, v6, v7

    add-int/lit8 v7, v7, 0x1

    goto :frs

    :frs_done
    new-array v8, v5, [[Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [[Ljava/lang/String;

    new-array v9, v5, [[I

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [[I

    new-array v10, v5, [Ljava/lang/String;

    invoke-virtual {v3, v10}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Ljava/lang/String;

    sput-object v8, Lcom/car/musiclite/LyricsBox;->sYChars:[[Ljava/lang/String;

    sput-object v9, Lcom/car/musiclite/LyricsBox;->sYW:[[I

    sput-object v6, Lcom/car/musiclite/LyricsBox;->sYRowStart:[I

    sput-object v10, Lcom/car/musiclite/LyricsBox;->sYRowText:[Ljava/lang/String;

    return-void

    :p_end
    return-void
.end method

# ---- translation lookup by row time ----
.method private transAt(I)Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcom/car/musiclite/LyricsBox;->trans:Ljava/util/HashMap;

    if-eqz v0, :ret_n

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    :ret_n
    const/4 v0, 0x0

    return-object v0
.end method

# ---- re-anchor translation keys from LRC timeline to yrc row timeline ----
.method private anchorTrans()V
    .locals 14

    iget-object v0, p0, Lcom/car/musiclite/LyricsBox;->trans:Ljava/util/HashMap;

    if-eqz v0, :a_ret

    sget-object v1, Lcom/car/musiclite/LyricsBox;->sYRowStart:[I

    if-eqz v1, :a_ret

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    array-length v3, v1

    const/4 v4, 0x0

    :row_loop
    if-ge v4, v3, :rows_done

    aget v5, v1, v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    const/4 v10, -0x1        # best key (int)

    const v11, 0x7fffffff    # best diff (int)

    :it_loop
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :it_done

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    sub-int v8, v7, v5

    if-ltz v8, :abs_d

    neg-int v8, v8

    :abs_d
    const/16 v9, 0x78

    if-gt v8, v9, :it_loop

    if-ge v8, v11, :it_loop

    move v11, v8

    move v10, v7

    goto :it_loop

    :it_done
    if-ltz v10, :row_norm

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    if-eqz v12, :row_norm2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v7, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v12, 0x0

    goto :row_loop

    :row_norm2
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v12, 0x0

    goto :row_loop

    :row_norm
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v12, 0x0

    goto :row_loop

    :rows_done
    iput-object v2, p0, Lcom/car/musiclite/LyricsBox;->trans:Ljava/util/HashMap;

    sput-object v2, Lcom/car/musiclite/LyricsBox;->sTrans:Ljava/util/HashMap;

    :a_ret
    return-void
.end method

# ---- current row renderer: word-level if yrc exists, else whole-line ----
.method private drawCurRow(Landroid/graphics/Canvas;III)V
    .locals 10

    sget-object v0, Lcom/car/musiclite/LyricsBox;->sYChars:[[Ljava/lang/String;

    if-eqz v0, :plain

    array-length v1, v0

    if-ltz p2, :plain

    if-ge p2, v1, :plain

    aget-object v0, v0, p2

    sget-object v1, Lcom/car/musiclite/LyricsBox;->sYW:[[I

    if-eqz v1, :plain

    array-length v2, v1

    if-ge p2, v2, :plain

    aget-object v1, v1, p2

    if-eqz v1, :plain

    const/16 v2, 0x1e

    invoke-direct {p0, v2}, Lcom/car/musiclite/LyricsBox;->dpF(I)F

    move-result v2

    iget-object v3, p0, Lcom/car/musiclite/LyricsBox;->pMain:Landroid/graphics/Paint;

    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v3, p0, Lcom/car/musiclite/LyricsBox;->pGlow:Landroid/graphics/Paint;

    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    # baseline (v9) = (float)cy + size*0.35
    const v9, 0x3eb33333    # 0.35f

    mul-float/2addr v2, v9

    int-to-float v9, p3

    add-float/2addr v9, v2

    const/4 v2, 0x0          # total width (float)

    const/4 v3, 0x0          # i

    :mt
    array-length v4, v0

    if-ge v3, v4, :mt_done

    aget-object v4, v0, v3

    iget-object v5, p0, Lcom/car/musiclite/LyricsBox;->pMain:Landroid/graphics/Paint;

    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v4

    add-float/2addr v2, v4

    add-int/lit8 v3, v3, 0x1

    goto :mt

    :mt_done
    invoke-virtual {p0}, Lcom/car/musiclite/LyricsBox;->getWidth()I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x3f000000

    mul-float/2addr v3, v4

    mul-float/2addr v2, v4

    sub-float v3, v3, v2      # x cursor

    const/4 v4, 0x0

    :wd
    array-length v5, v0

    if-ge v4, v5, :wd_done

    aget-object v5, v0, v4

    shl-int/lit8 v6, v4, 0x1

    aget v6, v1, v6           # word start (ms)

    const/16 v7, 0xff

    if-lt p4, v6, :unp

    goto :set_a
    :unp
    const/16 v7, 0x73
    :set_a
    iget-object v8, p0, Lcom/car/musiclite/LyricsBox;->pMain:Landroid/graphics/Paint;

    invoke-virtual {v8, v7}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v8, p0, Lcom/car/musiclite/LyricsBox;->pGlow:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v3, v9, v8}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget-object v8, p0, Lcom/car/musiclite/LyricsBox;->pMain:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v3, v9, v8}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget-object v8, p0, Lcom/car/musiclite/LyricsBox;->pMain:Landroid/graphics/Paint;

    invoke-virtual {v8, v5}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v8

    add-float/2addr v3, v8

    add-int/lit8 v4, v4, 0x1

    goto :wd

    :wd_done
    const/4 v4, 0x0

    aget v4, v1, v4

    invoke-direct {p0, v4}, Lcom/car/musiclite/LyricsBox;->transAt(I)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :r_null

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :r_null

    iget-object v5, p0, Lcom/car/musiclite/LyricsBox;->pTr:Landroid/graphics/Paint;

    const/16 v6, 0x11

    invoke-direct {p0, v6}, Lcom/car/musiclite/LyricsBox;->dpF(I)F

    move-result v6

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setTextSize(F)V

    const/16 v6, 0xa0

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    sget-object v6, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    invoke-virtual {v5}, Landroid/graphics/Paint;->getTextSize()F

    move-result v6

    const/high16 v7, 0x40000000

    mul-float/2addr v6, v7

    add-float/2addr v6, v9

    invoke-virtual {p0}, Lcom/car/musiclite/LyricsBox;->getWidth()I

    move-result v7

    int-to-float v7, v7

    const/high16 v8, 0x3f000000

    mul-float/2addr v7, v8

    invoke-virtual {p1, v4, v7, v6, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void

    :r_null
    return-void

    :plain
    iget-object v0, p0, Lcom/car/musiclite/LyricsBox;->lines:[Ljava/lang/String;

    if-eqz v0, :pr1

    array-length v1, v0

    if-ltz p2, :pr2

    if-ge p2, v1, :pr2

    aget-object v0, v0, p2

    const/16 v1, 0x1e

    invoke-direct {p0, v1}, Lcom/car/musiclite/LyricsBox;->dpF(I)F

    move-result v2

    iget-object v3, p0, Lcom/car/musiclite/LyricsBox;->pMain:Landroid/graphics/Paint;

    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v4, p0, Lcom/car/musiclite/LyricsBox;->pGlow:Landroid/graphics/Paint;

    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    const v5, 0x3eb33333

    mul-float/2addr v2, v5

    # baseline = (float)cy + size*0.35 (v9)
    int-to-float v9, p3

    add-float/2addr v9, v2

    sget-object v5, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    invoke-virtual {p0}, Lcom/car/musiclite/LyricsBox;->getWidth()I

    move-result v5

    int-to-float v5, v5

    const/high16 v6, 0x3f000000

    mul-float/2addr v5, v6

    invoke-virtual {p1, v0, v5, v9, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    invoke-virtual {p1, v0, v5, v9, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget-object v0, p0, Lcom/car/musiclite/LyricsBox;->times:[I

    if-eqz v0, :pr3

    array-length v1, v0

    if-ltz p2, :pr4

    if-ge p2, v1, :pr4

    aget v0, v0, p2

    invoke-direct {p0, v0}, Lcom/car/musiclite/LyricsBox;->transAt(I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :pr5

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :pr6

    iget-object v1, p0, Lcom/car/musiclite/LyricsBox;->pTr:Landroid/graphics/Paint;

    const/16 v2, 0x11

    invoke-direct {p0, v2}, Lcom/car/musiclite/LyricsBox;->dpF(I)F

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    const/16 v2, 0xa0

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {v1}, Landroid/graphics/Paint;->getTextSize()F

    move-result v2

    const/high16 v3, 0x40000000

    mul-float/2addr v2, v3

    add-float/2addr v2, v9

    invoke-virtual {p1, v0, v5, v2, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void

    :pr1
    return-void

    :pr2
    return-void

    :pr3
    return-void

    :pr4
    return-void

    :pr5
    return-void

    :pr6
    return-void
.end method

# ---- main painter ----
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 6

    invoke-direct {p0}, Lcom/car/musiclite/LyricsBox;->estPosMs()I

    move-result v0

    iget-object v1, p0, Lcom/car/musiclite/LyricsBox;->lines:[Ljava/lang/String;

    if-eqz v1, :msg

    array-length v2, v1

    if-lez v2, :msg

    invoke-direct {p0, p1, v0}, Lcom/car/musiclite/LyricsBox;->drawWindow(Landroid/graphics/Canvas;I)V

    goto :sched

    :msg
    invoke-direct {p0, p1}, Lcom/car/musiclite/LyricsBox;->drawMsg(Landroid/graphics/Canvas;)V

    :sched
    sget-boolean v0, Lcom/car/musiclite/MainActivity;->sPlaying:Z

    if-eqz v0, :slow

    const-wide/16 v3, 0x21    # 33ms

    goto :sch

    :slow
    const-wide/16 v3, 0x190   # 400ms

    :sch
    invoke-virtual {p0, v3, v4}, Lcom/car/musiclite/LyricsBox;->postInvalidateDelayed(J)V

    return-void
.end method

# ---- lyrics window painter (rows + fading neighbors) ----
.method private drawWindow(Landroid/graphics/Canvas;I)V
    .locals 14

    move/from16 v13, p2    # t (int ms)

    iget-object v1, p0, Lcom/car/musiclite/LyricsBox;->lines:[Ljava/lang/String;

    array-length v2, v1

    if-lez v2, :w_ret

    iget v3, p0, Lcom/car/musiclite/LyricsBox;->curLine:I

    if-ltz v3, :c_lo

    goto :c_hi
    :c_lo
    const/4 v3, 0x0
    :c_hi
    if-ge v3, v2, :c_hi_fix

    goto :c_ok
    :c_hi_fix
    add-int/lit8 v3, v2, -0x1
    :c_ok
    add-int/lit8 v10, v3, -0x3

    if-gez v10, :w_lo_ok

    const/4 v10, 0x0
    :w_lo_ok
    add-int/lit8 v11, v3, 0x3

    add-int/lit8 v12, v2, -0x1

    if-le v11, v12, :w_hi_ok

    move v11, v12
    :w_hi_ok
    invoke-virtual {p0}, Lcom/car/musiclite/LyricsBox;->getWidth()I

    move-result v6

    invoke-virtual {p0}, Lcom/car/musiclite/LyricsBox;->getHeight()I

    move-result v4

    const/16 v5, 0x9

    div-int v5, v4, v5

    if-lez v5, :sh_ok

    const/4 v5, 0x1
    :sh_ok
    sub-int v12, v3, v10    # iCur

    move v7, v10

    :loop
    if-gt v7, v11, :loop_end

    sub-int v8, v7, v10

    if-le v8, v12, :slot_ok

    add-int/lit8 v8, v8, 0x1
    :slot_ok
    mul-int/2addr v8, v5

    div-int/lit8 v9, v5, 0x2

    add-int/2addr v8, v9     # cy (slot center, int px)

    if-eq v7, v3, :nbr

    invoke-direct {p0, p1, v7, v8, v13}, Lcom/car/musiclite/LyricsBox;->drawCurRow(Landroid/graphics/Canvas;III)V

    const/4 v8, 0x0

    goto :next

    :nbr
    sub-int v2, v7, v3

    if-ltz v2, :d_ok

    neg-int v2, v2
    :d_ok
    add-int/lit8 v2, v2, -0x1

    const/16 v9, 0x32

    mul-int/2addr v2, v9

    rsub-int v2, v2, 0xbe    # alpha = 190 - 50*(d-1)

    invoke-direct {p0, p1, v7, v8, v2}, Lcom/car/musiclite/LyricsBox;->drawNbrRow(Landroid/graphics/Canvas;III)V

    :next
    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    add-int/lit8 v7, v7, 0x1

    goto :loop

    :loop_end
    :w_ret
    return-void
.end method

# ---- placeholder text painter ----
.method private drawMsg(Landroid/graphics/Canvas;)V
    .locals 7

    iget-object v0, p0, Lcom/car/musiclite/LyricsBox;->msg:Ljava/lang/String;

    if-eqz v0, :def

    goto :have
    :def
    const-string v0, "\u25cf"
    :have
    iget-object v1, p0, Lcom/car/musiclite/LyricsBox;->pMsg:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    const/16 v3, 0x16

    invoke-direct {p0, v3}, Lcom/car/musiclite/LyricsBox;->dpF(I)F

    move-result v3

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    const/16 v3, 0xb4

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p0}, Lcom/car/musiclite/LyricsBox;->getWidth()I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x3f000000

    mul-float/2addr v4, v5

    invoke-virtual {p0}, Lcom/car/musiclite/LyricsBox;->getHeight()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v5

    invoke-virtual {p1, v0, v4, v6, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void
.end method


# ---- estimated playback position (ms): sPos + elapsed when playing ----
.method private estPosMs()I
    .locals 6

    sget-boolean v0, Lcom/car/musiclite/MainActivity;->sPlaying:Z

    if-eqz v0, :st

    sget v1, Lcom/car/musiclite/MainActivity;->sPos:I

    sget-wide v2, Lcom/car/musiclite/MainActivity;->sPosAt:J

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v2

    long-to-int v4, v4

    add-int/2addr v1, v4

    return v1

    :st
    sget v0, Lcom/car/musiclite/MainActivity;->sPos:I

    return v0
.end method

# ---- neighbor row renderer (fading, centered, no glow) ----
.method private drawNbrRow(Landroid/graphics/Canvas;III)V
    .locals 6

    iget-object v0, p0, Lcom/car/musiclite/LyricsBox;->lines:[Ljava/lang/String;

    if-eqz v0, :ret

    array-length v1, v0

    if-ge p2, v1, :ret

    aget-object v2, v0, p2

    iget-object v0, p0, Lcom/car/musiclite/LyricsBox;->pNbr:Landroid/graphics/Paint;

    const/16 v1, 0x18

    invoke-direct {p0, v1}, Lcom/car/musiclite/LyricsBox;->dpF(I)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    invoke-virtual {v0, p4}, Landroid/graphics/Paint;->setAlpha(I)V

    sget-object v3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    # baseline = (float)cy + size*0.35
    const v3, 0x3eb33333

    mul-float/2addr v1, v3

    int-to-float v3, p3

    add-float/2addr v1, v3

    invoke-virtual {p0}, Lcom/car/musiclite/LyricsBox;->getWidth()I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x3f000000

    mul-float/2addr v3, v4

    invoke-virtual {p1, v2, v3, v1, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    :ret
    return-void
.end method

.class public Lcom/car/musiclite/LyricsBox;
.super Ljava/lang/Object;
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
.field private pendingId:J
.field private times:[I
.field private trans:Ljava/util/HashMap;
.field private view:Landroid/widget/TextView;


# static cache: survives in-place UI rebuild (theme switch) so lyrics + cover
# are restored instantly instead of re-fetching from network (no flash)
.field static sBmp:Landroid/graphics/Bitmap;
.field static sId:J
.field static sLine:I
.field static sLines:[Ljava/lang/String;
.field static sTimes:[I
.field static sTrans:Ljava/util/HashMap;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/ImageView;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/car/musiclite/LyricsBox;->ctx:Landroid/content/Context;

    iput-object p2, p0, Lcom/car/musiclite/LyricsBox;->view:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/car/musiclite/LyricsBox;->cover:Landroid/widget/ImageView;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/car/musiclite/LyricsBox;->handler:Landroid/os/Handler;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/car/musiclite/LyricsBox;->curId:J

    const-string v0, "\u25cf"

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
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
    .locals 10

    iget-object v0, p0, Lcom/car/musiclite/LyricsBox;->lines:[Ljava/lang/String;

    if-eqz v0, :cond_empty

    array-length v2, v0

    if-nez v2, :goto_go

    :cond_empty
    iget-object v0, p0, Lcom/car/musiclite/LyricsBox;->view:Landroid/widget/TextView;

    const-string v1, "\u6682\u65e0\u6b4c\u8bcd"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :goto_go
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    # window: curLine-3 .. curLine+3, clamped
    iget v2, p0, Lcom/car/musiclite/LyricsBox;->curLine:I

    const/4 v6, 0x3

    sub-int/2addr v2, v6

    if-gez v2, :lo_ok

    const/4 v2, 0x0

    :lo_ok
    iget v3, p0, Lcom/car/musiclite/LyricsBox;->curLine:I

    const/4 v6, 0x3

    add-int/2addr v3, v6

    iget-object v6, p0, Lcom/car/musiclite/LyricsBox;->lines:[Ljava/lang/String;

    array-length v6, v6

    add-int/lit8 v6, v6, -0x1

    if-le v3, v6, :hi_ok

    move v3, v6

    :hi_ok
    move v1, v2

    :loop
    if-gt v1, v3, :done

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    if-lez v2, :nosep

    const/16 v2, 0xa

    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    :nosep
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2           # span start

    iget v6, p0, Lcom/car/musiclite/LyricsBox;->curLine:I

    if-ne v1, v6, :other

    # ================= current line =================
    const-string v4, "\u25cf "

    invoke-virtual {v0, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    iget-object v4, p0, Lcom/car/musiclite/LyricsBox;->lines:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v0, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v7           # span end

    # white
    new-instance v4, Landroid/text/style/ForegroundColorSpan;

    const v6, -0x1

    invoke-direct {v4, v6}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/16 v8, 0x21

    invoke-virtual {v0, v4, v2, v7, v8}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    # 1.3x
    new-instance v4, Landroid/text/style/RelativeSizeSpan;

    const v6, 0x3fa66666    # 1.3f

    invoke-direct {v4, v6}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    const/16 v8, 0x21

    invoke-virtual {v0, v4, v2, v7, v8}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    # bold
    new-instance v4, Landroid/text/style/StyleSpan;

    const/4 v6, 0x1

    invoke-direct {v4, v6}, Landroid/text/style/StyleSpan;-><init>(I)V

    const/16 v8, 0x21

    invoke-virtual {v0, v4, v2, v7, v8}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    # translation line underneath
    iget-object v4, p0, Lcom/car/musiclite/LyricsBox;->trans:Ljava/util/HashMap;

    if-eqz v4, :norm

    iget-object v5, p0, Lcom/car/musiclite/LyricsBox;->times:[I

    if-eqz v5, :norm

    aget v6, v5, v1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    if-eqz v4, :norm

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :norm

    const/16 v5, 0xa

    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2           # translation span start

    invoke-virtual {v0, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v7           # translation span end

    # sub color @ alpha 210
    invoke-static {}, Lcom/car/musiclite/MainActivity;->textSub()I

    move-result v6

    invoke-static {v6}, Landroid/graphics/Color;->red(I)I

    move-result v8

    invoke-static {v6}, Landroid/graphics/Color;->green(I)I

    move-result v9

    invoke-static {v6}, Landroid/graphics/Color;->blue(I)I

    move-result v6

    const/16 v5, 0xd2

    invoke-static {v5, v8, v9, v6}, Landroid/graphics/Color;->argb(IIII)I

    move-result v5

    new-instance v4, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v4, v5}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/16 v8, 0x21

    invoke-virtual {v0, v4, v2, v7, v8}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    # 0.8x
    new-instance v4, Landroid/text/style/RelativeSizeSpan;

    const v6, 0x3f4ccccd    # 0.8f

    invoke-direct {v4, v6}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    const/16 v8, 0x21

    invoke-virtual {v0, v4, v2, v7, v8}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    goto :norm

    # ================= neighbor lines =================
    :other
    iget v6, p0, Lcom/car/musiclite/LyricsBox;->curLine:I

    sub-int v6, v1, v6

    if-gez v6, :d_pos

    neg-int v6, v6

    :d_pos
    const/16 v8, 0x32        # 50

    mul-int/2addr v8, v6

    rsub-int v6, v8, 0xff    # alpha = 255 - 50*distance

    const/16 v8, 0x5a        # floor 90

    if-ge v6, v8, :alpha_ok

    const/16 v6, 0x5a

    :alpha_ok
    invoke-static {}, Lcom/car/musiclite/MainActivity;->textSub()I

    move-result v9

    invoke-static {v9}, Landroid/graphics/Color;->red(I)I

    move-result v7

    invoke-static {v9}, Landroid/graphics/Color;->green(I)I

    move-result v8

    invoke-static {v9}, Landroid/graphics/Color;->blue(I)I

    move-result v9

    invoke-static {v6, v7, v8, v9}, Landroid/graphics/Color;->argb(IIII)I

    move-result v6

    iget-object v4, p0, Lcom/car/musiclite/LyricsBox;->lines:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v0, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v7           # span end

    new-instance v5, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v5, v6}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/16 v8, 0x21

    invoke-virtual {v0, v5, v2, v7, v8}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    # normalize temp registers so both branch paths merge with equal types
    :norm
    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    add-int/lit8 v1, v1, 0x1

    goto :loop

    :done
    iget-object v1, p0, Lcom/car/musiclite/LyricsBox;->view:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

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

    iget-object v0, p0, Lcom/car/musiclite/LyricsBox;->view:Landroid/widget/TextView;

    const-string v1, "\u6b4c\u8bcd\u52a0\u8f7d\u4e2d\u2026"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

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
    iget-object v0, p0, Lcom/car/musiclite/LyricsBox;->view:Landroid/widget/TextView;

    const-string v1, "\u672a\u5728\u64ad\u653e"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

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

    const-string v1, ",\"lv\":-1,\"kv\":-1,\"tv\":-1,\"rv\":-1}"

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

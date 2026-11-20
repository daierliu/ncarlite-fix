.class Lcom/car/musiclite/MainActivity$SongAdapter;
.super Landroid/widget/BaseAdapter;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/car/musiclite/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SongAdapter"
.end annotation


# instance fields
.field private final data:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/car/musiclite/Api$Song;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/car/musiclite/MainActivity;

.field static handler:Landroid/os/Handler;

.field static mem:Ljava/util/HashMap;

.field static tp:Ljava/util/concurrent/ExecutorService;


# direct methods
.method constructor <init>(Lcom/car/musiclite/MainActivity;Ljava/util/List;)V
    .locals 0

    iput-object p1, p0, Lcom/car/musiclite/MainActivity$SongAdapter;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    iput-object p2, p0, Lcom/car/musiclite/MainActivity$SongAdapter;->data:Ljava/util/List;

    return-void
.end method

.method static synthetic access$4000(Lcom/car/musiclite/MainActivity$SongAdapter;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/car/musiclite/MainActivity$SongAdapter;->data:Ljava/util/List;

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/car/musiclite/MainActivity$SongAdapter;->mem:Ljava/util/HashMap;

    const/4 v0, 0x3

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/car/musiclite/MainActivity$SongAdapter;->tp:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/car/musiclite/MainActivity$SongAdapter;->handler:Landroid/os/Handler;

    return-void
.end method

.method loadThumb(Landroid/widget/ImageView;J)V
    .locals 4

    sget-object v0, Lcom/car/musiclite/MainActivity$SongAdapter;->mem:Ljava/util/HashMap;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :lt_task

    check-cast v1, Landroid/graphics/Bitmap;

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void

    :lt_task
    new-instance v0, Lcom/car/musiclite/MainActivity$ThumbTask;

    iget-object v1, p0, Lcom/car/musiclite/MainActivity$SongAdapter;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-direct {v0, v1, p1, p2, p3}, Lcom/car/musiclite/MainActivity$ThumbTask;-><init>(Landroid/content/Context;Landroid/widget/ImageView;J)V

    sget-object v1, Lcom/car/musiclite/MainActivity$SongAdapter;->tp:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/car/musiclite/MainActivity$SongAdapter;->data:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/car/musiclite/MainActivity$SongAdapter;->data:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    iget-object v0, p0, Lcom/car/musiclite/MainActivity$SongAdapter;->data:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/car/musiclite/Api$Song;

    iget-wide v0, p1, Lcom/car/musiclite/Api$Song;->id:J

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 12

    iget-object p2, p0, Lcom/car/musiclite/MainActivity$SongAdapter;->data:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/car/musiclite/Api$Song;

    iget-object v0, p0, Lcom/car/musiclite/MainActivity$SongAdapter;->this$0:Lcom/car/musiclite/MainActivity;

    # ---- row root: horizontal, center_vertical ----
    new-instance p3, Landroid/widget/LinearLayout;

    invoke-direct {p3, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {p3, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v1, 0x10

    invoke-virtual {p3, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    # padding: 8dp sides, 4dp vertical
    const/16 v1, 0x8

    invoke-static {v0, v1}, Lcom/car/musiclite/MainActivity;->access$3600(Lcom/car/musiclite/MainActivity;I)I

    move-result v1

    const/4 v2, 0x4

    invoke-static {v0, v2}, Lcom/car/musiclite/MainActivity;->access$3600(Lcom/car/musiclite/MainActivity;I)I

    move-result v2

    invoke-virtual {p3, v1, v2, v1, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    # playing highlight removed (was red row background)
    :sa_norm
    # ---- cover: 44dp square (3-column grid), rounded bitmap from ThumbTask ----
    new-instance v1, Landroid/widget/ImageView;

    invoke-direct {v1, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const/16 v2, 0x58

    invoke-static {v0, v2}, Lcom/car/musiclite/MainActivity;->access$3600(Lcom/car/musiclite/MainActivity;I)I

    move-result v2

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p3, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-wide v4, p2, Lcom/car/musiclite/Api$Song;->id:J

    invoke-virtual {p0, v1, v4, v5}, Lcom/car/musiclite/MainActivity$SongAdapter;->loadThumb(Landroid/widget/ImageView;J)V

    # ---- text column ----
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, 0x0

    const/4 v4, -0x2

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v2, v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    const/16 v3, 0x6

    invoke-static {v0, v3}, Lcom/car/musiclite/MainActivity;->access$3600(Lcom/car/musiclite/MainActivity;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    invoke-virtual {p3, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # playing flag -> v3
    iget-wide v3, p2, Lcom/car/musiclite/Api$Song;->id:J

    invoke-static {v0}, Lcom/car/musiclite/MainActivity;->access$3800(Lcom/car/musiclite/MainActivity;)J

    move-result-wide v5

    cmp-long v7, v3, v5

    const/4 v3, 0x0

    if-eqz v7, :sa_isnp

    const/4 v3, 0x1

    :sa_isnp
    # ---- song name ----
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p2, Lcom/car/musiclite/Api$Song;->name:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lcom/car/musiclite/Api$Song;->badge()Ljava/lang/String;

    move-result-object v6

    const/4 v8, 0x0

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :sa_nobadge

    const-string v7, "  "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    :sa_nobadge
    iget-boolean v7, p2, Lcom/car/musiclite/Api$Song;->trial:Z

    const/4 v10, 0x0

    if-eqz v7, :sa_notrial

    const-string v7, "  \u8bd5\u542c"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v10, 0x2

    :sa_notrial
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v11

    new-instance v9, Landroid/text/SpannableString;

    invoke-direct {v9, v7}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    if-eqz v8, :sa_sp_trial

    # gold badge text (VIP/付费): bold + gold + smaller than song name
    new-instance v5, Landroid/text/style/ForegroundColorSpan;

    const v6, -0x2b5fe9

    invoke-direct {v5, v6}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    sub-int v6, v11, v8

    const/16 v7, 0x21

    invoke-virtual {v9, v5, v6, v11, v7}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    new-instance v5, Landroid/text/style/StyleSpan;

    const/4 v6, 0x1

    invoke-direct {v5, v6}, Landroid/text/style/StyleSpan;-><init>(I)V

    sub-int v6, v11, v8

    const/16 v7, 0x21

    invoke-virtual {v9, v5, v6, v11, v7}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    # smaller badge
    new-instance v5, Landroid/text/style/RelativeSizeSpan;

    const v6, 0x3f19999a    # 0.6f

    invoke-direct {v5, v6}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    sub-int v6, v11, v8

    const/16 v7, 0x21

    invoke-virtual {v9, v5, v6, v11, v7}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    :sa_sp_trial
    if-eqz v10, :sa_sp_done

    new-instance v5, Landroid/text/style/ForegroundColorSpan;

    const v6, -0x2b5fe9

    invoke-direct {v5, v6}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    sub-int v6, v11, v10

    const/16 v7, 0x21

    invoke-virtual {v9, v5, v6, v11, v7}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    new-instance v5, Landroid/text/style/StyleSpan;

    const/4 v6, 0x1

    invoke-direct {v5, v6}, Landroid/text/style/StyleSpan;-><init>(I)V

    sub-int v6, v11, v10

    const/16 v7, 0x21

    invoke-virtual {v9, v5, v6, v11, v7}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    # smaller trial badge
    new-instance v5, Landroid/text/style/RelativeSizeSpan;

    const v6, 0x3f19999a    # 0.6f

    invoke-direct {v5, v6}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    sub-int v6, v11, v10

    const/16 v7, 0x21

    invoke-virtual {v9, v5, v6, v11, v7}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    :sa_sp_done
    invoke-virtual {v4, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v5, 0x41b00000    # 22.0f

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextSize(F)V

    if-eqz v3, :sa_nm_gray

    invoke-static {}, Lcom/car/musiclite/MainActivity;->accent()I

    move-result v5

    goto :sa_nm_set

    :sa_nm_gray
    invoke-static {}, Lcom/car/musiclite/MainActivity;->textMain()I

    move-result v5

    :sa_nm_set
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    const/4 v7, -0x2

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # ---- artist ----
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iget-object v5, p2, Lcom/car/musiclite/Api$Song;->artist:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v5, 0x41880000    # 17.0f

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-static {}, Lcom/car/musiclite/MainActivity;->textSub()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    const/4 v7, -0x2

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v6, 0x2

    invoke-static {v0, v6}, Lcom/car/musiclite/MainActivity;->access$3600(Lcom/car/musiclite/MainActivity;I)I

    move-result v6

    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v1, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # click -> play song
    new-instance v0, Lcom/car/musiclite/MainActivity$SongAdapter$1;

    invoke-direct {v0, p0, p2}, Lcom/car/musiclite/MainActivity$SongAdapter$1;-><init>(Lcom/car/musiclite/MainActivity$SongAdapter;Lcom/car/musiclite/Api$Song;)V

    invoke-virtual {p3, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p3
.end method

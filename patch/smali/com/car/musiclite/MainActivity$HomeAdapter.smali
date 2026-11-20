.class Lcom/car/musiclite/MainActivity$HomeAdapter;
.super Landroid/widget/BaseAdapter;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/car/musiclite/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HomeAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/car/musiclite/MainActivity;


# direct methods
.method private constructor <init>(Lcom/car/musiclite/MainActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 636
    iput-object p1, p0, Lcom/car/musiclite/MainActivity$HomeAdapter;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/car/musiclite/MainActivity;Lcom/car/musiclite/MainActivity$1;)V
    .locals 0

    .line 636
    invoke-direct {p0, p1}, Lcom/car/musiclite/MainActivity$HomeAdapter;-><init>(Lcom/car/musiclite/MainActivity;)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 639
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$HomeAdapter;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {v0}, Lcom/car/musiclite/MainActivity;->access$2300(Lcom/car/musiclite/MainActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    .line 644
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$HomeAdapter;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {v0}, Lcom/car/musiclite/MainActivity;->access$2300(Lcom/car/musiclite/MainActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    .line 649
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$HomeAdapter;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {v0}, Lcom/car/musiclite/MainActivity;->access$2300(Lcom/car/musiclite/MainActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/car/musiclite/Api$Playlist;

    iget-wide v0, p1, Lcom/car/musiclite/Api$Playlist;->id:J

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 12

    # playlist
    iget-object p2, p0, Lcom/car/musiclite/MainActivity$HomeAdapter;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {p2}, Lcom/car/musiclite/MainActivity;->access$2300(Lcom/car/musiclite/MainActivity;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/car/musiclite/Api$Playlist;

    # v0 = ctx
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$HomeAdapter;->this$0:Lcom/car/musiclite/MainActivity;

    # root vertical LinearLayout, gravity center
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v2, 0x11

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/16 v2, 0xa

    invoke-static {v0, v2}, Lcom/car/musiclite/MainActivity;->access$3600(Lcom/car/musiclite/MainActivity;I)I

    move-result v2

    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    # iv cover
    new-instance v3, Landroid/widget/ImageView;

    invoke-direct {v3, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const/4 v2, 0x1

    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setAdjustViewBounds(Z)V

    const/16 v2, 0xc8

    invoke-static {v0, v2}, Lcom/car/musiclite/MainActivity;->access$3600(Lcom/car/musiclite/MainActivity;I)I

    move-result v2

    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setMinimumHeight(I)V

    # no background color: rounded corners come from CoverTask.round() bitmap

    # lp1: (200dp, WRAP_CONTENT) - cover shrunk from full column width
    const/16 v5, 0xc8

    invoke-static {v0, v5}, Lcom/car/musiclite/MainActivity;->access$3600(Lcom/car/musiclite/MainActivity;I)I

    move-result v5

    const/4 v6, -0x2

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v7, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # cover loading: pid > 0 -> fetch; else colored tile
    # v10/v11 = playlist id (wide, dedicated, never reused)
    iget-wide v10, p2, Lcom/car/musiclite/Api$Playlist;->id:J

    const-wide/16 v4, 0x0

    cmp-long v2, v10, v4

    if-lez v2, :ct_special

    sget-object v2, Lcom/car/musiclite/MainActivity$SongAdapter;->tp:Ljava/util/concurrent/ExecutorService;

    new-instance v4, Lcom/car/musiclite/MainActivity$CoverTask;

    invoke-direct {v4, v0, v3, v10, v11}, Lcom/car/musiclite/MainActivity$CoverTask;-><init>(Landroid/content/Context;Landroid/widget/ImageView;J)V

    invoke-interface {v2, v4}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :ct_tv

    :ct_special
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const-wide/16 v5, -0x1

    cmp-long v2, v10, v5

    if-nez v2, :ct_gray

    const v2, -0x177cc6    # orange 0xffe8833a

    goto :ct_set

    :ct_gray
    const v2, -0x756858    # gray 0xff8a97a8

    :ct_set
    invoke-virtual {v4, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v2, 0x41400000    # 12.0f

    invoke-virtual {v4, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :ct_tv
    # tv label (name only, no numbering)
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iget-object v2, p2, Lcom/car/musiclite/Api$Playlist;->name:Ljava/lang/String;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v2, 0x41800000    # 16.0f

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-static {}, Lcom/car/musiclite/MainActivity;->textMain()I

    move-result v2

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 v2, 0x11

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setGravity(I)V

    const/4 v2, 0x2

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    const/16 v2, 0x8

    invoke-static {v0, v2}, Lcom/car/musiclite/MainActivity;->access$3600(Lcom/car/musiclite/MainActivity;I)I

    move-result v2

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v2, v4, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # click
    new-instance v3, Lcom/car/musiclite/MainActivity$HomeAdapter$1;

    invoke-direct {v3, p0, p2}, Lcom/car/musiclite/MainActivity$HomeAdapter$1;-><init>(Lcom/car/musiclite/MainActivity$HomeAdapter;Lcom/car/musiclite/Api$Playlist;)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v1
.end method

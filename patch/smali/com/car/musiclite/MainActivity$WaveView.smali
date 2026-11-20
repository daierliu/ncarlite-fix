.class public Lcom/car/musiclite/MainActivity$WaveView;
.super Landroid/view/View;
.source "MainActivity.java"


# instance fields
.field private attached:Z

.field private final host:Lcom/car/musiclite/MainActivity;

.field private final played:Landroid/graphics/Paint;

.field private final rest:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Lcom/car/musiclite/MainActivity;Landroid/content/Context;)V
    .registers 4

    .line 17
    invoke-direct {p0, p2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 18
    iput-object p1, p0, Lcom/car/musiclite/MainActivity$WaveView;->host:Lcom/car/musiclite/MainActivity;

    .line 19
    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/car/musiclite/MainActivity$WaveView;->played:Landroid/graphics/Paint;

    .line 20
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/car/musiclite/MainActivity$WaveView;->rest:Landroid/graphics/Paint;

    .line 21
    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 22
    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 23
    sget-object p2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 24
    sget-object p1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 25
    return-void
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 1

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/car/musiclite/MainActivity$WaveView;->attached:Z

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/car/musiclite/MainActivity$WaveView;->attached:Z

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 16

    .line 28
    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity$WaveView;->getWidth()I

    move-result v0

    .line 29
    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity$WaveView;->getHeight()I

    move-result v1

    .line 30
    const/4 v2, 0x4

    if-lt v0, v2, :cond_da

    if-lt v1, v2, :cond_da

    .line 31
    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity$WaveView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    .line 32
    int-to-float v1, v1

    const/high16 v3, 0x3f000000    # 0.5f

    mul-float v3, v3, v1

    .line 33
    const v4, 0x3e99999a    # 0.3f

    mul-float v1, v1, v4

    .line 34
    const/high16 v4, 0x42a00000    # 80.0f

    mul-float v4, v4, v2

    .line 35
    iget-object v5, p0, Lcom/car/musiclite/MainActivity$WaveView;->played:Landroid/graphics/Paint;

    const v6, 0x404ccccd    # 3.2f

    mul-float v2, v2, v6

    invoke-virtual {v5, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 36
    iget-object v5, p0, Lcom/car/musiclite/MainActivity$WaveView;->rest:Landroid/graphics/Paint;

    invoke-virtual {v5, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 37
    iget-object v2, p0, Lcom/car/musiclite/MainActivity$WaveView;->played:Landroid/graphics/Paint;

    invoke-static {}, Lcom/car/musiclite/MainActivity;->accent()I

    move-result v5

    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 38
    invoke-static {}, Lcom/car/musiclite/MainActivity;->textSub()I

    move-result v2

    const v5, 0xffffff

    and-int/2addr v2, v5

    .line 39
    iget-object v5, p0, Lcom/car/musiclite/MainActivity$WaveView;->rest:Landroid/graphics/Paint;

    const/high16 v6, 0x59000000

    or-int/2addr v2, v6

    invoke-virtual {v5, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 40
    iget-object v2, p0, Lcom/car/musiclite/MainActivity$WaveView;->host:Lcom/car/musiclite/MainActivity;

    invoke-static {v2}, Lcom/car/musiclite/MainActivity;->access$900(Lcom/car/musiclite/MainActivity;)Landroid/widget/SeekBar;

    move-result-object v2

    .line 41
    nop

    .line 42
    const/4 v5, 0x0

    if-eqz v2, :cond_76

    invoke-virtual {v2}, Landroid/widget/SeekBar;->getMax()I

    move-result v6

    if-lez v6, :cond_76

    .line 43
    invoke-virtual {v2}, Landroid/widget/SeekBar;->getProgress()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v2}, Landroid/widget/SeekBar;->getMax()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v6, v2

    .line 44
    cmpg-float v2, v6, v5

    if-gez v2, :cond_6d

    .line 45
    goto :goto_6e

    .line 44
    :cond_6d
    move v5, v6

    .line 47
    :goto_6e
    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v6, v5, v2

    if-lez v6, :cond_76

    .line 48
    const/high16 v5, 0x3f800000    # 1.0f

    .line 51
    :cond_76
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    const-wide/32 v8, 0xf4240

    rem-long/2addr v6, v8

    long-to-float v2, v6

    const v6, 0x3a83126f    # 0.001f

    mul-float v2, v2, v6

    .line 52
    const v6, 0x400ccccd    # 2.2f

    mul-float v2, v2, v6

    # freeze wave phase while paused (no up/down motion)
    sget-boolean v6, Lcom/car/musiclite/MainActivity;->sPlaying:Z

    if-nez v6, :wave_play

    const/4 v2, 0x0

    :wave_play
    .line 53
    new-instance v6, Landroid/graphics/Path;

    invoke-direct {v6}, Landroid/graphics/Path;-><init>()V

    .line 54
    new-instance v7, Landroid/graphics/Path;

    invoke-direct {v7}, Landroid/graphics/Path;-><init>()V

    .line 55
    nop

    .line 56
    int-to-float v0, v0

    mul-float v5, v5, v0

    .line 57
    nop

    .line 58
    const/4 v8, 0x0

    const/4 v9, 0x0

    :goto_9a
    const/16 v10, 0x48

    if-gt v8, v10, :cond_ce

    .line 59
    int-to-float v11, v8

    mul-float v11, v11, v0

    int-to-float v10, v10

    div-float/2addr v11, v10

    .line 60
    div-float v10, v11, v4

    const v12, 0x40c90fd0

    mul-float v10, v10, v12

    add-float/2addr v10, v2

    float-to-double v12, v10

    invoke-static {v12, v13}, Ljava/lang/Math;->sin(D)D

    move-result-wide v12

    double-to-float v10, v12

    mul-float v10, v10, v1

    add-float/2addr v10, v3

    .line 61
    if-nez v8, :cond_ba

    .line 62
    invoke-virtual {v6, v11, v10}, Landroid/graphics/Path;->moveTo(FF)V

    goto :goto_bd

    .line 64
    :cond_ba
    invoke-virtual {v6, v11, v10}, Landroid/graphics/Path;->lineTo(FF)V

    .line 66
    :goto_bd
    cmpg-float v12, v11, v5

    if-gtz v12, :cond_cb

    .line 67
    if-nez v9, :cond_c8

    .line 68
    invoke-virtual {v7, v11, v10}, Landroid/graphics/Path;->moveTo(FF)V

    .line 69
    const/4 v9, 0x1

    goto :goto_cb

    .line 71
    :cond_c8
    invoke-virtual {v7, v11, v10}, Landroid/graphics/Path;->lineTo(FF)V

    .line 58
    :cond_cb
    :goto_cb
    add-int/lit8 v8, v8, 0x1

    goto :goto_9a

    .line 75
    :cond_ce
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$WaveView;->rest:Landroid/graphics/Paint;

    invoke-virtual {p1, v6, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 76
    if-eqz v9, :cond_da

    .line 77
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$WaveView;->played:Landroid/graphics/Paint;

    invoke-virtual {p1, v7, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 80
    :cond_da
    # attached flag maintained via onAttached/onDetached (View.isAttachedToWindow is API 19+, car is 4.3/API 18)
    iget-boolean p1, p0, Lcom/car/musiclite/MainActivity$WaveView;->attached:Z

    if-eqz p1, :cond_f5

    iget-object p1, p0, Lcom/car/musiclite/MainActivity$WaveView;->host:Lcom/car/musiclite/MainActivity;

    invoke-virtual {p1}, Lcom/car/musiclite/MainActivity;->isDestroyed()Z

    move-result p1

    if-nez p1, :cond_f5

    iget-object p1, p0, Lcom/car/musiclite/MainActivity$WaveView;->host:Lcom/car/musiclite/MainActivity;

    invoke-virtual {p1}, Lcom/car/musiclite/MainActivity;->isFinishing()Z

    move-result p1

    if-nez p1, :cond_f5

    .line 81
    const-wide/16 v0, 0x21

    invoke-virtual {p0, v0, v1}, Lcom/car/musiclite/MainActivity$WaveView;->postInvalidateDelayed(J)V

    .line 83
    :cond_f5
    return-void
.end method

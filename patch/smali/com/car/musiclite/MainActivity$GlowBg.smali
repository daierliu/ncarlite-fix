.class public Lcom/car/musiclite/MainActivity$GlowBg;
.super Landroid/view/View;
.source "GlowBg.java"


# instance fields
.field acc:J

.field host:Lcom/car/musiclite/MainActivity;

.field last:J

.field private pig:[I

.field private t0:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 8

    .line 20
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    # host ref (activity) so onDraw can freeze when playback is paused
    check-cast p1, Lcom/car/musiclite/MainActivity;

    iput-object p1, p0, Lcom/car/musiclite/MainActivity$GlowBg;->host:Lcom/car/musiclite/MainActivity;

    # 6 bright accent colors: purple / pink / sky blue / amber / teal / green
    const v0, -0x83b201

    const v1, -0xadae

    const v2, -0xbf3b01

    const v3, -0x28c0

    const v4, -0x9b0026

    const v5, -0x960f52

    .line 16
    filled-new-array/range {v0 .. v5}, [I

    move-result-object v0

    iput-object v0, p0, Lcom/car/musiclite/MainActivity$GlowBg;->pig:[I

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 26

    move-object/from16 v0, p0

    .line 50
    invoke-virtual/range {p0 .. p0}, Lcom/car/musiclite/MainActivity$GlowBg;->getWidth()I

    move-result v1

    .line 51
    invoke-virtual/range {p0 .. p0}, Lcom/car/musiclite/MainActivity$GlowBg;->getHeight()I

    move-result v2

    const-wide/16 v3, 0x21

    const/4 v5, 0x1

    if-lt v1, v5, :cond_129

    if-ge v2, v5, :cond_13

    goto/16 :goto_129

    .line 58
    :cond_13
    new-instance v11, Landroid/graphics/Paint;

    invoke-direct {v11}, Landroid/graphics/Paint;-><init>()V

    const v6, -0xe1ddd3

    .line 59
    invoke-virtual {v11, v6}, Landroid/graphics/Paint;->setColor(I)V

    const/4 v7, 0x0

    const/4 v8, 0x0

    int-to-float v15, v1

    int-to-float v14, v2

    move-object/from16 v6, p1

    move v9, v15

    move v10, v14

    .line 60
    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 63
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    # frame delta; accumulate into acc only while playing (freeze when paused)
    iget-object v12, v0, Lcom/car/musiclite/MainActivity$GlowBg;->host:Lcom/car/musiclite/MainActivity;

    const-wide/16 v10, 0x0

    iget-wide v8, v0, Lcom/car/musiclite/MainActivity$GlowBg;->last:J

    cmp-long v13, v8, v10

    if-nez v13, :have_last

    iput-wide v6, v0, Lcom/car/musiclite/MainActivity$GlowBg;->last:J

    :have_last
    sub-long v8, v6, v8

    iput-wide v6, v0, Lcom/car/musiclite/MainActivity$GlowBg;->last:J

    if-eqz v12, :frozen

    iget-boolean v12, v12, Lcom/car/musiclite/MainActivity;->npPlaying:Z

    if-eqz v12, :frozen

    iget-wide v10, v0, Lcom/car/musiclite/MainActivity$GlowBg;->acc:J

    add-long/2addr v10, v8

    iput-wide v10, v0, Lcom/car/musiclite/MainActivity$GlowBg;->acc:J

    :frozen
    iget-wide v6, v0, Lcom/car/musiclite/MainActivity$GlowBg;->acc:J

    long-to-float v6, v6

    const v7, 0x3a83126f    # 0.001f

    mul-float v6, v6, v7

    .line 67
    :goto_3e
    new-instance v7, Landroid/graphics/Paint;

    invoke-direct {v7}, Landroid/graphics/Paint;-><init>()V

    .line 68
    invoke-virtual {v7, v5}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 69
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-float v1, v1

    const v2, 0x3f1eb852    # 0.62f

    mul-float v1, v1, v2

    const/4 v2, 0x0

    :goto_51
    const/4 v5, 0x6

    if-ge v2, v5, :cond_cd

    int-to-float v5, v2

    const v8, 0x3fc8f5c3    # 1.57f

    mul-float v5, v5, v8

    add-float/2addr v5, v6

    float-to-double v8, v5

    const-wide v10, 0x3fd3d70a3d70a3d7L    # 0.31

    .line 73
    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v10, v10, v8

    int-to-double v12, v2

    const-wide v16, 0x4000cccccccccccdL    # 2.1

    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v16, v16, v12

    add-double v10, v10, v16

    invoke-static {v10, v11}, Ljava/lang/Math;->sin(D)D

    move-result-wide v10

    double-to-float v5, v10

    const v10, 0x3ed70a3d    # 0.42f

    mul-float v5, v5, v10

    const/high16 v11, 0x3f000000    # 0.5f

    add-float/2addr v5, v11

    const-wide v16, 0x3fcd70a3d70a3d71L    # 0.23

    .line 74
    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v8, v8, v16

    const-wide v16, 0x3ff4cccccccccccdL    # 1.3

    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v12, v12, v16

    add-double/2addr v8, v12

    invoke-static {v8, v9}, Ljava/lang/Math;->cos(D)D

    move-result-wide v8

    double-to-float v8, v8

    mul-float v8, v8, v10

    add-float/2addr v8, v11

    mul-float v5, v5, v15

    mul-float v8, v8, v14

    .line 77
    iget-object v9, v0, Lcom/car/musiclite/MainActivity$GlowBg;->pig:[I

    aget v9, v9, v2

    const v10, 0xffffff

    and-int/2addr v9, v10

    const/high16 v10, 0x99000000

    or-int v20, v9, v10

    .line 78
    new-instance v9, Landroid/graphics/RadialGradient;

    const/16 v21, 0x0

    sget-object v22, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move-object/from16 v16, v9

    move/from16 v17, v5

    move/from16 v18, v8

    move/from16 v19, v1

    invoke-direct/range {v16 .. v22}, Landroid/graphics/RadialGradient;-><init>(FFFIILandroid/graphics/Shader$TileMode;)V

    .line 80
    invoke-virtual {v7, v9}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    move-object/from16 v9, p1

    .line 81
    invoke-virtual {v9, v5, v8, v1, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/4 v5, 0x0

    .line 82
    invoke-virtual {v7, v5}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    add-int/lit8 v2, v2, 0x1

    goto :goto_51

    :cond_cd
    # fully immersive flat background: no fade gradients at top/bottom
    invoke-virtual {v0, v3, v4}, Lcom/car/musiclite/MainActivity$GlowBg;->postInvalidateDelayed(J)V

    return-void

    .line 53
    :cond_129
    :goto_129
    invoke-virtual {v0, v3, v4}, Lcom/car/musiclite/MainActivity$GlowBg;->postInvalidateDelayed(J)V

    return-void
.end method

.method public setCover(Landroid/graphics/Bitmap;)V
    .registers 11

    if-nez p1, :cond_3

    return-void

    :cond_3
    const/16 v0, 0x10

    const/4 v1, 0x1

    .line 27
    :try_start_6
    invoke-static {p1, v0, v0, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p1

    # 6 colors to match the 6 glow spots in onDraw (pig length must stay 6!)
    const/4 v0, 0x6

    new-array v2, v0, [I

    const/4 v3, 0x0

    const/4 v5, 0x3

    const/4 v8, 0x2

    :goto_e
    if-ge v3, v0, :cond_4d

    # 6 sample points on the 16x16 thumb: 3 columns x 2 rows
    rem-int/lit8 v4, v3, 0x3

    mul-int/lit8 v4, v4, 0x5

    add-int/2addr v4, v5

    div-int/lit8 v6, v3, 0x3

    mul-int/lit8 v6, v6, 0x7

    add-int/2addr v6, v5

    .line 34
    invoke-virtual {p1, v4, v6}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v4

    const/4 v6, 0x3

    new-array v6, v6, [F

    .line 36
    invoke-static {v4, v6}, Landroid/graphics/Color;->colorToHSV(I[F)V

    aget v4, v6, v1

    const/high16 v7, 0x3f000000    # 0.5f

    cmpg-float v4, v4, v7

    if-gez v4, :cond_2f

    aput v7, v6, v1

    :cond_2f
    aget v4, v6, v8

    const v7, 0x3ee66666    # 0.45f

    cmpg-float v4, v4, v7

    if-gez v4, :cond_3a

    aput v7, v6, v8

    :cond_3a
    aget v4, v6, v8

    const/high16 v7, 0x3f800000    # 1.0f

    cmpl-float v4, v4, v7

    if-lez v4, :cond_44

    aput v7, v6, v8

    .line 40
    :cond_44
    invoke-static {v6}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v4

    aput v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 42
    :cond_4d
    iput-object v2, p0, Lcom/car/musiclite/MainActivity$GlowBg;->pig:[I

    .line 43
    # restart the glow animation on a new cover
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/car/musiclite/MainActivity$GlowBg;->acc:J

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/car/musiclite/MainActivity$GlowBg;->last:J

    .line 44
    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity$GlowBg;->postInvalidate()V
    :try_end_58
    .catchall {:try_start_6 .. :try_end_58} :catchall_58

    :catchall_58
    return-void
.end method

.class public Lcom/car/musiclite/MainActivity$VinylView;
.super Landroid/widget/ImageView;
.source "VinylView.java"

# interfaces
.implements Landroid/media/audiofx/Visualizer$OnDataCaptureListener;


# instance fields
.field private angle:F

.field private bmp:Landroid/graphics/Bitmap;

.field public glow:Lcom/car/musiclite/MainActivity$GlowBg;

.field private host:Lcom/car/musiclite/MainActivity;

.field private lastT:J

.field private sm:[F

.field private spec:[F

.field private lastData:J

.field private lastLog:J

.field private vz:Landroid/media/audiofx/Visualizer;

.field private vzSess:I


# direct methods
.method public constructor <init>(Lcom/car/musiclite/MainActivity;Landroid/content/Context;)V
    .registers 4

    .line 26
    invoke-direct {p0, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    const/16 p2, 0x18

    new-array v0, p2, [F

    .line 21
    iput-object v0, p0, Lcom/car/musiclite/MainActivity$VinylView;->spec:[F

    new-array p2, p2, [F

    .line 22
    iput-object p2, p0, Lcom/car/musiclite/MainActivity$VinylView;->sm:[F

    .line 27
    iput-object p1, p0, Lcom/car/musiclite/MainActivity$VinylView;->host:Lcom/car/musiclite/MainActivity;

    return-void
.end method

.method private isPlaying()Z
    .registers 2

    .line 42
    :try_start_0
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$VinylView;->host:Lcom/car/musiclite/MainActivity;

    iget-boolean v0, v0, Lcom/car/musiclite/MainActivity;->npPlaying:Z
    :try_end_4
    .catchall {:try_start_0 .. :try_end_4} :catchall_5

    return v0

    :catchall_5
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .registers 1

    .line 50
    invoke-super {p0}, Landroid/widget/ImageView;->onAttachedToWindow()V

    # init Visualizer (guarded: skips until RECORD_AUDIO is granted, retries from onDraw)
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity$VinylView;->tryVz()V

    return-void
.end method

.method private tryVz()V
    .registers 8

    # target audio session: the player's own session when known, else output mix
    sget v1, Lcom/car/musiclite/PlayerService;->sSession:I

    iget-object v0, p0, Lcom/car/musiclite/MainActivity$VinylView;->vz:Landroid/media/audiofx/Visualizer;

    if-eqz v0, :cond_new

    # keep existing visualizer unless the player session changed
    if-lez v1, :cond_ret

    iget v0, p0, Lcom/car/musiclite/MainActivity$VinylView;->vzSess:I

    if-eq v0, v1, :cond_ret

    iget-object v0, p0, Lcom/car/musiclite/MainActivity$VinylView;->vz:Landroid/media/audiofx/Visualizer;

    invoke-virtual {v0}, Landroid/media/audiofx/Visualizer;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/car/musiclite/MainActivity$VinylView;->vz:Landroid/media/audiofx/Visualizer;

    :cond_new
    # Visualizer needs RECORD_AUDIO; on API 23+ only attach once runtime grant exists
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-lt v0, v2, :cond_go

    iget-object v0, p0, Lcom/car/musiclite/MainActivity$VinylView;->host:Lcom/car/musiclite/MainActivity;

    const-string v2, "android.permission.RECORD_AUDIO"

    invoke-virtual {v0, v2}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_ret

    :cond_go
    if-lez v1, :mix0

    goto :got_sess

    :mix0
    const/4 v1, 0x0

    :got_sess
    :try_vz
    new-instance v0, Landroid/media/audiofx/Visualizer;

    invoke-direct {v0, v1}, Landroid/media/audiofx/Visualizer;-><init>(I)V

    iput v1, p0, Lcom/car/musiclite/MainActivity$VinylView;->vzSess:I

    const/16 v2, 0x4e20

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-virtual {v0, p0, v2, v3, v4}, Landroid/media/audiofx/Visualizer;->setDataCaptureListener(Landroid/media/audiofx/Visualizer$OnDataCaptureListener;IZZ)I

    move-result v2

    invoke-virtual {v0, v4}, Landroid/media/audiofx/Visualizer;->setEnabled(Z)I

    iput-object v0, p0, Lcom/car/musiclite/MainActivity$VinylView;->vz:Landroid/media/audiofx/Visualizer;

    # diag: creation result
    const-string v3, "MusicLite.Spec"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "vz ok sess="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " listen="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :try_vz_end
    return-void

    :vz_catch
    move-exception v0

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/car/musiclite/MainActivity$VinylView;->vz:Landroid/media/audiofx/Visualizer;

    iput v1, p0, Lcom/car/musiclite/MainActivity$VinylView;->vzSess:I

    const-string v1, "MusicLite.Spec"

    const-string v2, "vz fail"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_ret
    return-void

    .catchall {:try_vz .. :try_vz_end} :vz_catch
.end method

.method private simSpec(J)V
    .locals 8

    # p1/p2 = uptimeMillis; produce lively pseudo-spectrum (no real FFT available)
    const/4 v0, 0x0

    :s_loop
    const/16 v1, 0x18

    if-ge v0, v1, :s_end

    # env = 1.0 - i*0.03 (bass-heavy falloff)
    int-to-float v3, v0

    const v1, 0x3cf5c28f    # 0.03f

    mul-float v3, v3, v1

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float v3, v1, v3

    # a = (0.9 + 0.37*i) * t
    int-to-float v1, v0

    const v2, 0x3ebdb22d    # 0.37f

    mul-float/2addr v1, v2

    const v2, 0x3f666666    # 0.9f

    add-float/2addr v1, v2

    long-to-float v2, p1

    const v4, 0x3a83126f    # 0.001f

    mul-float/2addr v2, v4

    mul-float/2addr v1, v2

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v1

    double-to-float v1, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    # b = |sin(1.7*t + i*1.31)|
    long-to-float v4, p1

    const v2, 0x3a83126f    # 0.001f

    mul-float/2addr v4, v2

    const v2, 0x3f99999a    # 1.7f

    mul-float/2addr v4, v2

    int-to-float v2, v0

    const v5, 0x3fa7ae14    # 1.31f

    mul-float/2addr v2, v5

    add-float/2addr v4, v2

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    double-to-float v4, v4

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    mul-float v1, v1, v4

    mul-float/2addr v1, v3

    const v2, 0x3f47ae14    # 0.78f

    mul-float/2addr v1, v2

    const v2, 0x3e99999a    # 0.3f

    add-float/2addr v1, v2

    iget-object v2, p0, Lcom/car/musiclite/MainActivity$VinylView;->spec:[F

    aput v1, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :s_loop

    :s_end
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .line 64
    invoke-super {p0}, Landroid/widget/ImageView;->onDetachedFromWindow()V

    .line 66
    :try_start_3
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$VinylView;->vz:Landroid/media/audiofx/Visualizer;

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Landroid/media/audiofx/Visualizer;->release()V
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_a

    :catchall_a
    :cond_a
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 25

    move-object/from16 v0, p0

    move-object/from16 v7, p1

    .line 104
    invoke-virtual/range {p0 .. p0}, Lcom/car/musiclite/MainActivity$VinylView;->getWidth()I

    move-result v1

    .line 105
    invoke-virtual/range {p0 .. p0}, Lcom/car/musiclite/MainActivity$VinylView;->getHeight()I

    move-result v2

    const/4 v10, 0x1

    if-lt v1, v10, :cond_2c0

    if-ge v2, v10, :cond_13

    goto/16 :goto_2c0

    .line 110
    :cond_13
    # (re)arm Visualizer if permission has since been granted
    invoke-direct {v0}, Lcom/car/musiclite/MainActivity$VinylView;->tryVz()V

    div-int/lit8 v3, v1, 0x2

    .line 111
    div-int/lit8 v4, v2, 0x2

    .line 112
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    const v2, 0x3f6b851f    # 0.92f

    mul-float v11, v1, v2

    int-to-float v12, v3

    int-to-float v13, v4

    .line 116
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 117
    iget-wide v3, v0, Lcom/car/musiclite/MainActivity$VinylView;->lastT:J

    sub-long v3, v1, v3

    const-wide/16 v5, 0x3e8

    cmp-long v14, v3, v5

    if-lez v14, :cond_35

    const-wide/16 v3, 0x10

    .line 119
    :cond_35
    invoke-direct/range {p0 .. p0}, Lcom/car/musiclite/MainActivity$VinylView;->isPlaying()Z

    move-result v14

    const v15, 0x3cf5c28f    # 0.03f

    if-eqz v14, :cond_46

    .line 121
    iget v5, v0, Lcom/car/musiclite/MainActivity$VinylView;->angle:F

    long-to-float v3, v3

    mul-float v3, v3, v15

    add-float/2addr v5, v3

    iput v5, v0, Lcom/car/musiclite/MainActivity$VinylView;->angle:F

    .line 122
    :cond_46
    iput-wide v1, v0, Lcom/car/musiclite/MainActivity$VinylView;->lastT:J

    long-to-float v1, v1

    const v2, 0x3b83126f    # 0.004f

    mul-float v6, v1, v2

    .line 126
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 127
    invoke-virtual {v1, v10}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 128
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const v2, 0x3d75c28f    # 0.06f

    mul-float v2, v2, v11

    .line 129
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const/high16 v2, 0x33000000

    .line 130
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    const v2, 0x3f866666    # 1.05f

    mul-float v2, v2, v11

    .line 131
    invoke-virtual {v7, v12, v13, v2, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 134
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 135
    invoke-virtual {v1, v10}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    const v3, -0xebebe8

    .line 136
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 137
    invoke-virtual {v7, v12, v13, v11, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 140
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 141
    invoke-virtual {v1, v10}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 142
    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const v3, 0x24ffffff

    .line 143
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    const/high16 v3, 0x3f800000    # 1.0f

    .line 144
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const/16 v16, 0x0

    const/4 v4, 0x0

    :goto_9c
    const/16 v5, 0x8

    if-ge v4, v5, :cond_b3

    int-to-float v5, v4

    const v17, 0x3d23d70a    # 0.04f

    mul-float v5, v5, v17

    const v17, 0x3f2b851f    # 0.67f

    add-float v5, v5, v17

    mul-float v5, v5, v11

    .line 147
    invoke-virtual {v7, v12, v13, v5, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_9c

    .line 150
    :cond_b3
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 151
    invoke-virtual {v1, v10}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 152
    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const v4, 0x3c75c28f    # 0.015f

    mul-float v4, v4, v11

    .line 153
    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const v3, 0x2effffff

    .line 154
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    const v3, 0x3f7c28f6    # 0.985f

    mul-float v3, v3, v11

    .line 155
    invoke-virtual {v7, v12, v13, v3, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 158
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    .line 159
    iget v1, v0, Lcom/car/musiclite/MainActivity$VinylView;->angle:F

    invoke-virtual {v7, v1, v12, v13}, Landroid/graphics/Canvas;->rotate(FFF)V

    const v1, 0x3f47ae14    # 0.78f

    mul-float v1, v1, v11

    .line 161
    new-instance v3, Landroid/graphics/Path;

    invoke-direct {v3}, Landroid/graphics/Path;-><init>()V

    .line 162
    sget-object v4, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v3, v12, v13, v1, v4}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 163
    invoke-virtual {v7, v3}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 164
    iget-object v3, v0, Lcom/car/musiclite/MainActivity$VinylView;->bmp:Landroid/graphics/Bitmap;

    if-eqz v3, :cond_144

    .line 165
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    iget-object v4, v0, Lcom/car/musiclite/MainActivity$VinylView;->bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    mul-float v1, v1, v4

    div-float/2addr v1, v3

    .line 169
    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 170
    invoke-virtual {v3, v1, v1}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 171
    iget-object v4, v0, Lcom/car/musiclite/MainActivity$VinylView;->bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    int-to-float v4, v4

    mul-float v4, v4, v1

    const/high16 v5, 0x3f000000    # 0.5f

    mul-float v4, v4, v5

    sub-float v4, v12, v4

    iget-object v8, v0, Lcom/car/musiclite/MainActivity$VinylView;->bmp:Landroid/graphics/Bitmap;

    .line 172
    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    int-to-float v8, v8

    mul-float v8, v8, v1

    mul-float v8, v8, v5

    sub-float v1, v13, v8

    .line 171
    invoke-virtual {v3, v4, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 173
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 174
    invoke-virtual {v1, v10}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 175
    invoke-virtual {v1, v10}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 176
    iget-object v4, v0, Lcom/car/musiclite/MainActivity$VinylView;->bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v7, v4, v3, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    goto :goto_155

    .line 178
    :cond_144
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    .line 179
    invoke-virtual {v3, v10}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    const v4, -0xf0f0ed

    .line 180
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 181
    invoke-virtual {v7, v12, v13, v1, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 183
    :goto_155
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    # center hole/spindle circles removed per request

    .line 196
    new-instance v9, Landroid/graphics/Paint;

    invoke-direct {v9}, Landroid/graphics/Paint;-><init>()V

    .line 197
    invoke-virtual {v9, v10}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 198
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v9, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const v1, 0x3d3851ec    # 0.045f

    mul-float v1, v1, v11

    const/high16 v3, 0x40400000    # 3.0f

    .line 199
    invoke-static {v3, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-virtual {v9, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const v1, -0x171718

    .line 200
    invoke-virtual {v9, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 201
    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v9, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    add-float v5, v12, v2

    const v1, 0x3f933333    # 1.15f

    mul-float v1, v1, v11

    sub-float v4, v13, v1

    const/high16 v1, 0x3f400000    # 0.75f

    mul-float v1, v1, v11

    add-float v18, v12, v1

    sub-float v19, v13, v1

    const v1, 0x3f1eb852    # 0.62f  (head at 0.877R, rests on the ring outside the 0.78R cover)

    mul-float v1, v1, v11

    add-float v3, v12, v1

    sub-float v2, v13, v1

    move-object/from16 v1, p1

    move/from16 v20, v2

    move v2, v5

    move/from16 v21, v3

    move v3, v4

    move v15, v4

    move/from16 v4, v18

    move v8, v5

    move/from16 v5, v19

    move/from16 v22, v6

    move-object v6, v9

    .line 209
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move/from16 v2, v18

    move/from16 v3, v19

    move/from16 v4, v21

    move/from16 v5, v20

    .line 210
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 212
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 213
    invoke-virtual {v1, v10}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    const v2, -0xd0d0e

    .line 214
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    const v2, 0x3d8f5c29    # 0.07f

    mul-float v2, v2, v11

    .line 215
    invoke-virtual {v7, v8, v15, v2, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 217
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 218
    invoke-virtual {v1, v10}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    const v2, -0x222223

    .line 219
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    const v8, 0x3d4ccccd    # 0.05f

    mul-float v2, v11, v8

    move/from16 v4, v20

    move/from16 v3, v21

    .line 220
    invoke-virtual {v7, v3, v4, v2, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 223
    new-instance v9, Landroid/graphics/Paint;

    invoke-direct {v9}, Landroid/graphics/Paint;-><init>()V

    .line 224
    invoke-virtual {v9, v10}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 225
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v9, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v1, 0x40a00000    # 5.0f

    .line 226
    invoke-virtual {v9, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 227
    invoke-static {}, Lcom/car/musiclite/MainActivity;->accent()I

    move-result v1

    invoke-virtual {v9, v1}, Landroid/graphics/Paint;->setColor(I)V

    # spectrum bars hidden per request (vinyl + tonearm only); delete the jump
    # below to bring the FFT/sim spectrum back
    goto/16 :cond_2ba

    # fallback chain: playing but no real FFT energy for 2.5s -> simulated spectrum
    invoke-direct {v0}, Lcom/car/musiclite/MainActivity$VinylView;->isPlaying()Z

    move-result v1

    if-eqz v1, :no_sim

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iget-wide v3, v0, Lcom/car/musiclite/MainActivity$VinylView;->lastData:J

    sub-long v3, v1, v3

    const-wide/16 v5, 0x9c4

    cmp-long v6, v3, v5

    if-lez v6, :no_sim

    invoke-direct {v0, v1, v2}, Lcom/car/musiclite/MainActivity$VinylView;->simSpec(J)V

    :no_sim
    const/4 v10, 0x0

    :goto_22d
    const/16 v1, 0x30

    if-ge v10, v1, :cond_2ba

    .line 229
    rem-int/lit8 v1, v10, 0x18

    if-eqz v14, :cond_245

    .line 232
    iget-object v2, v0, Lcom/car/musiclite/MainActivity$VinylView;->sm:[F

    aget v2, v2, v1

    iget-object v3, v0, Lcom/car/musiclite/MainActivity$VinylView;->spec:[F

    aget v3, v3, v1

    sub-float/2addr v3, v2

    const v4, 0x3e99999a    # 0.3f

    mul-float v3, v3, v4

    add-float/2addr v2, v3

    goto :goto_24e

    .line 235
    :cond_245
    iget-object v2, v0, Lcom/car/musiclite/MainActivity$VinylView;->sm:[F

    aget v2, v2, v1

    const v3, 0x3f59999a    # 0.85f

    mul-float v2, v2, v3

    .line 237
    :goto_24e
    iget-object v3, v0, Lcom/car/musiclite/MainActivity$VinylView;->sm:[F

    aput v2, v3, v1

    cmpg-float v1, v2, v8

    move/from16 v15, v22

    if-gez v1, :cond_278

    # paused: hold bars still (no time-varying sine wiggle)
    const v2, 0x3cf5c28f    # 0.03f

    goto :goto_27e

    :cond_278
    const v16, 0x3ca3d70a    # 0.02f

    const v18, 0x3cf5c28f    # 0.03f

    :goto_27e
    int-to-float v1, v10

    const v3, 0x3e060aa6    # 0.1309f

    mul-float v1, v1, v3

    float-to-double v3, v1

    .line 243
    invoke-static {v3, v4}, Ljava/lang/Math;->cos(D)D

    move-result-wide v5

    double-to-float v1, v5

    .line 244
    invoke-static {v3, v4}, Ljava/lang/Math;->sin(D)D

    move-result-wide v3

    double-to-float v3, v3

    const v4, 0x3f828f5c    # 1.02f

    mul-float v4, v4, v11

    const v5, 0x3eae147b    # 0.34f

    mul-float v5, v5, v11

    mul-float v5, v5, v2

    mul-float v2, v1, v4

    add-float/2addr v2, v12

    mul-float v6, v3, v4

    add-float/2addr v6, v13

    add-float/2addr v4, v5

    mul-float v1, v1, v4

    add-float v5, v12, v1

    mul-float v3, v3, v4

    add-float v19, v13, v3

    move-object/from16 v1, p1

    move v3, v6

    move v4, v5

    move/from16 v5, v19

    move-object v6, v9

    .line 247
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    add-int/lit8 v10, v10, 0x1

    move/from16 v22, v15

    goto/16 :goto_22d

    :cond_2ba
    const-wide/16 v1, 0x10

    .line 251
    invoke-virtual {v0, v1, v2}, Lcom/car/musiclite/MainActivity$VinylView;->postInvalidateDelayed(J)V

    return-void

    :cond_2c0
    :goto_2c0
    const-wide/16 v1, 0x10

    .line 107
    invoke-virtual {v0, v1, v2}, Lcom/car/musiclite/MainActivity$VinylView;->postInvalidateDelayed(J)V

    return-void
.end method

.method public onFftDataCapture(Landroid/media/audiofx/Visualizer;[BI)V
    .registers 12

    .line 77
    :try_start_0
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity$VinylView;->isPlaying()Z

    move-result p1

    if-nez p1, :cond_7

    return-void

    .line 78
    :cond_7
    array-length p1, p2

    div-int/lit8 p1, p1, 0x2

    const/16 p3, 0x1a

    if-gt p1, p3, :cond_f

    return-void

    :cond_f
    add-int/lit8 p3, p1, -0x3

    .line 81
    div-int/lit8 v0, p3, 0x18

    const/4 v1, 0x1

    if-ge v0, v1, :cond_17

    const/4 v0, 0x1

    :cond_17
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_19
    const/16 v3, 0x18

    if-ge v2, v3, :cond_4f

    mul-int v4, v2, p3

    .line 84
    div-int/2addr v4, v3

    add-int/lit8 v4, v4, 0x2

    add-int v3, v4, v0

    if-le v3, p1, :cond_27

    move v3, p1

    :cond_27
    const/4 v5, 0x0

    :goto_28
    if-ge v4, v3, :cond_3b

    .line 89
    aget-byte v6, p2, v4

    add-int v7, v4, p1

    .line 90
    aget-byte v7, p2, v7

    mul-int v6, v6, v6

    mul-int v7, v7, v7

    add-int/2addr v6, v7

    if-le v6, v5, :cond_38

    move v5, v6

    :cond_38
    add-int/lit8 v4, v4, 0x1

    goto :goto_28

    :cond_3b
    int-to-float v3, v5

    const v4, 0x469c4000    # 20000.0f

    div-float/2addr v3, v4

    const/high16 v4, 0x3f800000    # 1.0f

    cmpl-float v5, v3, v4

    if-lez v5, :cond_48

    const/high16 v3, 0x3f800000    # 1.0f

    .line 96
    :cond_48
    iget-object v4, p0, Lcom/car/musiclite/MainActivity$VinylView;->spec:[F

    aput v3, v4, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_19

    .line 98
    :cond_4f
    # record when real energy last arrived + diag log every 2s
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    # scan spec[] for max — locals only (v0-v7); v8 is this!
    const/4 v2, 0x0

    const/4 v3, 0x0

    int-to-float v3, v3

    :spec_scan
    const/16 v4, 0x18

    if-ge v2, v4, :spec_done

    iget-object v5, p0, Lcom/car/musiclite/MainActivity$VinylView;->spec:[F

    aget v6, v5, v2

    cmpl-float v4, v6, v3

    if-lez v4, :spec_next

    move v3, v6

    :spec_next
    add-int/lit8 v2, v2, 0x1

    goto :spec_scan

    :spec_done
    const v4, 0x3ca3d70a    # 0.02f

    cmpl-float v4, v3, v4

    if-lez v4, :quiet

    iput-wide v0, p0, Lcom/car/musiclite/MainActivity$VinylView;->lastData:J

    :quiet
    iget-wide v4, p0, Lcom/car/musiclite/MainActivity$VinylView;->lastLog:J

    sub-long v4, v0, v4

    const-wide/16 v6, 0x7d0

    cmp-long v2, v4, v6

    if-lez v2, :log_done

    iput-wide v0, p0, Lcom/car/musiclite/MainActivity$VinylView;->lastLog:J

    const-string v0, "MusicLite.Spec"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "fft bins="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " max="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :log_done
    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity$VinylView;->postInvalidate()V
    :try_end_52
    .catchall {:try_start_0 .. :try_end_52} :catchall_52

    :catchall_52
    return-void
.end method

.method public onWaveFormDataCapture(Landroid/media/audiofx/Visualizer;[BI)V
    .registers 4

    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;)V
    .registers 3

    .line 32
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 33
    iput-object p1, p0, Lcom/car/musiclite/MainActivity$VinylView;->bmp:Landroid/graphics/Bitmap;

    .line 34
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$VinylView;->glow:Lcom/car/musiclite/MainActivity$GlowBg;

    if-eqz v0, :cond_c

    .line 35
    invoke-virtual {v0, p1}, Lcom/car/musiclite/MainActivity$GlowBg;->setCover(Landroid/graphics/Bitmap;)V

    .line 37
    :cond_c
    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity$VinylView;->invalidate()V

    return-void
.end method

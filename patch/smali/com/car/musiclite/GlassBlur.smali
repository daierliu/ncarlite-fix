.class public Lcom/car/musiclite/GlassBlur;
.super Landroid/graphics/drawable/Drawable;

# frosted-glass capsule background (Tingyu style):
# downsampled snapshot of the content behind the bar, stretched back =
# natural blur; plus theme-derived glass tint, inset highlight, drop shadow.
# API 18 safe: Canvas/RectF/drawRoundRect/drawBitmap only.

.field public static inst:Lcom/car/musiclite/GlassBlur;
.field private static snap:Landroid/graphics/Bitmap;
.field private static sx:I
.field private static sy:I
.field private static dark:Z
.field private final paint:Landroid/graphics/Paint;
.field private final tmp:Landroid/graphics/RectF;
.field private final srcR:Landroid/graphics/Rect;

.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/car/musiclite/GlassBlur;

    invoke-direct {v0}, Lcom/car/musiclite/GlassBlur;-><init>()V

    sput-object v0, Lcom/car/musiclite/GlassBlur;->inst:Lcom/car/musiclite/GlassBlur;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    iput-object v0, p0, Lcom/car/musiclite/GlassBlur;->paint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/car/musiclite/GlassBlur;->tmp:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/car/musiclite/GlassBlur;->srcR:Landroid/graphics/Rect;

    return-void
.end method

.method public static setSource(Landroid/graphics/Bitmap;II)V
    .locals 1

    sput-object p0, Lcom/car/musiclite/GlassBlur;->snap:Landroid/graphics/Bitmap;

    sput p1, Lcom/car/musiclite/GlassBlur;->sx:I

    sput p2, Lcom/car/musiclite/GlassBlur;->sy:I

    sget-object v0, Lcom/car/musiclite/GlassBlur;->inst:Lcom/car/musiclite/GlassBlur;

    if-eqz v0, :ss_ret

    invoke-virtual {v0}, Lcom/car/musiclite/GlassBlur;->invalidateSelf()V

    :ss_ret
    return-void
.end method

.method public static setMode(Z)V
    .locals 1

    sput-boolean p0, Lcom/car/musiclite/GlassBlur;->dark:Z

    sget-object v0, Lcom/car/musiclite/GlassBlur;->inst:Lcom/car/musiclite/GlassBlur;

    if-eqz v0, :sm_ret

    invoke-virtual {v0}, Lcom/car/musiclite/GlassBlur;->invalidateSelf()V

    :sm_ret
    return-void
.end method

# pill fill/stroke helper: rect set from bounds + optional inset, then round-rect
# kept simple: main draw below, helpers use only 5-register-safe calls

.method public draw(Landroid/graphics/Canvas;)V
    .locals 10

    invoke-virtual {p0}, Lcom/car/musiclite/GlassBlur;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v1

    if-lez v1, :d_ret

    int-to-float v1, v1

    const/high16 v2, 0x40000000

    div-float v7, v1, v2          # v7 = radius = h/2 (full pill)

    iget-object v3, p0, Lcom/car/musiclite/GlassBlur;->tmp:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/car/musiclite/GlassBlur;->paint:Landroid/graphics/Paint;

    # ---- 1. drop shadow (same pill shifted down) ----
    sget-boolean v1, Lcom/car/musiclite/GlassBlur;->dark:Z

    if-eqz v1, :d_shl

    const v5, 0x40000000

    goto :d_shc

    :d_shl
    const v5, 0x1a000000

    :d_shc
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    iget v1, v0, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    iget v2, v0, Landroid/graphics/Rect;->top:I

    add-int/lit8 v2, v2, 0x14

    int-to-float v2, v2

    iget v5, v0, Landroid/graphics/Rect;->right:I

    int-to-float v5, v5

    iget v6, v0, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v6, v6, 0x14

    int-to-float v6, v6

    invoke-virtual {v3, v1, v2, v5, v6}, Landroid/graphics/RectF;->set(FFFF)V

    invoke-virtual {p1, v3, v7, v7, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    # ---- 2. blurred backdrop: crop snapshot region, stretch to bounds ----
    sget-object v1, Lcom/car/musiclite/GlassBlur;->snap:Landroid/graphics/Bitmap;

    if-eqz v1, :d_tint

    iget-object v2, p0, Lcom/car/musiclite/GlassBlur;->srcR:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v5

    shr-int/lit8 v5, v5, 0x3

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v6

    shr-int/lit8 v6, v6, 0x3

    sget v8, Lcom/car/musiclite/GlassBlur;->sx:I

    add-int/2addr v5, v8

    sget v9, Lcom/car/musiclite/GlassBlur;->sy:I

    add-int/2addr v6, v9

    invoke-virtual {v2, v8, v9, v5, v6}, Landroid/graphics/Rect;->set(IIII)V

    # clamp crop into the snapshot
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    iget v5, v2, Landroid/graphics/Rect;->right:I

    if-le v5, v8, :d_cl1

    iput v8, v2, Landroid/graphics/Rect;->right:I

    :d_cl1
    sget-object v1, Lcom/car/musiclite/GlassBlur;->snap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    iget v5, v2, Landroid/graphics/Rect;->bottom:I

    if-le v5, v8, :d_cl2

    iput v8, v2, Landroid/graphics/Rect;->bottom:I

    :d_cl2
    sget-object v1, Lcom/car/musiclite/GlassBlur;->snap:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v1, v2, v0, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    # ---- 3. theme-derived glass tint ----
    :d_tint
    invoke-virtual {v3, v0}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    sget-boolean v1, Lcom/car/musiclite/GlassBlur;->dark:Z

    if-eqz v1, :d_til

    const v5, 0x8f0f1815          # rgba(15,24,21,0.56) night glass

    goto :d_tic

    :d_til
    const v5, 0x73ffffff          # ~45% white daylight glass

    :d_tic
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p1, v3, v7, v7, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    # ---- 4. inset highlight stroke ----
    const/4 v1, 0x2

    int-to-float v1, v1

    invoke-virtual {v4, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    sget-boolean v1, Lcom/car/musiclite/GlassBlur;->dark:Z

    if-eqz v1, :d_hll

    const v5, 0x30ffffff

    goto :d_hlc

    :d_hll
    const v5, 0x1e000000

    :d_hlc
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    iget v1, v0, Landroid/graphics/Rect;->left:I

    add-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    iget v2, v0, Landroid/graphics/Rect;->top:I

    add-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    iget v5, v0, Landroid/graphics/Rect;->right:I

    add-int/lit8 v5, v5, -0x2

    int-to-float v5, v5

    iget v6, v0, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v6, v6, -0x2

    int-to-float v6, v6

    invoke-virtual {v3, v1, v2, v5, v6}, Landroid/graphics/RectF;->set(FFFF)V

    const v1, 0x3f800000

    sub-float v6, v7, v1          # radius - 1f

    invoke-virtual {p1, v3, v6, v6, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    :d_ret
    return-void
.end method

.method public getOpacity()I
    .locals 1

    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .locals 0

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    return-void
.end method

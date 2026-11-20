.class Lcom/car/musiclite/MainActivity$LyricSwipe;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field private dx0:F

.field private dy0:F

.field final synthetic this$0:Lcom/car/musiclite/MainActivity;


# direct methods
.method constructor <init>(Lcom/car/musiclite/MainActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/car/musiclite/MainActivity$LyricSwipe;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    if-eq v0, v1, :act_down

    const/4 v1, 0x1

    if-eq v0, v1, :act_up

    # other actions (move/cancel) not consumed
    const/4 v0, 0x0

    return v0

    :act_down
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/car/musiclite/MainActivity$LyricSwipe;->dx0:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/car/musiclite/MainActivity$LyricSwipe;->dy0:F

    const/4 v0, 0x1

    return v0

    :act_up
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget v1, p0, Lcom/car/musiclite/MainActivity$LyricSwipe;->dx0:F

    sub-float/2addr v0, v1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    iget v2, p0, Lcom/car/musiclite/MainActivity$LyricSwipe;->dy0:F

    sub-float/2addr v1, v2

    # require |dx| > 140px
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const/high16 v3, 0x430c0000    # 140.0f

    cmpg-float v4, v2, v3

    if-lez v4, :not_fling

    # require |dy| < 100px
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const/high16 v3, 0x42c80000    # 100.0f

    cmpg-float v4, v2, v3

    if-gez v4, :not_fling

    # horizontal fling: left -> next, right -> prev
    const/4 v3, 0x0

    cmpg-float v4, v0, v3

    if-lez v4, :act_next_sw

    const-string v3, "com.car.musiclite.PREV"

    goto :do_send

    :act_next_sw
    const-string v3, "com.car.musiclite.NEXT"

    :do_send
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$LyricSwipe;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {v0, v3}, Lcom/car/musiclite/MainActivity;->access$1700(Lcom/car/musiclite/MainActivity;Ljava/lang/String;)V

    const/4 v0, 0x1

    return v0

    :not_fling
    const/4 v0, 0x0

    return v0
.end method

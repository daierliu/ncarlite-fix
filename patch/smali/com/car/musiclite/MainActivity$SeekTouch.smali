.class Lcom/car/musiclite/MainActivity$SeekTouch;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field private downX:F

.field final synthetic this$0:Lcom/car/musiclite/MainActivity;


# direct methods
.method constructor <init>(Lcom/car/musiclite/MainActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/car/musiclite/MainActivity$SeekTouch;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :st_down

    const/4 v2, 0x1

    if-eq v0, v2, :st_up

    return v1

    :st_down
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    iput v2, p0, Lcom/car/musiclite/MainActivity$SeekTouch;->downX:F

    return v1

    :st_up
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    iget v3, p0, Lcom/car/musiclite/MainActivity$SeekTouch;->downX:F

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const/high16 v3, 0x41c00000    # 24.0f

    cmpg-float v0, v2, v3

    if-gez v0, :st_move

    iget-object v0, p0, Lcom/car/musiclite/MainActivity$SeekTouch;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-virtual {v0}, Lcom/car/musiclite/MainActivity;->showLyrics()V

    const/4 v1, 0x1

    return v1

    :st_move
    return v1
.end method

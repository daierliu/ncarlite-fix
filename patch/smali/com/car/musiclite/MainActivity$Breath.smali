.class Lcom/car/musiclite/MainActivity$Breath;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field final synthetic this$0:Lcom/car/musiclite/MainActivity;


# direct methods
.method constructor <init>(Lcom/car/musiclite/MainActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/car/musiclite/MainActivity$Breath;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    const v1, 0x3d800000    # 0.0625f

    mul-float v0, v0, v1

    const/high16 v1, 0x3f700000    # 0.9375f

    add-float/2addr v0, v1

    iget-object v1, p0, Lcom/car/musiclite/MainActivity$Breath;->this$0:Lcom/car/musiclite/MainActivity;

    iget-object v1, v1, Lcom/car/musiclite/MainActivity;->coverView:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setScaleX(F)V

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setScaleY(F)V

    return-void
.end method

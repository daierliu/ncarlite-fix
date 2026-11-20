.class Lcom/car/musiclite/MainActivity$CoverRun;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final iv:Landroid/widget/ImageView;

.field final bmp:Landroid/graphics/Bitmap;


# direct methods
.method constructor <init>(Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V
    .locals 0

    iput-object p1, p0, Lcom/car/musiclite/MainActivity$CoverRun;->iv:Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/car/musiclite/MainActivity$CoverRun;->bmp:Landroid/graphics/Bitmap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/car/musiclite/MainActivity$CoverRun;->bmp:Landroid/graphics/Bitmap;

    if-eqz v0, :tr_end

    iget-object v1, p0, Lcom/car/musiclite/MainActivity$CoverRun;->iv:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :tr_end
    return-void
.end method

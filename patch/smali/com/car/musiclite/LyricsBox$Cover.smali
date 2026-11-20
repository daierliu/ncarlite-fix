.class public Lcom/car/musiclite/LyricsBox$Cover;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "LyricsBox.java"


# instance fields
.field private owner:Lcom/car/musiclite/LyricsBox;


# direct methods
.method public constructor <init>(Lcom/car/musiclite/LyricsBox;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/car/musiclite/LyricsBox$Cover;->owner:Lcom/car/musiclite/LyricsBox;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/car/musiclite/LyricsBox$Cover;->owner:Lcom/car/musiclite/LyricsBox;

    iget-object v1, v0, Lcom/car/musiclite/LyricsBox;->bmp:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_ret

    iget-object v0, v0, Lcom/car/musiclite/LyricsBox;->cover:Landroid/widget/ImageView;

    if-eqz v0, :cond_ret

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_ret
    return-void
.end method

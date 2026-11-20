.class public Lcom/car/musiclite/MainActivity$BackBtn;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final this$0:Lcom/car/musiclite/MainActivity;


# direct methods
.method public constructor <init>(Lcom/car/musiclite/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/car/musiclite/MainActivity$BackBtn;->this$0:Lcom/car/musiclite/MainActivity;

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    # in lyrics screen: just close lyrics, reveal the underlying screen (song list etc.)
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$BackBtn;->this$0:Lcom/car/musiclite/MainActivity;

    iget-object v1, v0, Lcom/car/musiclite/MainActivity;->lyricsOverlay:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v1

    if-nez v1, :back_home

    invoke-virtual {v0}, Lcom/car/musiclite/MainActivity;->hideLyrics()V

    return-void

    :back_home
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/car/musiclite/MainActivity;->access$9900(Lcom/car/musiclite/MainActivity;I)V

    return-void
.end method

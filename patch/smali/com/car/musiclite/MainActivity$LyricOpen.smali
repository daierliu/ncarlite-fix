.class Lcom/car/musiclite/MainActivity$LyricOpen;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic this$0:Lcom/car/musiclite/MainActivity;


# direct methods
.method constructor <init>(Lcom/car/musiclite/MainActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/car/musiclite/MainActivity$LyricOpen;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    # already on the lyrics page -> ignore capsule clicks entirely
    sget-boolean v0, Lcom/car/musiclite/MainActivity;->wasLyrics:Z

    if-eqz v0, :do_open

    return-void

    :do_open
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$LyricOpen;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-virtual {v0}, Lcom/car/musiclite/MainActivity;->showLyrics()V

    return-void
.end method

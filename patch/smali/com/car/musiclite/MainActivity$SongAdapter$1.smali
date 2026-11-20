.class Lcom/car/musiclite/MainActivity$SongAdapter$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/car/musiclite/MainActivity$SongAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/car/musiclite/MainActivity$SongAdapter;

.field final synthetic val$s:Lcom/car/musiclite/Api$Song;


# direct methods
.method constructor <init>(Lcom/car/musiclite/MainActivity$SongAdapter;Lcom/car/musiclite/Api$Song;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 718
    iput-object p2, p0, Lcom/car/musiclite/MainActivity$SongAdapter$1;->val$s:Lcom/car/musiclite/Api$Song;

    iput-object p1, p0, Lcom/car/musiclite/MainActivity$SongAdapter$1;->this$1:Lcom/car/musiclite/MainActivity$SongAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 721
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$SongAdapter$1;->this$1:Lcom/car/musiclite/MainActivity$SongAdapter;

    iget-object p1, p1, Lcom/car/musiclite/MainActivity$SongAdapter;->this$0:Lcom/car/musiclite/MainActivity;

    iget-object v0, p0, Lcom/car/musiclite/MainActivity$SongAdapter$1;->this$1:Lcom/car/musiclite/MainActivity$SongAdapter;

    invoke-static {v0}, Lcom/car/musiclite/MainActivity$SongAdapter;->access$4000(Lcom/car/musiclite/MainActivity$SongAdapter;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/car/musiclite/MainActivity$SongAdapter$1;->this$1:Lcom/car/musiclite/MainActivity$SongAdapter;

    invoke-static {v1}, Lcom/car/musiclite/MainActivity$SongAdapter;->access$4000(Lcom/car/musiclite/MainActivity$SongAdapter;)Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Lcom/car/musiclite/MainActivity$SongAdapter$1;->val$s:Lcom/car/musiclite/Api$Song;

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-static {p1, v0, v1}, Lcom/car/musiclite/MainActivity;->access$4100(Lcom/car/musiclite/MainActivity;Ljava/util/List;I)V

    # auto-jump to lyrics page when a song is tapped to play
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$SongAdapter$1;->this$1:Lcom/car/musiclite/MainActivity$SongAdapter;

    iget-object p1, p1, Lcom/car/musiclite/MainActivity$SongAdapter;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-virtual {p1}, Lcom/car/musiclite/MainActivity;->showLyrics()V

    return-void
.end method

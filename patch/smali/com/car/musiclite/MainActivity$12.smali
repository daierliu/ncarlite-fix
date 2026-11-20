.class Lcom/car/musiclite/MainActivity$12;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lcom/car/musiclite/Api$Cb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/car/musiclite/MainActivity;->openPlaylist(Lcom/car/musiclite/Api$Playlist;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/car/musiclite/Api$Cb<",
        "Ljava/util/List<",
        "Lcom/car/musiclite/Api$Song;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/car/musiclite/MainActivity;


# direct methods
.method constructor <init>(Lcom/car/musiclite/MainActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 496
    iput-object p1, p0, Lcom/car/musiclite/MainActivity$12;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onDone(Ljava/lang/Object;Ljava/lang/Exception;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 496
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1, p2}, Lcom/car/musiclite/MainActivity$12;->onDone(Ljava/util/List;Ljava/lang/Exception;)V

    return-void
.end method

.method public onDone(Ljava/util/List;Ljava/lang/Exception;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/car/musiclite/Api$Song;",
            ">;",
            "Ljava/lang/Exception;",
            ")V"
        }
    .end annotation

    .line 499
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$12;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {v0}, Lcom/car/musiclite/MainActivity;->access$2600(Lcom/car/musiclite/MainActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    if-eqz p1, :cond_0

    .line 501
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$12;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {v0}, Lcom/car/musiclite/MainActivity;->access$2600(Lcom/car/musiclite/MainActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 503
    :cond_0
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$12;->this$0:Lcom/car/musiclite/MainActivity;

    const-string v0, "\u6bcf\u65e5\u63a8\u8350"

    invoke-static {p1, v0}, Lcom/car/musiclite/MainActivity;->access$2702(Lcom/car/musiclite/MainActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 504
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$12;->this$0:Lcom/car/musiclite/MainActivity;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/car/musiclite/MainActivity;->access$2802(Lcom/car/musiclite/MainActivity;Z)Z

    .line 505
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$12;->this$0:Lcom/car/musiclite/MainActivity;

    const/4 v1, 0x1

    invoke-static {p1, v1}, Lcom/car/musiclite/MainActivity;->access$1300(Lcom/car/musiclite/MainActivity;I)V

    .line 506
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$12;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {p1}, Lcom/car/musiclite/MainActivity;->access$1100(Lcom/car/musiclite/MainActivity;)Landroid/widget/GridView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/GridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    check-cast p1, Lcom/car/musiclite/MainActivity$SongAdapter;

    invoke-virtual {p1}, Lcom/car/musiclite/MainActivity$SongAdapter;->notifyDataSetChanged()V

    if-nez p2, :svskip

    iget-object v2, p0, Lcom/car/musiclite/MainActivity$12;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-virtual {v2}, Lcom/car/musiclite/MainActivity;->saveListCache()V

    :svskip
    if-eqz p2, :cond_1

    .line 508
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$12;->this$0:Lcom/car/musiclite/MainActivity;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\u83b7\u53d6\u5931\u8d25: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :cond_1
    return-void
.end method

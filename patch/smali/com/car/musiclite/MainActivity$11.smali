.class Lcom/car/musiclite/MainActivity$11;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lcom/car/musiclite/Api$Cb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/car/musiclite/MainActivity;->doSearch()V
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

    .line 475
    iput-object p1, p0, Lcom/car/musiclite/MainActivity$11;->this$0:Lcom/car/musiclite/MainActivity;

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

    .line 475
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1, p2}, Lcom/car/musiclite/MainActivity$11;->onDone(Ljava/util/List;Ljava/lang/Exception;)V

    return-void
.end method

.method public onDone(Ljava/util/List;Ljava/lang/Exception;)V
    .locals 2
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

    .line 478
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$11;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {v0}, Lcom/car/musiclite/MainActivity;->access$2600(Lcom/car/musiclite/MainActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    if-eqz p1, :cond_0

    .line 480
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$11;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {v0}, Lcom/car/musiclite/MainActivity;->access$2600(Lcom/car/musiclite/MainActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 482
    :cond_0
    if-nez p2, :sv11skip

    iget-object v0, p0, Lcom/car/musiclite/MainActivity$11;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-virtual {v0}, Lcom/car/musiclite/MainActivity;->saveListCache()V

    :sv11skip
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$11;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {p1}, Lcom/car/musiclite/MainActivity;->access$2600(Lcom/car/musiclite/MainActivity;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    .line 483
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$11;->this$0:Lcom/car/musiclite/MainActivity;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\u641c\u7d22\u5931\u8d25: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 485
    :cond_1
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$11;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {p1}, Lcom/car/musiclite/MainActivity;->access$1100(Lcom/car/musiclite/MainActivity;)Landroid/widget/GridView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/GridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    check-cast p1, Lcom/car/musiclite/MainActivity$SongAdapter;

    invoke-virtual {p1}, Lcom/car/musiclite/MainActivity$SongAdapter;->notifyDataSetChanged()V

    return-void
.end method

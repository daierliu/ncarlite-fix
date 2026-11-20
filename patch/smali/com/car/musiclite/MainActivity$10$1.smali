.class Lcom/car/musiclite/MainActivity$10$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lcom/car/musiclite/Api$Cb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/car/musiclite/MainActivity$10;->onDone(Lcom/car/musiclite/Api$Profile;Ljava/lang/Exception;)V
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
        "Lcom/car/musiclite/Api$Playlist;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/car/musiclite/MainActivity$10;


# direct methods
.method constructor <init>(Lcom/car/musiclite/MainActivity$10;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 422
    iput-object p1, p0, Lcom/car/musiclite/MainActivity$10$1;->this$1:Lcom/car/musiclite/MainActivity$10;

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

    .line 422
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1, p2}, Lcom/car/musiclite/MainActivity$10$1;->onDone(Ljava/util/List;Ljava/lang/Exception;)V

    return-void
.end method

.method public onDone(Ljava/util/List;Ljava/lang/Exception;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/car/musiclite/Api$Playlist;",
            ">;",
            "Ljava/lang/Exception;",
            ")V"
        }
    .end annotation

    .line 425
    iget-object p2, p0, Lcom/car/musiclite/MainActivity$10$1;->this$1:Lcom/car/musiclite/MainActivity$10;

    iget-object p2, p2, Lcom/car/musiclite/MainActivity$10;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {p2}, Lcom/car/musiclite/MainActivity;->access$2300(Lcom/car/musiclite/MainActivity;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 426
    new-instance p2, Lcom/car/musiclite/Api$Playlist;

    invoke-direct {p2}, Lcom/car/musiclite/Api$Playlist;-><init>()V

    const-wide/16 v0, -0x1

    .line 427
    iput-wide v0, p2, Lcom/car/musiclite/Api$Playlist;->id:J

    .line 428
    const-string v0, "\u6bcf\u65e5\u63a8\u8350"

    iput-object v0, p2, Lcom/car/musiclite/Api$Playlist;->name:Ljava/lang/String;

    .line 429
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$10$1;->this$1:Lcom/car/musiclite/MainActivity$10;

    iget-object v0, v0, Lcom/car/musiclite/MainActivity$10;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {v0}, Lcom/car/musiclite/MainActivity;->access$2300(Lcom/car/musiclite/MainActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    # private radar card (shared radar playlist id; content follows the account cookie)
    new-instance p2, Lcom/car/musiclite/Api$Playlist;

    invoke-direct {p2}, Lcom/car/musiclite/Api$Playlist;-><init>()V

    const-wide v0, 3136952023L

    iput-wide v0, p2, Lcom/car/musiclite/Api$Playlist;->id:J

    const-string v0, "\u79c1\u4eba\u96f7\u8fbe"

    iput-object v0, p2, Lcom/car/musiclite/Api$Playlist;->name:Ljava/lang/String;

    iget-object v0, p0, Lcom/car/musiclite/MainActivity$10$1;->this$1:Lcom/car/musiclite/MainActivity$10;

    iget-object v0, v0, Lcom/car/musiclite/MainActivity$10;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {v0}, Lcom/car/musiclite/MainActivity;->access$2300(Lcom/car/musiclite/MainActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    if-eqz p1, :cond_0

    .line 431
    iget-object p2, p0, Lcom/car/musiclite/MainActivity$10$1;->this$1:Lcom/car/musiclite/MainActivity$10;

    iget-object p2, p2, Lcom/car/musiclite/MainActivity$10;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {p2}, Lcom/car/musiclite/MainActivity;->access$2300(Lcom/car/musiclite/MainActivity;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 433
    :cond_0
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$10$1;->this$1:Lcom/car/musiclite/MainActivity$10;

    iget-object p1, p1, Lcom/car/musiclite/MainActivity$10;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {p1}, Lcom/car/musiclite/MainActivity;->access$2400(Lcom/car/musiclite/MainActivity;)V

    .line 434
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$10$1;->this$1:Lcom/car/musiclite/MainActivity$10;

    iget-object p1, p1, Lcom/car/musiclite/MainActivity$10;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {p1}, Lcom/car/musiclite/MainActivity;->access$2500(Lcom/car/musiclite/MainActivity;)Landroid/widget/GridView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/GridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    check-cast p1, Lcom/car/musiclite/MainActivity$HomeAdapter;

    invoke-virtual {p1}, Lcom/car/musiclite/MainActivity$HomeAdapter;->notifyDataSetChanged()V

    return-void
.end method

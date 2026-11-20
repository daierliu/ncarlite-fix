.class Lcom/car/musiclite/Api$5;
.super Ljava/lang/Object;
.source "Api.java"

# interfaces
.implements Lcom/car/musiclite/Api$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/car/musiclite/Api;->recommendSongs(Lcom/car/musiclite/Api$Cb;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/car/musiclite/Api$Job<",
        "Ljava/util/List<",
        "Lcom/car/musiclite/Api$Song;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/car/musiclite/Api;


# direct methods
.method constructor <init>(Lcom/car/musiclite/Api;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 233
    iput-object p1, p0, Lcom/car/musiclite/Api$5;->this$0:Lcom/car/musiclite/Api;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic work()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 233
    invoke-virtual {p0}, Lcom/car/musiclite/Api$5;->work()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public work()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/car/musiclite/Api$Song;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 236
    iget-object v0, p0, Lcom/car/musiclite/Api$5;->this$0:Lcom/car/musiclite/Api;

    const-string v1, "/v3/discovery/recommend/songs"

    const-string v2, "{\"limit\":50,\"total\":true}"

    invoke-virtual {v0, v1, v2}, Lcom/car/musiclite/Api;->post(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 238
    const-string v1, "data"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "dailySongs"

    invoke-static {v0, v1}, Lcom/car/musiclite/Api;->access$100(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

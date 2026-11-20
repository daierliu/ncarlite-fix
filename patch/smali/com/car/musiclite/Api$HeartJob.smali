.class Lcom/car/musiclite/Api$HeartJob;
.super Ljava/lang/Object;
.source "Api.java"

# interfaces
.implements Lcom/car/musiclite/Api$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/car/musiclite/Api;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "HeartJob"
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

.field private final pid:J

.field private final songId:J


# direct methods
.method constructor <init>(Lcom/car/musiclite/Api;JJ)V
    .locals 0

    iput-object p1, p0, Lcom/car/musiclite/Api$HeartJob;->this$0:Lcom/car/musiclite/Api;

    iput-wide p2, p0, Lcom/car/musiclite/Api$HeartJob;->songId:J

    iput-wide p4, p0, Lcom/car/musiclite/Api$HeartJob;->pid:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic work()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/car/musiclite/Api$HeartJob;->work()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public work()Ljava/util/List;
    .locals 9

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/car/musiclite/Api$Song;",
            ">;"
        }
    .end annotation

    :try_start_0
    # params = {"songId":x,"playlistId":y,"startMusicId":x,"type":"fromPlayingOne"}
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iget-wide v1, p0, Lcom/car/musiclite/Api$HeartJob;->songId:J

    const-string v3, "songId"

    invoke-virtual {v0, v3, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    iget-wide v1, p0, Lcom/car/musiclite/Api$HeartJob;->pid:J

    const-string v3, "playlistId"

    invoke-virtual {v0, v3, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    iget-wide v1, p0, Lcom/car/musiclite/Api$HeartJob;->songId:J

    const-string v3, "startMusicId"

    invoke-virtual {v0, v3, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v1, "type"

    const-string v2, "fromPlayingOne"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/car/musiclite/Api$HeartJob;->this$0:Lcom/car/musiclite/Api;

    const-string v2, "/playmode/intelligence/list"

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/car/musiclite/Api;->post(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    # diag: log raw response
    const-string v1, "MusicLite.Heart"

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    # response shape: {"data":{"list":[{songInfo:...}]}} - data is an OBJECT
    const-string v1, "data"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :fb

    const-string v1, "list"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    if-eqz v0, :fb

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    const/4 v2, 0x0

    :i_loop
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :i_end

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "songInfo"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :i_next

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :i_next
    add-int/lit8 v2, v2, 0x1

    goto :i_loop

    :i_end
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-eqz v2, :fb

    invoke-static {v1}, Lcom/car/musiclite/Api$HeartJob;->parse(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :w_end

    :fb
    # fallback: daily recommendations
    iget-object v0, p0, Lcom/car/musiclite/Api$HeartJob;->this$0:Lcom/car/musiclite/Api;

    const-string v1, "/v3/discovery/recommend/songs"

    const-string v2, "{\"limit\":50,\"total\":true}"

    invoke-virtual {v0, v1, v2}, Lcom/car/musiclite/Api;->post(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    # diag: log fallback response
    const-string v1, "MusicLite.Heart"

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "data"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "dailySongs"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-static {v1}, Lcom/car/musiclite/Api$HeartJob;->parse(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v0

    :w_end
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :ret_ok

    :catch_0
    move-exception v0

    const-string v1, "MusicLite.Heart"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/Throwable;)I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :ret_ok
    return-object v0
.end method

.method private static parse(Lorg/json/JSONArray;)Ljava/util/List;
    .locals 5

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/List<",
            "Lcom/car/musiclite/Api$Song;",
            ">;"
        }
    .end annotation

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "arr"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {v0, v1}, Lcom/car/musiclite/Api;->parseSongs(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

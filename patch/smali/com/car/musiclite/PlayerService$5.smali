.class Lcom/car/musiclite/PlayerService$5;
.super Ljava/lang/Object;
.source "PlayerService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/car/musiclite/PlayerService;->startProgressTicker()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/car/musiclite/PlayerService;


# direct methods
.method constructor <init>(Lcom/car/musiclite/PlayerService;)V
    .locals 0

    iput-object p1, p0, Lcom/car/musiclite/PlayerService$5;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    # ---- re-arm FIRST so the loop survives mp==null windows (song switch) ----
    const/4 v0, 0x0

    sput-boolean v0, Lcom/car/musiclite/PlayerService;->tickerOn:Z

    iget-object v0, p0, Lcom/car/musiclite/PlayerService$5;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-static {v0}, Lcom/car/musiclite/PlayerService;->access$500(Lcom/car/musiclite/PlayerService;)V

    # ---- execution: skip conditions no longer kill the loop ----
    invoke-static {v0}, Lcom/car/musiclite/PlayerService;->access$900(Lcom/car/musiclite/PlayerService;)Landroid/media/MediaPlayer;

    move-result-object v0

    if-eqz v0, :cond_end

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    sget-wide v4, Lcom/car/musiclite/PlayerService;->lastTick:J

    sub-long v4, v2, v4

    const-wide/16 v0, 0x320

    cmp-long v0, v4, v0

    if-ltz v0, :cond_end

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    sput-wide v0, Lcom/car/musiclite/PlayerService;->lastTick:J

    iget-object v0, p0, Lcom/car/musiclite/PlayerService$5;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-static {v0}, Lcom/car/musiclite/PlayerService;->access$000(Lcom/car/musiclite/PlayerService;)Z

    move-result v0

    if-eqz v0, :cond_end

    iget-object v0, p0, Lcom/car/musiclite/PlayerService$5;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-static {v0}, Lcom/car/musiclite/PlayerService;->access$900(Lcom/car/musiclite/PlayerService;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_end

    iget-object v0, p0, Lcom/car/musiclite/PlayerService$5;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-static {v0}, Lcom/car/musiclite/PlayerService;->access$400(Lcom/car/musiclite/PlayerService;)V

    :cond_end
    return-void
.end method

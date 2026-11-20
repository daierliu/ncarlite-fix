.class Lcom/car/musiclite/PlayerService$6;
.super Ljava/lang/Object;
.source "PlayerService.java"

# interfaces
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/car/musiclite/PlayerService;->requestFocus()V
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
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 262
    iput-object p1, p0, Lcom/car/musiclite/PlayerService$6;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAudioFocusChange(I)V
    .locals 2

    const/4 v0, -0x1

    const/4 v1, 0x1

    if-ne p1, v0, :cond_1

    .line 266
    iget-object p1, p0, Lcom/car/musiclite/PlayerService$6;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-static {p1, v1}, Lcom/car/musiclite/PlayerService;->access$202(Lcom/car/musiclite/PlayerService;Z)Z

    .line 267
    iget-object p1, p0, Lcom/car/musiclite/PlayerService$6;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-static {p1}, Lcom/car/musiclite/PlayerService;->access$900(Lcom/car/musiclite/PlayerService;)Landroid/media/MediaPlayer;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/car/musiclite/PlayerService$6;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-static {p1}, Lcom/car/musiclite/PlayerService;->access$000(Lcom/car/musiclite/PlayerService;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 268
    iget-object p1, p0, Lcom/car/musiclite/PlayerService$6;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-static {p1}, Lcom/car/musiclite/PlayerService;->access$900(Lcom/car/musiclite/PlayerService;)Landroid/media/MediaPlayer;

    move-result-object p1

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->pause()V

    .line 270
    :cond_0
    iget-object p1, p0, Lcom/car/musiclite/PlayerService$6;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-static {p1}, Lcom/car/musiclite/PlayerService;->access$1000(Lcom/car/musiclite/PlayerService;)V

    .line 271
    iget-object p1, p0, Lcom/car/musiclite/PlayerService$6;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-static {p1}, Lcom/car/musiclite/PlayerService;->access$400(Lcom/car/musiclite/PlayerService;)V

    return-void

    :cond_1
    const/4 v0, -0x3

    if-ne p1, v0, :cond_2

    .line 273
    iget-object p1, p0, Lcom/car/musiclite/PlayerService$6;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-static {p1}, Lcom/car/musiclite/PlayerService;->access$900(Lcom/car/musiclite/PlayerService;)Landroid/media/MediaPlayer;

    move-result-object p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/car/musiclite/PlayerService$6;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-static {p1}, Lcom/car/musiclite/PlayerService;->access$000(Lcom/car/musiclite/PlayerService;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 274
    iget-object p1, p0, Lcom/car/musiclite/PlayerService$6;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-static {p1}, Lcom/car/musiclite/PlayerService;->access$900(Lcom/car/musiclite/PlayerService;)Landroid/media/MediaPlayer;

    move-result-object p1

    const v0, 0x3f666666    # 0.9f (duck to 90% = -10%, light ducking)

    invoke-virtual {p1, v0, v0}, Landroid/media/MediaPlayer;->setVolume(FF)V

    return-void

    :cond_2
    const/4 v0, -0x2

    if-ne p1, v0, :cond_3

    .line 277
    iget-object p1, p0, Lcom/car/musiclite/PlayerService$6;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-static {p1}, Lcom/car/musiclite/PlayerService;->access$900(Lcom/car/musiclite/PlayerService;)Landroid/media/MediaPlayer;

    move-result-object p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/car/musiclite/PlayerService$6;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-static {p1}, Lcom/car/musiclite/PlayerService;->access$000(Lcom/car/musiclite/PlayerService;)Z

    move-result p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/car/musiclite/PlayerService$6;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-static {p1}, Lcom/car/musiclite/PlayerService;->access$900(Lcom/car/musiclite/PlayerService;)Landroid/media/MediaPlayer;

    move-result-object p1

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 278
    iget-object p1, p0, Lcom/car/musiclite/PlayerService$6;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-static {p1}, Lcom/car/musiclite/PlayerService;->access$900(Lcom/car/musiclite/PlayerService;)Landroid/media/MediaPlayer;

    move-result-object p1

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->pause()V

    return-void

    :cond_3
    if-ne p1, v1, :cond_4

    .line 281
    iget-object p1, p0, Lcom/car/musiclite/PlayerService$6;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-static {p1}, Lcom/car/musiclite/PlayerService;->access$900(Lcom/car/musiclite/PlayerService;)Landroid/media/MediaPlayer;

    move-result-object p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/car/musiclite/PlayerService$6;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-static {p1}, Lcom/car/musiclite/PlayerService;->access$000(Lcom/car/musiclite/PlayerService;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 282
    iget-object p1, p0, Lcom/car/musiclite/PlayerService$6;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-static {p1}, Lcom/car/musiclite/PlayerService;->access$900(Lcom/car/musiclite/PlayerService;)Landroid/media/MediaPlayer;

    move-result-object p1

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0, v0}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 283
    iget-object p1, p0, Lcom/car/musiclite/PlayerService$6;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-static {p1}, Lcom/car/musiclite/PlayerService;->access$200(Lcom/car/musiclite/PlayerService;)Z

    move-result p1

    if-nez p1, :cond_4

    .line 284
    iget-object p1, p0, Lcom/car/musiclite/PlayerService$6;->this$0:Lcom/car/musiclite/PlayerService;

    invoke-static {p1}, Lcom/car/musiclite/PlayerService;->access$900(Lcom/car/musiclite/PlayerService;)Landroid/media/MediaPlayer;

    move-result-object p1

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    :cond_4
    return-void
.end method

.class public Lcom/car/musiclite/MainActivity$UiTick;
.super Ljava/lang/Object;
.source "UiTick.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private h:Landroid/os/Handler;

.field private host:Lcom/car/musiclite/MainActivity;


# direct methods
.method public constructor <init>(Lcom/car/musiclite/MainActivity;)V
    .registers 3

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/car/musiclite/MainActivity$UiTick;->host:Lcom/car/musiclite/MainActivity;

    .line 12
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/car/musiclite/MainActivity$UiTick;->h:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 17
    :try_start_0
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$UiTick;->host:Lcom/car/musiclite/MainActivity;

    invoke-virtual {v0}, Lcom/car/musiclite/MainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1c

    iget-object v0, p0, Lcom/car/musiclite/MainActivity$UiTick;->host:Lcom/car/musiclite/MainActivity;

    invoke-virtual {v0}, Lcom/car/musiclite/MainActivity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_11

    goto :goto_1c

    .line 20
    :cond_11
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$UiTick;->host:Lcom/car/musiclite/MainActivity;

    invoke-virtual {v0}, Lcom/car/musiclite/MainActivity;->lyricsTick()V

    .line 21
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$UiTick;->host:Lcom/car/musiclite/MainActivity;

    invoke-virtual {v0}, Lcom/car/musiclite/MainActivity;->autoTick()V

    invoke-virtual {v0}, Lcom/car/musiclite/MainActivity;->navTick()V
    :try_end_1b
    .catchall {:try_start_0 .. :try_end_1b} :catchall_1d

    goto :goto_1d

    :cond_1c
    :goto_1c
    return-void

    .line 24
    :catchall_1d
    :goto_1d
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$UiTick;->h:Landroid/os/Handler;

    const-wide/16 v1, 0xfa

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

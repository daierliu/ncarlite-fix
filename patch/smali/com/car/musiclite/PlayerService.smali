.class public Lcom/car/musiclite/PlayerService;
.super Landroid/app/Service;
.source "PlayerService.java"


# static fields
.field public static final ACTION_NEXT:Ljava/lang/String; = "com.car.musiclite.NEXT"

.field public static final ACTION_PLAY_QUEUE:Ljava/lang/String; = "com.car.musiclite.PLAY_QUEUE"

.field public static final ACTION_PREV:Ljava/lang/String; = "com.car.musiclite.PREV"

.field public static final ACTION_SEEK:Ljava/lang/String; = "com.car.musiclite.SEEK"

.field public static final ACTION_STATE:Ljava/lang/String; = "com.car.musiclite.STATE"

.field public static sSession:I

# static player mirror so the UI can read the REAL position with no broadcast lag
.field public static sMp:Landroid/media/MediaPlayer;

.field public static sReady:Z

.field public static lastTick:J

.field public static tickerOn:Z

.field public static final ACTION_TOGGLE:Ljava/lang/String; = "com.car.musiclite.TOGGLE"

.field public static final EXTRA_ARTIST:Ljava/lang/String; = "artist"

.field public static final EXTRA_BADGE:Ljava/lang/String; = "badge"

.field public static final EXTRA_DUR:Ljava/lang/String; = "dur"

.field public static final EXTRA_ERR:Ljava/lang/String; = "err"

.field public static final EXTRA_INDEX:Ljava/lang/String; = "index"

.field public static final EXTRA_INDEX2:Ljava/lang/String; = "idx"

.field public static final EXTRA_JSON:Ljava/lang/String; = "json"

.field public static final EXTRA_PLAYING:Ljava/lang/String; = "playing"

.field public static final EXTRA_POS:Ljava/lang/String; = "pos"

.field public static final EXTRA_POS_MS:Ljava/lang/String; = "posMs"

.field public static final EXTRA_SIZE:Ljava/lang/String; = "size"

.field public static final EXTRA_TITLE:Ljava/lang/String; = "title"

.field public static final EXTRA_TRIAL:Ljava/lang/String; = "trial"

.field private static final RCC_KEY_ARTIST:I = 0x2

.field private static final RCC_KEY_DURATION:I = 0x9

.field private static final RCC_KEY_TITLE:I = 0x7

.field private static final TAG:Ljava/lang/String; = "MusicLite.Player"


# instance fields
.field private am:Landroid/media/AudioManager;

.field private focusListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

.field private final h:Landroid/os/Handler;

.field private index:I

.field public static shuffle:Z

.field private mp:Landroid/media/MediaPlayer;

.field private noisyReceiver:Landroid/content/BroadcastReceiver;

.field private playWhenReady:Z

.field private prepared:Z

.field private final queue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/car/musiclite/Api$Song;",
            ">;"
        }
    .end annotation
.end field

.field private rcc:Landroid/media/RemoteControlClient;

.field private userPaused:Z

.field private wakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 33
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 64
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/car/musiclite/PlayerService;->h:Landroid/os/Handler;

    .line 65
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/car/musiclite/PlayerService;->queue:Ljava/util/List;

    const/4 v0, -0x1

    .line 66
    iput v0, p0, Lcom/car/musiclite/PlayerService;->index:I

    return-void
.end method

.method private abandonFocus()V
    .locals 2

    .line 299
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->focusListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    if-eqz v0, :cond_0

    .line 300
    iget-object v1, p0, Lcom/car/musiclite/PlayerService;->am:Landroid/media/AudioManager;

    invoke-virtual {v1, v0}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 302
    :cond_0
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->rcc:Landroid/media/RemoteControlClient;

    if-eqz v0, :cond_1

    const/4 v1, 0x2

    .line 303
    invoke-virtual {v0, v1}, Landroid/media/RemoteControlClient;->setPlaybackState(I)V

    :cond_1
    return-void
.end method

.method static synthetic access$000(Lcom/car/musiclite/PlayerService;)Z
    .locals 0

    .line 33
    iget-boolean p0, p0, Lcom/car/musiclite/PlayerService;->prepared:Z

    return p0
.end method

.method static synthetic access$002(Lcom/car/musiclite/PlayerService;Z)Z
    .locals 0

    .line 33
    iput-boolean p1, p0, Lcom/car/musiclite/PlayerService;->prepared:Z

    # mirror for MainActivity.estPos()
    sput-boolean p1, Lcom/car/musiclite/PlayerService;->sReady:Z

    return p1
.end method

.method static synthetic access$100(Lcom/car/musiclite/PlayerService;)Z
    .locals 0

    .line 33
    iget-boolean p0, p0, Lcom/car/musiclite/PlayerService;->playWhenReady:Z

    return p0
.end method

.method static synthetic access$1000(Lcom/car/musiclite/PlayerService;)V
    .locals 0

    .line 33
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->abandonFocus()V

    return-void
.end method

.method static synthetic access$200(Lcom/car/musiclite/PlayerService;)Z
    .locals 0

    .line 33
    iget-boolean p0, p0, Lcom/car/musiclite/PlayerService;->userPaused:Z

    return p0
.end method

.method static synthetic access$202(Lcom/car/musiclite/PlayerService;Z)Z
    .locals 0

    .line 33
    iput-boolean p1, p0, Lcom/car/musiclite/PlayerService;->userPaused:Z

    return p1
.end method

.method static synthetic access$300(Lcom/car/musiclite/PlayerService;)V
    .locals 0

    .line 33
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->requestFocus()V

    return-void
.end method

.method static synthetic access$400(Lcom/car/musiclite/PlayerService;)V
    .locals 0

    .line 33
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->broadcastState()V

    return-void
.end method

.method static synthetic access$500(Lcom/car/musiclite/PlayerService;)V
    .locals 0

    .line 33
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->startProgressTicker()V

    return-void
.end method

.method static synthetic access$600(Lcom/car/musiclite/PlayerService;)V
    .locals 0

    .line 33
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->next()V

    return-void
.end method

.method static synthetic access$700(Lcom/car/musiclite/PlayerService;Ljava/lang/String;)V
    .locals 0

    .line 33
    invoke-direct {p0, p1}, Lcom/car/musiclite/PlayerService;->broadcastError(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$800(Lcom/car/musiclite/PlayerService;Ljava/lang/String;)V
    .locals 0

    .line 33
    invoke-direct {p0, p1}, Lcom/car/musiclite/PlayerService;->playUrl(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$900(Lcom/car/musiclite/PlayerService;)Landroid/media/MediaPlayer;
    .locals 0

    .line 33
    iget-object p0, p0, Lcom/car/musiclite/PlayerService;->mp:Landroid/media/MediaPlayer;

    return-object p0
.end method

.method private acquireWakeLock()V
    .locals 3

    .line 360
    const-string v0, "power"

    invoke-virtual {p0, v0}, Lcom/car/musiclite/PlayerService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    const/4 v1, 0x1

    .line 361
    const-string v2, "musiclite:play"

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    iput-object v0, p0, Lcom/car/musiclite/PlayerService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    const/4 v1, 0x0

    .line 362
    invoke-virtual {v0, v1}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    .line 363
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    return-void
.end method

.method private broadcastError(Ljava/lang/String;)V
    .locals 2

    .line 409
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.car.musiclite.STATE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 410
    invoke-virtual {p0}, Lcom/car/musiclite/PlayerService;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    if-nez p1, :cond_0

    .line 411
    const-string p1, "\u64ad\u653e\u5931\u8d25"

    :cond_0
    const-string v1, "err"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 412
    invoke-virtual {p0, v0}, Lcom/car/musiclite/PlayerService;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method private broadcastState()V
    .locals 5

    .line 383
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.car.musiclite.STATE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 384
    invoke-virtual {p0}, Lcom/car/musiclite/PlayerService;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 385
    iget-object v1, p0, Lcom/car/musiclite/PlayerService;->mp:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    iget-boolean v2, p0, Lcom/car/musiclite/PlayerService;->prepared:Z

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 386
    :goto_0
    iget v2, p0, Lcom/car/musiclite/PlayerService;->index:I

    if-ltz v2, :cond_1

    iget-object v3, p0, Lcom/car/musiclite/PlayerService;->queue:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    iget-object v2, p0, Lcom/car/musiclite/PlayerService;->queue:Ljava/util/List;

    iget v3, p0, Lcom/car/musiclite/PlayerService;->index:I

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/car/musiclite/Api$Song;

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    .line 387
    :goto_1
    move-object v4, v2

    const-string v3, "playing"

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 388
    const-string v1, "idx"

    iget v3, p0, Lcom/car/musiclite/PlayerService;->index:I

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 389
    iget-object v1, p0, Lcom/car/musiclite/PlayerService;->queue:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const-string v3, "size"

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    if-eqz v2, :cond_2

    .line 391
    const-string v1, "title"

    iget-object v3, v2, Lcom/car/musiclite/Api$Song;->name:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 392
    const-string v1, "artist"

    iget-object v3, v2, Lcom/car/musiclite/Api$Song;->artist:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 393
    const-string v1, "badge"

    invoke-virtual {v2}, Lcom/car/musiclite/Api$Song;->badge()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 394
    const-string v1, "sid"

    iget-wide v2, v4, Lcom/car/musiclite/Api$Song;->id:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string v1, "trial"

    iget-boolean v2, v4, Lcom/car/musiclite/Api$Song;->trial:Z

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 395
    const-string v1, "index"

    iget v2, p0, Lcom/car/musiclite/PlayerService;->index:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 397
    :cond_2
    iget-boolean v1, p0, Lcom/car/musiclite/PlayerService;->prepared:Z

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/car/musiclite/PlayerService;->mp:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_3

    .line 399
    :try_start_0
    const-string v2, "posMs"

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v1

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 400
    const-string v1, "dur"

    iget-object v2, p0, Lcom/car/musiclite/PlayerService;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 404
    :catch_0
    :cond_3
    invoke-virtual {p0, v0}, Lcom/car/musiclite/PlayerService;->sendBroadcast(Landroid/content/Intent;)V

    .line 405
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->updateRccMetadata()V

    return-void
.end method

.method private loadQueue(Ljava/lang/String;I)V
    .locals 6

    .line 141
    :try_start_0
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->queue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 142
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    const/4 v1, 0x0

    .line 143
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 144
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 145
    new-instance v3, Lcom/car/musiclite/Api$Song;

    invoke-direct {v3}, Lcom/car/musiclite/Api$Song;-><init>()V

    .line 146
    const-string v4, "id"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v4

    iput-wide v4, v3, Lcom/car/musiclite/Api$Song;->id:J

    .line 147
    const-string v4, "name"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/car/musiclite/Api$Song;->name:Ljava/lang/String;

    .line 148
    const-string v4, "artist"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/car/musiclite/Api$Song;->artist:Ljava/lang/String;

    .line 149
    const-string v4, "album"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/car/musiclite/Api$Song;->album:Ljava/lang/String;

    .line 150
    const-string v4, "fee"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v3, Lcom/car/musiclite/Api$Song;->fee:I

    .line 151
    iget-object v2, p0, Lcom/car/musiclite/PlayerService;->queue:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 153
    :cond_0
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->queue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    .line 156
    :cond_1
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->queue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    move-result p2

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/car/musiclite/PlayerService;->index:I

    .line 157
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->playCurrent()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 159
    const-string p2, "MusicLite.Player"

    const-string v0, "loadQueue"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method private next()V
    .locals 3

    .line 225
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->queue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 228
    :cond_0
    sget-boolean v0, Lcom/car/musiclite/PlayerService;->shuffle:Z

    if-eqz v0, :cond_seq

    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->queue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_seq

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    add-int/lit8 v2, v1, -0x1

    invoke-virtual {v0, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    iget v2, p0, Lcom/car/musiclite/PlayerService;->index:I

    add-int/2addr v2, v0

    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->queue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    rem-int/2addr v2, v0

    iput v2, p0, Lcom/car/musiclite/PlayerService;->index:I

    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->playCurrent()V

    return-void

    :cond_seq
    iget v0, p0, Lcom/car/musiclite/PlayerService;->index:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/car/musiclite/PlayerService;->queue:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/car/musiclite/PlayerService;->index:I

    .line 229
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->playCurrent()V

    return-void
.end method

.method private playCurrent()V
    .locals 5

    .line 164
    iget v0, p0, Lcom/car/musiclite/PlayerService;->index:I

    if-ltz v0, :cond_0

    iget-object v1, p0, Lcom/car/musiclite/PlayerService;->queue:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 167
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->queue:Ljava/util/List;

    iget v1, p0, Lcom/car/musiclite/PlayerService;->index:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/car/musiclite/Api$Song;

    const/4 v1, 0x0

    .line 168
    iput-boolean v1, p0, Lcom/car/musiclite/PlayerService;->prepared:Z

    .line 169
    iput-boolean v1, p0, Lcom/car/musiclite/PlayerService;->userPaused:Z

    const/4 v1, 0x1

    .line 170
    iput-boolean v1, p0, Lcom/car/musiclite/PlayerService;->playWhenReady:Z

    .line 171
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->releaseMp()V

    .line 172
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->broadcastState()V

    .line 173
    invoke-static {p0}, Lcom/car/musiclite/Api;->get(Landroid/content/Context;)Lcom/car/musiclite/Api;

    move-result-object v1

    iget-wide v2, v0, Lcom/car/musiclite/Api$Song;->id:J

    new-instance v4, Lcom/car/musiclite/PlayerService$4;

    invoke-direct {v4, p0, v0}, Lcom/car/musiclite/PlayerService$4;-><init>(Lcom/car/musiclite/PlayerService;Lcom/car/musiclite/Api$Song;)V

    invoke-virtual {v1, v2, v3, v4}, Lcom/car/musiclite/Api;->songUrl(JLcom/car/musiclite/Api$Cb;)V

    :cond_0
    return-void
.end method

.method private playUrl(Ljava/lang/String;)V
    .locals 2

    .line 188
    :try_start_0
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    # record the player's audio session so the visualizer can attach to it
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getAudioSessionId()I

    move-result v0

    sput v0, Lcom/car/musiclite/PlayerService;->sSession:I

    .line 189
    iget-object p1, p0, Lcom/car/musiclite/PlayerService;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->prepareAsync()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 191
    const-string v0, "MusicLite.Player"

    const-string v1, "playUrl"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 192
    const-string p1, "\u65e0\u6cd5\u64ad\u653e\u8be5\u5730\u5740"

    invoke-direct {p0, p1}, Lcom/car/musiclite/PlayerService;->broadcastError(Ljava/lang/String;)V

    return-void
.end method

.method private prev()V
    .locals 3

    .line 233
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->queue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 236
    :cond_0
    sget-boolean v0, Lcom/car/musiclite/PlayerService;->shuffle:Z

    if-eqz v0, :cond_pseq

    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->queue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_pseq

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    add-int/lit8 v2, v1, -0x1

    invoke-virtual {v0, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    iget v2, p0, Lcom/car/musiclite/PlayerService;->index:I

    add-int/2addr v2, v0

    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->queue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    rem-int/2addr v2, v0

    iput v2, p0, Lcom/car/musiclite/PlayerService;->index:I

    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->playCurrent()V

    return-void

    :cond_pseq
    iget v0, p0, Lcom/car/musiclite/PlayerService;->index:I

    add-int/lit8 v0, v0, -0x1

    iget-object v1, p0, Lcom/car/musiclite/PlayerService;->queue:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/car/musiclite/PlayerService;->queue:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/car/musiclite/PlayerService;->index:I

    .line 237
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->playCurrent()V

    return-void
.end method

.method private registerNoisy()V
    .locals 2

    .line 344
    new-instance v0, Lcom/car/musiclite/PlayerService$7;

    invoke-direct {v0, p0}, Lcom/car/musiclite/PlayerService$7;-><init>(Lcom/car/musiclite/PlayerService;)V

    iput-object v0, p0, Lcom/car/musiclite/PlayerService;->noisyReceiver:Landroid/content/BroadcastReceiver;

    .line 355
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.media.AUDIO_BECOMING_NOISY"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 356
    iget-object v1, p0, Lcom/car/musiclite/PlayerService;->noisyReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/car/musiclite/PlayerService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method private releaseMp()V
    .locals 1

    .line 198
    :try_start_0
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->mp:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 199
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    const/4 v0, 0x0

    .line 203
    iput-boolean v0, p0, Lcom/car/musiclite/PlayerService;->prepared:Z

    # mirror: not ready while reset/idle
    sput-boolean v0, Lcom/car/musiclite/PlayerService;->sReady:Z

    return-void
.end method

.method private requestFocus()V
    .locals 4

    .line 261
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->focusListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    if-nez v0, :cond_0

    .line 262
    new-instance v0, Lcom/car/musiclite/PlayerService$6;

    invoke-direct {v0, p0}, Lcom/car/musiclite/PlayerService$6;-><init>(Lcom/car/musiclite/PlayerService;)V

    iput-object v0, p0, Lcom/car/musiclite/PlayerService;->focusListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 291
    :cond_0
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->am:Landroid/media/AudioManager;

    iget-object v1, p0, Lcom/car/musiclite/PlayerService;->focusListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    const/4 v2, 0x1

    const/4 v3, 0x3

    invoke-virtual {v0, v1, v3, v2}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    .line 292
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->rcc:Landroid/media/RemoteControlClient;

    if-eqz v0, :cond_1

    .line 293
    invoke-virtual {v0, v3}, Landroid/media/RemoteControlClient;->setPlaybackState(I)V

    .line 295
    :cond_1
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->updateRccMetadata()V

    return-void
.end method

.method private seekTo(I)V
    .locals 1

    .line 241
    iget-boolean v0, p0, Lcom/car/musiclite/PlayerService;->prepared:Z

    if-eqz v0, :cond_0

    .line 242
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    :cond_0
    return-void
.end method

.method private setupRcc()V
    .locals 3

    .line 310
    :try_start_0
    new-instance v0, Landroid/content/ComponentName;

    const-class v1, Lcom/car/musiclite/MediaButtonReceiver;

    invoke-direct {v0, p0, v1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 311
    iget-object v1, p0, Lcom/car/musiclite/PlayerService;->am:Landroid/media/AudioManager;

    invoke-virtual {v1, v0}, Landroid/media/AudioManager;->registerMediaButtonEventReceiver(Landroid/content/ComponentName;)V

    .line 312
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.MEDIA_BUTTON"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 313
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v0

    const/high16 v1, 0x8000000

    const/4 v2, 0x0

    .line 312
    invoke-static {p0, v2, v0, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 315
    new-instance v1, Landroid/media/RemoteControlClient;

    invoke-direct {v1, v0}, Landroid/media/RemoteControlClient;-><init>(Landroid/app/PendingIntent;)V

    iput-object v1, p0, Lcom/car/musiclite/PlayerService;->rcc:Landroid/media/RemoteControlClient;

    .line 316
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->am:Landroid/media/AudioManager;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->registerRemoteControlClient(Landroid/media/RemoteControlClient;)V

    .line 317
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->rcc:Landroid/media/RemoteControlClient;

    const/16 v1, 0x89

    invoke-virtual {v0, v1}, Landroid/media/RemoteControlClient;->setTransportControlFlags(I)V

    .line 321
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->rcc:Landroid/media/RemoteControlClient;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/media/RemoteControlClient;->setPlaybackState(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 323
    const-string v1, "MusicLite.Player"

    const-string v2, "rcc setup"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method private startForegroundCompat()V
    .locals 6

    .line 369
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    const-string v2, "\u4e91\u97f3\u4e50Lite"

    if-lt v0, v1, :cond_0

    .line 370
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Lcom/car/musiclite/PlayerService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 371
    new-instance v1, Landroid/app/NotificationChannel;

    const-string v3, "\u64ad\u653e"

    const/4 v4, 0x2

    const-string v5, "play"

    invoke-direct {v1, v5, v3, v4}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    invoke-static {v0, v1}, Lcom/car/musiclite/PlayerService$$ExternalSyntheticApiModelOutline0;->m(Landroid/app/NotificationManager;Landroid/app/NotificationChannel;)V

    .line 372
    new-instance v0, Landroid/app/Notification$Builder;

    invoke-direct {v0, p0, v5}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    goto :goto_0

    .line 374
    :cond_0
    new-instance v0, Landroid/app/Notification$Builder;

    invoke-direct {v0, p0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x1080024

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 375
    invoke-virtual {v0, v2}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    :goto_0
    const/4 v1, 0x1

    .line 377
    invoke-virtual {p0, v1, v0}, Lcom/car/musiclite/PlayerService;->startForeground(ILandroid/app/Notification;)V

    return-void
.end method

.method private startProgressTicker()V
    .locals 4

    # idempotent: at most one pending tick at a time
    sget-boolean v0, Lcom/car/musiclite/PlayerService;->tickerOn:Z

    if-eqz v0, :goto_arm

    return-void

    :goto_arm
    const/4 v0, 0x1

    sput-boolean v0, Lcom/car/musiclite/PlayerService;->tickerOn:Z

    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->h:Landroid/os/Handler;

    new-instance v1, Lcom/car/musiclite/PlayerService$5;

    invoke-direct {v1, p0}, Lcom/car/musiclite/PlayerService$5;-><init>(Lcom/car/musiclite/PlayerService;)V

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private toggle()V
    .locals 1

    .line 207
    iget v0, p0, Lcom/car/musiclite/PlayerService;->index:I

    if-ltz v0, :cond_2

    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->queue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 210
    iget-boolean v0, p0, Lcom/car/musiclite/PlayerService;->prepared:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 211
    iput-boolean v0, p0, Lcom/car/musiclite/PlayerService;->userPaused:Z

    .line 212
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 213
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->abandonFocus()V

    goto :goto_0

    .line 214
    :cond_0
    iget-boolean v0, p0, Lcom/car/musiclite/PlayerService;->prepared:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 215
    iput-boolean v0, p0, Lcom/car/musiclite/PlayerService;->userPaused:Z

    .line 216
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 217
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->requestFocus()V

    goto :goto_0

    .line 219
    :cond_1
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->playCurrent()V

    .line 221
    :goto_0
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->broadcastState()V

    :cond_2
    return-void
.end method

.method private updateRccMetadata()V
    .locals 4

    .line 329
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->rcc:Landroid/media/RemoteControlClient;

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/car/musiclite/PlayerService;->index:I

    if-ltz v0, :cond_1

    iget-object v1, p0, Lcom/car/musiclite/PlayerService;->queue:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 332
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->queue:Ljava/util/List;

    iget v1, p0, Lcom/car/musiclite/PlayerService;->index:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/car/musiclite/Api$Song;

    .line 334
    :try_start_0
    iget-object v1, p0, Lcom/car/musiclite/PlayerService;->rcc:Landroid/media/RemoteControlClient;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/media/RemoteControlClient;->editMetadata(Z)Landroid/media/RemoteControlClient$MetadataEditor;

    move-result-object v1

    .line 335
    iget-object v2, v0, Lcom/car/musiclite/Api$Song;->name:Ljava/lang/String;

    const/4 v3, 0x7

    invoke-virtual {v1, v3, v2}, Landroid/media/RemoteControlClient$MetadataEditor;->putString(ILjava/lang/String;)Landroid/media/RemoteControlClient$MetadataEditor;

    .line 336
    iget-object v0, v0, Lcom/car/musiclite/Api$Song;->artist:Ljava/lang/String;

    const/4 v2, 0x2

    invoke-virtual {v1, v2, v0}, Landroid/media/RemoteControlClient$MetadataEditor;->putString(ILjava/lang/String;)Landroid/media/RemoteControlClient$MetadataEditor;

    .line 337
    iget-boolean v0, p0, Lcom/car/musiclite/PlayerService;->prepared:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v0

    int-to-long v2, v0

    goto :goto_0

    :cond_0
    const-wide/16 v2, 0x0

    :goto_0
    const/16 v0, 0x9

    invoke-virtual {v1, v0, v2, v3}, Landroid/media/RemoteControlClient$MetadataEditor;->putLong(IJ)Landroid/media/RemoteControlClient$MetadataEditor;

    .line 338
    invoke-virtual {v1}, Landroid/media/RemoteControlClient$MetadataEditor;->apply()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    :cond_1
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public onCreate()V
    .locals 2

    .line 79
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 80
    const-string v0, "audio"

    invoke-virtual {p0, v0}, Lcom/car/musiclite/PlayerService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iput-object v0, p0, Lcom/car/musiclite/PlayerService;->am:Landroid/media/AudioManager;

    .line 81
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lcom/car/musiclite/PlayerService;->mp:Landroid/media/MediaPlayer;

    # publish for MainActivity.estPos() direct-position reads
    sput-object v0, Lcom/car/musiclite/PlayerService;->sMp:Landroid/media/MediaPlayer;

    const/4 v1, 0x3

    .line 82
    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 83
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->mp:Landroid/media/MediaPlayer;

    new-instance v1, Lcom/car/musiclite/PlayerService$1;

    invoke-direct {v1, p0}, Lcom/car/musiclite/PlayerService$1;-><init>(Lcom/car/musiclite/PlayerService;)V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 95
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->mp:Landroid/media/MediaPlayer;

    new-instance v1, Lcom/car/musiclite/PlayerService$2;

    invoke-direct {v1, p0}, Lcom/car/musiclite/PlayerService$2;-><init>(Lcom/car/musiclite/PlayerService;)V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 101
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->mp:Landroid/media/MediaPlayer;

    new-instance v1, Lcom/car/musiclite/PlayerService$3;

    invoke-direct {v1, p0}, Lcom/car/musiclite/PlayerService$3;-><init>(Lcom/car/musiclite/PlayerService;)V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 110
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->setupRcc()V

    .line 111
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->startForegroundCompat()V

    .line 112
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->acquireWakeLock()V

    .line 113
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->registerNoisy()V

    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 417
    const/4 v0, 0x0

    sput-boolean v0, Lcom/car/musiclite/PlayerService;->tickerOn:Z

    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->h:Landroid/os/Handler;

    if-eqz v0, :cond_no_h

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    :cond_no_h
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_0

    .line 418
    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 420
    :cond_0
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->noisyReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_1

    .line 421
    invoke-virtual {p0, v0}, Lcom/car/musiclite/PlayerService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 424
    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->am:Landroid/media/AudioManager;

    iget-object v1, p0, Lcom/car/musiclite/PlayerService;->rcc:Landroid/media/RemoteControlClient;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->unregisterRemoteControlClient(Landroid/media/RemoteControlClient;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 428
    :catch_0
    :try_start_1
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->am:Landroid/media/AudioManager;

    iget-object v1, p0, Lcom/car/musiclite/PlayerService;->focusListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    nop

    .line 431
    :goto_0
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->releaseMp()V

    .line 432
    iget-object v0, p0, Lcom/car/musiclite/PlayerService;->mp:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_2

    .line 433
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    const/4 v0, 0x0

    .line 434
    iput-object v0, p0, Lcom/car/musiclite/PlayerService;->mp:Landroid/media/MediaPlayer;

    .line 436
    :cond_2
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 1

    if-eqz p1, :cond_4

    .line 118
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_4

    .line 119
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    .line 120
    const-string p3, "com.car.musiclite.PLAY_QUEUE"

    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    const/4 v0, 0x0

    if-eqz p3, :cond_0

    .line 121
    const-string p2, "json"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 122
    const-string p3, "index"

    invoke-virtual {p1, p3, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    .line 123
    invoke-direct {p0, p2, p1}, Lcom/car/musiclite/PlayerService;->loadQueue(Ljava/lang/String;I)V

    goto :goto_0

    .line 124
    :cond_0
    const-string p3, "com.car.musiclite.TOGGLE"

    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_1

    .line 125
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->toggle()V

    goto :goto_0

    .line 126
    :cond_1
    const-string p3, "com.car.musiclite.NEXT"

    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_2

    .line 127
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->next()V

    goto :goto_0

    .line 128
    :cond_2
    const-string p3, "com.car.musiclite.PREV"

    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_3

    .line 129
    invoke-direct {p0}, Lcom/car/musiclite/PlayerService;->prev()V

    goto :goto_0

    .line 130
    :cond_3
    const-string p3, "com.car.musiclite.SEEK"

    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_4

    .line 131
    const-string p2, "pos"

    invoke-virtual {p1, p2, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/car/musiclite/PlayerService;->seekTo(I)V

    :cond_4
    :goto_0
    const/4 p1, 0x2

    return p1
.end method

.class public Lcom/car/musiclite/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/car/musiclite/MainActivity$HomeAdapter;,
        Lcom/car/musiclite/MainActivity$SongAdapter;
    }
.end annotation


# static fields
.field private static final CHART_IDS:[I

.field private static final CHART_NAMES:[Ljava/lang/String;

.field private static final SCREEN_HOME:I = 0x0

.field private static final SCREEN_LIST:I = 0x1

.field private static final SCREEN_LOGIN:I = 0x2

.field public static curScreen:I

# nav data mirror from AMap auto standard broadcast (KEY_TYPE=10001)
.field public static navAt:J = 0x0L
.field public static navCurRoad:Ljava/lang/String;
.field public static navIcon:I
.field public static navLimit:I
.field public static navNextRoad:Ljava/lang/String;
.field public static navRouteDisAuto:Ljava/lang/String;
.field public static navRouteTimeAuto:Ljava/lang/String;
.field public static navSegDis:I
.field public static navSegDisAuto:Ljava/lang/String;
.field public static navSpeed:I
.field public static navType:I

.field public static restoreType:I

.field public static restoreId:J

.field public static restoreText:Ljava/lang/String;


# instance fields
.field private content:Landroid/widget/FrameLayout;

.field private durValid:Z

.field private final h:Landroid/os/Handler;

.field private homeItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/car/musiclite/Api$Playlist;",
            ">;"
        }
    .end annotation
.end field

.field private homeList:Landroid/widget/GridView;

.field private lastDur:I

.field private lastIdx:I

.field private lastPos:I

.field public posAt:J

.field private lastSize:I

.field private listIsSearch:Z

.field private listSongs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/car/musiclite/Api$Song;",
            ">;"
        }
    .end annotation
.end field

.field private listTitle:Ljava/lang/String;

.field public static lastArtistTxt:Ljava/lang/String;

# player-state mirrors: survive recreate() so the capsule renders correctly at once
.field public static sPlaying:Z

.field public static sPos:I

.field public static sPosAt:J

.field public static sDur:I

.field public static lastTitle:Ljava/lang/String;

.field private loginStatus:Landroid/widget/TextView;

.field private loginView:Landroid/widget/LinearLayout;

.field private npArtist:Landroid/widget/TextView;

.field npPlaying:Z

.field private modeBtn:Landroid/widget/ImageView;
.field private npSeek:Landroid/widget/SeekBar;

.field private npSeeking:Z

.field private npTime:Landroid/widget/TextView;

.field private npTitle:Landroid/widget/TextView;

.field public static dark:Z

.field public static curSid:J = 0x0L

.field public static wasLyrics:Z

.field public static autoSid:J

.field public static lastSid:J

.field npBar:Landroid/widget/LinearLayout;

.field private npInfoCol:Landroid/widget/LinearLayout;

# theme/heart pills parked here at build time, added into the capsule later
.field private darkPill:Landroid/widget/ImageView;

.field private heartPill:Landroid/widget/ImageView;

.field topBar:Landroid/widget/LinearLayout;

.field listPane:Landroid/widget/LinearLayout;

.field lyricsOverlay:Landroid/widget/FrameLayout;

.field mainPane:Landroid/widget/LinearLayout;

.field breathAnim:Landroid/animation/ValueAnimator;

.field public static mode:I

.field private playBtn:Landroid/widget/ImageView;

.field private lyricsBox:Lcom/car/musiclite/LyricsBox;
.field private navCard:Landroid/widget/LinearLayout;
.field private navL1:Landroid/widget/TextView;
.field private navL2:Landroid/widget/TextView;
.field private navRecv:Lcom/car/musiclite/MainActivity$NavRecv;

.field private lyricsView:Landroid/widget/TextView;

.field public coverView:Landroid/widget/ImageView;

.field public vinyl:Lcom/car/musiclite/MainActivity$VinylView;

.field glowBg:Lcom/car/musiclite/MainActivity$GlowBg;

.field private polling:Z

.field private qrExpired:Z

.field private qrImage:Landroid/widget/ImageView;

.field private qrKey:Ljava/lang/String;

.field private resultList:Landroid/widget/GridView;

.field private root:Landroid/widget/LinearLayout;

.field private searchBox:Landroid/widget/EditText;

.field private final stateReceiver:Landroid/content/BroadcastReceiver;

.field private statusText:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const v0, 0x12cf5ec

    const v1, 0x2c7663a4

    const v2, 0x39a876

    const v3, 0x39ac2d

    .line 48
    filled-new-array {v2, v3, v0}, [I

    move-result-object v0

    sput-object v0, Lcom/car/musiclite/MainActivity;->CHART_IDS:[I

    const/4 v0, 0x3

    .line 49
    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "\u70ed\u6b4c\u699c"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "\u65b0\u6b4c\u699c"

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string v1, "\u98d9\u5347\u699c"

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sput-object v0, Lcom/car/musiclite/MainActivity;->CHART_NAMES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 46
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 55
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/car/musiclite/MainActivity;->h:Landroid/os/Handler;

    .line 73
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/car/musiclite/MainActivity;->homeItems:Ljava/util/List;

    .line 74
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/car/musiclite/MainActivity;->listSongs:Ljava/util/List;

    .line 75
    const-string v0, ""

    iput-object v0, p0, Lcom/car/musiclite/MainActivity;->listTitle:Ljava/lang/String;

    const/4 v0, -0x1

    .line 80
    iput v0, p0, Lcom/car/musiclite/MainActivity;->lastIdx:I

    .line 81
    iput v0, p0, Lcom/car/musiclite/MainActivity;->lastSize:I

    .line 90
    new-instance v0, Lcom/car/musiclite/MainActivity$1;

    invoke-direct {v0, p0}, Lcom/car/musiclite/MainActivity$1;-><init>(Lcom/car/musiclite/MainActivity;)V

    iput-object v0, p0, Lcom/car/musiclite/MainActivity;->stateReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$002(Lcom/car/musiclite/MainActivity;Z)Z
    .locals 0

    .line 46
    iput-boolean p1, p0, Lcom/car/musiclite/MainActivity;->npPlaying:Z

    return p1
.end method

.method static synthetic access$100(Lcom/car/musiclite/MainActivity;)Landroid/widget/TextView;
    .locals 0

    .line 46
    iget-object p0, p0, Lcom/car/musiclite/MainActivity;->npTitle:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/car/musiclite/MainActivity;)V
    .locals 0

    .line 46
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->updatePlayBtn()V

    return-void
.end method

.method static synthetic access$1100(Lcom/car/musiclite/MainActivity;)Landroid/widget/GridView;
    .locals 0

    .line 46
    iget-object p0, p0, Lcom/car/musiclite/MainActivity;->resultList:Landroid/widget/GridView;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/car/musiclite/MainActivity;)V
    .locals 0

    .line 46
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->refreshHome()V

    return-void
.end method

.method static synthetic access$1300(Lcom/car/musiclite/MainActivity;I)V
    .locals 0

    .line 46
    invoke-direct {p0, p1}, Lcom/car/musiclite/MainActivity;->showScreen(I)V

    return-void
.end method

.method static synthetic access$1400(Lcom/car/musiclite/MainActivity;)V
    .locals 0

    .line 46
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->openLogin()V

    return-void
.end method

.method static synthetic access$1500(Lcom/car/musiclite/MainActivity;)V
    .locals 0

    .line 46
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->doSearch()V

    return-void
.end method

.method static synthetic access$1700(Lcom/car/musiclite/MainActivity;Ljava/lang/String;)V
    .locals 0

    .line 46
    invoke-direct {p0, p1}, Lcom/car/musiclite/MainActivity;->svc(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1800(I)Ljava/lang/String;
    .locals 0

    .line 46
    invoke-static {p0}, Lcom/car/musiclite/MainActivity;->fmt(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1900(Lcom/car/musiclite/MainActivity;)Landroid/widget/TextView;
    .locals 0

    .line 46
    iget-object p0, p0, Lcom/car/musiclite/MainActivity;->npTime:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$200(Lcom/car/musiclite/MainActivity;)Landroid/widget/TextView;
    .locals 0

    .line 46
    iget-object p0, p0, Lcom/car/musiclite/MainActivity;->npArtist:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$2000(Lcom/car/musiclite/MainActivity;)V
    .locals 0

    .line 46
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->startQrLogin()V

    return-void
.end method

.method static synthetic access$2100(Lcom/car/musiclite/MainActivity;)Landroid/widget/TextView;
    .locals 0

    .line 46
    iget-object p0, p0, Lcom/car/musiclite/MainActivity;->statusText:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$2200(Lcom/car/musiclite/MainActivity;)V
    .locals 0

    .line 46
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->showGuestHome()V

    return-void
.end method

.method static synthetic access$2300(Lcom/car/musiclite/MainActivity;)Ljava/util/List;
    .locals 0

    .line 46
    iget-object p0, p0, Lcom/car/musiclite/MainActivity;->homeItems:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$2400(Lcom/car/musiclite/MainActivity;)V
    .locals 0

    .line 46
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->addCharts()V

    return-void
.end method

.method static synthetic access$2500(Lcom/car/musiclite/MainActivity;)Landroid/widget/GridView;
    .locals 0

    .line 46
    iget-object p0, p0, Lcom/car/musiclite/MainActivity;->homeList:Landroid/widget/GridView;

    return-object p0
.end method

.method static synthetic access$2600(Lcom/car/musiclite/MainActivity;)Ljava/util/List;
    .locals 0

    .line 46
    iget-object p0, p0, Lcom/car/musiclite/MainActivity;->listSongs:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$2702(Lcom/car/musiclite/MainActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 46
    iput-object p1, p0, Lcom/car/musiclite/MainActivity;->listTitle:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2802(Lcom/car/musiclite/MainActivity;Z)Z
    .locals 0

    .line 46
    iput-boolean p1, p0, Lcom/car/musiclite/MainActivity;->listIsSearch:Z

    return p1
.end method

.method static synthetic access$2900(Lcom/car/musiclite/MainActivity;)Landroid/widget/TextView;
    .locals 0

    .line 46
    iget-object p0, p0, Lcom/car/musiclite/MainActivity;->loginStatus:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$3002(Lcom/car/musiclite/MainActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 46
    iput-object p1, p0, Lcom/car/musiclite/MainActivity;->qrKey:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$302(Lcom/car/musiclite/MainActivity;I)I
    .locals 0

    .line 46
    iput p1, p0, Lcom/car/musiclite/MainActivity;->lastIdx:I

    return p1
.end method

.method static synthetic access$3100(Lcom/car/musiclite/MainActivity;)Landroid/widget/ImageView;
    .locals 0

    .line 46
    iget-object p0, p0, Lcom/car/musiclite/MainActivity;->qrImage:Landroid/widget/ImageView;

    return-object p0
.end method

.method static synthetic access$3200(Lcom/car/musiclite/MainActivity;)V
    .locals 0

    .line 46
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->startPolling()V

    return-void
.end method

.method static synthetic access$3300(Lcom/car/musiclite/MainActivity;)Z
    .locals 0

    .line 46
    iget-boolean p0, p0, Lcom/car/musiclite/MainActivity;->polling:Z

    return p0
.end method

.method static synthetic access$3302(Lcom/car/musiclite/MainActivity;Z)Z
    .locals 0

    .line 46
    iput-boolean p1, p0, Lcom/car/musiclite/MainActivity;->polling:Z

    return p1
.end method

.method static synthetic access$3400(Lcom/car/musiclite/MainActivity;)Landroid/os/Handler;
    .locals 0

    .line 46
    iget-object p0, p0, Lcom/car/musiclite/MainActivity;->h:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$3500(Lcom/car/musiclite/MainActivity;)V
    .locals 0

    .line 46
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->pollLoop()V

    return-void
.end method

.method static synthetic access$3600(Lcom/car/musiclite/MainActivity;I)I
    .locals 0

    .line 46
    invoke-direct {p0, p1}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result p0

    return p0
.end method

.method static synthetic access$3700(Lcom/car/musiclite/MainActivity;Lcom/car/musiclite/Api$Playlist;)V
    .locals 0

    .line 46
    invoke-direct {p0, p1}, Lcom/car/musiclite/MainActivity;->openPlaylist(Lcom/car/musiclite/Api$Playlist;)V

    return-void
.end method

.method static synthetic access$3800(Lcom/car/musiclite/MainActivity;)J
    .locals 5

    sget-wide v0, Lcom/car/musiclite/MainActivity;->curSid:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gtz v4, :goto_sid

    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->playingId()J

    move-result-wide v0

    :goto_sid
    return-wide v0
.end method

.method static synthetic access$3900(IIF)Landroid/widget/LinearLayout$LayoutParams;
    .locals 0

    .line 46
    invoke-static {p0, p1, p2}, Lcom/car/musiclite/MainActivity;->lp(IIF)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$402(Lcom/car/musiclite/MainActivity;I)I
    .locals 0

    .line 46
    iput p1, p0, Lcom/car/musiclite/MainActivity;->lastSize:I

    return p1
.end method

.method static synthetic access$4100(Lcom/car/musiclite/MainActivity;Ljava/util/List;I)V
    .locals 0

    .line 46
    invoke-direct {p0, p1, p2}, Lcom/car/musiclite/MainActivity;->playQueue(Ljava/util/List;I)V

    return-void
.end method

.method static synthetic access$500(Lcom/car/musiclite/MainActivity;)I
    .locals 0

    .line 46
    iget p0, p0, Lcom/car/musiclite/MainActivity;->lastDur:I

    return p0
.end method

.method static synthetic access$502(Lcom/car/musiclite/MainActivity;I)I
    .locals 0

    .line 46
    iput p1, p0, Lcom/car/musiclite/MainActivity;->lastDur:I

    return p1
.end method

.method static synthetic access$600(Lcom/car/musiclite/MainActivity;)I
    .locals 0

    .line 46
    iget p0, p0, Lcom/car/musiclite/MainActivity;->lastPos:I

    return p0
.end method

.method static synthetic access$602(Lcom/car/musiclite/MainActivity;I)I
    .locals 0

    .line 46
    iput p1, p0, Lcom/car/musiclite/MainActivity;->lastPos:I

    return p1
.end method

.method static synthetic access$700(Lcom/car/musiclite/MainActivity;)Z
    .locals 0

    .line 46
    iget-boolean p0, p0, Lcom/car/musiclite/MainActivity;->durValid:Z

    return p0
.end method

.method static synthetic access$702(Lcom/car/musiclite/MainActivity;Z)Z
    .locals 0

    .line 46
    iput-boolean p1, p0, Lcom/car/musiclite/MainActivity;->durValid:Z

    return p1
.end method

.method static synthetic access$800(Lcom/car/musiclite/MainActivity;)Z
    .locals 0

    .line 46
    iget-boolean p0, p0, Lcom/car/musiclite/MainActivity;->npSeeking:Z

    return p0
.end method

.method static synthetic access$802(Lcom/car/musiclite/MainActivity;Z)Z
    .locals 0

    .line 46
    iput-boolean p1, p0, Lcom/car/musiclite/MainActivity;->npSeeking:Z

    return p1
.end method

.method static synthetic access$900(Lcom/car/musiclite/MainActivity;)Landroid/widget/SeekBar;
    .locals 0

    .line 46
    iget-object p0, p0, Lcom/car/musiclite/MainActivity;->npSeek:Landroid/widget/SeekBar;

    return-object p0
.end method

.method private addCharts()V
    .locals 5

    const/4 v0, 0x0

    .line 455
    :goto_0
    sget-object v1, Lcom/car/musiclite/MainActivity;->CHART_IDS:[I

    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 456
    new-instance v2, Lcom/car/musiclite/Api$Playlist;

    invoke-direct {v2}, Lcom/car/musiclite/Api$Playlist;-><init>()V

    .line 457
    aget v1, v1, v0

    int-to-long v3, v1

    iput-wide v3, v2, Lcom/car/musiclite/Api$Playlist;->id:J

    .line 458
    sget-object v1, Lcom/car/musiclite/MainActivity;->CHART_NAMES:[Ljava/lang/String;

    aget-object v1, v1, v0

    iput-object v1, v2, Lcom/car/musiclite/Api$Playlist;->name:Ljava/lang/String;

    .line 459
    iget-object v1, p0, Lcom/car/musiclite/MainActivity;->homeItems:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public rebuildUi()V
    .locals 1

    # rebuild the view tree in place (no Activity recreate): pages keep their
    # in-memory data, no restart flash; old views detach so VinylView releases
    # its Visualizer via onDetachedFromWindow
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->initScale()V

    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->buildUi()V

    sget v0, Lcom/car/musiclite/MainActivity;->curScreen:I

    invoke-direct {p0, v0}, Lcom/car/musiclite/MainActivity;->showScreen(I)V

    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v0}, Lcom/car/musiclite/MainActivity;->setContentView(Landroid/view/View;)V

    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->applyImmersive()V

    sget-boolean v0, Lcom/car/musiclite/MainActivity;->wasLyrics:Z

    if-eqz v0, :rdone

    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity;->showLyrics()V

    :rdone
    return-void
.end method

.method public navTick()V
    .locals 8

    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->navCard:Landroid/widget/LinearLayout;

    if-eqz v0, :ret

    # data freshness: hide card when no guide frame for 8s (nav ended/exit)
    sget-wide v1, Lcom/car/musiclite/MainActivity;->navAt:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-lez v5, :hide

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    sget-wide v3, Lcom/car/musiclite/MainActivity;->navAt:J

    sub-long v1, v1, v3

    const-wide/16 v3, 0x1f40    # 8000 ms

    cmp-long v5, v1, v3

    if-lez v5, :fresh

    :hide
    const/16 v5, 0x8

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    :ret
    return-void

    :fresh
    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    # register discipline: v1 StringBuilder, v2 String, v3 int, v4 String,
    # every merge point keeps identical types on all incoming paths

    # ---- line 1: "500米后进入 XX路" / "沿 当前路名" / "导航中" ----
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/car/musiclite/MainActivity;->navNextRoad:Ljava/lang/String;

    if-eqz v2, :try_cruise

    sget v3, Lcom/car/musiclite/MainActivity;->navSegDis:I

    if-lez v3, :try_cruise

    # case A: distance prefix
    sget-object v4, Lcom/car/musiclite/MainActivity;->navSegDisAuto:Ljava/lang/String;

    if-eqz v4, :dis_int

    goto/16 :app_a

    :dis_int
    sget v3, Lcom/car/musiclite/MainActivity;->navSegDis:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    :app_a
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " \u540e\u8fdb\u5165 "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :l1_set

    :try_cruise
    sget-object v2, Lcom/car/musiclite/MainActivity;->navCurRoad:Ljava/lang/String;

    if-eqz v2, :def_case

    const-string v4, " \u6cbf "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :l1_set

    :def_case
    const-string v4, " \u5bfc\u822a\u4e2d"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :l1_set
    iget-object v5, p0, Lcom/car/musiclite/MainActivity;->navL1:Landroid/widget/TextView;

    if-eqz v5, :l2

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    # ---- line 2: 全程剩余 · 剩余时间 · 限速 ----
    :l2
    iget-object v5, p0, Lcom/car/musiclite/MainActivity;->navL2:Landroid/widget/TextView;

    if-eqz v5, :ret2

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/car/musiclite/MainActivity;->navRouteDisAuto:Ljava/lang/String;

    if-eqz v2, :l2_time

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :l2_time
    sget-object v2, Lcom/car/musiclite/MainActivity;->navRouteTimeAuto:Ljava/lang/String;

    if-eqz v2, :l2_limit

    const-string v4, " \u00b7 "

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :l2_limit
    sget v3, Lcom/car/musiclite/MainActivity;->navLimit:I

    if-lez v3, :l2_set

    const-string v4, " \u00b7 \u9650\u901f"

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :l2_set
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :ret2
    return-void
.end method

.method private applyImmersive()V
    .locals 3

    .line 759
    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 760
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-lt v1, v2, :cond_0

    const/16 v1, 0x1106

    .line 761
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    return-void

    :cond_0
    const/4 v1, 0x1

    .line 767
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 768
    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x400

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFlags(II)V

    return-void
.end method

.method private buildLoginView()Landroid/widget/LinearLayout;
    .locals 6

    .line 356
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    .line 357
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v1, 0x11

    .line 358
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-static {}, Lcom/car/musiclite/MainActivity;->bgWindow()I

    move-result v1

    .line 359
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 361
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 362
    const-string v2, "\u626b\u7801\u767b\u5f55\u7f51\u6613\u4e91\u97f3\u4e50"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {}, Lcom/car/musiclite/MainActivity;->textMain()I

    move-result v2

    .line 363
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v2, 0x41880000    # 17.0f

    .line 364
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 v2, 0xa

    .line 365
    invoke-direct {p0, v2}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v2}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v4

    const/4 v5, 0x0

    invoke-virtual {v1, v5, v3, v5, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 366
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 368
    new-instance v1, Landroid/widget/ImageView;

    invoke-direct {v1, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/car/musiclite/MainActivity;->qrImage:Landroid/widget/ImageView;

    const/16 v3, 0xe6

    .line 369
    invoke-direct {p0, v3}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v4

    invoke-direct {p0, v3}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v3

    invoke-static {v4, v3}, Lcom/car/musiclite/MainActivity;->lp(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 371
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/car/musiclite/MainActivity;->loginStatus:Landroid/widget/TextView;

    .line 372
    const-string v3, "\u6b63\u5728\u751f\u6210\u4e8c\u7ef4\u7801\u2026"

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 373
    iget-object v1, p0, Lcom/car/musiclite/MainActivity;->loginStatus:Landroid/widget/TextView;

    invoke-static {}, Lcom/car/musiclite/MainActivity;->textSub()I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 374
    iget-object v1, p0, Lcom/car/musiclite/MainActivity;->loginStatus:Landroid/widget/TextView;

    const/high16 v3, 0x41500000    # 13.0f

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 375
    iget-object v1, p0, Lcom/car/musiclite/MainActivity;->loginStatus:Landroid/widget/TextView;

    invoke-direct {p0, v2}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v2

    const/4 v3, 0x6

    invoke-direct {p0, v3}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v3

    invoke-virtual {v1, v5, v2, v5, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 376
    iget-object v1, p0, Lcom/car/musiclite/MainActivity;->loginStatus:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 378
    new-instance v1, Landroid/widget/Button;

    invoke-direct {v1, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 379
    const-string v2, "\u5237\u65b0\u4e8c\u7ef4\u7801"

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 380
    new-instance v2, Lcom/car/musiclite/MainActivity$9;

    invoke-direct {v2, p0}, Lcom/car/musiclite/MainActivity$9;-><init>(Lcom/car/musiclite/MainActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/16 v2, 0xb4

    .line 386
    invoke-direct {p0, v2}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v2

    const/4 v3, -0x2

    invoke-static {v2, v3}, Lcom/car/musiclite/MainActivity;->lp(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method private buildUi()V
    .locals 16

    move-object/from16 v0, p0

    # restore player state mirrors so the capsule renders fully right after recreate
    # (play icon, progress info and time are correct on the very first frame)
    sget-boolean v1, Lcom/car/musiclite/MainActivity;->sPlaying:Z

    iput-boolean v1, v0, Lcom/car/musiclite/MainActivity;->npPlaying:Z

    sget v1, Lcom/car/musiclite/MainActivity;->sPos:I

    iput v1, v0, Lcom/car/musiclite/MainActivity;->lastPos:I

    sget-wide v1, Lcom/car/musiclite/MainActivity;->sPosAt:J

    iput-wide v1, v0, Lcom/car/musiclite/MainActivity;->posAt:J

    sget v1, Lcom/car/musiclite/MainActivity;->sDur:I

    iput v1, v0, Lcom/car/musiclite/MainActivity;->lastDur:I

    .line 160
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/car/musiclite/MainActivity;->root:Landroid/widget/LinearLayout;

    const/4 v2, 0x1

    .line 161
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 162
    iget-object v1, v0, Lcom/car/musiclite/MainActivity;->root:Landroid/widget/LinearLayout;

    invoke-static {}, Lcom/car/musiclite/MainActivity;->bgWindow()I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 165
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/car/musiclite/MainActivity;->topBar:Landroid/widget/LinearLayout;

    const/4 v4, 0x0

    .line 166
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v5, 0x10

    .line 167
    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 168
    invoke-direct {v0, v5}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v6

    const/4 v7, 0x6

    invoke-direct {v0, v7}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v8

    invoke-direct {v0, v5}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v9

    invoke-direct {v0, v7}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v10

    invoke-virtual {v1, v6, v8, v9, v10}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-static {}, Lcom/car/musiclite/MainActivity;->bgPanel()I

    move-result v6

    .line 169
    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 171
    new-instance v8, Landroid/widget/ImageView;

    invoke-direct {v8, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v9, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const/4 v10, -0x2

    # theme icon two-state: dark->moon, light->sun (auto mode removed)
    sget-boolean v9, Lcom/car/musiclite/MainActivity;->dark:Z

    if-eqz v9, :t_day_icon

    const-string v9, "night"

    goto :goto_tset

    :t_day_icon
    const-string v9, "day"

    :goto_tset
    invoke-static {v0, v9}, Lcom/car/musiclite/MainActivity;->iconDrawable(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    if-eqz v9, :cond_noic

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_noic
    new-instance v9, Lcom/car/musiclite/MainActivity$DarkBtn;

    invoke-direct {v9, v0}, Lcom/car/musiclite/MainActivity$DarkBtn;-><init>(Lcom/car/musiclite/MainActivity;)V

    invoke-virtual {v8, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    # glass background
    invoke-static {}, Lcom/car/musiclite/MainActivity;->glass()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    # theme pill: built here, mounted into the capsule bar below
    iput-object v8, v0, Lcom/car/musiclite/MainActivity;->darkPill:Landroid/widget/ImageView;

    # heart mode button (icon from library reference)
    new-instance v8, Landroid/widget/ImageView;

    invoke-direct {v8, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v9, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const-string v9, "heart"

    invoke-static {v0, v9}, Lcom/car/musiclite/MainActivity;->iconDrawable(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    if-eqz v9, :cond_noheart

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_noheart
    new-instance v9, Lcom/car/musiclite/MainActivity$HeartBtn;

    invoke-direct {v9, v0}, Lcom/car/musiclite/MainActivity$HeartBtn;-><init>(Lcom/car/musiclite/MainActivity;)V

    invoke-virtual {v8, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    # glass background
    invoke-static {}, Lcom/car/musiclite/MainActivity;->glass()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    # heart pill: built here, mounted into the capsule bar below
    iput-object v8, v0, Lcom/car/musiclite/MainActivity;->heartPill:Landroid/widget/ImageView;

    # title removed (v4 = wrap_content needed by later layout code)
    const/4 v4, -0x2

    .line 177
    new-instance v8, Landroid/widget/TextView;

    invoke-direct {v8, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v8, v0, Lcom/car/musiclite/MainActivity;->statusText:Landroid/widget/TextView;

    invoke-static {}, Lcom/car/musiclite/MainActivity;->textSub()I

    move-result v9

    .line 178
    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 179
    iget-object v8, v0, Lcom/car/musiclite/MainActivity;->statusText:Landroid/widget/TextView;

    const/high16 v11, 0x41500000    # 13.0f

    invoke-virtual {v8, v11}, Landroid/widget/TextView;->setTextSize(F)V

    .line 180
    iget-object v8, v0, Lcom/car/musiclite/MainActivity;->statusText:Landroid/widget/TextView;

    const/16 v11, 0xc

    invoke-direct {v0, v11}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v12

    invoke-direct {v0, v11}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v11

    invoke-virtual {v8, v12, v4, v11, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 181
    iget-object v8, v0, Lcom/car/musiclite/MainActivity;->statusText:Landroid/widget/TextView;

    new-instance v11, Lcom/car/musiclite/MainActivity$2;

    invoke-direct {v11, v0}, Lcom/car/musiclite/MainActivity$2;-><init>(Lcom/car/musiclite/MainActivity;)V

    invoke-virtual {v8, v11}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 201
    iget-object v8, v0, Lcom/car/musiclite/MainActivity;->statusText:Landroid/widget/TextView;

    const v11, 0x3f8ccccd    # 1.1f

    invoke-static {v4, v10, v11}, Lcom/car/musiclite/MainActivity;->lp(IIF)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v11

    invoke-virtual {v1, v8, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # search icon moved INTO the search field (compound drawable below)
    .line 203
    new-instance v8, Landroid/widget/EditText;

    invoke-direct {v8, v0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v8, v0, Lcom/car/musiclite/MainActivity;->searchBox:Landroid/widget/EditText;

    .line 204
    const-string v11, "\u641c\u7d22\u6b4c\u66f2/\u6b4c\u624b"

    invoke-virtual {v8, v11}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 205
    iget-object v8, v0, Lcom/car/musiclite/MainActivity;->searchBox:Landroid/widget/EditText;

    invoke-static {}, Lcom/car/musiclite/MainActivity;->textMain()I

    move-result v11

    invoke-virtual {v8, v11}, Landroid/widget/EditText;->setTextColor(I)V

    .line 206
    iget-object v8, v0, Lcom/car/musiclite/MainActivity;->searchBox:Landroid/widget/EditText;

    invoke-static {}, Lcom/car/musiclite/MainActivity;->textHint()I

    move-result v12

    invoke-virtual {v8, v12}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 207
    iget-object v8, v0, Lcom/car/musiclite/MainActivity;->searchBox:Landroid/widget/EditText;

    const/high16 v12, 0x41600000    # 14.0f

    invoke-virtual {v8, v12}, Landroid/widget/EditText;->setTextSize(F)V

    .line 208
    iget-object v8, v0, Lcom/car/musiclite/MainActivity;->searchBox:Landroid/widget/EditText;

    invoke-virtual {v8}, Landroid/widget/EditText;->setSingleLine()V

    .line 209
    iget-object v8, v0, Lcom/car/musiclite/MainActivity;->searchBox:Landroid/widget/EditText;

    new-instance v13, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v13}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-static {}, Lcom/car/musiclite/MainActivity;->bgSearch()I

    move-result v14

    invoke-virtual {v13, v14}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/16 v14, 0x18

    int-to-float v14, v14

    invoke-virtual {v13, v14}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v8, v13}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 210
    iget-object v8, v0, Lcom/car/musiclite/MainActivity;->searchBox:Landroid/widget/EditText;

    const/16 v13, 0xa

    invoke-direct {v0, v13}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v14

    invoke-direct {v0, v7}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v15

    invoke-direct {v0, v13}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v13

    invoke-direct {v0, v7}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v9

    invoke-virtual {v8, v14, v15, v13, v9}, Landroid/widget/EditText;->setPadding(IIII)V

    # search icon inside the field (bounded to 18dp)
    iget-object v8, v0, Lcom/car/musiclite/MainActivity;->searchBox:Landroid/widget/EditText;

    const-string v9, "search"

    invoke-static {v0, v9}, Lcom/car/musiclite/MainActivity;->iconDrawable(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    if-eqz v9, :cond_sic

    const/4 v11, 0x0

    const/16 v12, 0x12

    invoke-direct {v0, v12}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v12

    invoke-virtual {v9, v11, v11, v12, v12}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    const/16 v12, 0x6

    invoke-direct {v0, v12}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v12

    invoke-virtual {v8, v12}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    invoke-virtual {v8, v9, v11, v11, v11}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :cond_sic

    .line 211
    iget-object v8, v0, Lcom/car/musiclite/MainActivity;->searchBox:Landroid/widget/EditText;

    const/4 v9, 0x3

    invoke-virtual {v8, v9}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 212
    iget-object v8, v0, Lcom/car/musiclite/MainActivity;->searchBox:Landroid/widget/EditText;

    new-instance v9, Lcom/car/musiclite/MainActivity$3;

    invoke-direct {v9, v0}, Lcom/car/musiclite/MainActivity$3;-><init>(Lcom/car/musiclite/MainActivity;)V

    invoke-virtual {v8, v9}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 219
    iget-object v8, v0, Lcom/car/musiclite/MainActivity;->searchBox:Landroid/widget/EditText;

    const/16 v9, 0x96

    invoke-direct {v0, v9}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v9

    invoke-static {v9, v10}, Lcom/car/musiclite/MainActivity;->lp(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v9

    invoke-virtual {v1, v8, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 232
    iget-object v8, v0, Lcom/car/musiclite/MainActivity;->root:Landroid/widget/LinearLayout;

    new-instance v13, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v14, 0x34

    .line 233
    invoke-direct {v0, v14}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v14

    const/4 v15, -0x1

    invoke-direct {v13, v15, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 232
    invoke-virtual {v8, v1, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 236
    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/car/musiclite/MainActivity;->content:Landroid/widget/FrameLayout;

    .line 237
    new-instance v13, Landroid/widget/LinearLayout;

    invoke-direct {v13, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v8, 0x0

    invoke-virtual {v13, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v14, 0x3f800000    # 1.0f

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v4, v15, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v13, v1, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iput-object v13, v0, Lcom/car/musiclite/MainActivity;->mainPane:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    # horizontal panel: vinyl left, lyrics right (v71 vertical layout reverted)
    const/4 v8, 0x0

    invoke-virtual {v1, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v8, 0x11

    invoke-virtual {v1, v8}, Landroid/widget/LinearLayout;->setGravity(I)V

    # transparent panel: glow background shows through
    const v8, 0x0

    invoke-virtual {v1, v8}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    const/16 v8, 0x10

    invoke-direct {v0, v8}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v8

    # extra bottom padding: lift vinyl & lyrics away from the floating capsule bar
    # 136dp bottom -> disc center sits ~260px (centered between title and capsule)
    const/16 v15, 0x88

    invoke-direct {v0, v15}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v15

    invoke-virtual {v1, v8, v8, v8, v15}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v15, Lcom/car/musiclite/MainActivity$VinylView;

    invoke-direct {v15, v0, v0}, Lcom/car/musiclite/MainActivity$VinylView;-><init>(Lcom/car/musiclite/MainActivity;Landroid/content/Context;)V

    iput-object v15, v0, Lcom/car/musiclite/MainActivity;->coverView:Landroid/widget/ImageView;

    iput-object v15, v0, Lcom/car/musiclite/MainActivity;->vinyl:Lcom/car/musiclite/MainActivity$VinylView;

    sget-object v8, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v15, v8}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const/16 v15, 0x1b8

    invoke-direct {v0, v15}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v8

    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v15, v8, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v8, 0x10

    iput v8, v15, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const/16 v8, 0xc

    invoke-direct {v0, v8}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v8

    iput v8, v15, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    # vinyl position: 36px base + 320px right shift (half of 1/3 screen, rolled back half)
    const/16 v8, 0x164

    invoke-direct {v0, v8}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v8

    iput v8, v15, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iget-object v8, v0, Lcom/car/musiclite/MainActivity;->coverView:Landroid/widget/ImageView;

    invoke-virtual {v1, v8, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # lyrics renderer is now a self-drawing View (word-level + glow, see LyricsBox)
    new-instance v15, Lcom/car/musiclite/LyricsBox;

    iget-object v8, v0, Lcom/car/musiclite/MainActivity;->coverView:Landroid/widget/ImageView;

    invoke-direct {v15, v0, v8}, Lcom/car/musiclite/LyricsBox;-><init>(Landroid/content/Context;Landroid/widget/ImageView;)V

    iput-object v15, v0, Lcom/car/musiclite/MainActivity;->lyricsBox:Lcom/car/musiclite/LyricsBox;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, -0x1

    invoke-direct {v8, v4, v9, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v15, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # restore the original register state of the removed block (v13 held mainPane here)
    iget-object v13, v0, Lcom/car/musiclite/MainActivity;->mainPane:Landroid/widget/LinearLayout;

    const/4 v8, -0x1

    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v15, v8, v4, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    iget-object v8, v0, Lcom/car/musiclite/MainActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v8, v13, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v15, Landroid/widget/FrameLayout;

    invoke-direct {v15, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v15, v0, Lcom/car/musiclite/MainActivity;->lyricsOverlay:Landroid/widget/FrameLayout;

    invoke-static {}, Lcom/car/musiclite/MainActivity;->bgWindow()I

    move-result v8

    invoke-virtual {v15, v8}, Landroid/view/View;->setBackgroundColor(I)V

    const/16 v8, 0x8

    invoke-virtual {v15, v8}, Landroid/view/View;->setVisibility(I)V

    # glow background layer (below lyrics panel)
    new-instance v8, Lcom/car/musiclite/MainActivity$GlowBg;

    invoke-direct {v8, v0}, Lcom/car/musiclite/MainActivity$GlowBg;-><init>(Landroid/content/Context;)V

    iput-object v8, v0, Lcom/car/musiclite/MainActivity;->glowBg:Lcom/car/musiclite/MainActivity$GlowBg;

    new-instance v9, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v10, -0x1

    invoke-direct {v9, v10, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v15, v8, v9}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # wire vinyl -> glow
    iget-object v8, v0, Lcom/car/musiclite/MainActivity;->vinyl:Lcom/car/musiclite/MainActivity$VinylView;

    iget-object v9, v0, Lcom/car/musiclite/MainActivity;->glowBg:Lcom/car/musiclite/MainActivity$GlowBg;

    iput-object v9, v8, Lcom/car/musiclite/MainActivity$VinylView;->glow:Lcom/car/musiclite/MainActivity$GlowBg;

    # fix: child panel must fill overlay (was 0x0)
    const/4 v4, -0x1

    new-instance v8, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v8, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v15, v1, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, 0x0

    invoke-direct {v8, v4, v9, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    iget-object v9, v0, Lcom/car/musiclite/MainActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v9, v15, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # swipe gesture on lyrics overlay: left=next, right=prev
    iget-object v15, v0, Lcom/car/musiclite/MainActivity;->lyricsOverlay:Landroid/widget/FrameLayout;

    new-instance v8, Lcom/car/musiclite/MainActivity$LyricSwipe;

    invoke-direct {v8, v0}, Lcom/car/musiclite/MainActivity$LyricSwipe;-><init>(Lcom/car/musiclite/MainActivity;)V

    invoke-virtual {v15, v8}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const/4 v4, 0x0

    # nav card (AMap auto standard broadcast data), top-right over the lyrics overlay
    new-instance v8, Landroid/widget/LinearLayout;

    invoke-direct {v8, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v8, v0, Lcom/car/musiclite/MainActivity;->navCard:Landroid/widget/LinearLayout;

    const/4 v13, 0x1

    invoke-virtual {v8, v13}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-static {}, Lcom/car/musiclite/MainActivity;->glass()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v13

    invoke-virtual {v8, v13}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/16 v13, 0xc

    invoke-direct {v0, v13}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v15

    invoke-virtual {v8, v15, v15, v15, v15}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    # line 1: turn info
    new-instance v13, Landroid/widget/TextView;

    invoke-direct {v13, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v13, v0, Lcom/car/musiclite/MainActivity;->navL1:Landroid/widget/TextView;

    const v15, -0x1

    invoke-virtual {v13, v15}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v15, 0x41c00000    # 24.0f

    invoke-virtual {v13, v15}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v15, 0x1

    invoke-virtual {v13, v15}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v15, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v13, v15}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-virtual {v8, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    # line 2: route summary + speed limit
    new-instance v13, Landroid/widget/TextView;

    invoke-direct {v13, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v13, v0, Lcom/car/musiclite/MainActivity;->navL2:Landroid/widget/TextView;

    invoke-static {}, Lcom/car/musiclite/MainActivity;->textSub()I

    move-result v15

    invoke-virtual {v13, v15}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v15, 0x41900000    # 18.0f

    invoke-virtual {v13, v15}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v15, 0x1

    invoke-virtual {v13, v15}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v15, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v13, v15}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-virtual {v8, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const/16 v13, 0x8

    invoke-virtual {v8, v13}, Landroid/view/View;->setVisibility(I)V

    # nav card position: left of the vinyl disc, vertically centered with it
    new-instance v13, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v15, -0x2

    invoke-direct {v13, v15, v15}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    # fixed width 330 so the card's right edge stays clear of the vinyl (vinyl left edge = 16 + 356 = 372)
    const/16 v15, 0x14a

    invoke-direct {v0, v15}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v15

    iput v15, v13, Landroid/widget/FrameLayout$LayoutParams;->width:I

    # gravity: LEFT | CENTER_VERTICAL
    const/16 v15, 0x13

    iput v15, v13, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    # left margin = panel padding (16), aligns with vinyl panel content start
    const/16 v15, 0x10

    invoke-direct {v0, v15}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v15

    iput v15, v13, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    # vertical center must match vinyl center: panel pad top 16 / bottom 136 shifts vinyl center up by 60,
    # so bottomMargin 120 lifts the centered card by 60 as well
    const/16 v15, 0x78

    invoke-direct {v0, v15}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v15

    iput v15, v13, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    iget-object v15, v0, Lcom/car/musiclite/MainActivity;->lyricsOverlay:Landroid/widget/FrameLayout;

    invoke-virtual {v15, v8, v13}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 240
    new-instance v1, Landroid/widget/GridView;

    invoke-direct {v1, v0}, Landroid/widget/GridView;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/car/musiclite/MainActivity;->homeList:Landroid/widget/GridView;

    const/16 v8, 0x4

    invoke-virtual {v1, v8}, Landroid/widget/GridView;->setNumColumns(I)V

    const/16 v8, 0xa

    invoke-direct {v0, v8}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v8

    invoke-virtual {v1, v8}, Landroid/widget/GridView;->setHorizontalSpacing(I)V

    invoke-virtual {v1, v8}, Landroid/widget/GridView;->setVerticalSpacing(I)V

    invoke-virtual {v1, v8, v8, v8, v8}, Landroid/view/View;->setPadding(IIII)V

    const/4 v8, 0x0

    .line 242
    iget-object v1, v0, Lcom/car/musiclite/MainActivity;->homeList:Landroid/widget/GridView;

    invoke-virtual {v1, v3}, Landroid/widget/GridView;->setBackgroundColor(I)V

    .line 243
    iget-object v1, v0, Lcom/car/musiclite/MainActivity;->homeList:Landroid/widget/GridView;

    new-instance v13, Lcom/car/musiclite/MainActivity$HomeAdapter;

    invoke-direct {v13, v0, v8}, Lcom/car/musiclite/MainActivity$HomeAdapter;-><init>(Lcom/car/musiclite/MainActivity;Lcom/car/musiclite/MainActivity$1;)V

    invoke-virtual {v1, v13}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 244
    iget-object v1, v0, Lcom/car/musiclite/MainActivity;->content:Landroid/widget/FrameLayout;

    iget-object v13, v0, Lcom/car/musiclite/MainActivity;->homeList:Landroid/widget/GridView;

    invoke-virtual {v1, v13}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 246
    new-instance v1, Landroid/widget/GridView;

    invoke-direct {v1, v0}, Landroid/widget/GridView;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/car/musiclite/MainActivity;->resultList:Landroid/widget/GridView;

    .line 248
    # background color first (v3 holds the color)
    invoke-virtual {v1, v3}, Landroid/widget/GridView;->setBackgroundColor(I)V

    .line 247
    # playlist songs: four columns per row
    const/4 v3, 0x4

    invoke-virtual {v1, v3}, Landroid/widget/GridView;->setNumColumns(I)V

    const/4 v3, 0x6

    invoke-direct {v0, v3}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/GridView;->setVerticalSpacing(I)V

    invoke-virtual {v1, v3, v3, v3, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 249
    iget-object v1, v0, Lcom/car/musiclite/MainActivity;->resultList:Landroid/widget/GridView;

    new-instance v3, Lcom/car/musiclite/MainActivity$SongAdapter;

    iget-object v8, v0, Lcom/car/musiclite/MainActivity;->listSongs:Ljava/util/List;

    invoke-direct {v3, v0, v8}, Lcom/car/musiclite/MainActivity$SongAdapter;-><init>(Lcom/car/musiclite/MainActivity;Ljava/util/List;)V

    invoke-virtual {v1, v3}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 250
    # NOTE: visibility is gated by listPane in showScreen; keep resultList VISIBLE
    iget-object v1, v0, Lcom/car/musiclite/MainActivity;->resultList:Landroid/widget/GridView;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/widget/GridView;->setVisibility(I)V

    .line 251
    # play-all header above the song list
    new-instance v9, Landroid/widget/LinearLayout;

    invoke-direct {v9, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v9, v0, Lcom/car/musiclite/MainActivity;->listPane:Landroid/widget/LinearLayout;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->setOrientation(I)V

    # header row: 4 equal buttons, each 1/4 screen width (play-all + 3 reserved)
    # regs: v10=row  v11=btnWidth  v12=const(-2)  v13=button  v14/v15=scratch
    new-instance v10, Landroid/widget/LinearLayout;

    invoke-direct {v10, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v14, 0x0

    invoke-virtual {v10, v14}, Landroid/widget/LinearLayout;->setOrientation(I)V

    # btnWidth = screen width px / 4
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    invoke-virtual {v14}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v14

    iget v11, v14, Landroid/util/DisplayMetrics;->widthPixels:I

    const/4 v14, 0x4

    div-int/2addr v11, v14

    const/4 v12, -0x2

    # ---- button 1: play all ----
    new-instance v13, Landroid/widget/Button;

    invoke-direct {v13, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v14, "\u25b6 \u64ad\u653e\u5168\u90e8"

    invoke-virtual {v13, v14}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Landroid/widget/Button;->setAllCaps(Z)V

    const/high16 v14, 0x41600000    # 14.0f

    invoke-virtual {v13, v14}, Landroid/widget/Button;->setTextSize(F)V

    invoke-static {}, Lcom/car/musiclite/MainActivity;->textMain()I

    move-result v14

    invoke-virtual {v13, v14}, Landroid/widget/Button;->setTextColor(I)V

    invoke-static {}, Lcom/car/musiclite/MainActivity;->glass()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/16 v14, 0xc

    invoke-direct {v0, v14}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v14

    const/16 v15, 0x8

    invoke-direct {v0, v15}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v15

    invoke-virtual {v13, v14, v15, v14, v15}, Landroid/view/View;->setPadding(IIII)V

    new-instance v14, Lcom/car/musiclite/MainActivity$PlayAll;

    invoke-direct {v14, v0}, Lcom/car/musiclite/MainActivity$PlayAll;-><init>(Lcom/car/musiclite/MainActivity;)V

    invoke-virtual {v13, v14}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v15, v11, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v13, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # ---- button 2: reserved (下载) ----
    new-instance v13, Landroid/widget/Button;

    invoke-direct {v13, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v14, "\u4e0b\u8f7d"

    invoke-virtual {v13, v14}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Landroid/widget/Button;->setAllCaps(Z)V

    const/high16 v14, 0x41600000    # 14.0f

    invoke-virtual {v13, v14}, Landroid/widget/Button;->setTextSize(F)V

    invoke-static {}, Lcom/car/musiclite/MainActivity;->textMain()I

    move-result v14

    invoke-virtual {v13, v14}, Landroid/widget/Button;->setTextColor(I)V

    invoke-static {}, Lcom/car/musiclite/MainActivity;->glass()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/16 v14, 0xc

    invoke-direct {v0, v14}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v14

    const/16 v15, 0x8

    invoke-direct {v0, v15}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v15

    invoke-virtual {v13, v14, v15, v14, v15}, Landroid/view/View;->setPadding(IIII)V

    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v15, v11, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v13, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # ---- button 3: reserved (收藏) ----
    new-instance v13, Landroid/widget/Button;

    invoke-direct {v13, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v14, "\u6536\u85cf"

    invoke-virtual {v13, v14}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Landroid/widget/Button;->setAllCaps(Z)V

    const/high16 v14, 0x41600000    # 14.0f

    invoke-virtual {v13, v14}, Landroid/widget/Button;->setTextSize(F)V

    invoke-static {}, Lcom/car/musiclite/MainActivity;->textMain()I

    move-result v14

    invoke-virtual {v13, v14}, Landroid/widget/Button;->setTextColor(I)V

    invoke-static {}, Lcom/car/musiclite/MainActivity;->glass()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/16 v14, 0xc

    invoke-direct {v0, v14}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v14

    const/16 v15, 0x8

    invoke-direct {v0, v15}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v15

    invoke-virtual {v13, v14, v15, v14, v15}, Landroid/view/View;->setPadding(IIII)V

    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v15, v11, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v13, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # ---- button 4: reserved (更多) ----
    new-instance v13, Landroid/widget/Button;

    invoke-direct {v13, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v14, "\u66f4\u591a"

    invoke-virtual {v13, v14}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Landroid/widget/Button;->setAllCaps(Z)V

    const/high16 v14, 0x41600000    # 14.0f

    invoke-virtual {v13, v14}, Landroid/widget/Button;->setTextSize(F)V

    invoke-static {}, Lcom/car/musiclite/MainActivity;->textMain()I

    move-result v14

    invoke-virtual {v13, v14}, Landroid/widget/Button;->setTextColor(I)V

    invoke-static {}, Lcom/car/musiclite/MainActivity;->glass()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/16 v14, 0xc

    invoke-direct {v0, v14}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v14

    const/16 v15, 0x8

    invoke-direct {v0, v15}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v15

    invoke-virtual {v13, v14, v15, v14, v15}, Landroid/view/View;->setPadding(IIII)V

    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v15, v11, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v13, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # header row into the list pane
    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    # hide the play-all / download / fav / more header row per request
    const/16 v14, 0x8

    invoke-virtual {v10, v14}, Landroid/widget/LinearLayout;->setVisibility(I)V


    # song list fills remaining height
    iget-object v8, v0, Lcom/car/musiclite/MainActivity;->resultList:Landroid/widget/GridView;

    new-instance v13, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v14, -0x1

    const/4 v15, 0x0

    const/high16 v12, 0x3f800000    # 1.0f

    invoke-direct {v13, v14, v15, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v9, v8, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, v0, Lcom/car/musiclite/MainActivity;->content:Landroid/widget/FrameLayout;

    new-instance v14, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v13, -0x1

    invoke-direct {v14, v13, v13}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v9, v14}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 253
    invoke-direct {v0}, Lcom/car/musiclite/MainActivity;->buildLoginView()Landroid/widget/LinearLayout;

    move-result-object v1

    iput-object v1, v0, Lcom/car/musiclite/MainActivity;->loginView:Landroid/widget/LinearLayout;

    .line 254
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 255
    iget-object v1, v0, Lcom/car/musiclite/MainActivity;->content:Landroid/widget/FrameLayout;

    iget-object v8, v0, Lcom/car/musiclite/MainActivity;->loginView:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v8}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 258
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/car/musiclite/MainActivity;->npBar:Landroid/widget/LinearLayout;

    .line 259
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 260
    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 261
    # roomier insets keep the corner buttons inside the capsule's rounded ends
    const/16 v8, 0xc

    invoke-direct {v0, v8}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v8

    const/16 v13, 0xc

    invoke-direct {v0, v13}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v15

    const/16 v3, 0xc

    invoke-direct {v0, v3}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v3

    invoke-direct {v0, v13}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v13

    invoke-virtual {v1, v8, v15, v3, v13}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    # distinct bar color so the player bar stands out from the page
    invoke-static {}, Lcom/car/musiclite/MainActivity;->bgBar()I

    move-result v6

    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    # theme + heart pills at the capsule head (before the shuffle button)
    # same pill size as the other capsule buttons: 160 x 80 dp
    iget-object v3, v0, Lcom/car/musiclite/MainActivity;->darkPill:Landroid/widget/ImageView;

    if-eqz v3, :cap_no_dark

    const/16 v6, 0xa0

    invoke-direct {v0, v6}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v6

    const/16 v13, 0x50

    invoke-direct {v0, v13}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v13

    invoke-static {v6, v13}, Lcom/car/musiclite/MainActivity;->lp(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    const/16 v13, 0x8

    invoke-direct {v0, v13}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v13

    iput v13, v6, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iput v13, v6, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    invoke-virtual {v1, v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cap_no_dark
    iget-object v3, v0, Lcom/car/musiclite/MainActivity;->heartPill:Landroid/widget/ImageView;

    if-eqz v3, :cap_no_heart

    const/16 v6, 0xa0

    invoke-direct {v0, v6}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v6

    const/16 v13, 0x50

    invoke-direct {v0, v13}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v13

    invoke-static {v6, v13}, Lcom/car/musiclite/MainActivity;->lp(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    const/16 v13, 0x8

    invoke-direct {v0, v13}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v13

    iput v13, v6, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iput v13, v6, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    invoke-virtual {v1, v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cap_no_heart
    .line 274
    new-instance v3, Landroid/widget/ImageView;

    invoke-direct {v3, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v6, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    iput-object v3, v0, Lcom/car/musiclite/MainActivity;->playBtn:Landroid/widget/ImageView;

    .line 276
    iget-object v3, v0, Lcom/car/musiclite/MainActivity;->playBtn:Landroid/widget/ImageView;

    new-instance v6, Lcom/car/musiclite/MainActivity$6;

    invoke-direct {v6, v0}, Lcom/car/musiclite/MainActivity$6;-><init>(Lcom/car/musiclite/MainActivity;)V

    invoke-virtual {v3, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    # glass background (play button)
    invoke-static {}, Lcom/car/musiclite/MainActivity;->glass()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 277
    new-instance v3, Landroid/widget/ImageView;

    invoke-direct {v3, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v6, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    # keep a reference so the icon can follow the play mode
    iput-object v3, v0, Lcom/car/musiclite/MainActivity;->modeBtn:Landroid/widget/ImageView;

    new-instance v6, Lcom/car/musiclite/MainActivity$ModeBtn;

    invoke-direct {v6, v0}, Lcom/car/musiclite/MainActivity$ModeBtn;-><init>(Lcom/car/musiclite/MainActivity;)V

    invoke-virtual {v3, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    # glass background (shuffle button)
    invoke-static {}, Lcom/car/musiclite/MainActivity;->glass()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    # initial icon follows the current play mode
    invoke-virtual {v0}, Lcom/car/musiclite/MainActivity;->updateModeBtn()V

    const/16 v6, 0xa0

    invoke-direct {v0, v6}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v6

    const/16 v13, 0x50

    invoke-direct {v0, v13}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v13

    invoke-static {v6, v13}, Lcom/car/musiclite/MainActivity;->lp(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    # breathing room between capsule pills (shouldn't touch each other)
    const/16 v13, 0x8

    invoke-direct {v0, v13}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v13

    iput v13, v6, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iput v13, v6, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    invoke-virtual {v1, v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 278
    iget-object v3, v0, Lcom/car/musiclite/MainActivity;->playBtn:Landroid/widget/ImageView;

    const/16 v6, 0xa0

    invoke-direct {v0, v6}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v6

    const/16 v13, 0x50

    invoke-direct {v0, v13}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v13

    invoke-static {v6, v13}, Lcom/car/musiclite/MainActivity;->lp(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    # breathing room between capsule pills (shouldn't touch each other)
    const/16 v13, 0x8

    invoke-direct {v0, v13}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v13

    iput v13, v6, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iput v13, v6, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    invoke-virtual {v1, v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # initial play/pause icon
    invoke-direct {v0}, Lcom/car/musiclite/MainActivity;->updatePlayBtn()V

    .line 284
    new-instance v3, Landroid/widget/ImageView;

    invoke-direct {v3, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v6, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const-string v6, "back"

    invoke-static {v0, v6}, Lcom/car/musiclite/MainActivity;->iconDrawable(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    if-eqz v6, :cond_noic4

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_noic4
    new-instance v6, Lcom/car/musiclite/MainActivity$BackBtn;

    invoke-direct {v6, v0}, Lcom/car/musiclite/MainActivity$BackBtn;-><init>(Lcom/car/musiclite/MainActivity;)V

    invoke-virtual {v3, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    # glass background (back button)
    invoke-static {}, Lcom/car/musiclite/MainActivity;->glass()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 288
    const/16 v6, 0xa0

    invoke-direct {v0, v6}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v6

    const/16 v13, 0x50

    invoke-direct {v0, v13}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v13

    invoke-static {v6, v13}, Lcom/car/musiclite/MainActivity;->lp(II)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    # breathing room between capsule pills (shouldn't touch each other)
    const/16 v13, 0x8

    invoke-direct {v0, v13}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v13

    iput v13, v6, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iput v13, v6, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    invoke-virtual {v1, v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 282
    .line 284




    # bottom bar column: seekbar on top, song/artist centered below
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x1

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v2, 0x11

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    # keep ref for show/hide when nothing is playing
    iput-object v3, v0, Lcom/car/musiclite/MainActivity;->npInfoCol:Landroid/widget/LinearLayout;

    # wave progress bar: WaveView under a transparent SeekBar (keeps touch/seek logic)
    new-instance v9, Landroid/widget/FrameLayout;

    invoke-direct {v9, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/widget/SeekBar;

    invoke-direct {v2, v0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    iput-object v2, v0, Lcom/car/musiclite/MainActivity;->npSeek:Landroid/widget/SeekBar;

    iget-object v2, v0, Lcom/car/musiclite/MainActivity;->npSeek:Landroid/widget/SeekBar;

    new-instance v5, Lcom/car/musiclite/MainActivity$8;

    invoke-direct {v5, v0}, Lcom/car/musiclite/MainActivity$8;-><init>(Lcom/car/musiclite/MainActivity;)V

    invoke-virtual {v2, v5}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    # invisible visuals: the wave underneath does the drawing
    const/4 v5, 0x0

    invoke-virtual {v2, v5}, Landroid/view/View;->setAlpha(F)V

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v6, -0x1

    const/16 v8, 0x30

    invoke-direct {v5, v6, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v9, v2, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # wave layer
    new-instance v2, Lcom/car/musiclite/MainActivity$WaveView;

    invoke-direct {v2, v0, v0}, Lcom/car/musiclite/MainActivity$WaveView;-><init>(Lcom/car/musiclite/MainActivity;Landroid/content/Context;)V

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v6, -0x1

    const/16 v8, 0x30

    invoke-direct {v5, v6, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v9, v2, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # wave + touch layer into the info column
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    const/4 v8, -0x2

    invoke-direct {v5, v6, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v9, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # centered info column
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v5, 0x11

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    # single-line row: title + artist + time on one line, centered as a group
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v8, 0x11

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setGravity(I)V

    # title
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v5, v0, Lcom/car/musiclite/MainActivity;->npTitle:Landroid/widget/TextView;

    const-string v6, "\u672a\u64ad\u653e"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {}, Lcom/car/musiclite/MainActivity;->textMain()I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v6, 0x41700000    # 15.0f

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v5}, Landroid/widget/TextView;->setSingleLine()V

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    const/16 v6, 0xb4

    invoke-direct {v0, v6}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setMaxWidth(I)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x2

    invoke-direct {v6, v8, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # artist
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v5, v0, Lcom/car/musiclite/MainActivity;->npArtist:Landroid/widget/TextView;

    invoke-static {}, Lcom/car/musiclite/MainActivity;->textMain()I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v6, 0x41300000    # 11.0f

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v5}, Landroid/widget/TextView;->setSingleLine()V

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    const/16 v6, 0xa0

    invoke-direct {v0, v6}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setMaxWidth(I)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x2

    invoke-direct {v6, v8, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v8, 0x6

    invoke-direct {v0, v8}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v8

    iput v8, v6, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    invoke-virtual {v7, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # time
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v5, v0, Lcom/car/musiclite/MainActivity;->npTime:Landroid/widget/TextView;

    invoke-static {}, Lcom/car/musiclite/MainActivity;->textMain()I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v6, 0x41300000    # 11.0f

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 v6, 0x7

    invoke-direct {v0, v6}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v6

    const/4 v8, 0x0

    invoke-virtual {v5, v6, v8, v8, v8}, Landroid/widget/TextView;->setPadding(IIII)V

    # full column width + centered text
    const/16 v6, 0x11

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x2

    invoke-direct {v6, v8, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # single-line row into the info column
    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    # info column fills bar width so the row stays centered under the seekbar
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x1

    const/4 v5, -0x2

    invoke-direct {v6, v8, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # info column into bar (width 0 + weight)
    const/4 v5, 0x0

    const/4 v6, -0x2

    const v8, 0x3f8ccccd    # 1.1f

    invoke-static {v5, v6, v8}, Lcom/car/musiclite/MainActivity;->lp(IIF)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v5

    invoke-virtual {v1, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # restore v6 = -1 for the root addView below
    const/4 v6, -0x1

    iget-object v3, v0, Lcom/car/musiclite/MainActivity;->npTitle:Landroid/widget/TextView;

    new-instance v5, Lcom/car/musiclite/MainActivity$LyricOpen;

    invoke-direct {v5, v0}, Lcom/car/musiclite/MainActivity$LyricOpen;-><init>(Lcom/car/musiclite/MainActivity;)V

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v3, v0, Lcom/car/musiclite/MainActivity;->npArtist:Landroid/widget/TextView;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v3, v0, Lcom/car/musiclite/MainActivity;->npTime:Landroid/widget/TextView;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v3, v0, Lcom/car/musiclite/MainActivity;->npSeek:Landroid/widget/SeekBar;

    # read-only progress: touch/drag must not change playback position
    # (disabled SeekBar ignores all touch; programmatic setProgress still works)
    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Landroid/view/View;->setEnabled(Z)V

    .line 351
    # global floating glass capsule: park npBar over content (bottom-left, width hugs buttons)
    iget-object v2, v0, Lcom/car/musiclite/MainActivity;->content:Landroid/widget/FrameLayout;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x2

    const/4 v5, -0x2

    const/16 v6, 0x50

    invoke-direct {v3, v4, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    const/16 v4, 0x14

    invoke-direct {v0, v4}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v4

    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    const/16 v4, 0x10

    invoke-direct {v0, v4}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v4

    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {v1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {}, Lcom/car/musiclite/MainActivity;->glassBarDock()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    # restore capsule song text instantly after recreate (no blank flash until next broadcast)
    sget-object v3, Lcom/car/musiclite/MainActivity;->lastTitle:Ljava/lang/String;

    if-eqz v3, :no_title

    iget-object v4, v0, Lcom/car/musiclite/MainActivity;->npTitle:Landroid/widget/TextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :no_title
    sget-object v3, Lcom/car/musiclite/MainActivity;->lastArtistTxt:Ljava/lang/String;

    if-eqz v3, :no_artist

    iget-object v4, v0, Lcom/car/musiclite/MainActivity;->npArtist:Landroid/widget/TextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :no_artist
    # initial capsule visibility follows playing state (hidden before first play)
    invoke-virtual {v0}, Lcom/car/musiclite/MainActivity;->updateTime()V

    return-void
.end method

.method private doSearch()V
    .locals 4

    .line 464
    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->searchBox:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 465
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 466
    const-string v0, "\u8f93\u5165\u5173\u952e\u8bcd"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void

    :cond_0
    const/4 v1, 0x1

    .line 469
    invoke-direct {p0, v1}, Lcom/car/musiclite/MainActivity;->showScreen(I)V

    const/4 v2, 0x3

    sput v2, Lcom/car/musiclite/MainActivity;->restoreType:I

    sput-object v0, Lcom/car/musiclite/MainActivity;->restoreText:Ljava/lang/String;

    .line 470
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u641c\u7d22: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/car/musiclite/MainActivity;->listTitle:Ljava/lang/String;

    .line 471
    iput-boolean v1, p0, Lcom/car/musiclite/MainActivity;->listIsSearch:Z

    .line 472
    iget-object v1, p0, Lcom/car/musiclite/MainActivity;->listSongs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 473
    iget-object v1, p0, Lcom/car/musiclite/MainActivity;->resultList:Landroid/widget/GridView;

    invoke-virtual {v1}, Landroid/widget/GridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    check-cast v1, Lcom/car/musiclite/MainActivity$SongAdapter;

    invoke-virtual {v1}, Lcom/car/musiclite/MainActivity$SongAdapter;->notifyDataSetChanged()V

    .line 474
    invoke-static {p0}, Lcom/car/musiclite/Api;->get(Landroid/content/Context;)Lcom/car/musiclite/Api;

    move-result-object v1

    .line 475
    new-instance v2, Lcom/car/musiclite/MainActivity$11;

    invoke-direct {v2, p0}, Lcom/car/musiclite/MainActivity$11;-><init>(Lcom/car/musiclite/MainActivity;)V

    invoke-virtual {v1, v0, v2}, Lcom/car/musiclite/Api;->search(Ljava/lang/String;Lcom/car/musiclite/Api$Cb;)V

    return-void
.end method

.method private initScale()V
    .locals 4

    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    # scale = min(screenW / 1920, screenH / 720) : fit the 1920x720 car-unit design
    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v1, v1

    const v2, 0x44f00000    # 1920.0f

    div-float v1, v1, v2

    iget v2, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v2, v2

    const v3, 0x44340000    # 720.0f

    div-float v2, v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    # override density/scaledDensity: dp(I) and setTextSize(sp) all pick this up automatically
    iput v1, v0, Landroid/util/DisplayMetrics;->density:F

    iput v1, v0, Landroid/util/DisplayMetrics;->scaledDensity:F

    return-void
.end method

.method private dp(I)I
    .locals 1

    .line 742
    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    int-to-float p1, p1

    mul-float v0, v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p1

    return p1
.end method

.method private static fmt(I)Ljava/lang/String;
    .locals 3

    .line 754
    div-int/lit16 p0, p0, 0x3e8

    .line 755
    div-int/lit8 v0, p0, 0x3c

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    rem-int/lit8 p0, p0, 0x3c

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const/4 v0, 0x1

    aput-object p0, v1, v0

    const-string p0, "%d:%02d"

    invoke-static {p0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static lp(II)Landroid/widget/LinearLayout$LayoutParams;
    .locals 1

    .line 750
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, p0, p1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method private static lp(IIF)Landroid/widget/LinearLayout$LayoutParams;
    .locals 1

    .line 746
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, p0, p1, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    return-object v0
.end method

.method private openLogin()V
    .locals 1

    const/4 v0, 0x2

    .line 403
    invoke-direct {p0, v0}, Lcom/car/musiclite/MainActivity;->showScreen(I)V

    .line 404
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->startQrLogin()V

    return-void
.end method

.method private openPlaylist(Lcom/car/musiclite/Api$Playlist;)V
    .locals 5

    .line 491
    iget-wide v0, p1, Lcom/car/musiclite/Api$Playlist;->id:J

    const-wide/16 v2, -0x2

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    .line 492
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->openLogin()V

    return-void

    .line 495
    :cond_0
    iget-wide v0, p1, Lcom/car/musiclite/Api$Playlist;->id:J

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-nez v4, :cond_1

    const/4 v4, 0x1

    sput v4, Lcom/car/musiclite/MainActivity;->restoreType:I

    .line 496
    invoke-static {p0}, Lcom/car/musiclite/Api;->get(Landroid/content/Context;)Lcom/car/musiclite/Api;

    move-result-object p1

    new-instance v0, Lcom/car/musiclite/MainActivity$12;

    invoke-direct {v0, p0}, Lcom/car/musiclite/MainActivity$12;-><init>(Lcom/car/musiclite/MainActivity;)V

    invoke-virtual {p1, v0}, Lcom/car/musiclite/Api;->recommendSongs(Lcom/car/musiclite/Api$Cb;)V

    return-void

    .line 514
    :cond_1
    const/4 v4, 0x2

    sput v4, Lcom/car/musiclite/MainActivity;->restoreType:I

    iget-wide v0, p1, Lcom/car/musiclite/Api$Playlist;->id:J

    sput-wide v0, Lcom/car/musiclite/MainActivity;->restoreId:J

    iget-object v0, p1, Lcom/car/musiclite/Api$Playlist;->name:Ljava/lang/String;

    sput-object v0, Lcom/car/musiclite/MainActivity;->restoreText:Ljava/lang/String;

    invoke-static {p0}, Lcom/car/musiclite/Api;->get(Landroid/content/Context;)Lcom/car/musiclite/Api;

    move-result-object v0

    iget-wide v1, p1, Lcom/car/musiclite/Api$Playlist;->id:J

    new-instance v3, Lcom/car/musiclite/MainActivity$13;

    invoke-direct {v3, p0, p1}, Lcom/car/musiclite/MainActivity$13;-><init>(Lcom/car/musiclite/MainActivity;Lcom/car/musiclite/Api$Playlist;)V

    invoke-virtual {v0, v1, v2, v3}, Lcom/car/musiclite/Api;->playlistDetail(JLcom/car/musiclite/Api$Cb;)V

    return-void
.end method

.method private playQueue(Ljava/util/List;I)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/car/musiclite/Api$Song;",
            ">;I)V"
        }
    .end annotation

    .line 534
    :try_start_0
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 535
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/car/musiclite/Api$Song;

    .line 536
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 537
    const-string v3, "id"

    iget-wide v4, v1, Lcom/car/musiclite/Api$Song;->id:J

    invoke-virtual {v2, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 538
    const-string v3, "name"

    iget-object v4, v1, Lcom/car/musiclite/Api$Song;->name:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 539
    const-string v3, "artist"

    iget-object v4, v1, Lcom/car/musiclite/Api$Song;->artist:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 540
    const-string v3, "album"

    iget-object v4, v1, Lcom/car/musiclite/Api$Song;->album:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 541
    const-string v3, "fee"

    iget v1, v1, Lcom/car/musiclite/Api$Song;->fee:I

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 542
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .line 544
    :cond_0
    new-instance p1, Landroid/content/Intent;

    const-string v1, "com.car.musiclite.PLAY_QUEUE"

    const/4 v2, 0x0

    const-class v3, Lcom/car/musiclite/PlayerService;

    invoke-direct {p1, v1, v2, p0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    .line 546
    const-string v1, "json"

    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 547
    const-string v0, "index"

    invoke-virtual {p1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 548
    invoke-virtual {p0, p1}, Lcom/car/musiclite/MainActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method private playingId()J
    .locals 2

    .line 729
    iget v0, p0, Lcom/car/musiclite/MainActivity;->lastIdx:I

    if-ltz v0, :cond_0

    iget-object v1, p0, Lcom/car/musiclite/MainActivity;->listSongs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/car/musiclite/MainActivity;->listIsSearch:Z

    if-nez v0, :cond_0

    .line 730
    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->listSongs:Ljava/util/List;

    iget v1, p0, Lcom/car/musiclite/MainActivity;->lastIdx:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/car/musiclite/Api$Song;

    iget-wide v0, v0, Lcom/car/musiclite/Api$Song;->id:J

    return-wide v0

    :cond_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method private pollLoop()V
    .locals 3

    .line 592
    iget-boolean v0, p0, Lcom/car/musiclite/MainActivity;->polling:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->qrKey:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 595
    invoke-static {p0}, Lcom/car/musiclite/Api;->get(Landroid/content/Context;)Lcom/car/musiclite/Api;

    move-result-object v0

    iget-object v1, p0, Lcom/car/musiclite/MainActivity;->qrKey:Ljava/lang/String;

    new-instance v2, Lcom/car/musiclite/MainActivity$15;

    invoke-direct {v2, p0}, Lcom/car/musiclite/MainActivity$15;-><init>(Lcom/car/musiclite/MainActivity;)V

    invoke-virtual {v0, v1, v2}, Lcom/car/musiclite/Api;->qrPoll(Ljava/lang/String;Lcom/car/musiclite/Api$Cb;)V

    :cond_0
    return-void
.end method

.method private refreshHome()V
    .locals 4

    .line 408
    invoke-static {p0}, Lcom/car/musiclite/Api;->get(Landroid/content/Context;)Lcom/car/musiclite/Api;

    move-result-object v0

    .line 409
    invoke-virtual {v0}, Lcom/car/musiclite/Api;->loggedIn()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 410
    iget-object v1, p0, Lcom/car/musiclite/MainActivity;->statusText:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u5df2\u767b\u5f55: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/car/musiclite/Api;->nickname()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 411
    new-instance v1, Lcom/car/musiclite/MainActivity$10;

    invoke-direct {v1, p0, v0}, Lcom/car/musiclite/MainActivity$10;-><init>(Lcom/car/musiclite/MainActivity;Lcom/car/musiclite/Api;)V

    invoke-virtual {v0, v1}, Lcom/car/musiclite/Api;->account(Lcom/car/musiclite/Api$Cb;)V

    return-void

    .line 440
    :cond_0
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->showGuestHome()V

    return-void
.end method

.method private showGuestHome()V
    .locals 3

    .line 445
    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->homeItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 446
    new-instance v0, Lcom/car/musiclite/Api$Playlist;

    invoke-direct {v0}, Lcom/car/musiclite/Api$Playlist;-><init>()V

    const-wide/16 v1, -0x2

    .line 447
    iput-wide v1, v0, Lcom/car/musiclite/Api$Playlist;->id:J

    .line 448
    const-string v1, "\u767b\u5f55\u8d26\u53f7 (\u626b\u7801\uff0c\u53ef\u542c\u4f60\u8d26\u53f7\u91cc\u7684\u5185\u5bb9)"

    iput-object v1, v0, Lcom/car/musiclite/Api$Playlist;->name:Ljava/lang/String;

    .line 449
    iget-object v1, p0, Lcom/car/musiclite/MainActivity;->homeItems:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 450
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->addCharts()V

    .line 451
    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->homeList:Landroid/widget/GridView;

    invoke-virtual {v0}, Landroid/widget/GridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Lcom/car/musiclite/MainActivity$HomeAdapter;

    invoke-virtual {v0}, Lcom/car/musiclite/MainActivity$HomeAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method private showScreen(I)V
    .locals 4

    sput p1, Lcom/car/musiclite/MainActivity;->curScreen:I

    # close lyrics overlay on any screen switch (Back button etc.)
    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->lyricsOverlay:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v1

    if-nez v1, :ss_no_lyr

    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity;->hideLyrics()V

    :ss_no_lyr
    .line 394
    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->homeList:Landroid/widget/GridView;

    const/4 v1, 0x0

    if-nez p1, :cond_0

    const/4 v3, 0x0

    goto :goto_0

    :cond_0
    const/16 v3, 0x8

    :goto_0
    invoke-virtual {v0, v3}, Landroid/widget/GridView;->setVisibility(I)V

    .line 395
    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->listPane:Landroid/widget/LinearLayout;

    const/4 v3, 0x1

    if-ne p1, v3, :cond_1

    const/4 v3, 0x0

    goto :goto_1

    :cond_1
    const/16 v3, 0x8

    :goto_1
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 396
    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->loginView:Landroid/widget/LinearLayout;

    const/4 v3, 0x2

    if-eq p1, v3, :cond_2

    const/16 v1, 0x8

    :cond_2
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    if-nez p1, :cond_3

    .line 398
    iget-object p1, p0, Lcom/car/musiclite/MainActivity;->homeList:Landroid/widget/GridView;

    invoke-virtual {p1}, Landroid/widget/GridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    check-cast p1, Lcom/car/musiclite/MainActivity$HomeAdapter;

    invoke-virtual {p1}, Lcom/car/musiclite/MainActivity$HomeAdapter;->notifyDataSetChanged()V

    :cond_3
    return-void
.end method

.method private restoreList()V
    .locals 6

    sget v0, Lcom/car/musiclite/MainActivity;->curScreen:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_r0

    sget v0, Lcom/car/musiclite/MainActivity;->restoreType:I

    if-eqz v0, :cond_r0

    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity;->loadListCache()Z

    move-result v1

    if-eqz v1, :cache_miss

    return-void

    :cache_miss
    sget v0, Lcom/car/musiclite/MainActivity;->restoreType:I

    const/4 v1, 0x1

    if-eq v0, v1, :r_type1

    const/4 v1, 0x2

    if-eq v0, v1, :r_type2

    const/4 v1, 0x3

    if-eq v0, v1, :r_type3

    return-void

    :r_type1
    invoke-static {p0}, Lcom/car/musiclite/Api;->get(Landroid/content/Context;)Lcom/car/musiclite/Api;

    move-result-object v0

    new-instance v1, Lcom/car/musiclite/MainActivity$12;

    invoke-direct {v1, p0}, Lcom/car/musiclite/MainActivity$12;-><init>(Lcom/car/musiclite/MainActivity;)V

    invoke-virtual {v0, v1}, Lcom/car/musiclite/Api;->recommendSongs(Lcom/car/musiclite/Api$Cb;)V

    return-void

    :r_type2
    new-instance v1, Lcom/car/musiclite/Api$Playlist;

    invoke-direct {v1}, Lcom/car/musiclite/Api$Playlist;-><init>()V

    sget-wide v2, Lcom/car/musiclite/MainActivity;->restoreId:J

    iput-wide v2, v1, Lcom/car/musiclite/Api$Playlist;->id:J

    sget-object v4, Lcom/car/musiclite/MainActivity;->restoreText:Ljava/lang/String;

    iput-object v4, v1, Lcom/car/musiclite/Api$Playlist;->name:Ljava/lang/String;

    invoke-static {p0}, Lcom/car/musiclite/Api;->get(Landroid/content/Context;)Lcom/car/musiclite/Api;

    move-result-object v0

    sget-wide v2, Lcom/car/musiclite/MainActivity;->restoreId:J

    new-instance v4, Lcom/car/musiclite/MainActivity$13;

    invoke-direct {v4, p0, v1}, Lcom/car/musiclite/MainActivity$13;-><init>(Lcom/car/musiclite/MainActivity;Lcom/car/musiclite/Api$Playlist;)V

    invoke-virtual {v0, v2, v3, v4}, Lcom/car/musiclite/Api;->playlistDetail(JLcom/car/musiclite/Api$Cb;)V

    return-void

    :r_type3
    sget-object v0, Lcom/car/musiclite/MainActivity;->restoreText:Ljava/lang/String;

    iput-object v0, p0, Lcom/car/musiclite/MainActivity;->listTitle:Ljava/lang/String;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/car/musiclite/MainActivity;->listIsSearch:Z

    iget-object v1, p0, Lcom/car/musiclite/MainActivity;->listSongs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    iget-object v1, p0, Lcom/car/musiclite/MainActivity;->resultList:Landroid/widget/GridView;

    invoke-virtual {v1}, Landroid/widget/GridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    check-cast v1, Lcom/car/musiclite/MainActivity$SongAdapter;

    invoke-virtual {v1}, Lcom/car/musiclite/MainActivity$SongAdapter;->notifyDataSetChanged()V

    invoke-static {p0}, Lcom/car/musiclite/Api;->get(Landroid/content/Context;)Lcom/car/musiclite/Api;

    move-result-object v1

    new-instance v2, Lcom/car/musiclite/MainActivity$11;

    invoke-direct {v2, p0}, Lcom/car/musiclite/MainActivity$11;-><init>(Lcom/car/musiclite/MainActivity;)V

    invoke-virtual {v1, v0, v2}, Lcom/car/musiclite/Api;->search(Ljava/lang/String;Lcom/car/musiclite/Api$Cb;)V

    return-void

    :cond_r0
    return-void
.end method

.method saveListCache()V
    .locals 8

    sget v0, Lcom/car/musiclite/MainActivity;->restoreType:I

    if-eqz v0, :sc_ret

    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->listSongs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :sc_ret

    :try_scs
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    sget v1, Lcom/car/musiclite/MainActivity;->restoreType:I

    const-string v2, "t"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    sget-wide v1, Lcom/car/musiclite/MainActivity;->restoreId:J

    const-string v3, "i"

    invoke-virtual {v0, v3, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    sget-object v1, Lcom/car/musiclite/MainActivity;->restoreText:Ljava/lang/String;

    const-string v2, "x"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/car/musiclite/MainActivity;->listTitle:Ljava/lang/String;

    const-string v2, "ti"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-boolean v1, p0, Lcom/car/musiclite/MainActivity;->listIsSearch:Z

    const-string v2, "s"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    iget-object v2, p0, Lcom/car/musiclite/MainActivity;->listSongs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :sc_loop
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :sc_loop_end

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/car/musiclite/Api$Song;

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    iget-wide v5, v3, Lcom/car/musiclite/Api$Song;->id:J

    const-string v7, "i"

    invoke-virtual {v4, v7, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    iget-object v5, v3, Lcom/car/musiclite/Api$Song;->name:Ljava/lang/String;

    const-string v7, "n"

    invoke-virtual {v4, v7, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v5, v3, Lcom/car/musiclite/Api$Song;->artist:Ljava/lang/String;

    const-string v7, "a"

    invoke-virtual {v4, v7, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v5, v3, Lcom/car/musiclite/Api$Song;->album:Ljava/lang/String;

    const-string v7, "l"

    invoke-virtual {v4, v7, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget v5, v3, Lcom/car/musiclite/Api$Song;->fee:I

    const-string v7, "f"

    invoke-virtual {v4, v7, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    iget-boolean v5, v3, Lcom/car/musiclite/Api$Song;->trial:Z

    const-string v7, "tr"

    invoke-virtual {v4, v7, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :sc_loop

    :sc_loop_end
    const-string v2, "ls"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0
    :try_sce
    .catch Ljava/lang/Throwable; {:try_scs .. :try_sce} :sc_catch

    new-instance v1, Lcom/car/musiclite/MainActivity$CacheW;

    invoke-direct {v1, p0, v0}, Lcom/car/musiclite/MainActivity$CacheW;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    :sc_ret
    return-void

    :sc_catch
    move-exception v0

    return-void
.end method

.method loadListCache()Z
    .locals 9

    :try_lcs
    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity;->getCacheDir()Ljava/io/File;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    const-string v2, "listcache.json"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :lc_fail

    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v3}, Ljava/io/FileInputStream;->available()I

    move-result v4

    if-lez v4, :lc_close_fail

    new-array v5, v4, [B

    invoke-virtual {v3, v5}, Ljava/io/FileInputStream;->read([B)I

    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    new-instance v6, Ljava/lang/String;

    const-string v7, "UTF-8"

    invoke-direct {v6, v5, v7}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v8, "t"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    sget v2, Lcom/car/musiclite/MainActivity;->restoreType:I

    if-eq v8, v2, :lc_tok

    const/4 v0, 0x0

    return v0

    :lc_tok
    sget v2, Lcom/car/musiclite/MainActivity;->restoreType:I

    const/4 v8, 0x2

    if-ne v2, v8, :lc_t2done

    const-string v8, "i"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v0

    sget-wide v2, Lcom/car/musiclite/MainActivity;->restoreId:J

    cmp-long v8, v0, v2

    if-eqz v8, :lc_t2done

    const/4 v0, 0x0

    return v0

    :lc_t2done
    sget v2, Lcom/car/musiclite/MainActivity;->restoreType:I

    const/4 v8, 0x3

    if-ne v2, v8, :lc_t3done

    const-string v8, "x"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lcom/car/musiclite/MainActivity;->restoreText:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :lc_fail

    :lc_t3done
    const-string v8, "ti"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/car/musiclite/MainActivity;->listTitle:Ljava/lang/String;

    const-string v8, "s"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/car/musiclite/MainActivity;->listIsSearch:Z

    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->listSongs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const-string v8, "ls"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-eqz v1, :lc_check

    const/4 v2, 0x0

    :lc_loop
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :lc_loop_end

    new-instance v4, Lcom/car/musiclite/Api$Song;

    invoke-direct {v4}, Lcom/car/musiclite/Api$Song;-><init>()V

    const-string v5, "i"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v6

    iput-wide v6, v4, Lcom/car/musiclite/Api$Song;->id:J

    const-string v5, "n"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/car/musiclite/Api$Song;->name:Ljava/lang/String;

    const-string v5, "a"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/car/musiclite/Api$Song;->artist:Ljava/lang/String;

    const-string v5, "l"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/car/musiclite/Api$Song;->album:Ljava/lang/String;

    const-string v5, "f"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v4, Lcom/car/musiclite/Api$Song;->fee:I

    const-string v5, "tr"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, v4, Lcom/car/musiclite/Api$Song;->trial:Z

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :lc_loop

    :lc_loop_end
    :lc_check
    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->listSongs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :lc_fail

    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->resultList:Landroid/widget/GridView;

    invoke-virtual {v0}, Landroid/widget/GridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Lcom/car/musiclite/MainActivity$SongAdapter;

    invoke-virtual {v0}, Lcom/car/musiclite/MainActivity$SongAdapter;->notifyDataSetChanged()V

    const/4 v0, 0x1

    return v0

    :lc_close_fail
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    :lc_fail
    const/4 v0, 0x0

    return v0
    :try_lce
    .catch Ljava/lang/Throwable; {:try_lcs .. :try_lce} :lc_catch

    :lc_catch
    move-exception v0

    const/4 v0, 0x0

    return v0
.end method

.method showLyrics()V
    .locals 6

    # remember lyrics screen across recreate()
    const/4 v0, 0x1

    sput-boolean v0, Lcom/car/musiclite/MainActivity;->wasLyrics:Z

    # feed lyrics immediately on entry
    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity;->lyricsTick()V

    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->mainPane:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    # immersive lyrics page: hide top bar, transparent player bar
    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->topBar:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    # floating glass capsule bar over the lyrics overlay (motion shows through)
    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->npBar:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    iget-object v2, p0, Lcom/car/musiclite/MainActivity;->lyricsOverlay:Landroid/widget/FrameLayout;

    if-eq v1, v2, :capsule_bg

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    const/16 v1, 0x50

    invoke-direct {v3, v4, v5, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    const/16 v4, 0x14

    invoke-direct {p0, v4}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v4

    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    const/16 v5, 0x10

    invoke-direct {p0, v5}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v5

    iput v5, v3, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {v0, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :capsule_bg
    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->npBar:Landroid/widget/LinearLayout;

    invoke-static {}, Lcom/car/musiclite/MainActivity;->glassBar()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity;->updateTime()V

    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->lyricsOverlay:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    const-wide/16 v2, 0xfa

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    iget-object v1, p0, Lcom/car/musiclite/MainActivity;->breathAnim:Landroid/animation/ValueAnimator;

    if-eqz v1, :br_new

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    return-void

    :br_new
    const/4 v2, 0x2

    new-array v2, v2, [F

    const/4 v3, 0x0

    const/high16 v1, 0x3f700000    # 0.9375f

    aput v1, v2, v3

    const/4 v3, 0x1

    const/high16 v1, 0x3f800000    # 1.0f

    aput v1, v2, v3

    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    iput-object v1, p0, Lcom/car/musiclite/MainActivity;->breathAnim:Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0xaf0

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    new-instance v2, Lcom/car/musiclite/MainActivity$Breath;

    invoke-direct {v2, p0}, Lcom/car/musiclite/MainActivity$Breath;-><init>(Lcom/car/musiclite/MainActivity;)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method hideLyrics()V
    .locals 6

    # left lyrics screen
    const/4 v1, 0x0

    sput-boolean v1, Lcom/car/musiclite/MainActivity;->wasLyrics:Z

    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->lyricsOverlay:Landroid/widget/FrameLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->mainPane:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    # restore top bar + player bar color
    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->topBar:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    # return the floating capsule npBar into the content overlay (global float)
    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->npBar:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    iget-object v2, p0, Lcom/car/musiclite/MainActivity;->lyricsOverlay:Landroid/widget/FrameLayout;

    if-ne v1, v2, :bar_backed

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object v2, p0, Lcom/car/musiclite/MainActivity;->content:Landroid/widget/FrameLayout;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x2

    const/4 v1, -0x2

    const/16 v5, 0x50

    invoke-direct {v3, v4, v1, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    const/16 v4, 0x14

    invoke-direct {p0, v4}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v4

    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    const/16 v4, 0x10

    invoke-direct {p0, v4}, Lcom/car/musiclite/MainActivity;->dp(I)I

    move-result v4

    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {v0, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :bar_backed
    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->npBar:Landroid/widget/LinearLayout;

    invoke-static {}, Lcom/car/musiclite/MainActivity;->glassBarDock()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    # restore theme text colors
    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->npTitle:Landroid/widget/TextView;

    invoke-static {}, Lcom/car/musiclite/MainActivity;->textMain()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->npArtist:Landroid/widget/TextView;

    invoke-static {}, Lcom/car/musiclite/MainActivity;->textMain()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->npTime:Landroid/widget/TextView;

    invoke-static {}, Lcom/car/musiclite/MainActivity;->textMain()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->breathAnim:Landroid/animation/ValueAnimator;

    if-eqz v0, :h_end

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :h_end
    # capsule info visibility may change on the way out (paused shows only on lyrics)
    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity;->updateTime()V

    return-void
.end method

.method private startPolling()V
    .locals 1

    .line 584
    iget-boolean v0, p0, Lcom/car/musiclite/MainActivity;->polling:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 587
    iput-boolean v0, p0, Lcom/car/musiclite/MainActivity;->polling:Z

    .line 588
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->pollLoop()V

    return-void
.end method

.method private startQrLogin()V
    .locals 2

    const/4 v0, 0x0

    .line 562
    iput-boolean v0, p0, Lcom/car/musiclite/MainActivity;->polling:Z

    .line 563
    iput-boolean v0, p0, Lcom/car/musiclite/MainActivity;->qrExpired:Z

    .line 564
    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->loginStatus:Landroid/widget/TextView;

    const-string v1, "\u6b63\u5728\u751f\u6210\u4e8c\u7ef4\u7801\u2026"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 565
    invoke-static {p0}, Lcom/car/musiclite/Api;->get(Landroid/content/Context;)Lcom/car/musiclite/Api;

    move-result-object v0

    new-instance v1, Lcom/car/musiclite/MainActivity$14;

    invoke-direct {v1, p0}, Lcom/car/musiclite/MainActivity$14;-><init>(Lcom/car/musiclite/MainActivity;)V

    invoke-virtual {v0, v1}, Lcom/car/musiclite/Api;->qrKey(Lcom/car/musiclite/Api$Cb;)V

    return-void
.end method

.method private svc(Ljava/lang/String;)V
    .locals 4

    new-instance v0, Landroid/content/Intent;

    const/4 v2, 0x0

    const-class v1, Lcom/car/musiclite/PlayerService;

    invoke-direct {v0, p1, v2, p0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/car/musiclite/MainActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public updateModeBtn()V
    .locals 3

    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->modeBtn:Landroid/widget/ImageView;

    if-eqz v0, :um_ret

    sget-boolean v1, Lcom/car/musiclite/PlayerService;->shuffle:Z

    const-string v2, "shuffle"

    if-nez v1, :um_set

    const-string v2, "seq"

    :um_set
    invoke-static {p0, v2}, Lcom/car/musiclite/MainActivity;->iconDrawable(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :um_noic

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :um_noic
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    :um_ret
    return-void
.end method

.method private updatePlayBtn()V
    .locals 4

    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->playBtn:Landroid/widget/ImageView;

    iget-boolean v1, p0, Lcom/car/musiclite/MainActivity;->npPlaying:Z

    if-eqz v1, :upb_playing

    const-string v1, "pause"

    goto :upb_go

    :upb_playing
    const-string v1, "play"

    :upb_go
    invoke-static {p0, v1}, Lcom/car/musiclite/MainActivity;->iconDrawable(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :upb_end

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :upb_end
    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 2

    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->lyricsOverlay:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v0

    if-nez v0, :obp_def

    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity;->hideLyrics()V

    return-void

    :obp_def
    .line 783
    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->content:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->resultList:Landroid/widget/GridView;

    .line 784
    invoke-virtual {v0}, Landroid/widget/GridView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 785
    invoke-direct {p0, v1}, Lcom/car/musiclite/MainActivity;->showScreen(I)V

    return-void

    .line 786
    :cond_0
    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->loginView:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    .line 787
    iput-boolean v1, p0, Lcom/car/musiclite/MainActivity;->polling:Z

    .line 788
    invoke-direct {p0, v1}, Lcom/car/musiclite/MainActivity;->showScreen(I)V

    return-void

    :cond_1
    const/4 v0, 0x1

    .line 790
    invoke-virtual {p0, v0}, Lcom/car/musiclite/MainActivity;->moveTaskToBack(Z)Z

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 132
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    # global display scaling: make UI scale relative to the 1920x720 car-unit design,
    # so it fits any screen (phone included). Overrides density/scaledDensity before any layout.
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->initScale()V

    # runtime RECORD_AUDIO grant for Visualizer spectrum
    # guard: requestPermissions() is API 23+; car runs Android 4.3 (API 18)
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :perm_done

    :try_perm
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "android.permission.RECORD_AUDIO"

    aput-object v2, v0, v1

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V

    :try_perm_end
    goto :perm_done

    :perm_catch
    move-exception v0

    :perm_done
    nop
    .catchall {:try_perm .. :try_perm_end} :perm_catch

    # theme: read persisted mode; first-run default = time snapshot; legacy 0 -> snapshot
    const-string v0, "ui"

    const/4 p1, 0x0

    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "mode"

    invoke-static {}, Lcom/car/musiclite/MainActivity;->isNight()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :dflt_day

    const/4 v3, 0x2

    :dflt_day
    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    if-eqz p1, :fix_zero

    goto :mode_ok

    :fix_zero
    move p1, v3

    :mode_ok
    sput p1, Lcom/car/musiclite/MainActivity;->mode:I

    invoke-static {}, Lcom/car/musiclite/MainActivity;->applyMode()V

    .line 133
    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x80

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    .line 134
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->applyImmersive()V

    .line 136
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->buildUi()V

    sget v0, Lcom/car/musiclite/MainActivity;->curScreen:I

    invoke-direct {p0, v0}, Lcom/car/musiclite/MainActivity;->showScreen(I)V

    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->restoreList()V

    .line 137
    iget-object p1, p0, Lcom/car/musiclite/MainActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p0, p1}, Lcom/car/musiclite/MainActivity;->setContentView(Landroid/view/View;)V

    .line 139
    iget-object p1, p0, Lcom/car/musiclite/MainActivity;->stateReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "com.car.musiclite.STATE"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lcom/car/musiclite/MainActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    # AMap auto standard broadcast: live navigation guide frames (KEY_TYPE=10001)
    new-instance v0, Lcom/car/musiclite/MainActivity$NavRecv;

    invoke-direct {v0, p0}, Lcom/car/musiclite/MainActivity$NavRecv;-><init>(Lcom/car/musiclite/MainActivity;)V

    iput-object v0, p0, Lcom/car/musiclite/MainActivity;->navRecv:Lcom/car/musiclite/MainActivity$NavRecv;

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "AUTONAVI_STANDARD_BROADCAST_SEND"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/car/musiclite/MainActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 141
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->refreshHome()V

    # start 500ms UI tick: lyrics sync + auto theme, independent of broadcast cadence
    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->h:Landroid/os/Handler;

    new-instance v1, Lcom/car/musiclite/MainActivity$UiTick;

    invoke-direct {v1, p0}, Lcom/car/musiclite/MainActivity$UiTick;-><init>(Lcom/car/musiclite/MainActivity;)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    # restore lyrics screen after recreate() (dark mode switch etc.)
    sget-boolean v0, Lcom/car/musiclite/MainActivity;->wasLyrics:Z

    if-eqz v0, :cond_no_lyr

    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity;->showLyrics()V

    :cond_no_lyr
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .line 152
    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->stateReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/car/musiclite/MainActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->navRecv:Lcom/car/musiclite/MainActivity$NavRecv;

    if-eqz v0, :skip_navu

    invoke-virtual {p0, v0}, Lcom/car/musiclite/MainActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    :skip_navu
    .line 153
    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->h:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 154
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method protected onResume()V
    .locals 0

    .line 146
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 147
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->applyImmersive()V

    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    .line 775
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    if-eqz p1, :cond_0

    .line 777
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->applyImmersive()V

    :cond_0
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 4

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_super

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v1, 0x57

    if-eq v0, v1, :act_next

    const/16 v1, 0x59

    if-eq v0, v1, :act_next

    const/16 v1, 0x58

    if-eq v0, v1, :act_prev

    const/16 v1, 0x5a

    if-eq v0, v1, :act_prev

    const/16 v1, 0x55

    if-eq v0, v1, :act_toggle

    const/16 v1, 0x4f

    if-eq v0, v1, :act_toggle

    const/16 v1, 0x7e

    if-eq v0, v1, :act_toggle

    const/16 v1, 0x7f

    if-eq v0, v1, :act_toggle

    goto :goto_super

    :act_next
    const-string v2, "com.car.musiclite.NEXT"

    goto :goto_send

    :act_prev
    const-string v2, "com.car.musiclite.PREV"

    goto :goto_send

    :act_toggle
    const-string v2, "com.car.musiclite.TOGGLE"

    :goto_send
    new-instance v1, Landroid/content/Intent;

    const/4 v0, 0x0

    const-class v3, Lcom/car/musiclite/PlayerService;

    invoke-direct {v1, v2, v0, p0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/car/musiclite/MainActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    const/4 v0, 0x1

    return v0

    :goto_super
    :cond_super
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$9900(Lcom/car/musiclite/MainActivity;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/car/musiclite/MainActivity;->showScreen(I)V

    return-void
.end method

.method public onPosUpdate(I)V
    .locals 4

    iput p1, p0, Lcom/car/musiclite/MainActivity;->lastPos:I

    # keep static mirror alive for recreate()
    sput p1, Lcom/car/musiclite/MainActivity;->sPos:I

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/car/musiclite/MainActivity;->posAt:J

    sput-wide v0, Lcom/car/musiclite/MainActivity;->sPosAt:J

    return-void
.end method

.method public estPos()I
    .locals 6

    # NEW sync scheme: read the REAL position straight from the player
    # (no broadcast latency, no interpolation drift)
    sget-object v0, Lcom/car/musiclite/PlayerService;->sMp:Landroid/media/MediaPlayer;

    if-eqz v0, :interp

    sget-boolean v1, Lcom/car/musiclite/PlayerService;->sReady:Z

    if-eqz v1, :interp

    :try_pos
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    if-ltz v0, :interp

    return v0

    :try_end_pos
    :catch_pos
    move-exception v1

    # fallback: old clock interpolation
    :interp
    iget-boolean v0, p0, Lcom/car/musiclite/MainActivity;->npPlaying:Z

    if-eqz v0, :use_last

    iget-wide v1, p0, Lcom/car/musiclite/MainActivity;->posAt:J

    const-wide/16 v3, 0x0

    cmp-long v0, v1, v3

    if-lez v0, :use_last

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    sub-long v1, v3, v1

    long-to-int v0, v1

    iget v1, p0, Lcom/car/musiclite/MainActivity;->lastPos:I

    add-int/2addr v1, v0

    iget v2, p0, Lcom/car/musiclite/MainActivity;->lastDur:I

    if-lez v2, :ret

    if-le v1, v2, :ret

    move v1, v2

    :ret
    return v1

    :use_last
    iget v1, p0, Lcom/car/musiclite/MainActivity;->lastPos:I

    return v1

    .catch Ljava/lang/Throwable; {:try_pos .. :try_end_pos} :catch_pos
.end method

.method public lyricsTick()V
    .locals 7

    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->lyricsBox:Lcom/car/musiclite/LyricsBox;

    if-eqz v0, :cond_ret

    # prefer broadcast sid, fallback to playingId(), fallback to lastSid
    const-wide/16 v5, 0x0

    sget-wide v1, Lcom/car/musiclite/MainActivity;->curSid:J

    cmp-long v4, v1, v5

    if-lez v4, :try_play

    goto :goto_have

    :try_play
    invoke-direct {p0}, Lcom/car/musiclite/MainActivity;->playingId()J

    move-result-wide v1

    cmp-long v4, v1, v5

    if-lez v4, :try_last

    goto :goto_have

    :try_last
    sget-wide v1, Lcom/car/musiclite/MainActivity;->lastSid:J

    :goto_have
    cmp-long v4, v1, v5

    if-lez v4, :cond_ret

    sput-wide v1, Lcom/car/musiclite/MainActivity;->lastSid:J

    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity;->estPos()I

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/car/musiclite/LyricsBox;->feed(JI)V

    :cond_ret
    return-void
.end method


.method public updateTime()V
    .locals 5

    # show progress bar + song info whenever music is playing (all pages);
    # when paused keep it visible ONLY on the lyrics page
    iget-object v1, p0, Lcom/car/musiclite/MainActivity;->npInfoCol:Landroid/widget/LinearLayout;

    if-eqz v1, :cond_ut

    iget-boolean v2, p0, Lcom/car/musiclite/MainActivity;->npPlaying:Z

    const/16 v3, 0x8

    if-eqz v2, :ut_check_lyr

    const/4 v3, 0x0

    goto :ut_hide

    :ut_check_lyr
    # paused: keep the info column only while the lyrics overlay is showing
    iget-object v2, p0, Lcom/car/musiclite/MainActivity;->lyricsOverlay:Landroid/widget/FrameLayout;

    if-eqz v2, :ut_hide

    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v2

    if-nez v2, :ut_hide

    const/4 v3, 0x0

    :ut_hide
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :ut_vis_end
    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->npTime:Landroid/widget/TextView;

    if-eqz v0, :cond_ut

    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity;->estPos()I

    move-result v1

    invoke-static {v1}, Lcom/car/musiclite/MainActivity;->fmt(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, " / "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/car/musiclite/MainActivity;->lastDur:I

    invoke-static {v3}, Lcom/car/musiclite/MainActivity;->fmt(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_ut
    return-void
.end method

.method static synthetic access$9901(Lcom/car/musiclite/MainActivity;)V
    .locals 0

    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity;->lyricsTick()V

    return-void
.end method

.method public static bgWindow()I
    .locals 1

    sget-boolean v0, Lcom/car/musiclite/MainActivity;->dark:Z

    if-eqz v0, :cond_l

    const v0, -0xededee

    return v0

    :cond_l
    const v0, -0x50506

    return v0
.end method

.method public static bgPanel()I
    .locals 1

    sget-boolean v0, Lcom/car/musiclite/MainActivity;->dark:Z

    if-eqz v0, :cond_l

    const v0, -0xe0e0da

    return v0

    :cond_l
    const/4 v0, -0x1

    return v0
.end method

.method public static bgSearch()I
    .locals 1

    sget-boolean v0, Lcom/car/musiclite/MainActivity;->dark:Z

    if-eqz v0, :cond_l

    const v0, -0xd5d5ce

    return v0

    :cond_l
    const v0, -0xf0f0e

    return v0
.end method

.method public static textMain()I
    .locals 1

    sget-boolean v0, Lcom/car/musiclite/MainActivity;->dark:Z

    if-eqz v0, :cond_l

    const v0, -0x171718

    return v0

    :cond_l
    const v0, -0xcfcfd0

    return v0
.end method

.method public static textSub()I
    .locals 1

    sget-boolean v0, Lcom/car/musiclite/MainActivity;->dark:Z

    if-eqz v0, :cond_l

    const v0, -0x61615a

    return v0

    :cond_l
    const v0, -0x666667

    return v0
.end method

.method public static textHint()I
    .locals 1

    sget-boolean v0, Lcom/car/musiclite/MainActivity;->dark:Z

    if-eqz v0, :cond_l

    const v0, -0x919188

    return v0

    :cond_l
    const v0, -0x4f4f50

    return v0
.end method

.method public static bgPlaying()I
    .locals 1

    sget-boolean v0, Lcom/car/musiclite/MainActivity;->dark:Z

    if-eqz v0, :cond_l

    const v0, -0xc3d5d8

    return v0

    :cond_l
    const v0, -0x51c1f

    return v0
.end method

.method public static accent()I
    .locals 1

    sget-boolean v0, Lcom/car/musiclite/MainActivity;->dark:Z

    if-eqz v0, :cond_l

    const v0, -0x94a2

    return v0

    :cond_l
    const v0, -0x2cc5cf

    return v0
.end method

.method public static isNight()Z
    .locals 2

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v0

    # auto dark window: 18:00 - 07:00
    const/16 v1, 0x12

    if-lt v0, v1, :cond_chk

    const/4 v0, 0x1

    return v0

    :cond_chk
    const/4 v1, 0x7

    if-ge v0, v1, :cond_d0

    const/4 v0, 0x1

    return v0

    :cond_d0
    const/4 v0, 0x0

    return v0
.end method

.method public static glass()Landroid/graphics/drawable/GradientDrawable;
    .locals 6

    # frosted glass pill: vertical gradient sheen + soft stroke (matte blur look)
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    sget-boolean v1, Lcom/car/musiclite/MainActivity;->dark:Z

    if-eqz v1, :glass_l

    const v2, 0x40ffffff

    const v4, 0x14ffffff

    const v3, 0x55ffffff

    goto :glass_set

    :glass_l
    const v2, 0xe6ffffff

    const v4, 0xb3ffffff

    const v3, 0x1f000000

    :glass_set
    const/4 v1, 0x2

    new-array v1, v1, [I

    const/4 v5, 0x0

    aput v2, v1, v5

    const/4 v5, 0x1

    aput v4, v1, v5

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v3}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    const/high16 v1, 0x41a00000    # 20.0f

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    return-object v0
.end method

.method public static glassBar()Landroid/graphics/drawable/GradientDrawable;
    .locals 4

    # translucent floating capsule player bar (lyrics overlay motion shows through)
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    sget-boolean v1, Lcom/car/musiclite/MainActivity;->dark:Z

    if-eqz v1, :gbar_l

    const v2, 0x44101419

    const v3, 0x66ffffff

    goto :gbar_set

    :gbar_l
    const v2, 0x55ffffff

    const v3, 0x33000000

    :gbar_set
    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v3}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    const/high16 v1, 0x42c80000    # 100.0f radius -> clamps to full pill

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    return-object v0
.end method

.method public static glassBarDock()Landroid/graphics/drawable/GradientDrawable;
    .locals 4

    # docked (non-lyrics) capsule: much more opaque so page content stays readable
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    sget-boolean v1, Lcom/car/musiclite/MainActivity;->dark:Z

    if-eqz v1, :gbar_dock_l

    const v2, 0xcc101419

    const v3, 0x66ffffff

    goto :gbar_dock_set

    :gbar_dock_l
    const v2, 0xe6ffffff

    const v3, 0x33000000

    :gbar_dock_set
    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v3}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    const/high16 v1, 0x42c80000

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    return-object v0
.end method

.method public static bgBar()I
    .locals 1

    # bottom bar color distinct from main bg (req: easy to tell apart)
    sget-boolean v0, Lcom/car/musiclite/MainActivity;->dark:Z

    if-eqz v0, :bgbar_l

    const v0, -0xe3e3de

    return v0

    :bgbar_l
    const v0, -0x13130f

    return v0
.end method

.method public playAllGo()V
    .locals 3

    iget-object v0, p0, Lcom/car/musiclite/MainActivity;->listSongs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :pa_go

    const-string v0, "\u5217\u8868\u4e3a\u7a7a"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void

    :pa_go
    iget-object v1, p0, Lcom/car/musiclite/MainActivity;->listSongs:Ljava/util/List;

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/car/musiclite/MainActivity;->playQueue(Ljava/util/List;I)V

    return-void
.end method

.method public static iconDrawable(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 6

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    # variant offset: dark=0, white=1
    sget-boolean v1, Lcom/car/musiclite/MainActivity;->dark:Z

    const/4 v2, 0x0

    if-eqz v1, :ic_sfx

    const/4 v2, 0x1

    :ic_sfx
    # resolve base id by name
    const/4 v4, -0x1

    const-string v5, "auto"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :try_back

    const/4 v4, 0x0

    goto :have_id

    :try_back
    const-string v5, "back"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :try_day

    const/4 v4, 0x2

    goto :have_id

    :try_day
    const-string v5, "day"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :try_night

    const/4 v4, 0x4

    goto :have_id

    :try_night
    const-string v5, "night"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :try_pause

    const/4 v4, 0x6

    goto :have_id

    :try_pause
    const-string v5, "pause"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :try_play

    const/16 v4, 0x8

    goto :have_id

    :try_play
    const-string v5, "play"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :try_search

    const/16 v4, 0xa

    goto :have_id

    :try_search
    const-string v5, "search"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :try_shuffle

    const/16 v4, 0xc

    goto :have_id

    :try_shuffle
    const-string v5, "shuffle"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :try_heart

    const/16 v4, 0xe

    goto :have_id

    :try_heart
    const-string v5, "heart"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :try_seq

    const/16 v4, 0x10

    goto :have_id

    :try_seq
    const-string v5, "seq"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :ic_null

    const/16 v4, 0x12

    :have_id
    add-int/2addr v4, v2

    const v5, 0x7f040000

    add-int/2addr v4, v5

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0

    :ic_null
    const/4 v0, 0x0

    return-object v0
.end method

.method public static applyMode()V
    .locals 2

    sget v0, Lcom/car/musiclite/MainActivity;->mode:I

    if-eqz v0, :cond_auto

    const/4 v1, 0x1

    if-eq v0, v1, :cond_day

    const/4 v1, 0x1

    sput-boolean v1, Lcom/car/musiclite/MainActivity;->dark:Z

    return-void

    :cond_day
    const/4 v1, 0x0

    sput-boolean v1, Lcom/car/musiclite/MainActivity;->dark:Z

    return-void

    :cond_auto
    invoke-static {}, Lcom/car/musiclite/MainActivity;->isNight()Z

    move-result v0

    sput-boolean v0, Lcom/car/musiclite/MainActivity;->dark:Z

    return-void
.end method

.method public autoTick()V
    .locals 2

    sget v0, Lcom/car/musiclite/MainActivity;->mode:I

    if-eqz v0, :cond_go

    return-void

    :cond_go
    invoke-static {}, Lcom/car/musiclite/MainActivity;->isNight()Z

    move-result v0

    sget-boolean v1, Lcom/car/musiclite/MainActivity;->dark:Z

    if-eq v0, v1, :cond_same

    sput-boolean v0, Lcom/car/musiclite/MainActivity;->dark:Z

    invoke-virtual {p0}, Lcom/car/musiclite/MainActivity;->recreate()V

    :cond_same
    return-void
.end method

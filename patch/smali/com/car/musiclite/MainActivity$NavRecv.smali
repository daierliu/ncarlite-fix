.class public Lcom/car/musiclite/MainActivity$NavRecv;
.super Landroid/content/BroadcastReceiver;
.source "NavRecv.java"


# instance fields
.field private host:Lcom/car/musiclite/MainActivity;


# direct methods
.method public constructor <init>(Lcom/car/musiclite/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    iput-object p1, p0, Lcom/car/musiclite/MainActivity$NavRecv;->host:Lcom/car/musiclite/MainActivity;

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    if-eqz p2, :ret

    const-string v0, "KEY_TYPE"

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    const/16 v1, 0x2711    # 10001 guide frame

    if-eq v0, v1, :is_navi

    return-void

    :is_navi
    const-string v0, "TYPE"

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/car/musiclite/MainActivity;->navType:I

    const-string v0, "ICON"

    const/4 v1, -0x1

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/car/musiclite/MainActivity;->navIcon:I

    const-string v0, "CUR_SPEED"

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/car/musiclite/MainActivity;->navSpeed:I

    const-string v0, "LIMITED_SPEED"

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/car/musiclite/MainActivity;->navLimit:I

    const-string v0, "SEG_REMAIN_DIS"

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/car/musiclite/MainActivity;->navSegDis:I

    const-string v0, "CUR_ROAD_NAME"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/car/musiclite/MainActivity;->navCurRoad:Ljava/lang/String;

    const-string v0, "NEXT_ROAD_NAME"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/car/musiclite/MainActivity;->navNextRoad:Ljava/lang/String;

    const-string v0, "SEG_REMAIN_DIS_AUTO"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/car/musiclite/MainActivity;->navSegDisAuto:Ljava/lang/String;

    const-string v0, "ROUTE_REMAIN_DIS_AUTO"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/car/musiclite/MainActivity;->navRouteDisAuto:Ljava/lang/String;

    const-string v0, "ROUTE_REMAIN_TIME_AUTO"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/car/musiclite/MainActivity;->navRouteTimeAuto:Ljava/lang/String;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    sput-wide v0, Lcom/car/musiclite/MainActivity;->navAt:J

    :ret
    return-void
.end method

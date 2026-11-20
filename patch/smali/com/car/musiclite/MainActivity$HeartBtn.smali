.class public Lcom/car/musiclite/MainActivity$HeartBtn;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic this$0:Lcom/car/musiclite/MainActivity;


# direct methods
.method constructor <init>(Lcom/car/musiclite/MainActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/car/musiclite/MainActivity$HeartBtn;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 9

    iget-object v9, p0, Lcom/car/musiclite/MainActivity$HeartBtn;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {v9}, Lcom/car/musiclite/Api;->get(Landroid/content/Context;)Lcom/car/musiclite/Api;

    move-result-object v0

    if-eqz v0, :hb_end

    sget-wide v1, Lcom/car/musiclite/MainActivity;->curSid:J

    const-wide/16 v6, 0x0

    cmp-long v8, v1, v6

    if-eqz v8, :hb_end

    # pid: use restoreId when it is a real playlist
    sget-wide v3, Lcom/car/musiclite/MainActivity;->restoreId:J

    const-wide/16 v6, 0x1

    cmp-long v8, v3, v6

    if-gtz v8, :pid_ok

    const-wide/16 v3, 0x0

    :pid_ok
    new-instance v5, Lcom/car/musiclite/MainActivity$HeartCb;

    invoke-direct {v5, v9}, Lcom/car/musiclite/MainActivity$HeartCb;-><init>(Lcom/car/musiclite/MainActivity;)V

    invoke-virtual/range {v0 .. v5}, Lcom/car/musiclite/Api;->heartMode(JJLcom/car/musiclite/Api$Cb;)V

    :hb_end
    return-void
.end method

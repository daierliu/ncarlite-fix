.class public Lcom/car/musiclite/MainActivity$HeartCb;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lcom/car/musiclite/Api$Cb;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/car/musiclite/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "HeartCb"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/car/musiclite/Api$Cb<",
        "Ljava/util/List<",
        "Lcom/car/musiclite/Api$Song;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/car/musiclite/MainActivity;


# direct methods
.method constructor <init>(Lcom/car/musiclite/MainActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/car/musiclite/MainActivity$HeartCb;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDone(Ljava/lang/Object;Ljava/lang/Exception;)V
    .locals 4

    if-eqz p2, :hc_ok

    return-void

    :hc_ok
    if-eqz p1, :hc_empty

    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :hc_play

    :hc_empty
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$HeartCb;->this$0:Lcom/car/musiclite/MainActivity;

    const-string v1, "\u5fc3\u52a8\u6a21\u5f0f\u6682\u65e0\u63a8\u8350"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void

    :hc_play
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$HeartCb;->this$0:Lcom/car/musiclite/MainActivity;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lcom/car/musiclite/MainActivity;->access$4100(Lcom/car/musiclite/MainActivity;Ljava/util/List;I)V

    return-void
.end method

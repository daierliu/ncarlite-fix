.class Lcom/car/musiclite/MainActivity$14;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lcom/car/musiclite/Api$Cb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/car/musiclite/MainActivity;->startQrLogin()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/car/musiclite/Api$Cb<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/car/musiclite/MainActivity;


# direct methods
.method constructor <init>(Lcom/car/musiclite/MainActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 565
    iput-object p1, p0, Lcom/car/musiclite/MainActivity$14;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onDone(Ljava/lang/Object;Ljava/lang/Exception;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 565
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/car/musiclite/MainActivity$14;->onDone(Ljava/lang/String;Ljava/lang/Exception;)V

    return-void
.end method

.method public onDone(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 2

    .line 572
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$14;->this$0:Lcom/car/musiclite/MainActivity;

    if-eqz p2, :cond_0

    .line 569
    invoke-static {v0}, Lcom/car/musiclite/MainActivity;->access$2900(Lcom/car/musiclite/MainActivity;)Landroid/widget/TextView;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\u751f\u6210\u5931\u8d25: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\uff0c\u8bf7\u91cd\u8bd5"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 572
    :cond_0
    invoke-static {v0, p1}, Lcom/car/musiclite/MainActivity;->access$3002(Lcom/car/musiclite/MainActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 573
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "https://music.163.com/login?codekey="

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/16 p2, 0x1b8

    invoke-static {p1, p2}, Lcom/car/musiclite/Zx;->qrBitmap(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 575
    iget-object p2, p0, Lcom/car/musiclite/MainActivity$14;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {p2}, Lcom/car/musiclite/MainActivity;->access$3100(Lcom/car/musiclite/MainActivity;)Landroid/widget/ImageView;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 577
    :cond_1
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$14;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {p1}, Lcom/car/musiclite/MainActivity;->access$2900(Lcom/car/musiclite/MainActivity;)Landroid/widget/TextView;

    move-result-object p1

    const-string p2, "\u8bf7\u7528\u624b\u673a\u7f51\u6613\u4e91\u97f3\u4e50App\u626b\u7801"

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 578
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$14;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {p1}, Lcom/car/musiclite/MainActivity;->access$3200(Lcom/car/musiclite/MainActivity;)V

    return-void
.end method

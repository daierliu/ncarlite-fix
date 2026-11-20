.class Lcom/car/musiclite/MainActivity$1;
.super Landroid/content/BroadcastReceiver;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/car/musiclite/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
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

    .line 90
    iput-object p1, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6

    .line 93
    const-string p1, "err"

    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 98
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    .line 95
    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 98
    :cond_0
    const-string p1, "playing"

    invoke-virtual {p2, p1, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    invoke-static {v0, p1}, Lcom/car/musiclite/MainActivity;->access$002(Lcom/car/musiclite/MainActivity;Z)Z

    # mirror playing state for recreate()
    sput-boolean p1, Lcom/car/musiclite/MainActivity;->sPlaying:Z

    .line 99
    const-string p1, "title"

    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_6

    sput-object p1, Lcom/car/musiclite/MainActivity;->lastTitle:Ljava/lang/String;

    .line 101
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {v0}, Lcom/car/musiclite/MainActivity;->access$100(Lcom/car/musiclite/MainActivity;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    const-string p1, "artist"

    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 103
    const-string v0, "badge"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 104
    const-string v2, "trial"

    invoke-virtual {p2, v2, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    if-nez p1, :cond_1

    .line 105
    const-string p1, ""

    :cond_1
    # drop VIP/paid badge; prefix "-- " between title and artist
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "-- "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_2
    if-eqz v2, :cond_3

    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "  [\u8bd5\u542c]"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 112
    :cond_3
    sput-object p1, Lcom/car/musiclite/MainActivity;->lastArtistTxt:Ljava/lang/String;

    iget-object v0, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {v0}, Lcom/car/musiclite/MainActivity;->access$200(Lcom/car/musiclite/MainActivity;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    const-string v0, "idx"

    const/4 v2, -0x1

    invoke-virtual {p2, v0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    invoke-static {p1, v0}, Lcom/car/musiclite/MainActivity;->access$302(Lcom/car/musiclite/MainActivity;I)I

    .line 114
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    const-string v0, "size"

    invoke-virtual {p2, v0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    invoke-static {p1, v0}, Lcom/car/musiclite/MainActivity;->access$402(Lcom/car/musiclite/MainActivity;I)I

    .line 115
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    const-string v0, "dur"

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    invoke-static {p1, v0}, Lcom/car/musiclite/MainActivity;->access$502(Lcom/car/musiclite/MainActivity;I)I

    # mirror duration for recreate()
    sput v0, Lcom/car/musiclite/MainActivity;->sDur:I

    # persist playing song id from broadcast
    const-string v0, "sid"

    const-wide/16 v2, 0x0

    invoke-virtual {p2, v0, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    sput-wide v2, Lcom/car/musiclite/MainActivity;->curSid:J

    # auto-enter lyrics page once per new song while playing
    sget-wide v4, Lcom/car/musiclite/MainActivity;->autoSid:J

    cmp-long v0, v2, v4

    if-eqz v0, :cond_autolyr

    sput-wide v2, Lcom/car/musiclite/MainActivity;->autoSid:J

    iget-object v0, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    iget-boolean v0, v0, Lcom/car/musiclite/MainActivity;->npPlaying:Z

    if-eqz v0, :cond_autolyr

    iget-object v0, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-virtual {v0}, Lcom/car/musiclite/MainActivity;->showLyrics()V

    :cond_autolyr

    .line 116
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    const-string v0, "posMs"

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/car/musiclite/MainActivity;->onPosUpdate(I)V

    # always refresh time label + capsule visibility (also when paused/stopped)
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-virtual {p1}, Lcom/car/musiclite/MainActivity;->updateTime()V

    .line 117
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {p1}, Lcom/car/musiclite/MainActivity;->access$500(Lcom/car/musiclite/MainActivity;)I

    move-result p2

    if-lez p2, :cond_4

    const/4 v1, 0x1

    :cond_4
    invoke-static {p1, v1}, Lcom/car/musiclite/MainActivity;->access$702(Lcom/car/musiclite/MainActivity;Z)Z

    .line 118
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {p1}, Lcom/car/musiclite/MainActivity;->access$800(Lcom/car/musiclite/MainActivity;)Z

    move-result p1

    if-nez p1, :cond_5

    iget-object p1, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {p1}, Lcom/car/musiclite/MainActivity;->access$700(Lcom/car/musiclite/MainActivity;)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 119
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {p1}, Lcom/car/musiclite/MainActivity;->access$900(Lcom/car/musiclite/MainActivity;)Landroid/widget/SeekBar;

    move-result-object p1

    iget-object p2, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {p2}, Lcom/car/musiclite/MainActivity;->access$500(Lcom/car/musiclite/MainActivity;)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setMax(I)V

    .line 120
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {p1}, Lcom/car/musiclite/MainActivity;->access$900(Lcom/car/musiclite/MainActivity;)Landroid/widget/SeekBar;

    move-result-object p1

    iget-object p2, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {p2}, Lcom/car/musiclite/MainActivity;->access$600(Lcom/car/musiclite/MainActivity;)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setProgress(I)V

    # update time label
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-virtual {p1}, Lcom/car/musiclite/MainActivity;->updateTime()V

    .line 122
    :cond_5
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {p1}, Lcom/car/musiclite/MainActivity;->access$1000(Lcom/car/musiclite/MainActivity;)V

    .line 123
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {p1}, Lcom/car/musiclite/MainActivity;->access$1100(Lcom/car/musiclite/MainActivity;)Landroid/widget/GridView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/GridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    if-eqz p1, :cond_6

    .line 124
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {p1}, Lcom/car/musiclite/MainActivity;->access$1100(Lcom/car/musiclite/MainActivity;)Landroid/widget/GridView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/GridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    check-cast p1, Lcom/car/musiclite/MainActivity$SongAdapter;

    invoke-virtual {p1}, Lcom/car/musiclite/MainActivity$SongAdapter;->notifyDataSetChanged()V

    iget-object p1, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-static {p1}, Lcom/car/musiclite/MainActivity;->access$9901(Lcom/car/musiclite/MainActivity;)V

    iget-object p1, p0, Lcom/car/musiclite/MainActivity$1;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-virtual {p1}, Lcom/car/musiclite/MainActivity;->autoTick()V

    :cond_6
    return-void
.end method

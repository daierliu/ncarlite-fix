.class public Lcom/car/musiclite/MainActivity$ModeBtn;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final this$0:Lcom/car/musiclite/MainActivity;


# direct methods
.method public constructor <init>(Lcom/car/musiclite/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/car/musiclite/MainActivity$ModeBtn;->this$0:Lcom/car/musiclite/MainActivity;

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    sget-boolean v0, Lcom/car/musiclite/PlayerService;->shuffle:Z

    if-eqz v0, :cond_to_rand

    # currently shuffle on -> switch to sequence
    const/4 v0, 0x0

    sput-boolean v0, Lcom/car/musiclite/PlayerService;->shuffle:Z

    goto :goto_upd

    :cond_to_rand
    const/4 v0, 0x1

    sput-boolean v0, Lcom/car/musiclite/PlayerService;->shuffle:Z

    :goto_upd
    # refresh the mode icon (shuffle vs sequential)
    iget-object v1, p0, Lcom/car/musiclite/MainActivity$ModeBtn;->this$0:Lcom/car/musiclite/MainActivity;

    invoke-virtual {v1}, Lcom/car/musiclite/MainActivity;->updateModeBtn()V

    return-void
.end method

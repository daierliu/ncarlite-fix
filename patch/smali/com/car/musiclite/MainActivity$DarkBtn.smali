.class public Lcom/car/musiclite/MainActivity$DarkBtn;
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

    iput-object p1, p0, Lcom/car/musiclite/MainActivity$DarkBtn;->this$0:Lcom/car/musiclite/MainActivity;

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    # two-state toggle: night <-> day (auto mode removed)
    sget-boolean v0, Lcom/car/musiclite/MainActivity;->dark:Z

    if-eqz v0, :to_night

    # currently dark -> switch to day
    const/4 v0, 0x0

    sput-boolean v0, Lcom/car/musiclite/MainActivity;->dark:Z

    const/4 v1, 0x1

    sput v1, Lcom/car/musiclite/MainActivity;->mode:I

    goto :goto_upd

    :to_night
    # currently light -> switch to night
    const/4 v0, 0x1

    sput-boolean v0, Lcom/car/musiclite/MainActivity;->dark:Z

    const/4 v1, 0x2

    sput v1, Lcom/car/musiclite/MainActivity;->mode:I

    :goto_upd
    # persist chosen mode so recreate() keeps it
    iget-object v0, p0, Lcom/car/musiclite/MainActivity$DarkBtn;->this$0:Lcom/car/musiclite/MainActivity;

    const-string v1, "ui"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "mode"

    sget v2, Lcom/car/musiclite/MainActivity;->mode:I

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    iget-object v0, p0, Lcom/car/musiclite/MainActivity$DarkBtn;->this$0:Lcom/car/musiclite/MainActivity;

    # rebuild views in place: no Activity recreate, current page and data stay
    invoke-virtual {v0}, Lcom/car/musiclite/MainActivity;->rebuildUi()V

    return-void
.end method

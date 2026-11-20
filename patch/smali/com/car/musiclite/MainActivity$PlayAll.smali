.class public Lcom/car/musiclite/MainActivity$PlayAll;
.super Ljava/lang/Object;
.source "PlayAll.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private host:Lcom/car/musiclite/MainActivity;


# direct methods
.method public constructor <init>(Lcom/car/musiclite/MainActivity;)V
    .registers 2

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-object p1, p0, Lcom/car/musiclite/MainActivity$PlayAll;->host:Lcom/car/musiclite/MainActivity;

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 2

    .line 14
    :try_start_0
    iget-object p1, p0, Lcom/car/musiclite/MainActivity$PlayAll;->host:Lcom/car/musiclite/MainActivity;

    invoke-virtual {p1}, Lcom/car/musiclite/MainActivity;->playAllGo()V
    :try_end_5
    .catchall {:try_start_0 .. :try_end_5} :catchall_5

    :catchall_5
    return-void
.end method

.class public Lcom/car/musiclite/LyricsBox$Render;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "LyricsBox.java"


# instance fields
.field private final box:Lcom/car/musiclite/LyricsBox;


# direct methods
.method public constructor <init>(Lcom/car/musiclite/LyricsBox;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/car/musiclite/LyricsBox$Render;->box:Lcom/car/musiclite/LyricsBox;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/car/musiclite/LyricsBox$Render;->box:Lcom/car/musiclite/LyricsBox;

    invoke-virtual {v0}, Lcom/car/musiclite/LyricsBox;->render()V

    return-void
.end method

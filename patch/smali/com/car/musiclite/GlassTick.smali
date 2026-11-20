.class public Lcom/car/musiclite/GlassTick;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

# drives the capsule: spring animation integration + throttled
# backdrop snapshot updates. Owned by MainActivity (glassStep).

.field private final ow:Lcom/car/musiclite/MainActivity;

.method public constructor <init>(Lcom/car/musiclite/MainActivity;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/car/musiclite/GlassTick;->ow:Lcom/car/musiclite/MainActivity;

    return-void
.end method

.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/car/musiclite/GlassTick;->ow:Lcom/car/musiclite/MainActivity;

    invoke-virtual {v0}, Lcom/car/musiclite/MainActivity;->glassStep()V

    return-void
.end method

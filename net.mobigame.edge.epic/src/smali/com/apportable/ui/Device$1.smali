.class Lcom/apportable/ui/Device$1;
.super Landroid/view/OrientationEventListener;
.source "Device.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Device;-><init>(Landroid/content/Context;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private lastEvent:J

.field private mCurrentOrientation:I

.field final synthetic this$0:Lcom/apportable/ui/Device;


# direct methods
.method constructor <init>(Lcom/apportable/ui/Device;Landroid/content/Context;)V
    .locals 2
    .parameter
    .parameter "x0"

    .prologue
    .line 30
    iput-object p1, p0, Lcom/apportable/ui/Device$1;->this$0:Lcom/apportable/ui/Device;

    invoke-direct {p0, p2}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;)V

    .line 32
    const/4 v0, -0x2

    iput v0, p0, Lcom/apportable/ui/Device$1;->mCurrentOrientation:I

    .line 33
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/apportable/ui/Device$1;->lastEvent:J

    return-void
.end method


# virtual methods
.method public onOrientationChanged(I)V
    .locals 6
    .parameter "orientation"

    .prologue
    .line 37
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 38
    .local v0, now:J
    iget v2, p0, Lcom/apportable/ui/Device$1;->mCurrentOrientation:I

    if-eq p1, v2, :cond_0

    iget-object v2, p0, Lcom/apportable/ui/Device$1;->this$0:Lcom/apportable/ui/Device;

    #getter for: Lcom/apportable/ui/Device;->mObject:I
    invoke-static {v2}, Lcom/apportable/ui/Device;->access$000(Lcom/apportable/ui/Device;)I

    move-result v2

    if-eqz v2, :cond_0

    iget-wide v2, p0, Lcom/apportable/ui/Device$1;->lastEvent:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x190

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    .line 40
    iput-wide v0, p0, Lcom/apportable/ui/Device$1;->lastEvent:J

    .line 41
    iput p1, p0, Lcom/apportable/ui/Device$1;->mCurrentOrientation:I

    .line 42
    new-instance v2, Lcom/apportable/ui/Device$1$1;

    invoke-direct {v2, p0, p1}, Lcom/apportable/ui/Device$1$1;-><init>(Lcom/apportable/ui/Device$1;I)V

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/apportable/utils/ThreadUtils;->runOnThread(Ljava/lang/Runnable;I)V

    .line 49
    :cond_0
    return-void
.end method

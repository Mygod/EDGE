.class public Lcom/apportable/activity/AccelerometerActivity;
.super Landroid/app/Activity;
.source "AccelerometerActivity.java"


# instance fields
.field private accelerometer:Lcom/apportable/Accelerometer;

.field private accelerometerEnabled:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 7
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 9
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/apportable/activity/AccelerometerActivity;->accelerometerEnabled:Z

    return-void
.end method

.method public static terminateProcess()V
    .locals 1

    .prologue
    .line 28
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    .line 29
    return-void
.end method


# virtual methods
.method public disableAccelerometer()V
    .locals 1

    .prologue
    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/apportable/activity/AccelerometerActivity;->accelerometerEnabled:Z

    .line 24
    iget-object v0, p0, Lcom/apportable/activity/AccelerometerActivity;->accelerometer:Lcom/apportable/Accelerometer;

    invoke-virtual {v0}, Lcom/apportable/Accelerometer;->disable()V

    .line 25
    return-void
.end method

.method public enableAccelerometer()V
    .locals 1

    .prologue
    .line 18
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/apportable/activity/AccelerometerActivity;->accelerometerEnabled:Z

    .line 19
    iget-object v0, p0, Lcom/apportable/activity/AccelerometerActivity;->accelerometer:Lcom/apportable/Accelerometer;

    invoke-virtual {v0}, Lcom/apportable/Accelerometer;->enable()V

    .line 20
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 13
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 14
    new-instance v0, Lcom/apportable/Accelerometer;

    invoke-direct {v0, p0}, Lcom/apportable/Accelerometer;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/apportable/activity/AccelerometerActivity;->accelerometer:Lcom/apportable/Accelerometer;

    .line 15
    return-void
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 41
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 42
    iget-boolean v0, p0, Lcom/apportable/activity/AccelerometerActivity;->accelerometerEnabled:Z

    if-eqz v0, :cond_0

    .line 43
    iget-object v0, p0, Lcom/apportable/activity/AccelerometerActivity;->accelerometer:Lcom/apportable/Accelerometer;

    invoke-virtual {v0}, Lcom/apportable/Accelerometer;->disable()V

    .line 45
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 33
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 34
    iget-boolean v0, p0, Lcom/apportable/activity/AccelerometerActivity;->accelerometerEnabled:Z

    if-eqz v0, :cond_0

    .line 35
    iget-object v0, p0, Lcom/apportable/activity/AccelerometerActivity;->accelerometer:Lcom/apportable/Accelerometer;

    invoke-virtual {v0}, Lcom/apportable/Accelerometer;->enable()V

    .line 37
    :cond_0
    return-void
.end method

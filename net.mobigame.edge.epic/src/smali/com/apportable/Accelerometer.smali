.class public Lcom/apportable/Accelerometer;
.super Ljava/lang/Object;
.source "Accelerometer.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# static fields
.field private static final DELAY:J = 0xfL

.field private static final TAG:Ljava/lang/String; = "Accelerometer"


# instance fields
.field private lastEvent:J

.field private mAccelerometer:Landroid/hardware/Sensor;

.field private mContext:Landroid/content/Context;

.field private mSensorManager:Landroid/hardware/SensorManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/apportable/Accelerometer;->lastEvent:J

    .line 26
    iput-object p1, p0, Lcom/apportable/Accelerometer;->mContext:Landroid/content/Context;

    .line 29
    iget-object v0, p0, Lcom/apportable/Accelerometer;->mContext:Landroid/content/Context;

    const-string v1, "sensor"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lcom/apportable/Accelerometer;->mSensorManager:Landroid/hardware/SensorManager;

    .line 30
    iget-object v0, p0, Lcom/apportable/Accelerometer;->mSensorManager:Landroid/hardware/SensorManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lcom/apportable/Accelerometer;->mAccelerometer:Landroid/hardware/Sensor;

    .line 31
    return-void
.end method

.method private static native onSensorChanged(FFFJ)V
.end method


# virtual methods
.method public disable()V
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/apportable/Accelerometer;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 39
    return-void
.end method

.method public enable()V
    .locals 3

    .prologue
    .line 34
    iget-object v0, p0, Lcom/apportable/Accelerometer;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/apportable/Accelerometer;->mAccelerometer:Landroid/hardware/Sensor;

    const/4 v2, 0x1

    invoke-virtual {v0, p0, v1, v2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 35
    return-void
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .parameter "sensor"
    .parameter "accuracy"

    .prologue
    .line 71
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 13
    .parameter "event"

    .prologue
    const/4 v12, 0x2

    const/4 v11, 0x1

    .line 43
    iget-object v7, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v7}, Landroid/hardware/Sensor;->getType()I

    move-result v7

    if-eq v7, v11, :cond_1

    .line 68
    :cond_0
    :goto_0
    return-void

    .line 47
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 49
    .local v0, now:J
    iget-wide v7, p0, Lcom/apportable/Accelerometer;->lastEvent:J

    sub-long v7, v0, v7

    const-wide/16 v9, 0xf

    cmp-long v7, v7, v9

    if-lez v7, :cond_0

    .line 51
    iput-wide v0, p0, Lcom/apportable/Accelerometer;->lastEvent:J

    .line 52
    iget-object v7, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v8, 0x0

    aget v4, v7, v8

    .line 53
    .local v4, x:F
    iget-object v7, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v5, v7, v11

    .line 54
    .local v5, y:F
    iget-object v7, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v6, v7, v12

    .line 60
    .local v6, z:F
    iget-object v7, p0, Lcom/apportable/Accelerometer;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v7

    iget v2, v7, Landroid/content/res/Configuration;->orientation:I

    .line 61
    .local v2, orientation:I
    if-ne v2, v12, :cond_2

    .line 62
    move v3, v4

    .line 63
    .local v3, tmp:F
    neg-float v4, v5

    .line 64
    move v5, v3

    .line 66
    .end local v3           #tmp:F
    :cond_2
    iget-wide v7, p1, Landroid/hardware/SensorEvent;->timestamp:J

    invoke-static {v4, v5, v6, v7, v8}, Lcom/apportable/Accelerometer;->onSensorChanged(FFFJ)V

    goto :goto_0
.end method

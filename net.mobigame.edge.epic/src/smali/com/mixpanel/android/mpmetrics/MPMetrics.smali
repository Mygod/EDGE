.class public Lcom/mixpanel/android/mpmetrics/MPMetrics;
.super Ljava/lang/Object;
.source "MPMetrics.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;,
        Lcom/mixpanel/android/mpmetrics/MPMetrics$PeopleQueueTask;,
        Lcom/mixpanel/android/mpmetrics/MPMetrics$RegistrationReceiver;,
        Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;,
        Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;
    }
.end annotation


# static fields
.field private static FLUSH_EVENTS:I = 0x0

.field private static FLUSH_PEOPLE:I = 0x0

.field private static final LOGTAG:Ljava/lang/String; = "MPMetrics"

.field public static final VERSION:Ljava/lang/String; = "2.0"

.field private static mInstanceMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mixpanel/android/mpmetrics/MPMetrics;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile sEventsSubmitLock:Z

.field private static sExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

.field private static volatile sPeopleSubmitLock:Z


# instance fields
.field private distinct_id:Ljava/lang/String;

.field private mCarrier:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mDbAdapter:Lcom/mixpanel/android/mpmetrics/MPDbAdapter;

.field private mDeviceId:Ljava/lang/String;

.field private mModel:Ljava/lang/String;

.field private mRReceiver:Lcom/mixpanel/android/mpmetrics/MPMetrics$RegistrationReceiver;

.field private mSuperProperties:Lorg/json/JSONObject;

.field private mTimerHandler:Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;

.field private mToken:Ljava/lang/String;

.field private mVersion:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 44
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mInstanceMap:Ljava/util/HashMap;

    .line 48
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    sget v3, Lcom/mixpanel/android/mpmetrics/MPConfig;->SUBMIT_THREAD_TTL:I

    int-to-long v3, v3

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v6}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    new-instance v7, Lcom/mixpanel/android/mpmetrics/LowPriorityThreadFactory;

    invoke-direct {v7}, Lcom/mixpanel/android/mpmetrics/LowPriorityThreadFactory;-><init>()V

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 47
    sput-object v0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->sExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 66
    sput-boolean v1, Lcom/mixpanel/android/mpmetrics/MPMetrics;->sEventsSubmitLock:Z

    .line 67
    sput-boolean v1, Lcom/mixpanel/android/mpmetrics/MPMetrics;->sPeopleSubmitLock:Z

    .line 69
    sput v1, Lcom/mixpanel/android/mpmetrics/MPMetrics;->FLUSH_EVENTS:I

    .line 70
    sput v2, Lcom/mixpanel/android/mpmetrics/MPMetrics;->FLUSH_PEOPLE:I

    .line 38
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 5
    .parameter "context"
    .parameter "token"

    .prologue
    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    iput-object p1, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mContext:Landroid/content/Context;

    .line 98
    iput-object p2, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mToken:Ljava/lang/String;

    .line 100
    invoke-direct {p0}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->getCarrier()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mCarrier:Ljava/lang/String;

    .line 101
    invoke-direct {p0}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->getModel()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mModel:Ljava/lang/String;

    .line 102
    invoke-direct {p0}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->getVersion()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mVersion:Ljava/lang/String;

    .line 103
    invoke-direct {p0}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mDeviceId:Ljava/lang/String;

    .line 105
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mSuperProperties:Lorg/json/JSONObject;

    .line 107
    new-instance v0, Lcom/mixpanel/android/mpmetrics/MPDbAdapter;

    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mToken:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/mixpanel/android/mpmetrics/MPDbAdapter;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mDbAdapter:Lcom/mixpanel/android/mpmetrics/MPDbAdapter;

    .line 108
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mDbAdapter:Lcom/mixpanel/android/mpmetrics/MPDbAdapter;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    sget v3, Lcom/mixpanel/android/mpmetrics/MPConfig;->DATA_EXPIRATION:I

    int-to-long v3, v3

    sub-long/2addr v1, v3

    const-string v3, "events"

    invoke-virtual {v0, v1, v2, v3}, Lcom/mixpanel/android/mpmetrics/MPDbAdapter;->cleanupEvents(JLjava/lang/String;)V

    .line 109
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mDbAdapter:Lcom/mixpanel/android/mpmetrics/MPDbAdapter;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    sget v3, Lcom/mixpanel/android/mpmetrics/MPConfig;->DATA_EXPIRATION:I

    int-to-long v3, v3

    sub-long/2addr v1, v3

    const-string v3, "people"

    invoke-virtual {v0, v1, v2, v3}, Lcom/mixpanel/android/mpmetrics/MPDbAdapter;->cleanupEvents(JLjava/lang/String;)V

    .line 111
    sget-object v0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->sExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    sget v1, Lcom/mixpanel/android/mpmetrics/MPConfig;->SUBMIT_THREAD_TTL:I

    int-to-long v1, v1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/concurrent/ThreadPoolExecutor;->setKeepAliveTime(JLjava/util/concurrent/TimeUnit;)V

    .line 112
    new-instance v0, Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;-><init>(Lcom/mixpanel/android/mpmetrics/MPMetrics;Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;)V

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mTimerHandler:Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;

    .line 113
    return-void
.end method

.method static synthetic access$0()I
    .locals 1

    .prologue
    .line 69
    sget v0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->FLUSH_EVENTS:I

    return v0
.end method

.method static synthetic access$1()I
    .locals 1

    .prologue
    .line 70
    sget v0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->FLUSH_PEOPLE:I

    return v0
.end method

.method static synthetic access$10(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 56
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mVersion:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$11(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Lorg/json/JSONObject;
    .locals 1
    .parameter

    .prologue
    .line 60
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mSuperProperties:Lorg/json/JSONObject;

    return-object v0
.end method

.method static synthetic access$12(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 58
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->distinct_id:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2(Z)V
    .locals 0
    .parameter

    .prologue
    .line 67
    sput-boolean p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->sPeopleSubmitLock:Z

    return-void
.end method

.method static synthetic access$3(Z)V
    .locals 0
    .parameter

    .prologue
    .line 66
    sput-boolean p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->sEventsSubmitLock:Z

    return-void
.end method

.method static synthetic access$4(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Lcom/mixpanel/android/mpmetrics/MPDbAdapter;
    .locals 1
    .parameter

    .prologue
    .line 61
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mDbAdapter:Lcom/mixpanel/android/mpmetrics/MPDbAdapter;

    return-object v0
.end method

.method static synthetic access$5(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;
    .locals 1
    .parameter

    .prologue
    .line 94
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mTimerHandler:Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;

    return-object v0
.end method

.method static synthetic access$6(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mToken:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$7(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 57
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mDeviceId:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$8(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 54
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mCarrier:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$9(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 55
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mModel:Ljava/lang/String;

    return-object v0
.end method

.method private bindRegistrationReceiver()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 266
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mRReceiver:Lcom/mixpanel/android/mpmetrics/MPMetrics$RegistrationReceiver;

    if-nez v1, :cond_0

    .line 267
    new-instance v1, Lcom/mixpanel/android/mpmetrics/MPMetrics$RegistrationReceiver;

    invoke-direct {v1, p0, v4}, Lcom/mixpanel/android/mpmetrics/MPMetrics$RegistrationReceiver;-><init>(Lcom/mixpanel/android/mpmetrics/MPMetrics;Lcom/mixpanel/android/mpmetrics/MPMetrics$RegistrationReceiver;)V

    iput-object v1, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mRReceiver:Lcom/mixpanel/android/mpmetrics/MPMetrics$RegistrationReceiver;

    .line 269
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 270
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v1, "com.google.android.c2dm.intent.REGISTRATION"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 271
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addCategory(Ljava/lang/String;)V

    .line 272
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mContext:Landroid/content/Context;

    new-instance v2, Lcom/mixpanel/android/mpmetrics/MPMetrics$RegistrationReceiver;

    invoke-direct {v2, p0, v4}, Lcom/mixpanel/android/mpmetrics/MPMetrics$RegistrationReceiver;-><init>(Lcom/mixpanel/android/mpmetrics/MPMetrics;Lcom/mixpanel/android/mpmetrics/MPMetrics$RegistrationReceiver;)V

    const-string v3, "com.google.android.c2dm.permission.SEND"

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 274
    .end local v0           #filter:Landroid/content/IntentFilter;
    :cond_0
    return-void
.end method

.method private getCarrier()Ljava/lang/String;
    .locals 1

    .prologue
    .line 281
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    return-object v0
.end method

.method private getDeviceId()Ljava/lang/String;
    .locals 4

    .prologue
    .line 305
    sget-object v1, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    .line 306
    .local v1, product:Ljava/lang/String;
    iget-object v2, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "android_id"

    invoke-static {v2, v3}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 307
    .local v0, androidId:Ljava/lang/String;
    if-eqz v1, :cond_0

    if-nez v0, :cond_1

    .line 308
    :cond_0
    const/4 v2, 0x0

    .line 310
    :goto_0
    return-object v2

    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public static getInstance(Landroid/content/Context;Ljava/lang/String;)Lcom/mixpanel/android/mpmetrics/MPMetrics;
    .locals 2
    .parameter "context"
    .parameter "token"

    .prologue
    .line 506
    sget-object v1, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mInstanceMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mixpanel/android/mpmetrics/MPMetrics;

    .line 507
    .local v0, instance:Lcom/mixpanel/android/mpmetrics/MPMetrics;
    if-nez v0, :cond_0

    .line 508
    new-instance v0, Lcom/mixpanel/android/mpmetrics/MPMetrics;

    .end local v0           #instance:Lcom/mixpanel/android/mpmetrics/MPMetrics;
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/mixpanel/android/mpmetrics/MPMetrics;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 509
    .restart local v0       #instance:Lcom/mixpanel/android/mpmetrics/MPMetrics;
    sget-object v1, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mInstanceMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 512
    :cond_0
    return-object v0
.end method

.method private getModel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 289
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    return-object v0
.end method

.method private getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 297
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public clearSuperProperties()V
    .locals 2

    .prologue
    .line 138
    sget-boolean v0, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "MPMetrics"

    const-string v1, "clearSuperProperties"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mSuperProperties:Lorg/json/JSONObject;

    .line 140
    return-void
.end method

.method public delete()V
    .locals 4

    .prologue
    .line 206
    sget-boolean v0, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "MPMetrics"

    const-string v1, "delete"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    :cond_0
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->distinct_id:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 212
    :goto_0
    return-void

    .line 211
    :cond_1
    sget-object v0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->sExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v1, Lcom/mixpanel/android/mpmetrics/MPMetrics$PeopleQueueTask;

    const-string v2, "$delete"

    const/4 v3, 0x0

    invoke-direct {v1, p0, v2, v3}, Lcom/mixpanel/android/mpmetrics/MPMetrics$PeopleQueueTask;-><init>(Lcom/mixpanel/android/mpmetrics/MPMetrics;Ljava/lang/String;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    goto :goto_0
.end method

.method public disablePush()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 253
    sget-boolean v1, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "MPMetrics"

    const-string v2, "disablePush"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x8

    if-ge v1, v2, :cond_1

    .line 263
    :goto_0
    return-void

    .line 258
    :cond_1
    invoke-direct {p0}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->bindRegistrationReceiver()V

    .line 260
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.google.android.c2dm.intent.UNREGISTER"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 261
    .local v0, unregIntent:Landroid/content/Intent;
    const-string v1, "app"

    iget-object v2, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mContext:Landroid/content/Context;

    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    invoke-static {v2, v4, v3, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 262
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_0
.end method

.method public enablePush(Ljava/lang/String;)V
    .locals 5
    .parameter "accountEmail"

    .prologue
    const/4 v4, 0x0

    .line 239
    sget-boolean v1, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "MPMetrics"

    const-string v2, "enablePush"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x8

    if-ge v1, v2, :cond_1

    .line 250
    :goto_0
    return-void

    .line 244
    :cond_1
    invoke-direct {p0}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->bindRegistrationReceiver()V

    .line 246
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.google.android.c2dm.intent.REGISTER"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 247
    .local v0, registrationIntent:Landroid/content/Intent;
    const-string v1, "app"

    iget-object v2, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mContext:Landroid/content/Context;

    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    invoke-static {v2, v4, v3, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 248
    const-string v1, "sender"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 249
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_0
.end method

.method public flushAll()V
    .locals 2

    .prologue
    .line 215
    sget-boolean v0, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "MPMetrics"

    const-string v1, "flushAll"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    :cond_0
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->flushEvents()V

    .line 217
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->flushPeople()V

    .line 218
    return-void
.end method

.method public flushEvents()V
    .locals 3

    .prologue
    .line 220
    sget-boolean v0, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "MPMetrics"

    const-string v1, "flushEvents"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    :cond_0
    sget-boolean v0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->sEventsSubmitLock:Z

    if-nez v0, :cond_1

    .line 222
    const/4 v0, 0x1

    sput-boolean v0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->sEventsSubmitLock:Z

    .line 223
    sget-object v0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->sExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v1, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;

    sget v2, Lcom/mixpanel/android/mpmetrics/MPMetrics;->FLUSH_EVENTS:I

    invoke-direct {v1, p0, v2}, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;-><init>(Lcom/mixpanel/android/mpmetrics/MPMetrics;I)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 225
    :cond_1
    return-void
.end method

.method public flushPeople()V
    .locals 3

    .prologue
    .line 227
    sget-boolean v0, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "MPMetrics"

    const-string v1, "flushPeople"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    :cond_0
    sget-boolean v0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->sPeopleSubmitLock:Z

    if-nez v0, :cond_1

    .line 229
    const/4 v0, 0x1

    sput-boolean v0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->sPeopleSubmitLock:Z

    .line 230
    sget-object v0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->sExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v1, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;

    sget v2, Lcom/mixpanel/android/mpmetrics/MPMetrics;->FLUSH_PEOPLE:I

    invoke-direct {v1, p0, v2}, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;-><init>(Lcom/mixpanel/android/mpmetrics/MPMetrics;I)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 232
    :cond_1
    return-void
.end method

.method public identify(Ljava/lang/String;)V
    .locals 0
    .parameter "distinct_id"

    .prologue
    .line 147
    iput-object p1, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->distinct_id:Ljava/lang/String;

    .line 148
    return-void
.end method

.method public increment(Ljava/lang/String;J)V
    .locals 2
    .parameter "property"
    .parameter "value"

    .prologue
    .line 197
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 198
    .local v0, map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    invoke-virtual {p0, v0}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->increment(Ljava/util/Map;)V

    .line 200
    return-void
.end method

.method public increment(Ljava/util/Map;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 188
    .local p1, properties:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 189
    .local v0, json:Lorg/json/JSONObject;
    sget-boolean v1, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "MPMetrics"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "increment "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    :cond_0
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->distinct_id:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 195
    :goto_0
    return-void

    .line 194
    :cond_1
    sget-object v1, Lcom/mixpanel/android/mpmetrics/MPMetrics;->sExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v2, Lcom/mixpanel/android/mpmetrics/MPMetrics$PeopleQueueTask;

    const-string v3, "$add"

    invoke-direct {v2, p0, v3, v0}, Lcom/mixpanel/android/mpmetrics/MPMetrics$PeopleQueueTask;-><init>(Lcom/mixpanel/android/mpmetrics/MPMetrics;Ljava/lang/String;Lorg/json/JSONObject;)V

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    goto :goto_0
.end method

.method public registerSuperProperties(Lorg/json/JSONObject;)V
    .locals 5
    .parameter "superProperties"

    .prologue
    .line 122
    sget-boolean v3, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v3, :cond_0

    const-string v3, "MPMetrics"

    const-string v4, "registerSuperProperties"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    :cond_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .local v1, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 132
    return-void

    .line 125
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 127
    .local v2, key:Ljava/lang/String;
    :try_start_0
    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->mSuperProperties:Lorg/json/JSONObject;

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 128
    :catch_0
    move-exception v0

    .line 129
    .local v0, e:Lorg/json/JSONException;
    const-string v3, "MPMetrics"

    const-string v4, "Exception registering super property."

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3
    .parameter "property"
    .parameter "value"

    .prologue
    .line 177
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v1, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->set(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 181
    :goto_0
    return-void

    .line 178
    :catch_0
    move-exception v0

    .line 179
    .local v0, e:Lorg/json/JSONException;
    const-string v1, "MPMetrics"

    const-string v2, "set"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public set(Lorg/json/JSONObject;)V
    .locals 3
    .parameter "properties"

    .prologue
    .line 168
    sget-boolean v0, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "MPMetrics"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "set "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    :cond_0
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->distinct_id:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 174
    :goto_0
    return-void

    .line 173
    :cond_1
    sget-object v0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->sExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v1, Lcom/mixpanel/android/mpmetrics/MPMetrics$PeopleQueueTask;

    const-string v2, "$set"

    invoke-direct {v1, p0, v2, p1}, Lcom/mixpanel/android/mpmetrics/MPMetrics$PeopleQueueTask;-><init>(Lcom/mixpanel/android/mpmetrics/MPMetrics;Ljava/lang/String;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    goto :goto_0
.end method

.method public track(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 3
    .parameter "eventName"
    .parameter "properties"

    .prologue
    .line 158
    sget-boolean v0, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "MPMetrics"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "track "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    :cond_0
    sget-object v0, Lcom/mixpanel/android/mpmetrics/MPMetrics;->sExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v1, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;

    invoke-direct {v1, p0, p1, p2}, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;-><init>(Lcom/mixpanel/android/mpmetrics/MPMetrics;Ljava/lang/String;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 161
    return-void
.end method

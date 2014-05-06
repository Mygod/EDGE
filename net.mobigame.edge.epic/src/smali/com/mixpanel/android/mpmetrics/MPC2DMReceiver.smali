.class public Lcom/mixpanel/android/mpmetrics/MPC2DMReceiver;
.super Landroid/content/BroadcastReceiver;
.source "MPC2DMReceiver.java"


# static fields
.field private static LOGTAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 15
    const-string v0, "MPC2DMReceiver"

    sput-object v0, Lcom/mixpanel/android/mpmetrics/MPC2DMReceiver;->LOGTAG:Ljava/lang/String;

    .line 14
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 13
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 19
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 20
    .local v0, action:Ljava/lang/String;
    sget-boolean v10, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v10, :cond_0

    sget-object v10, Lcom/mixpanel/android/mpmetrics/MPC2DMReceiver;->LOGTAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "Intent received: "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    :cond_0
    const-string v10, "com.google.android.c2dm.intent.RECEIVE"

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 23
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v10

    const-string v11, "message"

    invoke-virtual {v10, v11}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 25
    .local v5, message:Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 26
    .local v4, manager:Landroid/content/pm/PackageManager;
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    .line 27
    .local v2, appIntent:Landroid/content/Intent;
    const-string v9, ""

    .line 28
    .local v9, notificationTitle:Ljava/lang/CharSequence;
    const v8, 0x1080093

    .line 30
    .local v8, notificationIcon:I
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v4, v10, v11}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    .line 31
    .local v1, appInfo:Landroid/content/pm/ApplicationInfo;
    invoke-virtual {v4, v1}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v9

    .line 32
    iget v8, v1, Landroid/content/pm/ApplicationInfo;->icon:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .end local v1           #appInfo:Landroid/content/pm/ApplicationInfo;
    :goto_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v10

    .line 37
    const/4 v11, 0x0

    .line 39
    const/high16 v12, 0x800

    .line 35
    invoke-static {v10, v11, v2, v12}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    .line 42
    .local v3, contentIntent:Landroid/app/PendingIntent;
    const-string v10, "notification"

    invoke-virtual {p1, v10}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/app/NotificationManager;

    .line 43
    .local v7, nm:Landroid/app/NotificationManager;
    new-instance v6, Landroid/app/Notification;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-direct {v6, v8, v5, v10, v11}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 44
    .local v6, n:Landroid/app/Notification;
    iget v10, v6, Landroid/app/Notification;->flags:I

    or-int/lit8 v10, v10, 0x10

    iput v10, v6, Landroid/app/Notification;->flags:I

    .line 45
    invoke-virtual {v6, p1, v9, v5, v3}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 46
    const/4 v10, 0x0

    invoke-virtual {v7, v10, v6}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 48
    .end local v2           #appIntent:Landroid/content/Intent;
    .end local v3           #contentIntent:Landroid/app/PendingIntent;
    .end local v4           #manager:Landroid/content/pm/PackageManager;
    .end local v5           #message:Ljava/lang/String;
    .end local v6           #n:Landroid/app/Notification;
    .end local v7           #nm:Landroid/app/NotificationManager;
    .end local v8           #notificationIcon:I
    .end local v9           #notificationTitle:Ljava/lang/CharSequence;
    :cond_1
    return-void

    .line 33
    .restart local v2       #appIntent:Landroid/content/Intent;
    .restart local v4       #manager:Landroid/content/pm/PackageManager;
    .restart local v5       #message:Ljava/lang/String;
    .restart local v8       #notificationIcon:I
    .restart local v9       #notificationTitle:Ljava/lang/CharSequence;
    :catch_0
    move-exception v10

    goto :goto_0
.end method

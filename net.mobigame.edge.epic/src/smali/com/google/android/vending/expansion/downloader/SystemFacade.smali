.class Lcom/google/android/vending/expansion/downloader/SystemFacade;
.super Ljava/lang/Object;
.source "SystemFacade.java"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mNotificationManager:Landroid/app/NotificationManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/SystemFacade;->mContext:Landroid/content/Context;

    .line 37
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/SystemFacade;->mContext:Landroid/content/Context;

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Lcom/google/android/vending/expansion/downloader/SystemFacade;->mNotificationManager:Landroid/app/NotificationManager;

    .line 39
    return-void
.end method


# virtual methods
.method public cancelAllNotifications()V
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/SystemFacade;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v0}, Landroid/app/NotificationManager;->cancelAll()V

    .line 117
    return-void
.end method

.method public cancelNotification(J)V
    .locals 2
    .parameter "id"

    .prologue
    .line 112
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/SystemFacade;->mNotificationManager:Landroid/app/NotificationManager;

    long-to-int v1, p1

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 113
    return-void
.end method

.method public currentTimeMillis()J
    .locals 2

    .prologue
    .line 42
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method public getActiveNetworkType()Ljava/lang/Integer;
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 46
    iget-object v3, p0, Lcom/google/android/vending/expansion/downloader/SystemFacade;->mContext:Landroid/content/Context;

    const-string v4, "connectivity"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 48
    .local v1, connectivity:Landroid/net/ConnectivityManager;
    if-nez v1, :cond_1

    .line 49
    const-string v3, "LVLDL"

    const-string v4, "couldn\'t get connectivity manager"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    :cond_0
    :goto_0
    return-object v2

    .line 53
    :cond_1
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 54
    .local v0, activeInfo:Landroid/net/NetworkInfo;
    if-eqz v0, :cond_0

    .line 60
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_0
.end method

.method public getMaxBytesOverMobile()Ljava/lang/Long;
    .locals 2

    .prologue
    .line 87
    const-wide/32 v0, 0x7fffffff

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public getRecommendedMaxBytesOverMobile()Ljava/lang/Long;
    .locals 2

    .prologue
    .line 91
    const-wide/32 v0, 0x200000

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public isNetworkRoaming()Z
    .locals 9

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 64
    iget-object v7, p0, Lcom/google/android/vending/expansion/downloader/SystemFacade;->mContext:Landroid/content/Context;

    const-string v8, "connectivity"

    invoke-virtual {v7, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 66
    .local v0, connectivity:Landroid/net/ConnectivityManager;
    if-nez v0, :cond_0

    .line 67
    const-string v5, "LVLDL"

    const-string v7, "couldn\'t get connectivity manager"

    invoke-static {v5, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    :goto_0
    return v6

    .line 71
    :cond_0
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 72
    .local v1, info:Landroid/net/NetworkInfo;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getType()I

    move-result v7

    if-nez v7, :cond_1

    move v2, v5

    .line 73
    .local v2, isMobile:Z
    :goto_1
    iget-object v7, p0, Lcom/google/android/vending/expansion/downloader/SystemFacade;->mContext:Landroid/content/Context;

    const-string v8, "phone"

    invoke-virtual {v7, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/telephony/TelephonyManager;

    .line 75
    .local v4, tm:Landroid/telephony/TelephonyManager;
    if-nez v4, :cond_2

    .line 76
    const-string v5, "LVLDL"

    const-string v7, "couldn\'t get telephony manager"

    invoke-static {v5, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .end local v2           #isMobile:Z
    .end local v4           #tm:Landroid/telephony/TelephonyManager;
    :cond_1
    move v2, v6

    .line 72
    goto :goto_1

    .line 79
    .restart local v2       #isMobile:Z
    .restart local v4       #tm:Landroid/telephony/TelephonyManager;
    :cond_2
    if-eqz v2, :cond_3

    invoke-virtual {v4}, Landroid/telephony/TelephonyManager;->isNetworkRoaming()Z

    move-result v7

    if-eqz v7, :cond_3

    move v3, v5

    .local v3, isRoaming:Z
    :goto_2
    move v6, v3

    .line 83
    goto :goto_0

    .end local v3           #isRoaming:Z
    :cond_3
    move v3, v6

    .line 79
    goto :goto_2
.end method

.method public postNotification(JLandroid/app/Notification;)V
    .locals 2
    .parameter "id"
    .parameter "notification"

    .prologue
    .line 108
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/SystemFacade;->mNotificationManager:Landroid/app/NotificationManager;

    long-to-int v1, p1

    invoke-virtual {v0, v1, p3}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 109
    return-void
.end method

.method public sendBroadcast(Landroid/content/Intent;)V
    .locals 1
    .parameter "intent"

    .prologue
    .line 95
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/SystemFacade;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 96
    return-void
.end method

.method public startThread(Ljava/lang/Thread;)V
    .locals 0
    .parameter "thread"

    .prologue
    .line 120
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 121
    return-void
.end method

.method public userOwnsPackage(ILjava/lang/String;)Z
    .locals 2
    .parameter "uid"
    .parameter "packageName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 99
    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/SystemFacade;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v1, p2, v0}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->uid:I

    if-ne v1, p1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

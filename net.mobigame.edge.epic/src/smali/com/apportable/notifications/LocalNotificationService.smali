.class public Lcom/apportable/notifications/LocalNotificationService;
.super Landroid/app/IntentService;
.source "LocalNotificationService.java"


# static fields
.field private static TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-string v0, "LocalNotificationService"

    sput-object v0, Lcom/apportable/notifications/LocalNotificationService;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 26
    const-string v0, "Local Notification Service"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 27
    return-void
.end method


# virtual methods
.method public onHandleIntent(Landroid/content/Intent;)V
    .locals 21
    .parameter "intent"

    .prologue
    .line 38
    invoke-static {}, Lcom/apportable/notifications/Notifications;->getScheduledLocalNotifications()Ljava/util/List;

    move-result-object v12

    .line 40
    .local v12, notifications:Ljava/util/List;,"Ljava/util/List<Lcom/apportable/ui/LocalNotification;>;"
    const-class v16, Lcom/apportable/notifications/Notifications;

    monitor-enter v16

    .line 41
    :try_start_0
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .local v14, removeNotifications:Ljava/util/List;,"Ljava/util/List<Lcom/apportable/ui/LocalNotification;>;"
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    const-wide/16 v19, 0x3e8

    div-long v6, v17, v19

    .line 46
    .local v6, currentTimeSeconds:J
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/apportable/ui/LocalNotification;

    .line 47
    .local v11, notif:Lcom/apportable/ui/LocalNotification;
    invoke-virtual {v11}, Lcom/apportable/ui/LocalNotification;->getTimeZone()J

    move-result-wide v17

    const-wide/16 v19, 0x0

    cmp-long v15, v17, v19

    if-nez v15, :cond_1

    .line 49
    long-to-double v0, v6

    move-wide/from16 v17, v0

    invoke-virtual {v11}, Lcom/apportable/ui/LocalNotification;->getFireDate()D

    move-result-wide v19

    cmpl-double v15, v17, v19

    if-ltz v15, :cond_0

    .line 51
    invoke-static {}, Ljava/text/DateFormat;->getInstance()Ljava/text/DateFormat;

    move-result-object v8

    .line 52
    .local v8, df:Ljava/text/DateFormat;
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v15

    invoke-virtual {v8, v15}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 53
    const/4 v15, 0x0

    invoke-static {v11, v15}, Lcom/apportable/notifications/Notifications;->postLocalNotification(Lcom/apportable/ui/LocalNotification;Z)V

    .line 54
    invoke-interface {v14, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 87
    .end local v6           #currentTimeSeconds:J
    .end local v8           #df:Ljava/text/DateFormat;
    .end local v9           #i$:Ljava/util/Iterator;
    .end local v11           #notif:Lcom/apportable/ui/LocalNotification;
    .end local v14           #removeNotifications:Ljava/util/List;,"Ljava/util/List<Lcom/apportable/ui/LocalNotification;>;"
    :catchall_0
    move-exception v15

    monitor-exit v16
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v15

    .line 60
    .restart local v6       #currentTimeSeconds:J
    .restart local v9       #i$:Ljava/util/Iterator;
    .restart local v11       #notif:Lcom/apportable/ui/LocalNotification;
    .restart local v14       #removeNotifications:Ljava/util/List;,"Ljava/util/List<Lcom/apportable/ui/LocalNotification;>;"
    :cond_1
    :try_start_1
    new-instance v15, Ljava/lang/RuntimeException;

    const-string v17, "Not done yet!"

    move-object/from16 v0, v17

    invoke-direct {v15, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 68
    .end local v11           #notif:Lcom/apportable/ui/LocalNotification;
    :cond_2
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_3

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/apportable/ui/LocalNotification;

    .line 69
    .restart local v11       #notif:Lcom/apportable/ui/LocalNotification;
    invoke-interface {v12, v11}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_1

    .line 72
    .end local v11           #notif:Lcom/apportable/ui/LocalNotification;
    :cond_3
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v15

    if-lez v15, :cond_4

    .line 74
    invoke-static {v12}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 75
    const/4 v15, 0x0

    invoke-interface {v12, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/apportable/ui/LocalNotification;

    .line 77
    .local v10, nextNotification:Lcom/apportable/ui/LocalNotification;
    const-string v15, "alarm"

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/apportable/notifications/LocalNotificationService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/AlarmManager;

    .line 78
    .local v3, alarmMgr:Landroid/app/AlarmManager;
    const/4 v15, 0x0

    new-instance v17, Landroid/content/Intent;

    const-class v18, Lcom/apportable/notifications/NotificationsAlarmReceiver;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-static {v0, v15, v1, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v13

    .line 80
    .local v13, pendingIntent:Landroid/app/PendingIntent;
    invoke-virtual {v10}, Lcom/apportable/ui/LocalNotification;->getFireDate()D

    move-result-wide v17

    move-wide/from16 v0, v17

    double-to-long v0, v0

    move-wide/from16 v17, v0

    invoke-virtual {v10}, Lcom/apportable/ui/LocalNotification;->getTimeZone()J

    move-result-wide v19

    sub-long v17, v17, v19

    const-wide/16 v19, 0x3e8

    mul-long v4, v17, v19

    .line 81
    .local v4, alarmTimeUtc:J
    invoke-static {}, Ljava/text/DateFormat;->getInstance()Ljava/text/DateFormat;

    move-result-object v8

    .line 82
    .restart local v8       #df:Ljava/text/DateFormat;
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v15

    invoke-virtual {v8, v15}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 84
    const/4 v15, 0x0

    invoke-virtual {v3, v15, v4, v5, v13}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 86
    .end local v3           #alarmMgr:Landroid/app/AlarmManager;
    .end local v4           #alarmTimeUtc:J
    .end local v8           #df:Ljava/text/DateFormat;
    .end local v10           #nextNotification:Lcom/apportable/ui/LocalNotification;
    .end local v13           #pendingIntent:Landroid/app/PendingIntent;
    :cond_4
    invoke-static {}, Lcom/apportable/notifications/Notifications;->persistNotifications()V

    .line 87
    monitor-exit v16
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 88
    return-void
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 0
    .parameter "intent"
    .parameter "startId"

    .prologue
    .line 31
    invoke-super {p0, p1, p2}, Landroid/app/IntentService;->onStart(Landroid/content/Intent;I)V

    .line 32
    return-void
.end method

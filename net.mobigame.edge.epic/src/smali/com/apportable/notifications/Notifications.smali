.class public Lcom/apportable/notifications/Notifications;
.super Ljava/lang/Object;
.source "Notifications.java"


# static fields
.field private static TAG:Ljava/lang/String;

.field private static localNotifications:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/apportable/ui/LocalNotification;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const-string v0, "Notifications"

    sput-object v0, Lcom/apportable/notifications/Notifications;->TAG:Ljava/lang/String;

    .line 26
    const/4 v0, 0x0

    sput-object v0, Lcom/apportable/notifications/Notifications;->localNotifications:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static cancelAllLocalNotifications()V
    .locals 3

    .prologue
    .line 76
    const-class v2, Lcom/apportable/notifications/Notifications;

    monitor-enter v2

    .line 77
    :try_start_0
    invoke-static {}, Lcom/apportable/notifications/Notifications;->getScheduledLocalNotifications()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 78
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    invoke-static {}, Lcom/apportable/notifications/Notifications;->persistNotifications()V

    .line 80
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v0

    .line 81
    .local v0, context:Landroid/content/Context;
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/apportable/notifications/LocalNotificationService;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 82
    return-void

    .line 78
    .end local v0           #context:Landroid/content/Context;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public static getScheduledLocalNotifications()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/apportable/ui/LocalNotification;",
            ">;"
        }
    .end annotation

    .prologue
    .line 29
    sget-object v4, Lcom/apportable/notifications/Notifications;->localNotifications:Ljava/util/List;

    if-nez v4, :cond_0

    .line 30
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v0

    .line 32
    .local v0, context:Landroid/content/Context;
    :try_start_0
    const-string v4, "Notifications"

    invoke-virtual {v0, v4}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v2

    .line 33
    .local v2, in:Ljava/io/FileInputStream;
    new-instance v3, Ljava/io/ObjectInputStream;

    invoke-direct {v3, v2}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 34
    .local v3, oin:Ljava/io/ObjectInputStream;
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/ArrayList;

    sput-object v4, Lcom/apportable/notifications/Notifications;->localNotifications:Ljava/util/List;

    .line 35
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->close()V

    .line 36
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 43
    .end local v2           #in:Ljava/io/FileInputStream;
    .end local v3           #oin:Ljava/io/ObjectInputStream;
    :goto_0
    sget-object v4, Lcom/apportable/notifications/Notifications;->localNotifications:Ljava/util/List;

    if-nez v4, :cond_0

    .line 44
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    sput-object v4, Lcom/apportable/notifications/Notifications;->localNotifications:Ljava/util/List;

    .line 47
    :cond_0
    sget-object v4, Lcom/apportable/notifications/Notifications;->localNotifications:Ljava/util/List;

    return-object v4

    .line 37
    :catch_0
    move-exception v1

    .line 38
    .local v1, e:Ljava/io/FileNotFoundException;
    sget-object v4, Lcom/apportable/notifications/Notifications;->TAG:Ljava/lang/String;

    const-string v5, "No notifications list exists yet."

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 39
    .end local v1           #e:Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v1

    .line 40
    .local v1, e:Ljava/lang/Exception;
    sget-object v4, Lcom/apportable/notifications/Notifications;->TAG:Ljava/lang/String;

    const-string v5, "Exception loading notification list.  Will start new list."

    invoke-static {v4, v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method protected static persistNotifications()V
    .locals 7

    .prologue
    .line 51
    const-class v4, Lcom/apportable/notifications/Notifications;

    monitor-enter v4

    .line 52
    :try_start_0
    invoke-static {}, Lcom/apportable/notifications/Notifications;->getScheduledLocalNotifications()Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    :try_start_1
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v3

    const-string v5, "Notifications"

    const/4 v6, 0x0

    invoke-virtual {v3, v5, v6}, Lcom/apportable/app/VerdeApplication;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v2

    .line 55
    .local v2, out:Ljava/io/FileOutputStream;
    new-instance v1, Ljava/io/ObjectOutputStream;

    invoke-direct {v1, v2}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 56
    .local v1, oout:Ljava/io/ObjectOutputStream;
    sget-object v3, Lcom/apportable/notifications/Notifications;->localNotifications:Ljava/util/List;

    invoke-virtual {v1, v3}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 57
    invoke-virtual {v1}, Ljava/io/ObjectOutputStream;->close()V

    .line 58
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 62
    .end local v1           #oout:Ljava/io/ObjectOutputStream;
    :goto_0
    :try_start_2
    monitor-exit v4

    .line 63
    return-void

    .line 59
    :catch_0
    move-exception v0

    .line 60
    .local v0, e:Ljava/lang/Exception;
    sget-object v3, Lcom/apportable/notifications/Notifications;->TAG:Ljava/lang/String;

    const-string v5, "Exception saving notification list.  Notifications may not be saved!"

    invoke-static {v3, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 62
    .end local v0           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3
.end method

.method public static postLocalNotification(Lcom/apportable/ui/LocalNotification;Z)V
    .locals 2
    .parameter "notification"
    .parameter "isRemote"

    .prologue
    .line 85
    invoke-virtual {p0}, Lcom/apportable/ui/LocalNotification;->getAlertBody()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/apportable/ui/LocalNotification;->getSoundName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/apportable/notifications/Notifications;->postNotification(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 86
    return-void
.end method

.method public static postNotification(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 20
    .parameter "context"
    .parameter "alert"
    .parameter "sound"
    .parameter "isRemote"

    .prologue
    .line 105
    :try_start_0
    const-string v12, "notification"

    .line 106
    .local v12, ns:Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/app/NotificationManager;

    .line 108
    .local v11, notificationManager:Landroid/app/NotificationManager;
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 109
    .local v3, appR:Landroid/content/res/Resources;
    const-string v17, "notification_icon"

    const-string v18, "drawable"

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-virtual {v3, v0, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v8

    .line 110
    .local v8, icon:I
    if-nez v8, :cond_0

    .line 111
    sget-object v17, Lcom/apportable/notifications/Notifications;->TAG:Ljava/lang/String;

    const-string v18, "Notification Icon not found!  Will use app icon for notification icon."

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    const-string v17, "icon"

    const-string v18, "drawable"

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-virtual {v3, v0, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v8

    .line 115
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v15

    .line 116
    .local v15, when:J
    const-string v17, "app_name"

    const-string v18, "string"

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-virtual {v3, v0, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    invoke-virtual {v3, v0}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v13

    .line 117
    .local v13, tickerText:Ljava/lang/CharSequence;
    move-object v6, v13

    .line 118
    .local v6, contentTitle:Ljava/lang/CharSequence;
    move-object/from16 v5, p1

    .line 120
    .local v5, contentText:Ljava/lang/CharSequence;
    const-string v17, "com.apportable.activity.VerdeActivity"

    invoke-static/range {v17 .. v17}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v14

    .line 122
    .local v14, verdeClass:Ljava/lang/Class;
    new-instance v10, Landroid/content/Intent;

    move-object/from16 v0, p0

    invoke-direct {v10, v0, v14}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 123
    .local v10, notificationIntent:Landroid/content/Intent;
    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-static {v0, v1, v10, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    .line 125
    .local v4, contentIntent:Landroid/app/PendingIntent;
    new-instance v9, Landroid/app/Notification;

    move-wide v0, v15

    invoke-direct {v9, v8, v13, v0, v1}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 127
    .local v9, notification:Landroid/app/Notification;
    move-object/from16 v0, p0

    invoke-virtual {v9, v0, v6, v5, v4}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 128
    iget v0, v9, Landroid/app/Notification;->defaults:I

    move/from16 v17, v0

    or-int/lit8 v17, v17, 0x1

    move/from16 v0, v17

    iput v0, v9, Landroid/app/Notification;->defaults:I

    .line 129
    iget v0, v9, Landroid/app/Notification;->flags:I

    move/from16 v17, v0

    or-int/lit8 v17, v17, 0x10

    move/from16 v0, v17

    iput v0, v9, Landroid/app/Notification;->flags:I

    .line 131
    const/16 v17, 0x1

    move/from16 v0, v17

    invoke-virtual {v11, v0, v9}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 143
    .end local v3           #appR:Landroid/content/res/Resources;
    .end local v4           #contentIntent:Landroid/app/PendingIntent;
    .end local v5           #contentText:Ljava/lang/CharSequence;
    .end local v6           #contentTitle:Ljava/lang/CharSequence;
    .end local v8           #icon:I
    .end local v9           #notification:Landroid/app/Notification;
    .end local v10           #notificationIntent:Landroid/content/Intent;
    .end local v11           #notificationManager:Landroid/app/NotificationManager;
    .end local v12           #ns:Ljava/lang/String;
    .end local v13           #tickerText:Ljava/lang/CharSequence;
    .end local v14           #verdeClass:Ljava/lang/Class;
    .end local v15           #when:J
    :goto_0
    return-void

    .line 132
    :catch_0
    move-exception v7

    .line 133
    .local v7, ex:Ljava/lang/Exception;
    sget-object v17, Lcom/apportable/notifications/Notifications;->TAG:Ljava/lang/String;

    const-string v18, "Exception posting notification:"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static postNotification(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 1
    .parameter "context"
    .parameter "alert"
    .parameter "isRemote"

    .prologue
    .line 97
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-static {p0, p1, v0, p2}, Lcom/apportable/notifications/Notifications;->postNotification(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 98
    return-void
.end method

.method public static postNotification(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1
    .parameter "alert"
    .parameter "sound"
    .parameter "isRemote"

    .prologue
    .line 93
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v0

    invoke-static {v0, p0, p1, p2}, Lcom/apportable/notifications/Notifications;->postNotification(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 94
    return-void
.end method

.method public static postNotification(Ljava/lang/String;Z)V
    .locals 1
    .parameter "alert"
    .parameter "isRemote"

    .prologue
    .line 89
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v0

    invoke-static {v0, p0, p1}, Lcom/apportable/notifications/Notifications;->postNotification(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 90
    return-void
.end method

.method public static scheduleLocalNotification(Lcom/apportable/ui/LocalNotification;)V
    .locals 3
    .parameter "notification"

    .prologue
    .line 67
    const-class v2, Lcom/apportable/notifications/Notifications;

    monitor-enter v2

    .line 68
    :try_start_0
    invoke-static {}, Lcom/apportable/notifications/Notifications;->getScheduledLocalNotifications()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v0

    .line 72
    .local v0, context:Landroid/content/Context;
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/apportable/notifications/LocalNotificationService;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 73
    return-void

    .line 69
    .end local v0           #context:Landroid/content/Context;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

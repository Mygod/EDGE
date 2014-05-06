.class public Lcom/google/android/vending/expansion/downloader/impl/CustomNotificationFactory;
.super Ljava/lang/Object;
.source "CustomNotificationFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createCustomNotification()Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification$ICustomNotification;
    .locals 6

    .prologue
    .line 25
    :try_start_0
    const-string v2, "android.app.Notification$Builder"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 26
    .local v1, notificationBuilderClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const-string v2, "setProgress"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    const/4 v4, 0x2

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 27
    new-instance v2, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;

    invoke-direct {v2}, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    :goto_0
    return-object v2

    .line 28
    :catch_0
    move-exception v0

    .line 29
    .local v0, e:Ljava/lang/Exception;
    new-instance v2, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;

    invoke-direct {v2}, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;-><init>()V

    goto :goto_0
.end method

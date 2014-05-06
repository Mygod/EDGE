.class public Lcom/google/android/vending/expansion/downloader/DownloaderClientMarshaller;
.super Ljava/lang/Object;
.source "DownloaderClientMarshaller.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/vending/expansion/downloader/DownloaderClientMarshaller$Stub;,
        Lcom/google/android/vending/expansion/downloader/DownloaderClientMarshaller$Proxy;
    }
.end annotation


# static fields
.field public static final DOWNLOAD_REQUIRED:I = 0x2

.field public static final LVL_CHECK_REQUIRED:I = 0x1

.field public static final MSG_ONDOWNLOADPROGRESS:I = 0xb

.field public static final MSG_ONDOWNLOADSTATE_CHANGED:I = 0xa

.field public static final MSG_ONSERVICECONNECTED:I = 0xc

.field public static final NO_DOWNLOAD_REQUIRED:I = 0x0

.field public static final PARAM_MESSENGER:Ljava/lang/String; = "EMH"

.field public static final PARAM_NEW_STATE:Ljava/lang/String; = "newState"

.field public static final PARAM_PROGRESS:Ljava/lang/String; = "progress"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 111
    return-void
.end method

.method public static CreateProxy(Landroid/os/Messenger;)Lcom/google/android/vending/expansion/downloader/IDownloaderClient;
    .locals 1
    .parameter "msg"

    .prologue
    .line 208
    new-instance v0, Lcom/google/android/vending/expansion/downloader/DownloaderClientMarshaller$Proxy;

    invoke-direct {v0, p0}, Lcom/google/android/vending/expansion/downloader/DownloaderClientMarshaller$Proxy;-><init>(Landroid/os/Messenger;)V

    return-object v0
.end method

.method public static CreateStub(Lcom/google/android/vending/expansion/downloader/IDownloaderClient;Ljava/lang/Class;)Lcom/google/android/vending/expansion/downloader/IStub;
    .locals 1
    .parameter "itf"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/vending/expansion/downloader/IDownloaderClient;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/google/android/vending/expansion/downloader/IStub;"
        }
    .end annotation

    .prologue
    .line 224
    .local p1, downloaderService:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    new-instance v0, Lcom/google/android/vending/expansion/downloader/DownloaderClientMarshaller$Stub;

    invoke-direct {v0, p0, p1}, Lcom/google/android/vending/expansion/downloader/DownloaderClientMarshaller$Stub;-><init>(Lcom/google/android/vending/expansion/downloader/IDownloaderClient;Ljava/lang/Class;)V

    return-object v0
.end method

.method public static startDownloadServiceIfRequired(Landroid/content/Context;Landroid/app/PendingIntent;Ljava/lang/Class;)I
    .locals 1
    .parameter "context"
    .parameter "notificationClient"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/app/PendingIntent;",
            "Ljava/lang/Class",
            "<*>;)I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .prologue
    .line 253
    .local p2, serviceClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-static {p0, p1, p2}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->startDownloadServiceIfRequired(Landroid/content/Context;Landroid/app/PendingIntent;Ljava/lang/Class;)I

    move-result v0

    return v0
.end method

.method public static startDownloadServiceIfRequired(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/Class;)I
    .locals 1
    .parameter "context"
    .parameter "notificationClient"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/content/Intent;",
            "Ljava/lang/Class",
            "<*>;)I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .prologue
    .line 272
    .local p2, serviceClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-static {p0, p1, p2}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->startDownloadServiceIfRequired(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/Class;)I

    move-result v0

    return v0
.end method

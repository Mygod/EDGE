.class Lcom/google/android/vending/expansion/downloader/DownloaderClientMarshaller$Proxy;
.super Ljava/lang/Object;
.source "DownloaderClientMarshaller.java"

# interfaces
.implements Lcom/google/android/vending/expansion/downloader/IDownloaderClient;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/vending/expansion/downloader/DownloaderClientMarshaller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Proxy"
.end annotation


# instance fields
.field private mServiceMessenger:Landroid/os/Messenger;


# direct methods
.method public constructor <init>(Landroid/os/Messenger;)V
    .locals 0
    .parameter "msg"

    .prologue
    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/DownloaderClientMarshaller$Proxy;->mServiceMessenger:Landroid/os/Messenger;

    .line 101
    return-void
.end method

.method private send(ILandroid/os/Bundle;)V
    .locals 3
    .parameter "method"
    .parameter "params"

    .prologue
    .line 90
    const/4 v2, 0x0

    invoke-static {v2, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    .line 91
    .local v1, m:Landroid/os/Message;
    invoke-virtual {v1, p2}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 93
    :try_start_0
    iget-object v2, p0, Lcom/google/android/vending/expansion/downloader/DownloaderClientMarshaller$Proxy;->mServiceMessenger:Landroid/os/Messenger;

    invoke-virtual {v2, v1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    :goto_0
    return-void

    .line 94
    :catch_0
    move-exception v0

    .line 95
    .local v0, e:Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public onDownloadProgress(Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;)V
    .locals 2
    .parameter "progress"

    .prologue
    .line 84
    new-instance v0, Landroid/os/Bundle;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/os/Bundle;-><init>(I)V

    .line 85
    .local v0, params:Landroid/os/Bundle;
    const-string v1, "progress"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 86
    const/16 v1, 0xb

    invoke-direct {p0, v1, v0}, Lcom/google/android/vending/expansion/downloader/DownloaderClientMarshaller$Proxy;->send(ILandroid/os/Bundle;)V

    .line 87
    return-void
.end method

.method public onDownloadStateChanged(I)V
    .locals 2
    .parameter "newState"

    .prologue
    .line 77
    new-instance v0, Landroid/os/Bundle;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/os/Bundle;-><init>(I)V

    .line 78
    .local v0, params:Landroid/os/Bundle;
    const-string v1, "newState"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 79
    const/16 v1, 0xa

    invoke-direct {p0, v1, v0}, Lcom/google/android/vending/expansion/downloader/DownloaderClientMarshaller$Proxy;->send(ILandroid/os/Bundle;)V

    .line 80
    return-void
.end method

.method public onServiceConnected(Landroid/os/Messenger;)V
    .locals 0
    .parameter "m"

    .prologue
    .line 108
    return-void
.end method

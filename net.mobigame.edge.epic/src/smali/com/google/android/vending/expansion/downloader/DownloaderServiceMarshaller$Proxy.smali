.class Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller$Proxy;
.super Ljava/lang/Object;
.source "DownloaderServiceMarshaller.java"

# interfaces
.implements Lcom/google/android/vending/expansion/downloader/IDownloaderService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Proxy"
.end annotation


# instance fields
.field private mMsg:Landroid/os/Messenger;


# direct methods
.method public constructor <init>(Landroid/os/Messenger;)V
    .locals 0
    .parameter "msg"

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller$Proxy;->mMsg:Landroid/os/Messenger;

    .line 70
    return-void
.end method

.method private send(ILandroid/os/Bundle;)V
    .locals 3
    .parameter "method"
    .parameter "params"

    .prologue
    .line 59
    const/4 v2, 0x0

    invoke-static {v2, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    .line 60
    .local v1, m:Landroid/os/Message;
    invoke-virtual {v1, p2}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 62
    :try_start_0
    iget-object v2, p0, Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller$Proxy;->mMsg:Landroid/os/Messenger;

    invoke-virtual {v2, v1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    :goto_0
    return-void

    .line 63
    :catch_0
    move-exception v0

    .line 64
    .local v0, e:Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public onClientUpdated(Landroid/os/Messenger;)V
    .locals 2
    .parameter "clientMessenger"

    .prologue
    .line 101
    new-instance v0, Landroid/os/Bundle;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/os/Bundle;-><init>(I)V

    .line 102
    .local v0, bundle:Landroid/os/Bundle;
    const-string v1, "EMH"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 103
    const/4 v1, 0x6

    invoke-direct {p0, v1, v0}, Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller$Proxy;->send(ILandroid/os/Bundle;)V

    .line 104
    return-void
.end method

.method public requestAbortDownload()V
    .locals 2

    .prologue
    .line 74
    const/4 v0, 0x1

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller$Proxy;->send(ILandroid/os/Bundle;)V

    .line 75
    return-void
.end method

.method public requestContinueDownload()V
    .locals 2

    .prologue
    .line 91
    const/4 v0, 0x4

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller$Proxy;->send(ILandroid/os/Bundle;)V

    .line 92
    return-void
.end method

.method public requestDownloadStatus()V
    .locals 2

    .prologue
    .line 96
    const/4 v0, 0x5

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller$Proxy;->send(ILandroid/os/Bundle;)V

    .line 97
    return-void
.end method

.method public requestPauseDownload()V
    .locals 2

    .prologue
    .line 79
    const/4 v0, 0x2

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller$Proxy;->send(ILandroid/os/Bundle;)V

    .line 80
    return-void
.end method

.method public setDownloadFlags(I)V
    .locals 2
    .parameter "flags"

    .prologue
    .line 84
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 85
    .local v0, params:Landroid/os/Bundle;
    const-string v1, "flags"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 86
    const/4 v1, 0x3

    invoke-direct {p0, v1, v0}, Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller$Proxy;->send(ILandroid/os/Bundle;)V

    .line 87
    return-void
.end method

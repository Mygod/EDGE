.class Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller$Stub;
.super Ljava/lang/Object;
.source "DownloaderServiceMarshaller.java"

# interfaces
.implements Lcom/google/android/vending/expansion/downloader/IStub;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Stub"
.end annotation


# instance fields
.field private mItf:Lcom/google/android/vending/expansion/downloader/IDownloaderService;

.field final mMessenger:Landroid/os/Messenger;


# direct methods
.method public constructor <init>(Lcom/google/android/vending/expansion/downloader/IDownloaderService;)V
    .locals 2
    .parameter "itf"

    .prologue
    .line 136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller$Stub;->mItf:Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    .line 109
    new-instance v0, Landroid/os/Messenger;

    new-instance v1, Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller$Stub$1;

    invoke-direct {v1, p0}, Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller$Stub$1;-><init>(Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller$Stub;)V

    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller$Stub;->mMessenger:Landroid/os/Messenger;

    .line 137
    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller$Stub;->mItf:Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    .line 138
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller$Stub;)Lcom/google/android/vending/expansion/downloader/IDownloaderService;
    .locals 1
    .parameter "x0"

    .prologue
    .line 107
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller$Stub;->mItf:Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    return-object v0
.end method


# virtual methods
.method public connect(Landroid/content/Context;)V
    .locals 0
    .parameter "c"

    .prologue
    .line 148
    return-void
.end method

.method public disconnect(Landroid/content/Context;)V
    .locals 0
    .parameter "c"

    .prologue
    .line 153
    return-void
.end method

.method public getMessenger()Landroid/os/Messenger;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller$Stub;->mMessenger:Landroid/os/Messenger;

    return-object v0
.end method

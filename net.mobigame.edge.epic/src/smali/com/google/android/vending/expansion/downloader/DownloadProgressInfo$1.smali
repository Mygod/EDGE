.class final Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo$1;
.super Ljava/lang/Object;
.source "DownloadProgressInfo.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;
    .locals 1
    .parameter "parcel"

    .prologue
    .line 70
    new-instance v0, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;

    invoke-direct {v0, p1}, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 67
    invoke-virtual {p0, p1}, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo$1;->createFromParcel(Landroid/os/Parcel;)Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;
    .locals 1
    .parameter "i"

    .prologue
    .line 75
    new-array v0, p1, [Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 67
    invoke-virtual {p0, p1}, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo$1;->newArray(I)[Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;

    move-result-object v0

    return-object v0
.end method

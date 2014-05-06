.class public Lcom/apportable/expansion/downloader/ExpansionFileDownloaderService;
.super Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;
.source "ExpansionFileDownloaderService.java"


# static fields
.field private static final BASE64_PUBLIC_KEY:Ljava/lang/String;

.field private static final SALT:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 28
    invoke-static {}, Lcom/apportable/utils/MetaData;->getMetaData()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "apportable.android_market_pubkey"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/apportable/expansion/downloader/ExpansionFileDownloaderService;->BASE64_PUBLIC_KEY:Ljava/lang/String;

    .line 30
    const/16 v0, 0x14

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/apportable/expansion/downloader/ExpansionFileDownloaderService;->SALT:[B

    return-void

    :array_0
    .array-data 0x1
        0xa8t
        0xbt
        0x45t
        0xd4t
        0xe7t
        0xe9t
        0xb7t
        0x68t
        0xa5t
        0x21t
        0xdet
        0x3ct
        0x35t
        0x83t
        0x66t
        0xf5t
        0x97t
        0xfft
        0x12t
        0x4ct
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;-><init>()V

    return-void
.end method


# virtual methods
.method public getAlarmReceiverClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    const-class v0, Lcom/apportable/expansion/downloader/ExpansionFileDownloaderAlarmReceiver;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPublicKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    sget-object v0, Lcom/apportable/expansion/downloader/ExpansionFileDownloaderService;->BASE64_PUBLIC_KEY:Ljava/lang/String;

    return-object v0
.end method

.method public getSALT()[B
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/apportable/expansion/downloader/ExpansionFileDownloaderService;->SALT:[B

    return-object v0
.end method

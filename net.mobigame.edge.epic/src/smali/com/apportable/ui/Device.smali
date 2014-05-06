.class public Lcom/apportable/ui/Device;
.super Ljava/lang/Object;
.source "Device.java"


# static fields
.field private static final CHAR_SET:Ljava/lang/String; = "iso-8859-1"

.field private static final DELAY:J = 0x190L

.field private static final SHA1_ALGORITHM:Ljava/lang/String; = "SHA-1"

.field private static final TAG:Ljava/lang/String; = "ODIN"


# instance fields
.field private listener:Landroid/view/OrientationEventListener;

.field private mEnabled:Z

.field private mObject:I


# direct methods
.method protected constructor <init>(Landroid/content/Context;I)V
    .locals 1
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/apportable/ui/Device;->mEnabled:Z

    .line 20
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/apportable/ui/Device;->listener:Landroid/view/OrientationEventListener;

    .line 29
    iput p2, p0, Lcom/apportable/ui/Device;->mObject:I

    .line 30
    new-instance v0, Lcom/apportable/ui/Device$1;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Device$1;-><init>(Lcom/apportable/ui/Device;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/apportable/ui/Device;->listener:Landroid/view/OrientationEventListener;

    .line 51
    return-void
.end method

.method private SHA1(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .parameter "text"

    .prologue
    .line 158
    :try_start_0
    const-string v3, "SHA-1"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    .line 159
    .local v1, md:Ljava/security/MessageDigest;
    const/16 v3, 0x28

    new-array v2, v3, [B

    .line 160
    .local v2, sha1hash:[B
    const-string v3, "iso-8859-1"

    invoke-virtual {p1, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v1, v3, v4, v5}, Ljava/security/MessageDigest;->update([BII)V

    .line 161
    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v2

    .line 163
    invoke-direct {p0, v2}, Lcom/apportable/ui/Device;->convertToHex([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 166
    .end local v1           #md:Ljava/security/MessageDigest;
    .end local v2           #sha1hash:[B
    :goto_0
    return-object v3

    .line 164
    :catch_0
    move-exception v0

    .line 165
    .local v0, e:Ljava/lang/Exception;
    const-string v3, "VerdeDevice"

    const-string v4, "Error generating generating SHA-1: "

    invoke-static {v3, v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 166
    const/4 v3, 0x0

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/apportable/ui/Device;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 16
    iget v0, p0, Lcom/apportable/ui/Device;->mObject:I

    return v0
.end method

.method static synthetic access$100(Lcom/apportable/ui/Device;II)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 16
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/Device;->nativeOnOrientationChanged(II)V

    return-void
.end method

.method static synthetic access$200(Lcom/apportable/ui/Device;)Landroid/view/OrientationEventListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 16
    iget-object v0, p0, Lcom/apportable/ui/Device;->listener:Landroid/view/OrientationEventListener;

    return-object v0
.end method

.method private convertToHex([B)Ljava/lang/String;
    .locals 6
    .parameter "data"

    .prologue
    .line 140
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 141
    .local v0, buf:Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    array-length v5, p1

    if-ge v2, v5, :cond_1

    .line 142
    aget-byte v5, p1, v2

    ushr-int/lit8 v5, v5, 0x4

    and-int/lit8 v1, v5, 0xf

    .line 143
    .local v1, halfbyte:I
    const/4 v3, 0x0

    .local v3, two_halfs:I
    move v4, v3

    .line 145
    .end local v3           #two_halfs:I
    .local v4, two_halfs:I
    :goto_1
    if-ltz v1, :cond_0

    const/16 v5, 0x9

    if-gt v1, v5, :cond_0

    .line 146
    add-int/lit8 v5, v1, 0x30

    int-to-char v5, v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 149
    :goto_2
    aget-byte v5, p1, v2

    and-int/lit8 v1, v5, 0xf

    .line 150
    add-int/lit8 v3, v4, 0x1

    .end local v4           #two_halfs:I
    .restart local v3       #two_halfs:I
    const/4 v5, 0x1

    if-lt v4, v5, :cond_2

    .line 141
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 148
    .end local v3           #two_halfs:I
    .restart local v4       #two_halfs:I
    :cond_0
    add-int/lit8 v5, v1, -0xa

    add-int/lit8 v5, v5, 0x61

    int-to-char v5, v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 152
    .end local v1           #halfbyte:I
    .end local v4           #two_halfs:I
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .restart local v1       #halfbyte:I
    .restart local v3       #two_halfs:I
    :cond_2
    move v4, v3

    .end local v3           #two_halfs:I
    .restart local v4       #two_halfs:I
    goto :goto_1
.end method

.method public static create(Landroid/content/Context;I)Lcom/apportable/ui/Device;
    .locals 2
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 54
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 55
    new-instance v1, Lcom/apportable/ui/Device;

    invoke-direct {v1, p0, p1}, Lcom/apportable/ui/Device;-><init>(Landroid/content/Context;I)V

    .line 74
    :goto_0
    return-object v1

    .line 57
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 58
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/Device;>;"
    new-instance v1, Lcom/apportable/ui/Device$2;

    invoke-direct {v1, p0, v0, p1}, Lcom/apportable/ui/Device$2;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;I)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 67
    monitor-enter p0

    .line 68
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 70
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 71
    :catch_0
    move-exception v1

    goto :goto_1

    .line 73
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 74
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/Device;

    goto :goto_0

    .line 73
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method private native nativeOnOrientationChanged(II)V
.end method


# virtual methods
.method public disable()V
    .locals 2

    .prologue
    .line 91
    iget-boolean v0, p0, Lcom/apportable/ui/Device;->mEnabled:Z

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 92
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/apportable/ui/Device;->mEnabled:Z

    .line 93
    new-instance v0, Lcom/apportable/ui/Device$4;

    invoke-direct {v0, p0}, Lcom/apportable/ui/Device$4;-><init>(Lcom/apportable/ui/Device;)V

    invoke-static {v0}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 100
    :cond_0
    return-void
.end method

.method public enable()V
    .locals 1

    .prologue
    .line 79
    iget-boolean v0, p0, Lcom/apportable/ui/Device;->mEnabled:Z

    if-nez v0, :cond_0

    .line 80
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/apportable/ui/Device;->mEnabled:Z

    .line 81
    new-instance v0, Lcom/apportable/ui/Device$3;

    invoke-direct {v0, p0}, Lcom/apportable/ui/Device$3;-><init>(Lcom/apportable/ui/Device;)V

    invoke-static {v0}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 88
    :cond_0
    return-void
.end method

.method public getODIN()Ljava/lang/String;
    .locals 7

    .prologue
    .line 124
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v1

    .line 125
    .local v1, context:Landroid/content/Context;
    const/4 v0, 0x0

    .line 127
    .local v0, androidId:Ljava/lang/String;
    :try_start_0
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "android_id"

    invoke-static {v4, v5}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 132
    :goto_0
    if-nez v0, :cond_1

    .line 133
    const-string v3, ""

    .line 136
    :cond_0
    :goto_1
    return-object v3

    .line 128
    :catch_0
    move-exception v2

    .line 129
    .local v2, e:Ljava/lang/Exception;
    const-string v4, "VerdeDevice"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error generating ODIN-1: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 135
    .end local v2           #e:Ljava/lang/Exception;
    :cond_1
    invoke-direct {p0, v0}, Lcom/apportable/ui/Device;->SHA1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 136
    .local v3, odin:Ljava/lang/String;
    if-nez v3, :cond_0

    const-string v3, ""

    goto :goto_1
.end method

.method public macAddress()Ljava/lang/String;
    .locals 7

    .prologue
    .line 110
    const/4 v2, 0x0

    .line 112
    .local v2, macAddress:Ljava/lang/String;
    :try_start_0
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v4

    const-string v5, "wifi"

    invoke-virtual {v4, v5}, Lcom/apportable/app/VerdeApplication;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/wifi/WifiManager;

    move-object v0, v4

    check-cast v0, Landroid/net/wifi/WifiManager;

    move-object v3, v0

    .line 113
    .local v3, wm:Landroid/net/wifi/WifiManager;
    invoke-virtual {v3}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 117
    .end local v3           #wm:Landroid/net/wifi/WifiManager;
    :goto_0
    if-eqz v2, :cond_0

    .end local v2           #macAddress:Ljava/lang/String;
    :goto_1
    return-object v2

    .line 114
    .restart local v2       #macAddress:Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 115
    .local v1, e:Ljava/lang/Exception;
    const-string v4, "VerdeDevice"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Could not get device mac address: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 117
    .end local v1           #e:Ljava/lang/Exception;
    :cond_0
    const-string v2, ""

    goto :goto_1
.end method

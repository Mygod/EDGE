.class public Lcom/android/vending/licensing/LicenseChecker;
.super Ljava/lang/Object;
.source "LicenseChecker.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/vending/licensing/LicenseChecker$ResultListener;
    }
.end annotation


# static fields
.field private static final KEY_FACTORY_ALGORITHM:Ljava/lang/String; = "RSA"

.field private static final RANDOM:Ljava/security/SecureRandom; = null

.field private static final TAG:Ljava/lang/String; = "LicenseChecker"

.field private static final TIMEOUT_MS:I = 0x2710


# instance fields
.field private final mChecksInProgress:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/android/vending/licensing/LicenseValidator;",
            ">;"
        }
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;

.field private final mPackageName:Ljava/lang/String;

.field private final mPendingChecks:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/android/vending/licensing/LicenseValidator;",
            ">;"
        }
    .end annotation
.end field

.field private final mPolicy:Lcom/android/vending/licensing/Policy;

.field private mPublicKey:Ljava/security/PublicKey;

.field private mService:Lcom/android/vending/licensing/ILicensingService;

.field private final mVersionCode:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 66
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    sput-object v0, Lcom/android/vending/licensing/LicenseChecker;->RANDOM:Ljava/security/SecureRandom;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/vending/licensing/Policy;Ljava/lang/String;)V
    .locals 3
    .parameter "context"
    .parameter "policy"
    .parameter "encodedPublicKey"

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lcom/android/vending/licensing/LicenseChecker;->mChecksInProgress:Ljava/util/Set;

    .line 81
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lcom/android/vending/licensing/LicenseChecker;->mPendingChecks:Ljava/util/Queue;

    .line 90
    iput-object p1, p0, Lcom/android/vending/licensing/LicenseChecker;->mContext:Landroid/content/Context;

    .line 91
    iput-object p2, p0, Lcom/android/vending/licensing/LicenseChecker;->mPolicy:Lcom/android/vending/licensing/Policy;

    .line 92
    invoke-static {p3}, Lcom/android/vending/licensing/LicenseChecker;->generatePublicKey(Ljava/lang/String;)Ljava/security/PublicKey;

    move-result-object v1

    iput-object v1, p0, Lcom/android/vending/licensing/LicenseChecker;->mPublicKey:Ljava/security/PublicKey;

    .line 93
    iget-object v1, p0, Lcom/android/vending/licensing/LicenseChecker;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/vending/licensing/LicenseChecker;->mPackageName:Ljava/lang/String;

    .line 94
    iget-object v1, p0, Lcom/android/vending/licensing/LicenseChecker;->mPackageName:Ljava/lang/String;

    invoke-static {p1, v1}, Lcom/android/vending/licensing/LicenseChecker;->getVersionCode(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/vending/licensing/LicenseChecker;->mVersionCode:Ljava/lang/String;

    .line 95
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "background thread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 96
    .local v0, handlerThread:Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 97
    new-instance v1, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/android/vending/licensing/LicenseChecker;->mHandler:Landroid/os/Handler;

    .line 98
    return-void
.end method

.method static synthetic access$100(Lcom/android/vending/licensing/LicenseChecker;Lcom/android/vending/licensing/LicenseValidator;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lcom/android/vending/licensing/LicenseChecker;->handleServiceConnectionError(Lcom/android/vending/licensing/LicenseValidator;)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/vending/licensing/LicenseChecker;Lcom/android/vending/licensing/LicenseValidator;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lcom/android/vending/licensing/LicenseChecker;->finishCheck(Lcom/android/vending/licensing/LicenseValidator;)V

    return-void
.end method

.method static synthetic access$300(Lcom/android/vending/licensing/LicenseChecker;)Ljava/util/Set;
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget-object v0, p0, Lcom/android/vending/licensing/LicenseChecker;->mChecksInProgress:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/vending/licensing/LicenseChecker;)Ljava/security/PublicKey;
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget-object v0, p0, Lcom/android/vending/licensing/LicenseChecker;->mPublicKey:Ljava/security/PublicKey;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/vending/licensing/LicenseChecker;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget-object v0, p0, Lcom/android/vending/licensing/LicenseChecker;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private cleanupService()V
    .locals 3

    .prologue
    .line 260
    iget-object v1, p0, Lcom/android/vending/licensing/LicenseChecker;->mService:Lcom/android/vending/licensing/ILicensingService;

    if-eqz v1, :cond_0

    .line 262
    :try_start_0
    iget-object v1, p0, Lcom/android/vending/licensing/LicenseChecker;->mContext:Landroid/content/Context;

    invoke-virtual {v1, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 267
    :goto_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/vending/licensing/LicenseChecker;->mService:Lcom/android/vending/licensing/ILicensingService;

    .line 269
    :cond_0
    return-void

    .line 263
    :catch_0
    move-exception v0

    .line 265
    .local v0, e:Ljava/lang/IllegalArgumentException;
    const-string v1, "LicenseChecker"

    const-string v2, "Unable to unbind from licensing service (already unbound)"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private declared-synchronized finishCheck(Lcom/android/vending/licensing/LicenseValidator;)V
    .locals 1
    .parameter "validator"

    .prologue
    .line 181
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/vending/licensing/LicenseChecker;->mChecksInProgress:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 182
    iget-object v0, p0, Lcom/android/vending/licensing/LicenseChecker;->mChecksInProgress:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 183
    invoke-direct {p0}, Lcom/android/vending/licensing/LicenseChecker;->cleanupService()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 185
    :cond_0
    monitor-exit p0

    return-void

    .line 181
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private generateNonce()I
    .locals 1

    .prologue
    .line 286
    sget-object v0, Lcom/android/vending/licensing/LicenseChecker;->RANDOM:Ljava/security/SecureRandom;

    invoke-virtual {v0}, Ljava/security/SecureRandom;->nextInt()I

    move-result v0

    return v0
.end method

.method private static generatePublicKey(Ljava/lang/String;)Ljava/security/PublicKey;
    .locals 5
    .parameter "encodedPublicKey"

    .prologue
    .line 109
    :try_start_0
    invoke-static {p0}, Lcom/android/vending/licensing/util/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v0

    .line 110
    .local v0, decodedKey:[B
    const-string v3, "RSA"

    invoke-static {v3}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v2

    .line 112
    .local v2, keyFactory:Ljava/security/KeyFactory;
    new-instance v3, Ljava/security/spec/X509EncodedKeySpec;

    invoke-direct {v3, v0}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    invoke-virtual {v2, v3}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/android/vending/licensing/util/Base64DecoderException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v3

    return-object v3

    .line 113
    .end local v0           #decodedKey:[B
    .end local v2           #keyFactory:Ljava/security/KeyFactory;
    :catch_0
    move-exception v1

    .line 115
    .local v1, e:Ljava/security/NoSuchAlgorithmException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 116
    .end local v1           #e:Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v1

    .line 117
    .local v1, e:Lcom/android/vending/licensing/util/Base64DecoderException;
    const-string v3, "LicenseChecker"

    const-string v4, "Could not decode from Base64."

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 119
    .end local v1           #e:Lcom/android/vending/licensing/util/Base64DecoderException;
    :catch_2
    move-exception v1

    .line 120
    .local v1, e:Ljava/security/spec/InvalidKeySpecException;
    const-string v3, "LicenseChecker"

    const-string v4, "Invalid key specification."

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method private static getVersionCode(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "context"
    .parameter "packageName"

    .prologue
    .line 298
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    iget v1, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 302
    :goto_0
    return-object v1

    .line 300
    :catch_0
    move-exception v0

    .line 301
    .local v0, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v1, "LicenseChecker"

    const-string v2, "Package not found. could not get version code."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 302
    const-string v1, ""

    goto :goto_0
.end method

.method private declared-synchronized handleServiceConnectionError(Lcom/android/vending/licensing/LicenseValidator;)V
    .locals 3
    .parameter "validator"

    .prologue
    .line 249
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/vending/licensing/LicenseChecker;->mPolicy:Lcom/android/vending/licensing/Policy;

    sget-object v1, Lcom/android/vending/licensing/Policy$LicenseResponse;->RETRY:Lcom/android/vending/licensing/Policy$LicenseResponse;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/android/vending/licensing/Policy;->processServerResponse(Lcom/android/vending/licensing/Policy$LicenseResponse;Lcom/android/vending/licensing/ResponseData;)V

    .line 251
    iget-object v0, p0, Lcom/android/vending/licensing/LicenseChecker;->mPolicy:Lcom/android/vending/licensing/Policy;

    invoke-interface {v0}, Lcom/android/vending/licensing/Policy;->allowAccess()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 252
    invoke-virtual {p1}, Lcom/android/vending/licensing/LicenseValidator;->getCallback()Lcom/android/vending/licensing/LicenseCheckerCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/vending/licensing/LicenseCheckerCallback;->allow()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 256
    :goto_0
    monitor-exit p0

    return-void

    .line 254
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Lcom/android/vending/licensing/LicenseValidator;->getCallback()Lcom/android/vending/licensing/LicenseCheckerCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/vending/licensing/LicenseCheckerCallback;->dontAllow()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 249
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private runChecks()V
    .locals 7

    .prologue
    .line 166
    :goto_0
    iget-object v2, p0, Lcom/android/vending/licensing/LicenseChecker;->mPendingChecks:Ljava/util/Queue;

    invoke-interface {v2}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/vending/licensing/LicenseValidator;

    .local v1, validator:Lcom/android/vending/licensing/LicenseValidator;
    if-eqz v1, :cond_0

    .line 168
    :try_start_0
    const-string v2, "LicenseChecker"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Calling checkLicense on service for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lcom/android/vending/licensing/LicenseValidator;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    iget-object v2, p0, Lcom/android/vending/licensing/LicenseChecker;->mService:Lcom/android/vending/licensing/ILicensingService;

    invoke-virtual {v1}, Lcom/android/vending/licensing/LicenseValidator;->getNonce()I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v1}, Lcom/android/vending/licensing/LicenseValidator;->getPackageName()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/android/vending/licensing/LicenseChecker$ResultListener;

    invoke-direct {v6, p0, v1}, Lcom/android/vending/licensing/LicenseChecker$ResultListener;-><init>(Lcom/android/vending/licensing/LicenseChecker;Lcom/android/vending/licensing/LicenseValidator;)V

    invoke-interface {v2, v3, v4, v5, v6}, Lcom/android/vending/licensing/ILicensingService;->checkLicense(JLjava/lang/String;Lcom/android/vending/licensing/ILicenseResultListener;)V

    .line 172
    iget-object v2, p0, Lcom/android/vending/licensing/LicenseChecker;->mChecksInProgress:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 173
    :catch_0
    move-exception v0

    .line 174
    .local v0, e:Landroid/os/RemoteException;
    const-string v2, "LicenseChecker"

    const-string v3, "RemoteException in checkLicense call."

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 175
    invoke-direct {p0, v1}, Lcom/android/vending/licensing/LicenseChecker;->handleServiceConnectionError(Lcom/android/vending/licensing/LicenseValidator;)V

    goto :goto_0

    .line 178
    .end local v0           #e:Landroid/os/RemoteException;
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized checkAccess(Lcom/android/vending/licensing/LicenseCheckerCallback;)V
    .locals 9
    .parameter "callback"

    .prologue
    .line 133
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/android/vending/licensing/LicenseChecker;->mPolicy:Lcom/android/vending/licensing/Policy;

    invoke-interface {v1}, Lcom/android/vending/licensing/Policy;->allowAccess()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 134
    const-string v1, "LicenseChecker"

    const-string v2, "Using cached license response"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    invoke-interface {p1}, Lcom/android/vending/licensing/LicenseCheckerCallback;->allow()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 162
    :goto_0
    monitor-exit p0

    return-void

    .line 137
    :cond_0
    :try_start_1
    new-instance v0, Lcom/android/vending/licensing/LicenseValidator;

    iget-object v1, p0, Lcom/android/vending/licensing/LicenseChecker;->mPolicy:Lcom/android/vending/licensing/Policy;

    new-instance v2, Lcom/android/vending/licensing/NullDeviceLimiter;

    invoke-direct {v2}, Lcom/android/vending/licensing/NullDeviceLimiter;-><init>()V

    invoke-direct {p0}, Lcom/android/vending/licensing/LicenseChecker;->generateNonce()I

    move-result v4

    iget-object v5, p0, Lcom/android/vending/licensing/LicenseChecker;->mPackageName:Ljava/lang/String;

    iget-object v6, p0, Lcom/android/vending/licensing/LicenseChecker;->mVersionCode:Ljava/lang/String;

    move-object v3, p1

    invoke-direct/range {v0 .. v6}, Lcom/android/vending/licensing/LicenseValidator;-><init>(Lcom/android/vending/licensing/Policy;Lcom/android/vending/licensing/DeviceLimiter;Lcom/android/vending/licensing/LicenseCheckerCallback;ILjava/lang/String;Ljava/lang/String;)V

    .line 140
    .local v0, validator:Lcom/android/vending/licensing/LicenseValidator;
    iget-object v1, p0, Lcom/android/vending/licensing/LicenseChecker;->mService:Lcom/android/vending/licensing/ILicensingService;

    if-nez v1, :cond_2

    .line 141
    const-string v1, "LicenseChecker"

    const-string v2, "Binding to licensing service."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 143
    :try_start_2
    iget-object v1, p0, Lcom/android/vending/licensing/LicenseChecker;->mContext:Landroid/content/Context;

    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/android/vending/licensing/ILicensingService;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x1

    invoke-virtual {v1, v2, p0, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v7

    .line 148
    .local v7, bindResult:Z
    if-eqz v7, :cond_1

    .line 149
    iget-object v1, p0, Lcom/android/vending/licensing/LicenseChecker;->mPendingChecks:Ljava/util/Queue;

    invoke-interface {v1, v0}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 154
    .end local v7           #bindResult:Z
    :catch_0
    move-exception v8

    .line 155
    .local v8, e:Ljava/lang/SecurityException;
    :try_start_3
    sget-object v1, Lcom/android/vending/licensing/LicenseCheckerCallback$ApplicationErrorCode;->MISSING_PERMISSION:Lcom/android/vending/licensing/LicenseCheckerCallback$ApplicationErrorCode;

    invoke-interface {p1, v1}, Lcom/android/vending/licensing/LicenseCheckerCallback;->applicationError(Lcom/android/vending/licensing/LicenseCheckerCallback$ApplicationErrorCode;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 133
    .end local v0           #validator:Lcom/android/vending/licensing/LicenseValidator;
    .end local v8           #e:Ljava/lang/SecurityException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 151
    .restart local v0       #validator:Lcom/android/vending/licensing/LicenseValidator;
    .restart local v7       #bindResult:Z
    :cond_1
    :try_start_4
    const-string v1, "LicenseChecker"

    const-string v2, "Could not bind to service."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    invoke-direct {p0, v0}, Lcom/android/vending/licensing/LicenseChecker;->handleServiceConnectionError(Lcom/android/vending/licensing/LicenseValidator;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/SecurityException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_0

    .line 158
    .end local v7           #bindResult:Z
    :cond_2
    :try_start_5
    iget-object v1, p0, Lcom/android/vending/licensing/LicenseChecker;->mPendingChecks:Ljava/util/Queue;

    invoke-interface {v1, v0}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 159
    invoke-direct {p0}, Lcom/android/vending/licensing/LicenseChecker;->runChecks()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized onDestroy()V
    .locals 1

    .prologue
    .line 280
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/android/vending/licensing/LicenseChecker;->cleanupService()V

    .line 281
    iget-object v0, p0, Lcom/android/vending/licensing/LicenseChecker;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->quit()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 282
    monitor-exit p0

    return-void

    .line 280
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1
    .parameter "name"
    .parameter "service"

    .prologue
    .line 232
    monitor-enter p0

    :try_start_0
    invoke-static {p2}, Lcom/android/vending/licensing/ILicensingService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/vending/licensing/ILicensingService;

    move-result-object v0

    iput-object v0, p0, Lcom/android/vending/licensing/LicenseChecker;->mService:Lcom/android/vending/licensing/ILicensingService;

    .line 233
    invoke-direct {p0}, Lcom/android/vending/licensing/LicenseChecker;->runChecks()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 234
    monitor-exit p0

    return-void

    .line 232
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .parameter "name"

    .prologue
    .line 240
    monitor-enter p0

    :try_start_0
    const-string v0, "LicenseChecker"

    const-string v1, "Service unexpectedly disconnected."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/vending/licensing/LicenseChecker;->mService:Lcom/android/vending/licensing/ILicensingService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 242
    monitor-exit p0

    return-void

    .line 240
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.class public Lcom/google/ads/b;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static c:Lcom/google/ads/b;


# instance fields
.field private final a:Ljava/math/BigInteger;

.field private b:Ljava/math/BigInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 42
    const/4 v0, 0x0

    sput-object v0, Lcom/google/ads/b;->c:Lcom/google/ads/b;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    sget-object v0, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    iput-object v0, p0, Lcom/google/ads/b;->b:Ljava/math/BigInteger;

    .line 72
    invoke-static {}, Lcom/google/ads/b;->d()Ljava/math/BigInteger;

    move-result-object v0

    iput-object v0, p0, Lcom/google/ads/b;->a:Ljava/math/BigInteger;

    .line 73
    return-void
.end method

.method public static declared-synchronized a()Lcom/google/ads/b;
    .locals 2

    .prologue
    .line 48
    const-class v1, Lcom/google/ads/b;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/google/ads/b;->c:Lcom/google/ads/b;

    if-nez v0, :cond_0

    .line 49
    new-instance v0, Lcom/google/ads/b;

    invoke-direct {v0}, Lcom/google/ads/b;-><init>()V

    sput-object v0, Lcom/google/ads/b;->c:Lcom/google/ads/b;

    .line 51
    :cond_0
    sget-object v0, Lcom/google/ads/b;->c:Lcom/google/ads/b;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 48
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static a(J)[B
    .locals 1
    .parameter

    .prologue
    .line 117
    invoke-static {p0, p1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v0

    return-object v0
.end method

.method private static d()Ljava/math/BigInteger;
    .locals 5

    .prologue
    .line 96
    :try_start_0
    const-string v0, "MD5"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 97
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    .line 98
    invoke-virtual {v1}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/google/ads/b;->a(J)[B

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/security/MessageDigest;->update([B)V

    .line 99
    invoke-virtual {v1}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/google/ads/b;->a(J)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 100
    const/16 v1, 0x9

    new-array v1, v1, [B

    .line 105
    const/4 v2, 0x0

    const/4 v3, 0x0

    aput-byte v3, v1, v2

    .line 106
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/16 v4, 0x8

    invoke-static {v0, v2, v1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 107
    new-instance v0, Ljava/math/BigInteger;

    invoke-direct {v0, v1}, Ljava/math/BigInteger;-><init>([B)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 108
    :catch_0
    move-exception v0

    .line 109
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Cannot find MD5 message digest algorithm."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public declared-synchronized b()Ljava/math/BigInteger;
    .locals 1

    .prologue
    .line 58
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/ads/b;->a:Ljava/math/BigInteger;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized c()Ljava/math/BigInteger;
    .locals 3

    .prologue
    .line 66
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/ads/b;->b:Ljava/math/BigInteger;

    .line 67
    iget-object v1, p0, Lcom/google/ads/b;->b:Ljava/math/BigInteger;

    sget-object v2, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    iput-object v1, p0, Lcom/google/ads/b;->b:Ljava/math/BigInteger;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    monitor-exit p0

    return-object v0

    .line 66
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

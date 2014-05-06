.class public final Lcom/flurry/android/FlurryAgent;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/location/LocationListener;


# static fields
.field static a:Ljava/lang/String;

.field private static final b:[Ljava/lang/String;

.field private static volatile c:Ljava/lang/String;

.field private static volatile d:Ljava/lang/String;

.field private static volatile e:Ljava/lang/String;

.field private static volatile f:Ljava/lang/String;

.field private static volatile g:Ljava/lang/String;

.field private static final h:Lcom/flurry/android/FlurryAgent;

.field private static i:J

.field private static j:Z

.field private static k:Z

.field private static volatile kInsecureReportUrl:Ljava/lang/String;

.field private static volatile kSecureReportUrl:Ljava/lang/String;

.field private static l:Z

.field private static m:Z

.field private static n:Landroid/location/Criteria;

.field private static o:Z

.field private static p:Lcom/flurry/android/AppCircle;

.field private static q:Ljava/util/concurrent/atomic/AtomicInteger;

.field private static r:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field private A:Ljava/lang/String;

.field private B:Ljava/lang/String;

.field private C:Z

.field private D:Ljava/util/List;

.field private E:Landroid/location/LocationManager;

.field private F:Ljava/lang/String;

.field private G:Z

.field private H:J

.field private I:[B

.field private J:Ljava/util/List;

.field private K:J

.field private L:J

.field private M:J

.field private N:Ljava/lang/String;

.field private O:Ljava/lang/String;

.field private P:B

.field private Q:Ljava/lang/String;

.field private R:B

.field private S:Ljava/lang/Long;

.field private T:I

.field private U:Landroid/location/Location;

.field private V:Ljava/util/Map;

.field private W:Ljava/util/List;

.field private X:Z

.field private Y:I

.field private Z:Ljava/util/List;

.field private aa:I

.field private ab:Lcom/flurry/android/v;

.field private final s:Landroid/os/Handler;

.field private t:Ljava/io/File;

.field private u:Ljava/io/File;

.field private volatile v:Z

.field private volatile w:Z

.field private x:J

.field private y:Ljava/util/Map;

.field private z:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 93
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "9774d56d682e549c"

    aput-object v1, v0, v2

    const-string v1, "dead00beef"

    aput-object v1, v0, v4

    sput-object v0, Lcom/flurry/android/FlurryAgent;->b:[Ljava/lang/String;

    .line 101
    sput-object v3, Lcom/flurry/android/FlurryAgent;->c:Ljava/lang/String;

    .line 102
    const-string v0, "http://data.flurry.com/aap.do"

    sput-object v0, Lcom/flurry/android/FlurryAgent;->kInsecureReportUrl:Ljava/lang/String;

    .line 103
    const-string v0, "https://data.flurry.com/aap.do"

    sput-object v0, Lcom/flurry/android/FlurryAgent;->kSecureReportUrl:Ljava/lang/String;

    .line 105
    sput-object v3, Lcom/flurry/android/FlurryAgent;->d:Ljava/lang/String;

    .line 106
    const-string v0, "http://ad.flurry.com/getCanvas.do"

    sput-object v0, Lcom/flurry/android/FlurryAgent;->e:Ljava/lang/String;

    .line 108
    sput-object v3, Lcom/flurry/android/FlurryAgent;->f:Ljava/lang/String;

    .line 109
    const-string v0, "http://ad.flurry.com/getAndroidApp.do"

    sput-object v0, Lcom/flurry/android/FlurryAgent;->g:Ljava/lang/String;

    .line 148
    new-instance v0, Lcom/flurry/android/FlurryAgent;

    invoke-direct {v0}, Lcom/flurry/android/FlurryAgent;-><init>()V

    sput-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    .line 150
    const-wide/16 v0, 0x2710

    sput-wide v0, Lcom/flurry/android/FlurryAgent;->i:J

    .line 151
    sput-boolean v4, Lcom/flurry/android/FlurryAgent;->j:Z

    .line 153
    sput-boolean v2, Lcom/flurry/android/FlurryAgent;->k:Z

    .line 154
    sput-boolean v2, Lcom/flurry/android/FlurryAgent;->l:Z

    .line 157
    sput-boolean v4, Lcom/flurry/android/FlurryAgent;->m:Z

    .line 158
    sput-object v3, Lcom/flurry/android/FlurryAgent;->n:Landroid/location/Criteria;

    .line 160
    sput-boolean v2, Lcom/flurry/android/FlurryAgent;->o:Z

    .line 161
    new-instance v0, Lcom/flurry/android/AppCircle;

    invoke-direct {v0}, Lcom/flurry/android/AppCircle;-><init>()V

    sput-object v0, Lcom/flurry/android/FlurryAgent;->p:Lcom/flurry/android/AppCircle;

    .line 163
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/flurry/android/FlurryAgent;->q:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 164
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/flurry/android/FlurryAgent;->r:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method private constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 296
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 170
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->u:Ljava/io/File;

    .line 173
    iput-boolean v2, p0, Lcom/flurry/android/FlurryAgent;->v:Z

    .line 174
    iput-boolean v2, p0, Lcom/flurry/android/FlurryAgent;->w:Z

    .line 177
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->y:Ljava/util/Map;

    .line 181
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/android/FlurryAgent;->C:Z

    .line 190
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->J:Ljava/util/List;

    .line 197
    const-string v0, ""

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->N:Ljava/lang/String;

    .line 198
    const-string v0, ""

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->O:Ljava/lang/String;

    .line 199
    iput-byte v1, p0, Lcom/flurry/android/FlurryAgent;->P:B

    .line 200
    const-string v0, ""

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->Q:Ljava/lang/String;

    .line 201
    iput-byte v1, p0, Lcom/flurry/android/FlurryAgent;->R:B

    .line 205
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->V:Ljava/util/Map;

    .line 206
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->W:Ljava/util/List;

    .line 209
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->Z:Ljava/util/List;

    .line 213
    new-instance v0, Lcom/flurry/android/v;

    invoke-direct {v0}, Lcom/flurry/android/v;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    .line 297
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "FlurryAgent"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 298
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 299
    new-instance v1, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/flurry/android/FlurryAgent;->s:Landroid/os/Handler;

    .line 300
    return-void
.end method

.method private static a(D)D
    .locals 4
    .parameter

    .prologue
    const-wide v2, 0x408f400000000000L

    .line 1376
    mul-double v0, p0, v2

    .line 1377
    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    long-to-double v0, v0

    .line 1378
    div-double/2addr v0, v2

    .line 1379
    return-wide v0
.end method

.method static a(Landroid/content/Context;Ljava/lang/String;I)Landroid/view/View;
    .locals 4
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v0, 0x0

    .line 347
    sget-boolean v1, Lcom/flurry/android/FlurryAgent;->o:Z

    if-nez v1, :cond_0

    .line 356
    :goto_0
    return-object v0

    .line 351
    :cond_0
    :try_start_0
    sget-object v1, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    iget-object v1, v1, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    invoke-virtual {v1, p0, p1, p2}, Lcom/flurry/android/v;->a(Landroid/content/Context;Ljava/lang/String;I)Landroid/view/View;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    .line 353
    :catch_0
    move-exception v1

    .line 355
    const-string v2, "FlurryAgent"

    const-string v3, ""

    invoke-static {v2, v3, v1}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method static a(Ljava/lang/String;)Lcom/flurry/android/Offer;
    .locals 1
    .parameter

    .prologue
    .line 374
    sget-boolean v0, Lcom/flurry/android/FlurryAgent;->o:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 376
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    iget-object v0, v0, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    invoke-virtual {v0, p0}, Lcom/flurry/android/v;->b(Ljava/lang/String;)Lcom/flurry/android/Offer;

    move-result-object v0

    goto :goto_0
.end method

.method private a(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/client/HttpClient;
    .locals 6
    .parameter

    .prologue
    .line 2516
    :try_start_0
    invoke-static {}, Ljava/security/KeyStore;->getDefaultType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v0

    .line 2518
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 2520
    new-instance v1, Lcom/flurry/android/aj;

    invoke-direct {v1, p0, v0}, Lcom/flurry/android/aj;-><init>(Lcom/flurry/android/FlurryAgent;Ljava/security/KeyStore;)V

    .line 2522
    new-instance v0, Lorg/apache/http/conn/scheme/SchemeRegistry;

    invoke-direct {v0}, Lorg/apache/http/conn/scheme/SchemeRegistry;-><init>()V

    .line 2523
    new-instance v2, Lorg/apache/http/conn/scheme/Scheme;

    const-string v3, "http"

    invoke-static {}, Lorg/apache/http/conn/scheme/PlainSocketFactory;->getSocketFactory()Lorg/apache/http/conn/scheme/PlainSocketFactory;

    move-result-object v4

    const/16 v5, 0x50

    invoke-direct {v2, v3, v4, v5}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v0, v2}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 2525
    new-instance v2, Lorg/apache/http/conn/scheme/Scheme;

    const-string v3, "https"

    const/16 v4, 0x1bb

    invoke-direct {v2, v3, v1, v4}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v0, v2}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 2527
    new-instance v1, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;

    invoke-direct {v1, p1, v0}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .line 2529
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0, v1, p1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2533
    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0, p1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    goto :goto_0
.end method

.method private declared-synchronized a(Landroid/content/Context;)V
    .locals 8
    .parameter

    .prologue
    .line 1988
    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1}, Lcom/flurry/android/FlurryAgent;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->F:Ljava/lang/String;

    .line 1990
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->u:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 1992
    const-string v0, "FlurryAgent"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "loading persistent data: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/android/FlurryAgent;->u:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1995
    const/4 v2, 0x0

    .line 1998
    :try_start_1
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v1, p0, Lcom/flurry/android/FlurryAgent;->u:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 1999
    new-instance v1, Ljava/io/DataInputStream;

    invoke-direct {v1, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_2

    .line 2001
    :try_start_2
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    .line 2004
    const v2, 0xb5fa

    if-ne v0, v2, :cond_4

    .line 2006
    invoke-direct {p0, v1}, Lcom/flurry/android/FlurryAgent;->b(Ljava/io/DataInputStream;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 2019
    :goto_0
    :try_start_3
    invoke-static {v1}, Lcom/flurry/android/r;->a(Ljava/io/Closeable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 2024
    :goto_1
    :try_start_4
    iget-boolean v0, p0, Lcom/flurry/android/FlurryAgent;->w:Z

    if-nez v0, :cond_0

    .line 2026
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->u:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    .line 2027
    if-eqz v0, :cond_5

    .line 2029
    const-string v0, "FlurryAgent"

    const-string v1, "Deleted persistence file"

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1

    .line 2047
    :cond_0
    :goto_2
    :try_start_5
    iget-boolean v0, p0, Lcom/flurry/android/FlurryAgent;->w:Z

    if-nez v0, :cond_1

    .line 2049
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/flurry/android/FlurryAgent;->G:Z

    .line 2050
    iget-wide v0, p0, Lcom/flurry/android/FlurryAgent;->K:J

    iput-wide v0, p0, Lcom/flurry/android/FlurryAgent;->H:J

    .line 2051
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/android/FlurryAgent;->w:Z

    .line 2054
    :cond_1
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->F:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 2056
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    const-wide/16 v2, 0x25

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    iget-object v6, p0, Lcom/flurry/android/FlurryAgent;->z:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->hashCode()I

    move-result v6

    mul-int/lit8 v6, v6, 0x25

    int-to-long v6, v6

    add-long/2addr v4, v6

    mul-long/2addr v2, v4

    add-long/2addr v0, v2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ID"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x10

    invoke-static {v0, v1, v3}, Ljava/lang/Long;->toString(JI)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->F:Ljava/lang/String;

    .line 2057
    const-string v0, "FlurryAgent"

    const-string v1, "Generated id"

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 2060
    :cond_2
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    iget-object v1, p0, Lcom/flurry/android/FlurryAgent;->F:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flurry/android/v;->a(Ljava/lang/String;)V

    .line 2063
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->F:Ljava/lang/String;

    const-string v1, "AND"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->t:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_3

    .line 2065
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->F:Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lcom/flurry/android/FlurryAgent;->c(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 2067
    :cond_3
    monitor-exit p0

    return-void

    .line 2010
    :cond_4
    :try_start_6
    const-string v0, "FlurryAgent"

    const-string v2, "Unexpected file type"

    invoke-static {v0, v2}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_0

    goto/16 :goto_0

    .line 2013
    :catch_0
    move-exception v0

    .line 2015
    :goto_3
    :try_start_7
    const-string v2, "FlurryAgent"

    const-string v3, "Error when loading persistent file"

    invoke-static {v2, v3, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 2019
    :try_start_8
    invoke-static {v1}, Lcom/flurry/android/r;->a(Ljava/io/Closeable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto/16 :goto_1

    .line 1988
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 2019
    :catchall_1
    move-exception v0

    move-object v1, v2

    :goto_4
    :try_start_9
    invoke-static {v1}, Lcom/flurry/android/r;->a(Ljava/io/Closeable;)V

    throw v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 2033
    :cond_5
    :try_start_a
    const-string v0, "FlurryAgent"

    const-string v1, "Cannot delete persistence file"

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_1

    goto/16 :goto_2

    .line 2037
    :catch_1
    move-exception v0

    .line 2039
    :try_start_b
    const-string v1, "FlurryAgent"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_2

    .line 2044
    :cond_6
    const-string v0, "FlurryAgent"

    const-string v1, "Agent cache file doesn\'t exist."

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    goto/16 :goto_2

    .line 2019
    :catchall_2
    move-exception v0

    goto :goto_4

    .line 2013
    :catch_2
    move-exception v0

    move-object v1, v2

    goto :goto_3
.end method

.method static a(Landroid/content/Context;J)V
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 388
    sget-boolean v0, Lcom/flurry/android/FlurryAgent;->o:Z

    if-nez v0, :cond_0

    .line 390
    const-string v0, "FlurryAgent"

    const-string v1, "Cannot accept Offer. AppCircle is not enabled"

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 393
    :cond_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    iget-object v0, v0, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    invoke-virtual {v0, p0, p1, p2}, Lcom/flurry/android/v;->a(Landroid/content/Context;J)V

    .line 394
    return-void
.end method

.method static a(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 362
    sget-boolean v0, Lcom/flurry/android/FlurryAgent;->o:Z

    if-nez v0, :cond_0

    .line 365
    :goto_0
    return-void

    .line 364
    :cond_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    iget-object v0, v0, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    invoke-virtual {v0, p0, p1}, Lcom/flurry/android/v;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private declared-synchronized a(Landroid/content/Context;Z)V
    .locals 5
    .parameter
    .parameter

    .prologue
    .line 1174
    monitor-enter p0

    if-eqz p1, :cond_0

    .line 1176
    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->y:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 1177
    if-nez v0, :cond_0

    .line 1179
    const-string v0, "FlurryAgent"

    const-string v1, "onEndSession called without context from corresponding onStartSession"

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1182
    :cond_0
    iget-boolean v0, p0, Lcom/flurry/android/FlurryAgent;->v:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->y:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1184
    const-string v0, "FlurryAgent"

    const-string v1, "Ending session"

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 1186
    invoke-direct {p0}, Lcom/flurry/android/FlurryAgent;->o()V

    .line 1188
    if-nez p1, :cond_4

    const/4 v0, 0x0

    .line 1190
    :goto_0
    if-eqz p1, :cond_1

    .line 1192
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 1193
    iget-object v2, p0, Lcom/flurry/android/FlurryAgent;->A:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1195
    const-string v2, "FlurryAgent"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onEndSession called from different application package, expected: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/flurry/android/FlurryAgent;->A:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " actual: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;)I

    .line 1199
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    .line 1200
    iput-wide v1, p0, Lcom/flurry/android/FlurryAgent;->x:J

    .line 1201
    iget-wide v3, p0, Lcom/flurry/android/FlurryAgent;->L:J

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lcom/flurry/android/FlurryAgent;->M:J

    .line 1202
    iget-object v1, p0, Lcom/flurry/android/FlurryAgent;->F:Ljava/lang/String;

    if-nez v1, :cond_2

    const-string v1, "FlurryAgent"

    const-string v2, "Not creating report because of bad Android ID or generated ID is null"

    invoke-static {v1, v2}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    new-instance v1, Lcom/flurry/android/b;

    invoke-direct {v1, p0, p2, v0}, Lcom/flurry/android/b;-><init>(Lcom/flurry/android/FlurryAgent;ZLandroid/content/Context;)V

    invoke-direct {p0, v1}, Lcom/flurry/android/FlurryAgent;->a(Ljava/lang/Runnable;)V

    .line 1204
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/flurry/android/FlurryAgent;->v:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1206
    :cond_3
    monitor-exit p0

    return-void

    .line 1188
    :cond_4
    :try_start_1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 1174
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method static a(Lcom/flurry/android/AppCircleCallback;)V
    .locals 1
    .parameter

    .prologue
    .line 426
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    iget-object v0, v0, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    invoke-virtual {v0, p0}, Lcom/flurry/android/v;->a(Lcom/flurry/android/AppCircleCallback;)V

    .line 427
    return-void
.end method

.method static synthetic a(Lcom/flurry/android/FlurryAgent;Landroid/content/Context;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 87
    invoke-direct {p0, p1}, Lcom/flurry/android/FlurryAgent;->a(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic a(Lcom/flurry/android/FlurryAgent;Landroid/content/Context;Z)V
    .locals 3
    .parameter
    .parameter
    .parameter

    .prologue
    .line 87
    const/4 v0, 0x0

    if-eqz p2, :cond_0

    :try_start_0
    invoke-direct {p0, p1}, Lcom/flurry/android/FlurryAgent;->d(Landroid/content/Context;)Landroid/location/Location;

    move-result-object v0

    :cond_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->U:Landroid/location/Location;

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    sget-boolean v0, Lcom/flurry/android/FlurryAgent;->o:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    invoke-virtual {v0}, Lcom/flurry/android/v;->b()V

    :cond_1
    invoke-static {p1}, Lcom/flurry/android/FlurryAgent;->e(Landroid/content/Context;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->I:[B

    const-string v0, "FlurryAgent"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fetching IMEI: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/android/FlurryAgent;->I:[B

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->c(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/flurry/android/FlurryAgent;->c(Z)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    :goto_0
    return-void

    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v0
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    move-exception v0

    const-string v1, "FlurryAgent"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private a(Ljava/io/DataInputStream;)V
    .locals 14
    .parameter

    .prologue
    const/4 v7, 0x0

    .line 1775
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 1776
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 1777
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 1778
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 1779
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 1780
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 1783
    :cond_0
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v9

    .line 1784
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    .line 1785
    packed-switch v9, :pswitch_data_0

    .line 1886
    :pswitch_0
    const-string v8, "FlurryAgent"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Unknown chunkType: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v10}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 1887
    invoke-virtual {p1, v0}, Ljava/io/DataInputStream;->skipBytes(I)I

    .line 1890
    :cond_1
    :goto_0
    :pswitch_1
    const/16 v0, 0x108

    if-ne v9, v0, :cond_0

    .line 1892
    sget-boolean v0, Lcom/flurry/android/FlurryAgent;->o:Z

    if-eqz v0, :cond_3

    .line 1894
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1896
    const-string v0, "FlurryAgent"

    const-string v7, "No ads from server"

    invoke-static {v0, v7}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 1898
    :cond_2
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/android/v;->a(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V

    .line 1900
    :cond_3
    return-void

    .line 1788
    :pswitch_2
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    goto :goto_0

    .line 1792
    :pswitch_3
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result v8

    .line 1794
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v10

    .line 1796
    new-array v11, v10, [Lcom/flurry/android/w;

    move v0, v7

    .line 1797
    :goto_1
    if-ge v0, v10, :cond_4

    .line 1799
    new-instance v12, Lcom/flurry/android/w;

    invoke-direct {v12, p1}, Lcom/flurry/android/w;-><init>(Ljava/io/DataInput;)V

    .line 1800
    aput-object v12, v11, v0

    .line 1797
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1803
    :cond_4
    invoke-static {v8}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    invoke-interface {v1, v0, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1806
    :pswitch_4
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v8

    move v0, v7

    .line 1807
    :goto_2
    if-ge v0, v8, :cond_1

    .line 1809
    new-instance v10, Lcom/flurry/android/AdImage;

    invoke-direct {v10, p1}, Lcom/flurry/android/AdImage;-><init>(Ljava/io/DataInput;)V

    .line 1810
    iget-wide v11, v10, Lcom/flurry/android/AdImage;->a:J

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-interface {v4, v11, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1807
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 1815
    :pswitch_5
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v8

    move v0, v7

    .line 1816
    :goto_3
    if-ge v0, v8, :cond_1

    .line 1818
    new-instance v10, Lcom/flurry/android/e;

    invoke-direct {v10, p1}, Lcom/flurry/android/e;-><init>(Ljava/io/DataInput;)V

    .line 1819
    iget-object v11, v10, Lcom/flurry/android/e;->a:Ljava/lang/String;

    invoke-interface {v2, v11, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1820
    const-string v11, "FlurryAgent"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Parsed hook: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v11, v10}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 1816
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 1825
    :pswitch_6
    invoke-virtual {p1, v0}, Ljava/io/DataInputStream;->skipBytes(I)I

    goto/16 :goto_0

    .line 1828
    :pswitch_7
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result v8

    move v0, v7

    .line 1829
    :goto_4
    if-ge v0, v8, :cond_1

    .line 1831
    new-instance v10, Lcom/flurry/android/c;

    invoke-direct {v10, p1}, Lcom/flurry/android/c;-><init>(Ljava/io/DataInput;)V

    .line 1832
    iget-byte v11, v10, Lcom/flurry/android/c;->a:B

    invoke-static {v11}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v11

    invoke-interface {v3, v11, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1829
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 1837
    :pswitch_8
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result v10

    move v8, v7

    .line 1838
    :goto_5
    if-ge v8, v10, :cond_1

    .line 1840
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readByte()B

    move-result v0

    .line 1841
    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/c;

    .line 1842
    if-eqz v0, :cond_5

    .line 1844
    invoke-virtual {v0, p1}, Lcom/flurry/android/c;->a(Ljava/io/DataInput;)V

    .line 1838
    :cond_5
    add-int/lit8 v0, v8, 0x1

    move v8, v0

    goto :goto_5

    .line 1850
    :pswitch_9
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v8

    move v0, v7

    .line 1852
    :goto_6
    if-ge v0, v8, :cond_1

    .line 1854
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v10

    .line 1855
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readShort()S

    move-result v12

    .line 1856
    invoke-static {v12}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v12

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-interface {v6, v12, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1852
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 1860
    :pswitch_a
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v10

    .line 1862
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/am;

    .line 1863
    if-nez v0, :cond_6

    .line 1865
    new-instance v0, Lcom/flurry/android/am;

    invoke-direct {v0}, Lcom/flurry/android/am;-><init>()V

    .line 1867
    :cond_6
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v0, Lcom/flurry/android/am;->a:Ljava/lang/String;

    .line 1868
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v8

    iput v8, v0, Lcom/flurry/android/am;->c:I

    .line 1869
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-interface {v5, v8, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 1876
    :pswitch_b
    invoke-virtual {p1, v0}, Ljava/io/DataInputStream;->skipBytes(I)I

    goto/16 :goto_0

    .line 1880
    :pswitch_c
    invoke-virtual {p1, v0}, Ljava/io/DataInputStream;->skipBytes(I)I

    goto/16 :goto_0

    .line 1785
    nop

    :pswitch_data_0
    .packed-switch 0x102
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_5
        :pswitch_1
        :pswitch_0
        :pswitch_7
        :pswitch_0
        :pswitch_9
        :pswitch_b
        :pswitch_6
        :pswitch_8
        :pswitch_a
        :pswitch_c
    .end packed-switch
.end method

.method private a(Ljava/lang/Runnable;)V
    .locals 1
    .parameter

    .prologue
    .line 1384
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->s:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1385
    return-void
.end method

.method private declared-synchronized a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1491
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->Z:Ljava/util/List;

    if-nez v0, :cond_0

    .line 1493
    const-string v0, "FlurryAgent"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onError called before onStartSession.  Error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1513
    :goto_0
    monitor-exit p0

    return-void

    .line 1497
    :cond_0
    :try_start_1
    iget v0, p0, Lcom/flurry/android/FlurryAgent;->T:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/flurry/android/FlurryAgent;->T:I

    .line 1498
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->Z:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0xa

    if-ge v0, v1, :cond_1

    .line 1500
    new-instance v0, Lcom/flurry/android/ab;

    invoke-direct {v0}, Lcom/flurry/android/ab;-><init>()V

    .line 1501
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/flurry/android/ab;->b:J

    .line 1502
    const/16 v1, 0xff

    invoke-static {p1, v1}, Lcom/flurry/android/r;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flurry/android/ab;->c:Ljava/lang/String;

    .line 1503
    const/16 v1, 0x200

    invoke-static {p2, v1}, Lcom/flurry/android/r;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flurry/android/ab;->d:Ljava/lang/String;

    .line 1504
    const/16 v1, 0xff

    invoke-static {p3, v1}, Lcom/flurry/android/r;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/flurry/android/ab;->e:Ljava/lang/String;

    .line 1505
    iget-object v1, p0, Lcom/flurry/android/FlurryAgent;->Z:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1507
    const-string v1, "FlurryAgent"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error logged: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v0, v0, Lcom/flurry/android/ab;->c:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1491
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 1511
    :cond_1
    :try_start_2
    const-string v0, "FlurryAgent"

    const-string v1, "Max errors logged. No more errors logged."

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method private declared-synchronized a(Ljava/lang/String;Ljava/util/Map;Z)V
    .locals 7
    .parameter
    .parameter
    .parameter

    .prologue
    const/16 v6, 0x3e80

    .line 1394
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->W:Ljava/util/List;

    if-nez v0, :cond_1

    .line 1396
    const-string v0, "FlurryAgent"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onEvent called before onStartSession.  Event: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1473
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 1400
    :cond_1
    :try_start_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/flurry/android/FlurryAgent;->L:J

    sub-long v3, v0, v2

    .line 1402
    const/16 v0, 0xff

    invoke-static {p1, v0}, Lcom/flurry/android/r;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .line 1403
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 1407
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->V:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/g;

    .line 1408
    if-nez v0, :cond_4

    .line 1410
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->V:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    const/16 v2, 0x64

    if-ge v0, v2, :cond_3

    .line 1412
    new-instance v0, Lcom/flurry/android/g;

    invoke-direct {v0}, Lcom/flurry/android/g;-><init>()V

    .line 1413
    const/4 v2, 0x1

    iput v2, v0, Lcom/flurry/android/g;->a:I

    .line 1414
    iget-object v2, p0, Lcom/flurry/android/FlurryAgent;->V:Ljava/util/Map;

    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1416
    const-string v0, "FlurryAgent"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Event count incremented: "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 1433
    :cond_2
    :goto_1
    sget-boolean v0, Lcom/flurry/android/FlurryAgent;->j:Z

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->W:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v2, 0xc8

    if-ge v0, v2, :cond_7

    iget v0, p0, Lcom/flurry/android/FlurryAgent;->Y:I

    if-ge v0, v6, :cond_7

    .line 1437
    if-nez p2, :cond_8

    .line 1439
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    .line 1441
    :goto_2
    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v0

    const/16 v5, 0xa

    if-le v0, v5, :cond_5

    .line 1443
    const-string v0, "FlurryAgent"

    invoke-static {v0}, Lcom/flurry/android/ai;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1445
    const-string v0, "FlurryAgent"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "MaxEventParams exceeded: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 1394
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 1420
    :cond_3
    :try_start_2
    const-string v0, "FlurryAgent"

    invoke-static {v0}, Lcom/flurry/android/ai;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1422
    const-string v0, "FlurryAgent"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Too many different events. Event not counted: "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 1428
    :cond_4
    iget v2, v0, Lcom/flurry/android/g;->a:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v0, Lcom/flurry/android/g;->a:I

    .line 1430
    const-string v0, "FlurryAgent"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Event count incremented: "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 1450
    :cond_5
    new-instance v0, Lcom/flurry/android/i;

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/flurry/android/i;-><init>(Ljava/lang/String;Ljava/util/Map;JZ)V

    .line 1452
    invoke-virtual {v0}, Lcom/flurry/android/i;->a()[B

    move-result-object v2

    array-length v2, v2

    iget v3, p0, Lcom/flurry/android/FlurryAgent;->Y:I

    add-int/2addr v2, v3

    if-gt v2, v6, :cond_6

    .line 1454
    iget-object v2, p0, Lcom/flurry/android/FlurryAgent;->W:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1455
    iget v2, p0, Lcom/flurry/android/FlurryAgent;->Y:I

    invoke-virtual {v0}, Lcom/flurry/android/i;->a()[B

    move-result-object v0

    array-length v0, v0

    add-int/2addr v0, v2

    iput v0, p0, Lcom/flurry/android/FlurryAgent;->Y:I

    .line 1457
    const-string v0, "FlurryAgent"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Logged event: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1462
    :cond_6
    const/16 v0, 0x3e80

    iput v0, p0, Lcom/flurry/android/FlurryAgent;->Y:I

    .line 1463
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/flurry/android/FlurryAgent;->X:Z

    .line 1465
    const-string v0, "FlurryAgent"

    const-string v1, "Event Log size exceeded. No more event details logged."

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1471
    :cond_7
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/flurry/android/FlurryAgent;->X:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_0

    :cond_8
    move-object v2, p2

    goto/16 :goto_2
.end method

.method static a(Ljava/util/List;)V
    .locals 1
    .parameter

    .prologue
    .line 398
    sget-boolean v0, Lcom/flurry/android/FlurryAgent;->o:Z

    if-nez v0, :cond_0

    .line 401
    :goto_0
    return-void

    .line 400
    :cond_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    iget-object v0, v0, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    invoke-virtual {v0, p0}, Lcom/flurry/android/v;->a(Ljava/util/List;)V

    goto :goto_0
.end method

.method static a(Z)V
    .locals 1
    .parameter

    .prologue
    .line 405
    sget-boolean v0, Lcom/flurry/android/FlurryAgent;->o:Z

    if-nez v0, :cond_0

    .line 408
    :goto_0
    return-void

    .line 407
    :cond_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    iget-object v0, v0, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    invoke-virtual {v0, p0}, Lcom/flurry/android/v;->a(Z)V

    goto :goto_0
.end method

.method static a()Z
    .locals 1

    .prologue
    .line 412
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    iget-object v0, v0, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    invoke-virtual {v0}, Lcom/flurry/android/v;->h()Z

    move-result v0

    return v0
.end method

.method static synthetic a(Lcom/flurry/android/FlurryAgent;)Z
    .locals 1
    .parameter

    .prologue
    .line 87
    iget-boolean v0, p0, Lcom/flurry/android/FlurryAgent;->w:Z

    return v0
.end method

.method private static a(Ljava/io/File;)Z
    .locals 4
    .parameter

    .prologue
    .line 2207
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 2208
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    .line 2209
    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 2211
    const-string v1, "FlurryAgent"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to create persistent dir: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;)I

    .line 2212
    const/4 v0, 0x0

    .line 2214
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private a([B)Z
    .locals 5
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 1667
    invoke-static {}, Lcom/flurry/android/FlurryAgent;->m()Ljava/lang/String;

    move-result-object v0

    .line 1668
    if-nez v0, :cond_1

    move v0, v1

    .line 1703
    :cond_0
    :goto_0
    return v0

    .line 1675
    :cond_1
    :try_start_0
    invoke-direct {p0, p1, v0}, Lcom/flurry/android/FlurryAgent;->a([BLjava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 1681
    :goto_1
    if-nez v0, :cond_0

    sget-object v2, Lcom/flurry/android/FlurryAgent;->c:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 1685
    sget-boolean v2, Lcom/flurry/android/FlurryAgent;->k:Z

    if-eqz v2, :cond_0

    sget-boolean v2, Lcom/flurry/android/FlurryAgent;->l:Z

    if-nez v2, :cond_0

    .line 1687
    sget-object v2, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    monitor-enter v2

    .line 1688
    const/4 v3, 0x1

    :try_start_1
    sput-boolean v3, Lcom/flurry/android/FlurryAgent;->l:Z

    .line 1689
    invoke-static {}, Lcom/flurry/android/FlurryAgent;->m()Ljava/lang/String;

    move-result-object v3

    .line 1690
    if-nez v3, :cond_2

    .line 1692
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move v0, v1

    goto :goto_0

    .line 1677
    :catch_0
    move-exception v0

    .line 1679
    const-string v2, "FlurryAgent"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Sending report exception: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v1

    goto :goto_1

    .line 1694
    :cond_2
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1697
    :try_start_3
    invoke-direct {p0, p1, v3}, Lcom/flurry/android/FlurryAgent;->a([BLjava/lang/String;)Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    move-result v0

    goto :goto_0

    .line 1694
    :catchall_0
    move-exception v0

    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v0

    :catch_1
    move-exception v1

    goto :goto_0
.end method

.method private a([BLjava/lang/String;)Z
    .locals 6
    .parameter
    .parameter

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 1709
    const-string v2, "local"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1746
    :goto_0
    return v0

    .line 1714
    :cond_0
    const-string v2, "FlurryAgent"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Sending report to: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 1716
    new-instance v2, Lorg/apache/http/entity/ByteArrayEntity;

    invoke-direct {v2, p1}, Lorg/apache/http/entity/ByteArrayEntity;-><init>([B)V

    .line 1717
    const-string v3, "application/octet-stream"

    invoke-virtual {v2, v3}, Lorg/apache/http/entity/ByteArrayEntity;->setContentType(Ljava/lang/String;)V

    .line 1718
    new-instance v3, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v3, p2}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 1719
    invoke-virtual {v3, v2}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 1721
    new-instance v2, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v2}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 1722
    const/16 v4, 0x2710

    invoke-static {v2, v4}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 1723
    const/16 v4, 0x3a98

    invoke-static {v2, v4}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 1724
    invoke-virtual {v3}, Lorg/apache/http/client/methods/HttpPost;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v4

    const-string v5, "http.protocol.expect-continue"

    invoke-interface {v4, v5, v1}, Lorg/apache/http/params/HttpParams;->setBooleanParameter(Ljava/lang/String;Z)Lorg/apache/http/params/HttpParams;

    .line 1726
    invoke-direct {p0, v2}, Lcom/flurry/android/FlurryAgent;->a(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/client/HttpClient;

    move-result-object v2

    .line 1727
    invoke-interface {v2, v3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    .line 1728
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v3

    .line 1729
    monitor-enter p0

    .line 1731
    const/16 v4, 0xc8

    if-ne v3, v4, :cond_2

    .line 1733
    :try_start_0
    const-string v1, "FlurryAgent"

    const-string v3, "Report successful"

    invoke-static {v1, v3}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 1734
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/flurry/android/FlurryAgent;->G:Z

    .line 1735
    iget-object v1, p0, Lcom/flurry/android/FlurryAgent;->J:Ljava/util/List;

    iget-object v3, p0, Lcom/flurry/android/FlurryAgent;->D:Ljava/util/List;

    invoke-interface {v1, v3}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 1738
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    const-string v2, "FlurryAgent"

    const-string v3, "Processing report response"

    invoke-static {v2, v3}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v1, :cond_1

    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->getContentLength()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1

    :try_start_1
    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v2

    new-instance v3, Ljava/io/DataInputStream;

    invoke-direct {v3, v2}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {p0, v3}, Lcom/flurry/android/FlurryAgent;->a(Ljava/io/DataInputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->consumeContent()V

    .line 1744
    :cond_1
    :goto_1
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/flurry/android/FlurryAgent;->D:Ljava/util/List;

    .line 1745
    monitor-exit p0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 1738
    :catchall_1
    move-exception v0

    :try_start_3
    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->consumeContent()V

    throw v0

    .line 1742
    :cond_2
    const-string v0, "FlurryAgent"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Report failed. HTTP response: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move v0, v1

    goto :goto_1
.end method

.method public static addUserCookie(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 431
    sget-boolean v0, Lcom/flurry/android/FlurryAgent;->o:Z

    if-nez v0, :cond_0

    .line 434
    :goto_0
    return-void

    .line 433
    :cond_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    iget-object v0, v0, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    invoke-virtual {v0, p0, p1}, Lcom/flurry/android/v;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method static b()Lcom/flurry/android/v;
    .locals 1

    .prologue
    .line 1058
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    iget-object v0, v0, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    return-object v0
.end method

.method private b(Landroid/content/Context;)Ljava/lang/String;
    .locals 7
    .parameter

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 2265
    iget-object v2, p0, Lcom/flurry/android/FlurryAgent;->F:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 2268
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->F:Ljava/lang/String;

    .line 2304
    :cond_0
    :goto_0
    return-object v0

    .line 2272
    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "android_id"

    invoke-static {v2, v3}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 2273
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_2

    const-string v2, "null"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    :goto_1
    if-eqz v1, :cond_5

    .line 2275
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AND"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 2273
    :cond_3
    sget-object v4, Lcom/flurry/android/FlurryAgent;->b:[Ljava/lang/String;

    array-length v5, v4

    move v2, v1

    :goto_2
    if-ge v2, v5, :cond_4

    aget-object v6, v4, v2

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_4
    const/4 v1, 0x1

    goto :goto_1

    .line 2280
    :cond_5
    const-string v1, ".flurryb."

    invoke-virtual {p1, v1}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 2281
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2286
    :try_start_0
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 2287
    new-instance v2, Ljava/io/DataInputStream;

    invoke-direct {v2, v3}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 2288
    :try_start_1
    invoke-virtual {v2}, Ljava/io/DataInputStream;->readInt()I

    .line 2289
    invoke-virtual {v2}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    .line 2297
    invoke-static {v2}, Lcom/flurry/android/r;->a(Ljava/io/Closeable;)V

    goto :goto_0

    .line 2291
    :catch_0
    move-exception v1

    move-object v2, v0

    .line 2293
    :goto_3
    :try_start_2
    const-string v3, "FlurryAgent"

    const-string v4, "Error when loading b file"

    invoke-static {v3, v4, v1}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 2297
    invoke-static {v2}, Lcom/flurry/android/r;->a(Ljava/io/Closeable;)V

    goto :goto_0

    :catchall_0
    move-exception v1

    move-object v2, v0

    move-object v0, v1

    :goto_4
    invoke-static {v2}, Lcom/flurry/android/r;->a(Ljava/io/Closeable;)V

    throw v0

    :catchall_1
    move-exception v0

    goto :goto_4

    .line 2291
    :catch_1
    move-exception v1

    goto :goto_3
.end method

.method static b(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .parameter

    .prologue
    .line 381
    sget-boolean v0, Lcom/flurry/android/FlurryAgent;->o:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 383
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    iget-object v0, v0, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    invoke-virtual {v0, p0}, Lcom/flurry/android/v;->c(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method private declared-synchronized b(Landroid/content/Context;Ljava/lang/String;)V
    .locals 8
    .parameter
    .parameter

    .prologue
    .line 1063
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->z:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->z:Ljava/lang/String;

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1065
    const-string v0, "FlurryAgent"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onStartSession called with different api keys: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/android/FlurryAgent;->z:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " and "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;)I

    .line 1068
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->y:Ljava/util/Map;

    invoke-interface {v0, p1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 1069
    if-eqz v0, :cond_1

    .line 1071
    const-string v0, "FlurryAgent"

    const-string v1, "onStartSession called with duplicate context, use a specific Activity or Service as context instead of using a global context"

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1073
    :cond_1
    iget-boolean v0, p0, Lcom/flurry/android/FlurryAgent;->v:Z

    if-nez v0, :cond_8

    .line 1075
    const-string v0, "FlurryAgent"

    const-string v1, "Initializing Flurry session"

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 1077
    sget-object v0, Lcom/flurry/android/FlurryAgent;->q:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 1078
    sget-object v0, Lcom/flurry/android/FlurryAgent;->r:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 1080
    iput-object p2, p0, Lcom/flurry/android/FlurryAgent;->z:Ljava/lang/String;

    .line 1081
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ".flurryagent."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/FlurryAgent;->z:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/16 v2, 0x10

    invoke-static {v1, v2}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->u:Ljava/io/File;

    .line 1082
    const-string v0, ".flurryb."

    invoke-virtual {p1, v0}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->t:Ljava/io/File;

    .line 1083
    sget-boolean v0, Lcom/flurry/android/FlurryAgent;->m:Z

    if-eqz v0, :cond_2

    .line 1085
    new-instance v0, Lcom/flurry/android/FlurryAgent$FlurryDefaultExceptionHandler;

    invoke-direct {v0}, Lcom/flurry/android/FlurryAgent$FlurryDefaultExceptionHandler;-><init>()V

    invoke-static {v0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 1088
    :cond_2
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 1090
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->B:Ljava/lang/String;

    if-nez v0, :cond_3

    .line 1092
    invoke-static {v1}, Lcom/flurry/android/FlurryAgent;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->B:Ljava/lang/String;

    .line 1094
    :cond_3
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 1095
    iget-object v2, p0, Lcom/flurry/android/FlurryAgent;->A:Ljava/lang/String;

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/flurry/android/FlurryAgent;->A:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 1097
    const-string v2, "FlurryAgent"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onStartSession called from different application packages: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/flurry/android/FlurryAgent;->A:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " and "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;)I

    .line 1099
    :cond_4
    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->A:Ljava/lang/String;

    .line 1101
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    .line 1102
    iget-wide v4, p0, Lcom/flurry/android/FlurryAgent;->x:J

    sub-long v4, v2, v4

    sget-wide v6, Lcom/flurry/android/FlurryAgent;->i:J

    cmp-long v0, v4, v6

    if-lez v0, :cond_a

    .line 1104
    const-string v0, "FlurryAgent"

    const-string v4, "New session"

    invoke-static {v0, v4}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 1107
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/flurry/android/FlurryAgent;->K:J

    .line 1108
    iput-wide v2, p0, Lcom/flurry/android/FlurryAgent;->L:J

    .line 1109
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lcom/flurry/android/FlurryAgent;->M:J

    .line 1110
    const-string v0, ""

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->Q:Ljava/lang/String;

    .line 1111
    const/4 v0, 0x0

    iput v0, p0, Lcom/flurry/android/FlurryAgent;->T:I

    .line 1112
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->U:Landroid/location/Location;

    .line 1113
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->O:Ljava/lang/String;

    .line 1114
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "_"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->N:Ljava/lang/String;

    .line 1115
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->V:Ljava/util/Map;

    .line 1116
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->W:Ljava/util/List;

    .line 1117
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/android/FlurryAgent;->X:Z

    .line 1118
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->Z:Ljava/util/List;

    .line 1119
    const/4 v0, 0x0

    iput v0, p0, Lcom/flurry/android/FlurryAgent;->Y:I

    .line 1120
    const/4 v0, 0x0

    iput v0, p0, Lcom/flurry/android/FlurryAgent;->aa:I

    .line 1124
    sget-boolean v0, Lcom/flurry/android/FlurryAgent;->o:Z

    if-eqz v0, :cond_6

    .line 1126
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    invoke-virtual {v0}, Lcom/flurry/android/v;->a()Z

    move-result v0

    if-nez v0, :cond_5

    .line 1128
    const-string v0, "FlurryAgent"

    const-string v2, "Initializing AppCircle"

    invoke-static {v0, v2}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 1130
    new-instance v2, Lcom/flurry/android/a;

    invoke-direct {v2}, Lcom/flurry/android/a;-><init>()V

    .line 1131
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->z:Ljava/lang/String;

    iput-object v0, v2, Lcom/flurry/android/a;->a:Ljava/lang/String;

    .line 1132
    iget-wide v3, p0, Lcom/flurry/android/FlurryAgent;->H:J

    iput-wide v3, v2, Lcom/flurry/android/a;->b:J

    .line 1133
    sget-object v0, Lcom/flurry/android/FlurryAgent;->d:Ljava/lang/String;

    if-eqz v0, :cond_9

    sget-object v0, Lcom/flurry/android/FlurryAgent;->d:Ljava/lang/String;

    :goto_0
    iput-object v0, v2, Lcom/flurry/android/a;->c:Ljava/lang/String;

    .line 1134
    invoke-static {}, Lcom/flurry/android/FlurryAgent;->c()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/flurry/android/a;->d:Ljava/lang/String;

    .line 1135
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->s:Landroid/os/Handler;

    iput-object v0, v2, Lcom/flurry/android/a;->e:Landroid/os/Handler;

    .line 1137
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    invoke-virtual {v0, p1, v2}, Lcom/flurry/android/v;->a(Landroid/content/Context;Lcom/flurry/android/a;)V

    .line 1139
    const-string v0, "FlurryAgent"

    const-string v2, "AppCircle initialized"

    invoke-static {v0, v2}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 1141
    :cond_5
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    iget-wide v2, p0, Lcom/flurry/android/FlurryAgent;->K:J

    iget-wide v4, p0, Lcom/flurry/android/FlurryAgent;->L:J

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/flurry/android/v;->a(JJ)V

    .line 1144
    :cond_6
    iget-boolean v0, p0, Lcom/flurry/android/FlurryAgent;->C:Z

    .line 1145
    new-instance v2, Lcom/flurry/android/d;

    invoke-direct {v2, p0, v1, v0}, Lcom/flurry/android/d;-><init>(Lcom/flurry/android/FlurryAgent;Landroid/content/Context;Z)V

    invoke-direct {p0, v2}, Lcom/flurry/android/FlurryAgent;->a(Ljava/lang/Runnable;)V

    .line 1168
    :cond_7
    :goto_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/android/FlurryAgent;->v:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1170
    :cond_8
    monitor-exit p0

    return-void

    .line 1133
    :cond_9
    :try_start_1
    sget-object v0, Lcom/flurry/android/FlurryAgent;->e:Ljava/lang/String;

    goto :goto_0

    .line 1161
    :cond_a
    const-string v0, "FlurryAgent"

    const-string v1, "Continuing previous session"

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 1163
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->J:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_7

    .line 1165
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->J:Ljava/util/List;

    iget-object v1, p0, Lcom/flurry/android/FlurryAgent;->J:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 1063
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method static synthetic b(Lcom/flurry/android/FlurryAgent;)V
    .locals 0
    .parameter

    .prologue
    .line 87
    invoke-direct {p0}, Lcom/flurry/android/FlurryAgent;->k()V

    return-void
.end method

.method static synthetic b(Lcom/flurry/android/FlurryAgent;Landroid/content/Context;)V
    .locals 5
    .parameter
    .parameter

    .prologue
    const/4 v0, 0x0

    .line 87
    :try_start_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iget-wide v3, p0, Lcom/flurry/android/FlurryAgent;->x:J

    sub-long/2addr v1, v3

    iget-boolean v3, p0, Lcom/flurry/android/FlurryAgent;->v:Z

    if-nez v3, :cond_0

    sget-wide v3, Lcom/flurry/android/FlurryAgent;->i:J

    cmp-long v1, v1, v3

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/flurry/android/FlurryAgent;->J:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :try_start_2
    invoke-direct {p0, v0}, Lcom/flurry/android/FlurryAgent;->c(Z)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    :cond_1
    :goto_0
    return-void

    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v0
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    move-exception v0

    const-string v1, "FlurryAgent"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private declared-synchronized b(Ljava/io/DataInputStream;)V
    .locals 5
    .parameter

    .prologue
    const/4 v2, 0x2

    const/4 v0, 0x0

    .line 2071
    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v1

    .line 2075
    if-le v1, v2, :cond_0

    .line 2077
    const-string v0, "FlurryAgent"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown agent file version: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;)I

    .line 2078
    new-instance v0, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown agent file version: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2071
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 2081
    :cond_0
    if-lt v1, v2, :cond_4

    .line 2083
    :try_start_1
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v1

    .line 2084
    const-string v2, "FlurryAgent"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Loading API key: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/flurry/android/FlurryAgent;->z:Ljava/lang/String;

    invoke-static {v4}, Lcom/flurry/android/FlurryAgent;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 2086
    iget-object v2, p0, Lcom/flurry/android/FlurryAgent;->z:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 2088
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v1

    .line 2089
    iget-object v2, p0, Lcom/flurry/android/FlurryAgent;->F:Ljava/lang/String;

    if-nez v2, :cond_1

    .line 2091
    const-string v2, "FlurryAgent"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Loading phoneId: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 2094
    :cond_1
    iput-object v1, p0, Lcom/flurry/android/FlurryAgent;->F:Ljava/lang/String;

    .line 2095
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readBoolean()Z

    move-result v1

    iput-boolean v1, p0, Lcom/flurry/android/FlurryAgent;->G:Z

    .line 2096
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/flurry/android/FlurryAgent;->H:J

    .line 2098
    const-string v1, "FlurryAgent"

    const-string v2, "Loading session reports"

    invoke-static {v1, v2}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 2103
    :goto_0
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v1

    .line 2104
    if-eqz v1, :cond_2

    .line 2106
    new-array v1, v1, [B

    .line 2109
    invoke-virtual {p1, v1}, Ljava/io/DataInputStream;->readFully([B)V

    .line 2110
    iget-object v2, p0, Lcom/flurry/android/FlurryAgent;->J:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v2, v3, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 2112
    const-string v1, "FlurryAgent"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Session report added: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 2115
    :cond_2
    const-string v0, "FlurryAgent"

    const-string v1, "Persistent file loaded"

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 2117
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/android/FlurryAgent;->w:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2128
    :goto_1
    monitor-exit p0

    return-void

    .line 2121
    :cond_3
    :try_start_2
    const-string v0, "FlurryAgent"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Api keys do not match, old: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v1}, Lcom/flurry/android/FlurryAgent;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", new: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/android/FlurryAgent;->z:Ljava/lang/String;

    invoke-static {v2}, Lcom/flurry/android/FlurryAgent;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 2126
    :cond_4
    const-string v0, "FlurryAgent"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Deleting old file version: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1
.end method

.method private declared-synchronized b(Z)[B
    .locals 11
    .parameter

    .prologue
    const/4 v1, 0x0

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1518
    monitor-enter p0

    .line 1522
    :try_start_0
    new-instance v5, Lcom/flurry/android/CrcMessageDigest;

    invoke-direct {v5}, Lcom/flurry/android/CrcMessageDigest;-><init>()V

    .line 1523
    new-instance v6, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v6}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1524
    new-instance v7, Ljava/security/DigestOutputStream;

    invoke-direct {v7, v6, v5}, Ljava/security/DigestOutputStream;-><init>(Ljava/io/OutputStream;Ljava/security/MessageDigest;)V

    .line 1525
    new-instance v2, Ljava/io/DataOutputStream;

    invoke-direct {v2, v7}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 1527
    const/16 v0, 0x16

    :try_start_1
    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1528
    sget-boolean v0, Lcom/flurry/android/FlurryAgent;->o:Z

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 1530
    const/4 v0, 0x1

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1537
    :goto_0
    sget-boolean v0, Lcom/flurry/android/FlurryAgent;->o:Z

    if-eqz v0, :cond_1

    .line 1540
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    invoke-virtual {v0}, Lcom/flurry/android/v;->d()J

    move-result-wide v8

    invoke-virtual {v2, v8, v9}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 1541
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    invoke-virtual {v0}, Lcom/flurry/android/v;->e()Ljava/util/Set;

    move-result-object v0

    .line 1542
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v8

    invoke-virtual {v2, v8}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1544
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    .line 1546
    const/4 v0, 0x1

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 1547
    invoke-virtual {v2, v9, v10}, Ljava/io/DataOutputStream;->writeLong(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 1615
    :catch_0
    move-exception v0

    .line 1617
    :goto_2
    :try_start_2
    const-string v3, "FlurryAgent"

    const-string v4, "Error when generating report"

    invoke-static {v3, v4, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1621
    :try_start_3
    invoke-static {v2}, Lcom/flurry/android/r;->a(Ljava/io/Closeable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-object v0, v1

    .line 1624
    :goto_3
    monitor-exit p0

    return-object v0

    .line 1534
    :cond_0
    const/4 v0, 0x0

    :try_start_4
    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeShort(I)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_0

    .line 1621
    :catchall_0
    move-exception v0

    :goto_4
    :try_start_5
    invoke-static {v2}, Lcom/flurry/android/r;->a(Ljava/io/Closeable;)V

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 1518
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0

    .line 1552
    :cond_1
    const-wide/16 v8, 0x0

    :try_start_6
    invoke-virtual {v2, v8, v9}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 1553
    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1556
    :cond_2
    const/4 v0, 0x3

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1557
    const/16 v0, 0x7a

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1558
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v2, v8, v9}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 1559
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->z:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1560
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->B:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1563
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->I:[B

    if-nez v0, :cond_4

    move v0, v4

    .line 1564
    :goto_5
    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1565
    const/4 v8, 0x0

    invoke-virtual {v2, v8}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1566
    iget-object v8, p0, Lcom/flurry/android/FlurryAgent;->F:Ljava/lang/String;

    invoke-virtual {v2, v8}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1567
    if-le v0, v4, :cond_3

    .line 1569
    const/4 v0, 0x5

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1570
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->I:[B

    array-length v0, v0

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1571
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->I:[B

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->write([B)V

    .line 1572
    const-string v0, "FlurryAgent"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Sent IMEI: "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v8, p0, Lcom/flurry/android/FlurryAgent;->I:[B

    invoke-static {v8}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/flurry/android/ai;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 1576
    :cond_3
    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->write(I)V

    .line 1578
    iget-wide v8, p0, Lcom/flurry/android/FlurryAgent;->H:J

    invoke-virtual {v2, v8, v9}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 1579
    iget-wide v8, p0, Lcom/flurry/android/FlurryAgent;->K:J

    invoke-virtual {v2, v8, v9}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 1582
    const/4 v0, 0x6

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1583
    const-string v0, "device.model"

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1584
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1585
    const-string v0, "build.brand"

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1586
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1587
    const-string v0, "build.id"

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1588
    sget-object v0, Landroid/os/Build;->ID:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1589
    const-string v0, "version.release"

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1590
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1591
    const-string v0, "build.device"

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1592
    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1593
    const-string v0, "build.product"

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1594
    sget-object v0, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1596
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->J:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    .line 1598
    invoke-virtual {v2, v4}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1599
    :goto_6
    if-ge v3, v4, :cond_5

    .line 1601
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->J:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 1602
    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->write([B)V

    .line 1599
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_6

    .line 1563
    :cond_4
    const/4 v0, 0x2

    goto/16 :goto_5

    .line 1606
    :cond_5
    new-instance v0, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/flurry/android/FlurryAgent;->J:Ljava/util/List;

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->D:Ljava/util/List;

    .line 1609
    const/4 v0, 0x0

    invoke-virtual {v7, v0}, Ljava/security/DigestOutputStream;->on(Z)V

    .line 1610
    invoke-virtual {v5}, Lcom/flurry/android/CrcMessageDigest;->getDigest()[B

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->write([B)V

    .line 1612
    invoke-virtual {v2}, Ljava/io/DataOutputStream;->close()V

    .line 1613
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_0

    move-result-object v0

    .line 1621
    :try_start_7
    invoke-static {v2}, Lcom/flurry/android/r;->a(Ljava/io/Closeable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto/16 :goto_3

    :catchall_2
    move-exception v0

    move-object v2, v1

    goto/16 :goto_4

    .line 1615
    :catch_1
    move-exception v0

    move-object v2, v1

    goto/16 :goto_2
.end method

.method static c()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1654
    sget-object v0, Lcom/flurry/android/FlurryAgent;->f:Ljava/lang/String;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/flurry/android/FlurryAgent;->f:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->g:Ljava/lang/String;

    goto :goto_0
.end method

.method private static c(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .parameter

    .prologue
    .line 2328
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 2329
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 2330
    iget-object v1, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 2332
    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 2343
    :goto_0
    return-object v0

    .line 2334
    :cond_0
    iget v1, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    if-eqz v1, :cond_1

    .line 2336
    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    .line 2339
    :catch_0
    move-exception v0

    .line 2341
    const-string v1, "FlurryAgent"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2343
    :cond_1
    const-string v0, "Unknown"

    goto :goto_0
.end method

.method private declared-synchronized c(Landroid/content/Context;Ljava/lang/String;)V
    .locals 4
    .parameter
    .parameter

    .prologue
    .line 2235
    monitor-enter p0

    :try_start_0
    const-string v0, ".flurryb."

    invoke-virtual {p1, v0}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->t:Ljava/io/File;

    .line 2236
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->t:Ljava/io/File;

    invoke-static {v0}, Lcom/flurry/android/FlurryAgent;->a(Ljava/io/File;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 2237
    if-nez v0, :cond_0

    .line 2257
    :goto_0
    monitor-exit p0

    return-void

    .line 2242
    :cond_0
    const/4 v2, 0x0

    .line 2245
    :try_start_1
    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v1, p0, Lcom/flurry/android/FlurryAgent;->t:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 2246
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    .line 2247
    const/4 v0, 0x1

    :try_start_2
    invoke-virtual {v1, v0}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 2248
    invoke-virtual {v1, p2}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    .line 2256
    :try_start_3
    invoke-static {v1}, Lcom/flurry/android/r;->a(Ljava/io/Closeable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 2235
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 2250
    :catch_0
    move-exception v0

    move-object v1, v2

    .line 2252
    :goto_1
    :try_start_4
    const-string v2, "FlurryAgent"

    const-string v3, "Error when saving b file"

    invoke-static {v2, v3, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 2256
    :try_start_5
    invoke-static {v1}, Lcom/flurry/android/r;->a(Ljava/io/Closeable;)V

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object v1, v2

    :goto_2
    invoke-static {v1}, Lcom/flurry/android/r;->a(Ljava/io/Closeable;)V

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :catchall_2
    move-exception v0

    goto :goto_2

    .line 2250
    :catch_1
    move-exception v0

    goto :goto_1
.end method

.method static synthetic c(Lcom/flurry/android/FlurryAgent;)V
    .locals 0
    .parameter

    .prologue
    .line 87
    invoke-direct {p0}, Lcom/flurry/android/FlurryAgent;->n()V

    return-void
.end method

.method private declared-synchronized c(Ljava/lang/String;)V
    .locals 5
    .parameter

    .prologue
    .line 1478
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->W:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/i;

    .line 1480
    invoke-virtual {v0, p1}, Lcom/flurry/android/i;->a(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1482
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iget-wide v3, p0, Lcom/flurry/android/FlurryAgent;->L:J

    sub-long/2addr v1, v3

    .line 1483
    invoke-virtual {v0, v1, v2}, Lcom/flurry/android/i;->a(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1487
    :cond_1
    monitor-exit p0

    return-void

    .line 1478
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private c(Z)V
    .locals 3
    .parameter

    .prologue
    .line 1917
    :try_start_0
    const-string v0, "FlurryAgent"

    const-string v1, "generating report"

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 1918
    invoke-direct {p0, p1}, Lcom/flurry/android/FlurryAgent;->b(Z)[B

    move-result-object v0

    .line 1919
    if-eqz v0, :cond_2

    .line 1922
    invoke-direct {p0, v0}, Lcom/flurry/android/FlurryAgent;->a([B)Z

    move-result v0

    .line 1923
    if-eqz v0, :cond_0

    .line 1925
    const-string v1, "FlurryAgent"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Done sending "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v0, p0, Lcom/flurry/android/FlurryAgent;->v:Z

    if-eqz v0, :cond_1

    const-string v0, "initial "

    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "agent report"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 1928
    invoke-direct {p0}, Lcom/flurry/android/FlurryAgent;->n()V

    .line 1944
    :cond_0
    :goto_1
    return-void

    .line 1925
    :cond_1
    const-string v0, ""

    goto :goto_0

    .line 1933
    :cond_2
    const-string v0, "FlurryAgent"

    const-string v1, "Error generating report"

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 1936
    :catch_0
    move-exception v0

    .line 1938
    const-string v1, "FlurryAgent"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 1940
    :catch_1
    move-exception v0

    .line 1942
    const-string v1, "FlurryAgent"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method public static clearUserCookies()V
    .locals 1

    .prologue
    .line 438
    sget-boolean v0, Lcom/flurry/android/FlurryAgent;->o:Z

    if-nez v0, :cond_0

    .line 441
    :goto_0
    return-void

    .line 440
    :cond_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    iget-object v0, v0, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    invoke-virtual {v0}, Lcom/flurry/android/v;->k()V

    goto :goto_0
.end method

.method private d(Landroid/content/Context;)Landroid/location/Location;
    .locals 7
    .parameter

    .prologue
    .line 2348
    const-string v0, "android.permission.ACCESS_FINE_LOCATION"

    invoke-virtual {p1, v0}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-virtual {p1, v0}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_3

    .line 2351
    :cond_0
    const-string v0, "location"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/LocationManager;

    .line 2352
    monitor-enter p0

    .line 2354
    :try_start_0
    iget-object v1, p0, Lcom/flurry/android/FlurryAgent;->E:Landroid/location/LocationManager;

    if-nez v1, :cond_2

    .line 2356
    iput-object v0, p0, Lcom/flurry/android/FlurryAgent;->E:Landroid/location/LocationManager;

    .line 2362
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2363
    sget-object v1, Lcom/flurry/android/FlurryAgent;->n:Landroid/location/Criteria;

    .line 2364
    if-nez v1, :cond_1

    .line 2366
    new-instance v1, Landroid/location/Criteria;

    invoke-direct {v1}, Landroid/location/Criteria;-><init>()V

    .line 2368
    :cond_1
    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/location/LocationManager;->getBestProvider(Landroid/location/Criteria;Z)Ljava/lang/String;

    move-result-object v1

    .line 2369
    if-eqz v1, :cond_3

    .line 2371
    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v6

    move-object v5, p0

    invoke-virtual/range {v0 .. v6}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;Landroid/os/Looper;)V

    .line 2372
    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v0

    .line 2375
    :goto_1
    return-object v0

    .line 2360
    :cond_2
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->E:Landroid/location/LocationManager;

    goto :goto_0

    .line 2362
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 2375
    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method

.method static synthetic d(Lcom/flurry/android/FlurryAgent;)Landroid/os/Handler;
    .locals 1
    .parameter

    .prologue
    .line 87
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->s:Landroid/os/Handler;

    return-object v0
.end method

.method private static d(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter

    .prologue
    .line 2135
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x4

    if-le v0, v1, :cond_1

    .line 2137
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 2138
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x4

    if-ge v0, v2, :cond_0

    .line 2140
    const/16 v2, 0x2a

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 2138
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2142
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x4

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2143
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 2147
    :cond_1
    return-object p0
.end method

.method static d()Z
    .locals 1

    .prologue
    .line 1659
    sget-boolean v0, Lcom/flurry/android/FlurryAgent;->o:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 1661
    :goto_0
    return v0

    :cond_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    iget-object v0, v0, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    invoke-virtual {v0}, Lcom/flurry/android/v;->m()Z

    move-result v0

    goto :goto_0
.end method

.method static synthetic e(Lcom/flurry/android/FlurryAgent;)Lcom/flurry/android/v;
    .locals 1
    .parameter

    .prologue
    .line 87
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    return-object v0
.end method

.method static e()Ljava/lang/String;
    .locals 1

    .prologue
    .line 2421
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    iget-object v0, v0, Lcom/flurry/android/FlurryAgent;->z:Ljava/lang/String;

    return-object v0
.end method

.method private static e(Landroid/content/Context;)[B
    .locals 4
    .parameter

    .prologue
    .line 2380
    const-string v0, "android.permission.READ_PHONE_STATE"

    invoke-virtual {p0, v0}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    .line 2382
    const-string v0, "phone"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 2383
    if-eqz v0, :cond_1

    .line 2385
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    .line 2386
    if-eqz v0, :cond_1

    .line 2390
    :try_start_0
    invoke-static {v0}, Lcom/flurry/android/r;->b(Ljava/lang/String;)[B

    move-result-object v0

    .line 2391
    if-eqz v0, :cond_0

    array-length v1, v0

    const/16 v2, 0x14

    if-ne v1, v2, :cond_0

    .line 2408
    :goto_0
    return-object v0

    .line 2397
    :cond_0
    const-string v1, "FlurryAgent"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sha1 is not 20 bytes long: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2408
    :cond_1
    :goto_1
    const/4 v0, 0x0

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method public static enableAppCircle()V
    .locals 1

    .prologue
    .line 326
    const/4 v0, 0x1

    sput-boolean v0, Lcom/flurry/android/FlurryAgent;->o:Z

    .line 327
    return-void
.end method

.method public static endTimedEvent(Ljava/lang/String;)V
    .locals 4
    .parameter

    .prologue
    .line 831
    :try_start_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    invoke-direct {v0, p0}, Lcom/flurry/android/FlurryAgent;->c(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 837
    :goto_0
    return-void

    .line 833
    :catch_0
    move-exception v0

    .line 835
    const-string v1, "FlurryAgent"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to signify the end of event: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method static f()I
    .locals 1

    .prologue
    .line 2539
    sget-object v0, Lcom/flurry/android/FlurryAgent;->q:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    return v0
.end method

.method static g()I
    .locals 1

    .prologue
    .line 2544
    sget-object v0, Lcom/flurry/android/FlurryAgent;->r:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    return v0
.end method

.method public static getAgentVersion()I
    .locals 1

    .prologue
    .line 474
    const/16 v0, 0x7a

    return v0
.end method

.method public static getAppCircle()Lcom/flurry/android/AppCircle;
    .locals 1

    .prologue
    .line 336
    sget-object v0, Lcom/flurry/android/FlurryAgent;->p:Lcom/flurry/android/AppCircle;

    return-object v0
.end method

.method public static getForbidPlaintextFallback()Z
    .locals 1

    .prologue
    .line 1031
    const/4 v0, 0x0

    return v0
.end method

.method public static getPhoneId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 2431
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    invoke-direct {v0}, Lcom/flurry/android/FlurryAgent;->p()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic h()Lcom/flurry/android/FlurryAgent;
    .locals 1

    .prologue
    .line 87
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    return-object v0
.end method

.method static synthetic i()J
    .locals 2

    .prologue
    .line 87
    sget-wide v0, Lcom/flurry/android/FlurryAgent;->i:J

    return-wide v0
.end method

.method protected static isCaptureUncaughtExceptions()Z
    .locals 1

    .prologue
    .line 1047
    sget-boolean v0, Lcom/flurry/android/FlurryAgent;->m:Z

    return v0
.end method

.method static synthetic j()Z
    .locals 1

    .prologue
    .line 87
    sget-boolean v0, Lcom/flurry/android/FlurryAgent;->o:Z

    return v0
.end method

.method private declared-synchronized k()V
    .locals 6

    .prologue
    .line 1276
    monitor-enter p0

    const/4 v1, 0x0

    .line 1279
    :try_start_0
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1280
    new-instance v2, Ljava/io/DataOutputStream;

    invoke-direct {v2, v3}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 1282
    const/4 v0, 0x1

    :try_start_1
    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1283
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->B:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1284
    iget-wide v0, p0, Lcom/flurry/android/FlurryAgent;->K:J

    invoke-virtual {v2, v0, v1}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 1285
    iget-wide v0, p0, Lcom/flurry/android/FlurryAgent;->M:J

    invoke-virtual {v2, v0, v1}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 1286
    const-wide/16 v0, 0x0

    invoke-virtual {v2, v0, v1}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 1287
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->N:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1288
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->O:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1289
    iget-byte v0, p0, Lcom/flurry/android/FlurryAgent;->P:B

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 1290
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->Q:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, ""

    :goto_0
    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1292
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->U:Landroid/location/Location;

    if-nez v0, :cond_1

    .line 1294
    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeBoolean(Z)V

    .line 1304
    :goto_1
    iget v0, p0, Lcom/flurry/android/FlurryAgent;->aa:I

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 1305
    const/4 v0, -0x1

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 1306
    const/4 v0, -0x1

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 1307
    iget-byte v0, p0, Lcom/flurry/android/FlurryAgent;->R:B

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 1308
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->S:Ljava/lang/Long;

    if-nez v0, :cond_2

    .line 1310
    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeBoolean(Z)V

    .line 1318
    :goto_2
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->V:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1319
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->V:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 1321
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1322
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/g;

    iget v0, v0, Lcom/flurry/android/g;->a:I

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeInt(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    .line 1361
    :catch_0
    move-exception v0

    move-object v1, v2

    .line 1363
    :goto_4
    :try_start_2
    const-string v2, "FlurryAgent"

    const-string v3, ""

    invoke-static {v2, v3, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 1367
    :try_start_3
    invoke-static {v1}, Lcom/flurry/android/r;->a(Ljava/io/Closeable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1368
    :goto_5
    monitor-exit p0

    return-void

    .line 1290
    :cond_0
    :try_start_4
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->Q:Ljava/lang/String;

    goto :goto_0

    .line 1298
    :cond_1
    const/4 v0, 0x1

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeBoolean(Z)V

    .line 1299
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->U:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/flurry/android/FlurryAgent;->a(D)D

    move-result-wide v0

    invoke-virtual {v2, v0, v1}, Ljava/io/DataOutputStream;->writeDouble(D)V

    .line 1300
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->U:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/flurry/android/FlurryAgent;->a(D)D

    move-result-wide v0

    invoke-virtual {v2, v0, v1}, Ljava/io/DataOutputStream;->writeDouble(D)V

    .line 1301
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->U:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getAccuracy()F

    move-result v0

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeFloat(F)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    goto/16 :goto_1

    .line 1367
    :catchall_0
    move-exception v0

    :goto_6
    :try_start_5
    invoke-static {v2}, Lcom/flurry/android/r;->a(Ljava/io/Closeable;)V

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 1276
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0

    .line 1314
    :cond_2
    const/4 v0, 0x1

    :try_start_6
    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeBoolean(Z)V

    .line 1315
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->S:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {v2, v0, v1}, Ljava/io/DataOutputStream;->writeLong(J)V

    goto/16 :goto_2

    .line 1325
    :cond_3
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->W:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1326
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->W:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/i;

    .line 1328
    invoke-virtual {v0}, Lcom/flurry/android/i;->a()[B

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->write([B)V

    goto :goto_7

    .line 1330
    :cond_4
    iget-boolean v0, p0, Lcom/flurry/android/FlurryAgent;->X:Z

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeBoolean(Z)V

    .line 1332
    iget v0, p0, Lcom/flurry/android/FlurryAgent;->T:I

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 1333
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->Z:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1334
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->Z:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/ab;

    .line 1336
    iget v4, v0, Lcom/flurry/android/ab;->a:I

    invoke-virtual {v2, v4}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1337
    iget-wide v4, v0, Lcom/flurry/android/ab;->b:J

    invoke-virtual {v2, v4, v5}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 1338
    iget-object v4, v0, Lcom/flurry/android/ab;->c:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1339
    iget-object v4, v0, Lcom/flurry/android/ab;->d:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1340
    iget-object v0, v0, Lcom/flurry/android/ab;->e:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    goto :goto_8

    .line 1343
    :cond_5
    sget-boolean v0, Lcom/flurry/android/FlurryAgent;->o:Z

    if-eqz v0, :cond_6

    .line 1345
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->ab:Lcom/flurry/android/v;

    invoke-virtual {v0}, Lcom/flurry/android/v;->f()Ljava/util/List;

    move-result-object v0

    .line 1346
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v2, v1}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1347
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/p;

    .line 1349
    invoke-virtual {v0, v2}, Lcom/flurry/android/p;->a(Ljava/io/DataOutput;)V

    goto :goto_9

    .line 1354
    :cond_6
    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1357
    :cond_7
    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1359
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->J:Ljava/util/List;

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    .line 1367
    :try_start_7
    invoke-static {v2}, Lcom/flurry/android/r;->a(Ljava/io/Closeable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto/16 :goto_5

    :catchall_2
    move-exception v0

    move-object v2, v1

    goto/16 :goto_6

    :catchall_3
    move-exception v0

    move-object v2, v1

    goto/16 :goto_6

    .line 1361
    :catch_1
    move-exception v0

    goto/16 :goto_4
.end method

.method private declared-synchronized l()V
    .locals 1

    .prologue
    .line 1389
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/flurry/android/FlurryAgent;->aa:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/flurry/android/FlurryAgent;->aa:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1390
    monitor-exit p0

    return-void

    .line 1389
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public static logEvent(Ljava/lang/String;)V
    .locals 4
    .parameter

    .prologue
    .line 726
    :try_start_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/flurry/android/FlurryAgent;->a(Ljava/lang/String;Ljava/util/Map;Z)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 732
    :goto_0
    return-void

    .line 728
    :catch_0
    move-exception v0

    .line 730
    const-string v1, "FlurryAgent"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to log event: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static logEvent(Ljava/lang/String;Ljava/util/Map;)V
    .locals 4
    .parameter
    .parameter

    .prologue
    .line 762
    :try_start_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/flurry/android/FlurryAgent;->a(Ljava/lang/String;Ljava/util/Map;Z)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 768
    :goto_0
    return-void

    .line 764
    :catch_0
    move-exception v0

    .line 766
    const-string v1, "FlurryAgent"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to log event: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static logEvent(Ljava/lang/String;Ljava/util/Map;Z)V
    .locals 4
    .parameter
    .parameter
    .parameter

    .prologue
    .line 812
    :try_start_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    invoke-direct {v0, p0, p1, p2}, Lcom/flurry/android/FlurryAgent;->a(Ljava/lang/String;Ljava/util/Map;Z)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 818
    :goto_0
    return-void

    .line 814
    :catch_0
    move-exception v0

    .line 816
    const-string v1, "FlurryAgent"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to log event: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static logEvent(Ljava/lang/String;Z)V
    .locals 4
    .parameter
    .parameter

    .prologue
    .line 786
    :try_start_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1, p1}, Lcom/flurry/android/FlurryAgent;->a(Ljava/lang/String;Ljava/util/Map;Z)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 792
    :goto_0
    return-void

    .line 788
    :catch_0
    move-exception v0

    .line 790
    const-string v1, "FlurryAgent"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to log event: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private static m()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1628
    sget-object v0, Lcom/flurry/android/FlurryAgent;->c:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 1630
    sget-object v0, Lcom/flurry/android/FlurryAgent;->c:Ljava/lang/String;

    .line 1644
    :goto_0
    return-object v0

    .line 1632
    :cond_0
    sget-boolean v0, Lcom/flurry/android/FlurryAgent;->l:Z

    if-eqz v0, :cond_1

    .line 1634
    sget-object v0, Lcom/flurry/android/FlurryAgent;->kInsecureReportUrl:Ljava/lang/String;

    goto :goto_0

    .line 1640
    :cond_1
    sget-boolean v0, Lcom/flurry/android/FlurryAgent;->k:Z

    if-eqz v0, :cond_2

    .line 1642
    sget-object v0, Lcom/flurry/android/FlurryAgent;->kSecureReportUrl:Ljava/lang/String;

    goto :goto_0

    .line 1644
    :cond_2
    sget-object v0, Lcom/flurry/android/FlurryAgent;->kInsecureReportUrl:Ljava/lang/String;

    goto :goto_0
.end method

.method private declared-synchronized n()V
    .locals 6

    .prologue
    const/4 v2, 0x0

    .line 2153
    monitor-enter p0

    .line 2157
    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->u:Ljava/io/File;

    invoke-static {v0}, Lcom/flurry/android/FlurryAgent;->a(Ljava/io/File;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 2158
    if-nez v0, :cond_0

    .line 2196
    const/4 v0, 0x0

    :try_start_1
    invoke-static {v0}, Lcom/flurry/android/r;->a(Ljava/io/Closeable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2197
    :goto_0
    monitor-exit p0

    return-void

    .line 2163
    :cond_0
    :try_start_2
    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v1, p0, Lcom/flurry/android/FlurryAgent;->u:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 2164
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 2165
    const v0, 0xb5fa

    :try_start_3
    invoke-virtual {v1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 2166
    const/4 v0, 0x2

    invoke-virtual {v1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 2168
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->z:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 2169
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->F:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 2171
    iget-boolean v0, p0, Lcom/flurry/android/FlurryAgent;->G:Z

    invoke-virtual {v1, v0}, Ljava/io/DataOutputStream;->writeBoolean(Z)V

    .line 2172
    iget-wide v2, p0, Lcom/flurry/android/FlurryAgent;->H:J

    invoke-virtual {v1, v2, v3}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 2176
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->J:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    move v2, v0

    :goto_1
    if-ltz v2, :cond_1

    .line 2178
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->J:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 2179
    array-length v3, v0

    .line 2180
    add-int/lit8 v4, v3, 0x2

    invoke-virtual {v1}, Ljava/io/DataOutputStream;->size()I

    move-result v5

    add-int/2addr v4, v5

    const v5, 0xc350

    if-le v4, v5, :cond_2

    .line 2182
    const-string v0, "FlurryAgent"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "discarded sessions: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 2188
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1

    .line 2196
    :try_start_4
    invoke-static {v1}, Lcom/flurry/android/r;->a(Ljava/io/Closeable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 2153
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 2185
    :cond_2
    :try_start_5
    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 2186
    invoke-virtual {v1, v0}, Ljava/io/DataOutputStream;->write([B)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_1

    .line 2176
    add-int/lit8 v0, v2, -0x1

    move v2, v0

    goto :goto_1

    .line 2190
    :catch_0
    move-exception v0

    move-object v1, v2

    .line 2192
    :goto_2
    :try_start_6
    const-string v2, "FlurryAgent"

    const-string v3, ""

    invoke-static {v2, v3, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 2196
    :try_start_7
    invoke-static {v1}, Lcom/flurry/android/r;->a(Ljava/io/Closeable;)V

    goto/16 :goto_0

    :catchall_1
    move-exception v0

    move-object v1, v2

    :goto_3
    invoke-static {v1}, Lcom/flurry/android/r;->a(Ljava/io/Closeable;)V

    throw v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    :catchall_2
    move-exception v0

    goto :goto_3

    .line 2190
    :catch_1
    move-exception v0

    goto :goto_2
.end method

.method private declared-synchronized o()V
    .locals 1

    .prologue
    .line 2413
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->E:Landroid/location/LocationManager;

    if-eqz v0, :cond_0

    .line 2415
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->E:Landroid/location/LocationManager;

    invoke-virtual {v0, p0}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2417
    :cond_0
    monitor-exit p0

    return-void

    .line 2413
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public static onEndSession(Landroid/content/Context;)V
    .locals 3
    .parameter

    .prologue
    .line 685
    if-nez p0, :cond_0

    .line 687
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null context"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 691
    :cond_0
    :try_start_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/flurry/android/FlurryAgent;->a(Landroid/content/Context;Z)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 697
    :goto_0
    return-void

    .line 693
    :catch_0
    move-exception v0

    .line 695
    const-string v1, "FlurryAgent"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static onError(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .parameter
    .parameter
    .parameter

    .prologue
    .line 856
    :try_start_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    invoke-direct {v0, p0, p1, p2}, Lcom/flurry/android/FlurryAgent;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 862
    :goto_0
    return-void

    .line 858
    :catch_0
    move-exception v0

    .line 860
    const-string v1, "FlurryAgent"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static onEvent(Ljava/lang/String;)V
    .locals 3
    .parameter

    .prologue
    .line 873
    :try_start_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/flurry/android/FlurryAgent;->a(Ljava/lang/String;Ljava/util/Map;Z)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 879
    :goto_0
    return-void

    .line 875
    :catch_0
    move-exception v0

    .line 877
    const-string v1, "FlurryAgent"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static onEvent(Ljava/lang/String;Ljava/util/Map;)V
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 891
    :try_start_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/flurry/android/FlurryAgent;->a(Ljava/lang/String;Ljava/util/Map;Z)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 897
    :goto_0
    return-void

    .line 893
    :catch_0
    move-exception v0

    .line 895
    const-string v1, "FlurryAgent"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static onPageView()V
    .locals 3

    .prologue
    .line 911
    :try_start_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    invoke-direct {v0}, Lcom/flurry/android/FlurryAgent;->l()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 917
    :goto_0
    return-void

    .line 913
    :catch_0
    move-exception v0

    .line 915
    const-string v1, "FlurryAgent"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static onStartSession(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 636
    if-nez p0, :cond_0

    .line 638
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null context"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 640
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_2

    .line 642
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Api key not specified"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 647
    :cond_2
    :try_start_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    invoke-direct {v0, p0, p1}, Lcom/flurry/android/FlurryAgent;->b(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 653
    :goto_0
    return-void

    .line 649
    :catch_0
    move-exception v0

    .line 651
    const-string v1, "FlurryAgent"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private declared-synchronized p()Ljava/lang/String;
    .locals 1

    .prologue
    .line 2426
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->F:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public static setAge(I)V
    .locals 7
    .parameter

    .prologue
    const/4 v6, 0x1

    .line 967
    if-lez p0, :cond_0

    const/16 v0, 0x6e

    if-ge p0, v0, :cond_0

    .line 969
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    int-to-long v2, p0

    const-wide v4, 0x7528ad000L

    mul-long/2addr v2, v4

    sub-long/2addr v0, v2

    .line 970
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v2}, Ljava/util/Date;->getYear()I

    move-result v0

    .line 971
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, v0, v6, v6}, Ljava/util/Date;-><init>(III)V

    .line 972
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lcom/flurry/android/FlurryAgent;->S:Ljava/lang/Long;

    .line 974
    :cond_0
    return-void
.end method

.method public static setCanvasUrl(Ljava/lang/String;)V
    .locals 0
    .parameter

    .prologue
    .line 928
    sput-object p0, Lcom/flurry/android/FlurryAgent;->d:Ljava/lang/String;

    .line 929
    return-void
.end method

.method public static setCaptureUncaughtExceptions(Z)V
    .locals 3
    .parameter

    .prologue
    .line 585
    sget-object v1, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    monitor-enter v1

    .line 587
    :try_start_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    iget-boolean v0, v0, Lcom/flurry/android/FlurryAgent;->v:Z

    if-eqz v0, :cond_0

    .line 589
    const-string v0, "FlurryAgent"

    const-string v2, "Cannot setCaptureUncaughtExceptions after onSessionStart"

    invoke-static {v0, v2}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;)I

    .line 590
    monitor-exit v1

    .line 593
    :goto_0
    return-void

    .line 592
    :cond_0
    sput-boolean p0, Lcom/flurry/android/FlurryAgent;->m:Z

    .line 593
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static setCatalogIntentName(Ljava/lang/String;)V
    .locals 0
    .parameter

    .prologue
    .line 311
    sput-object p0, Lcom/flurry/android/FlurryAgent;->a:Ljava/lang/String;

    .line 312
    return-void
.end method

.method public static setContinueSessionMillis(J)V
    .locals 3
    .parameter

    .prologue
    .line 544
    const-wide/16 v0, 0x1388

    cmp-long v0, p0, v0

    if-gez v0, :cond_0

    .line 546
    const-string v0, "FlurryAgent"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid time set for session resumption: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;)I

    .line 553
    :goto_0
    return-void

    .line 550
    :cond_0
    sget-object v1, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    monitor-enter v1

    .line 552
    :try_start_0
    sput-wide p0, Lcom/flurry/android/FlurryAgent;->i:J

    .line 553
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static setDefaultNoAdsMessage(Ljava/lang/String;)V
    .locals 1
    .parameter

    .prologue
    .line 419
    sget-boolean v0, Lcom/flurry/android/FlurryAgent;->o:Z

    if-nez v0, :cond_0

    .line 422
    :goto_0
    return-void

    .line 421
    :cond_0
    if-nez p0, :cond_1

    const-string p0, ""

    :cond_1
    sput-object p0, Lcom/flurry/android/v;->b:Ljava/lang/String;

    goto :goto_0
.end method

.method public static setGender(B)V
    .locals 2
    .parameter

    .prologue
    .line 983
    packed-switch p0, :pswitch_data_0

    .line 991
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    const/4 v1, -0x1

    iput-byte v1, v0, Lcom/flurry/android/FlurryAgent;->R:B

    .line 993
    :goto_0
    return-void

    .line 987
    :pswitch_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    iput-byte p0, v0, Lcom/flurry/android/FlurryAgent;->R:B

    goto :goto_0

    .line 983
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static setGetAppUrl(Ljava/lang/String;)V
    .locals 0
    .parameter

    .prologue
    .line 933
    sput-object p0, Lcom/flurry/android/FlurryAgent;->f:Ljava/lang/String;

    .line 934
    return-void
.end method

.method public static setLocationCriteria(Landroid/location/Criteria;)V
    .locals 2
    .parameter

    .prologue
    .line 948
    sget-object v1, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    monitor-enter v1

    .line 950
    :try_start_0
    sput-object p0, Lcom/flurry/android/FlurryAgent;->n:Landroid/location/Criteria;

    .line 951
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static setLogEnabled(Z)V
    .locals 2
    .parameter

    .prologue
    .line 498
    sget-object v1, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    monitor-enter v1

    .line 500
    if-eqz p0, :cond_0

    .line 502
    :try_start_0
    invoke-static {}, Lcom/flurry/android/ai;->b()V

    .line 508
    :goto_0
    monitor-exit v1

    return-void

    .line 506
    :cond_0
    invoke-static {}, Lcom/flurry/android/ai;->a()V

    goto :goto_0

    .line 508
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static setLogEvents(Z)V
    .locals 2
    .parameter

    .prologue
    .line 562
    sget-object v1, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    monitor-enter v1

    .line 564
    :try_start_0
    sput-boolean p0, Lcom/flurry/android/FlurryAgent;->j:Z

    .line 565
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static setLogLevel(I)V
    .locals 2
    .parameter

    .prologue
    .line 517
    sget-object v1, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    monitor-enter v1

    .line 519
    :try_start_0
    invoke-static {p0}, Lcom/flurry/android/ai;->a(I)V

    .line 520
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static setReportLocation(Z)V
    .locals 2
    .parameter

    .prologue
    .line 486
    sget-object v1, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    monitor-enter v1

    .line 488
    :try_start_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    iput-boolean p0, v0, Lcom/flurry/android/FlurryAgent;->C:Z

    .line 489
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static setReportUrl(Ljava/lang/String;)V
    .locals 0
    .parameter

    .prologue
    .line 923
    sput-object p0, Lcom/flurry/android/FlurryAgent;->c:Ljava/lang/String;

    .line 924
    return-void
.end method

.method public static setUseHttps(Z)V
    .locals 0
    .parameter

    .prologue
    .line 576
    sput-boolean p0, Lcom/flurry/android/FlurryAgent;->k:Z

    .line 577
    return-void
.end method

.method public static setUserId(Ljava/lang/String;)V
    .locals 3
    .parameter

    .prologue
    .line 1004
    sget-object v1, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    monitor-enter v1

    .line 1006
    :try_start_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    const/16 v2, 0xff

    invoke-static {p0, v2}, Lcom/flurry/android/r;->a(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/flurry/android/FlurryAgent;->Q:Ljava/lang/String;

    .line 1007
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static setVersionName(Ljava/lang/String;)V
    .locals 2
    .parameter

    .prologue
    .line 462
    sget-object v1, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    monitor-enter v1

    .line 464
    :try_start_0
    sget-object v0, Lcom/flurry/android/FlurryAgent;->h:Lcom/flurry/android/FlurryAgent;

    iput-object p0, v0, Lcom/flurry/android/FlurryAgent;->B:Ljava/lang/String;

    .line 465
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method final a(Ljava/lang/Throwable;)V
    .locals 4
    .parameter

    .prologue
    .line 265
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 267
    const-string v0, ""

    .line 268
    invoke-virtual {p1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    .line 269
    if-eqz v1, :cond_2

    array-length v2, v1

    if-lez v2, :cond_2

    .line 271
    const/4 v0, 0x0

    aget-object v0, v1, v0

    .line 272
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 273
    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 277
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 279
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " ("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 281
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 289
    :cond_1
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v1

    .line 290
    const-string v2, "uncaught"

    invoke-static {v2, v0, v1}, Lcom/flurry/android/FlurryAgent;->onError(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 291
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent;->y:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 292
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/flurry/android/FlurryAgent;->a(Landroid/content/Context;Z)V

    .line 293
    return-void

    .line 284
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 286
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public final declared-synchronized onLocationChanged(Landroid/location/Location;)V
    .locals 3
    .parameter

    .prologue
    .line 2439
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/flurry/android/FlurryAgent;->U:Landroid/location/Location;

    .line 2440
    invoke-direct {p0}, Lcom/flurry/android/FlurryAgent;->o()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 2446
    :goto_0
    monitor-exit p0

    return-void

    .line 2442
    :catch_0
    move-exception v0

    .line 2444
    :try_start_1
    const-string v1, "FlurryAgent"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 2439
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final onProviderDisabled(Ljava/lang/String;)V
    .locals 0
    .parameter

    .prologue
    .line 2452
    return-void
.end method

.method public final onProviderEnabled(Ljava/lang/String;)V
    .locals 0
    .parameter

    .prologue
    .line 2458
    return-void
.end method

.method public final onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 2464
    return-void
.end method

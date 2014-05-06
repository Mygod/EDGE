.class public Lcom/apportable/VerdeOutputStream;
.super Ljava/io/OutputStream;
.source "VerdeOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/apportable/VerdeOutputStream$VerdeHostNameVerifier;
    }
.end annotation


# static fields
.field private static TAG:Ljava/lang/String;


# instance fields
.field private mDelegate:J

.field private mExpected:I

.field private mWritten:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const-string v0, "VerdeOutputStream"

    sput-object v0, Lcom/apportable/VerdeOutputStream;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(J)V
    .locals 3
    .parameter "delegate"

    .prologue
    const/4 v2, 0x0

    .line 45
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 37
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/apportable/VerdeOutputStream;->mDelegate:J

    .line 38
    iput v2, p0, Lcom/apportable/VerdeOutputStream;->mExpected:I

    .line 39
    iput v2, p0, Lcom/apportable/VerdeOutputStream;->mWritten:I

    .line 47
    iput-wide p1, p0, Lcom/apportable/VerdeOutputStream;->mDelegate:J

    .line 48
    return-void
.end method

.method public constructor <init>(JI)V
    .locals 3
    .parameter "delegate"
    .parameter "expectedLength"

    .prologue
    const/4 v2, 0x0

    .line 50
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 37
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/apportable/VerdeOutputStream;->mDelegate:J

    .line 38
    iput v2, p0, Lcom/apportable/VerdeOutputStream;->mExpected:I

    .line 39
    iput v2, p0, Lcom/apportable/VerdeOutputStream;->mWritten:I

    .line 51
    iput-wide p1, p0, Lcom/apportable/VerdeOutputStream;->mDelegate:J

    .line 52
    iput p3, p0, Lcom/apportable/VerdeOutputStream;->mExpected:I

    .line 53
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    sget-object v0, Lcom/apportable/VerdeOutputStream;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private static dumpRequestInfo(Lorg/apache/http/client/methods/HttpUriRequest;)V
    .locals 8
    .parameter "request"

    .prologue
    .line 129
    :try_start_0
    sget-object v4, Lcom/apportable/VerdeOutputStream;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "now making request to: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    invoke-interface {p0}, Lorg/apache/http/client/methods/HttpUriRequest;->getMethod()Ljava/lang/String;

    move-result-object v4

    const-string v5, "POST"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 131
    move-object v0, p0

    check-cast v0, Lorg/apache/http/HttpEntityEnclosingRequest;

    move-object v3, v0

    .line 132
    .local v3, post:Lorg/apache/http/HttpEntityEnclosingRequest;
    sget-object v4, Lcom/apportable/VerdeOutputStream;->TAG:Ljava/lang/String;

    const-string v5, "=========================================================================="

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    invoke-interface {v3}, Lorg/apache/http/HttpEntityEnclosingRequest;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v1

    .line 134
    .local v1, headers:[Lorg/apache/http/Header;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    array-length v4, v1

    if-ge v2, v4, :cond_0

    .line 135
    sget-object v4, Lcom/apportable/VerdeOutputStream;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "HEADER:: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v1, v2

    invoke-interface {v6}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v1, v2

    invoke-interface {v6}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 137
    :cond_0
    sget-object v4, Lcom/apportable/VerdeOutputStream;->TAG:Ljava/lang/String;

    const-string v5, "=========================================================================="

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    sget-object v4, Lcom/apportable/VerdeOutputStream;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "-- request body: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    new-instance v6, Ljava/util/Scanner;

    invoke-interface {v3}, Lorg/apache/http/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V

    const-string v7, "\\A"

    invoke-virtual {v6, v7}, Ljava/util/Scanner;->useDelimiter(Ljava/lang/String;)Ljava/util/Scanner;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Scanner;->next()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    sget-object v4, Lcom/apportable/VerdeOutputStream;->TAG:Ljava/lang/String;

    const-string v5, "=========================================================================="

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 143
    .end local v1           #headers:[Lorg/apache/http/Header;
    .end local v2           #i:I
    .end local v3           #post:Lorg/apache/http/HttpEntityEnclosingRequest;
    :cond_1
    :goto_1
    return-void

    .line 141
    :catch_0
    move-exception v4

    goto :goto_1
.end method

.method public static execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;J)Lcom/apportable/VerdeOutputStream;
    .locals 11
    .parameter "request"
    .parameter
    .parameter "delegate"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/client/methods/HttpUriRequest;",
            "Lorg/apache/http/client/ResponseHandler",
            "<",
            "Lcom/apportable/VerdeOutputStream;",
            ">;J)",
            "Lcom/apportable/VerdeOutputStream;"
        }
    .end annotation

    .prologue
    .line 91
    .local p1, responseHandler:Lorg/apache/http/client/ResponseHandler;,"Lorg/apache/http/client/ResponseHandler<Lcom/apportable/VerdeOutputStream;>;"
    const/4 v6, 0x0

    .line 95
    .local v6, stream:Lcom/apportable/VerdeOutputStream;
    :try_start_0
    new-instance v4, Lorg/apache/http/conn/scheme/SchemeRegistry;

    invoke-direct {v4}, Lorg/apache/http/conn/scheme/SchemeRegistry;-><init>()V

    .line 96
    .local v4, schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;
    new-instance v7, Lorg/apache/http/conn/scheme/Scheme;

    const-string v8, "http"

    invoke-static {}, Lorg/apache/http/conn/scheme/PlainSocketFactory;->getSocketFactory()Lorg/apache/http/conn/scheme/PlainSocketFactory;

    move-result-object v9

    const/16 v10, 0x50

    invoke-direct {v7, v8, v9, v10}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v4, v7}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 98
    invoke-static {}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->getSocketFactory()Lorg/apache/http/conn/ssl/SSLSocketFactory;

    move-result-object v5

    .line 99
    .local v5, sslFactory:Lorg/apache/http/conn/ssl/SSLSocketFactory;
    new-instance v7, Lcom/apportable/VerdeOutputStream$VerdeHostNameVerifier;

    const-wide/16 v8, 0x0

    invoke-direct {v7, v8, v9}, Lcom/apportable/VerdeOutputStream$VerdeHostNameVerifier;-><init>(J)V

    invoke-virtual {v5, v7}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->setHostnameVerifier(Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .line 101
    new-instance v7, Lorg/apache/http/conn/scheme/Scheme;

    const-string v8, "https"

    const/16 v9, 0x1bb

    invoke-direct {v7, v8, v5, v9}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v4, v7}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 103
    new-instance v3, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v3}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 104
    .local v3, params:Lorg/apache/http/params/HttpParams;
    const-string v7, "http.conn-manager.max-total"

    const/16 v8, 0x1e

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v3, v7, v8}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 105
    const-string v7, "http.conn-manager.max-per-route"

    new-instance v8, Lorg/apache/http/conn/params/ConnPerRouteBean;

    const/16 v9, 0x1e

    invoke-direct {v8, v9}, Lorg/apache/http/conn/params/ConnPerRouteBean;-><init>(I)V

    invoke-interface {v3, v7, v8}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 106
    const-string v7, "http.protocol.expect-continue"

    const/4 v8, 0x0

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-interface {v3, v7, v8}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 107
    sget-object v7, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-static {v3, v7}, Lorg/apache/http/params/HttpProtocolParams;->setVersion(Lorg/apache/http/params/HttpParams;Lorg/apache/http/ProtocolVersion;)V

    .line 109
    new-instance v1, Lorg/apache/http/impl/conn/SingleClientConnManager;

    invoke-direct {v1, v3, v4}, Lorg/apache/http/impl/conn/SingleClientConnManager;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .line 110
    .local v1, cm:Lorg/apache/http/conn/ClientConnectionManager;
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0, v1, v3}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V

    .line 111
    .local v0, client:Lorg/apache/http/impl/client/DefaultHttpClient;
    invoke-virtual {v0, p0, p1}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;

    move-result-object v6

    .end local v6           #stream:Lcom/apportable/VerdeOutputStream;
    check-cast v6, Lcom/apportable/VerdeOutputStream;
    :try_end_0
    .catch Lorg/apache/http/client/HttpResponseException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 124
    .end local v0           #client:Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v1           #cm:Lorg/apache/http/conn/ClientConnectionManager;
    .end local v3           #params:Lorg/apache/http/params/HttpParams;
    .end local v4           #schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;
    .end local v5           #sslFactory:Lorg/apache/http/conn/ssl/SSLSocketFactory;
    .restart local v6       #stream:Lcom/apportable/VerdeOutputStream;
    :goto_0
    return-object v6

    .line 112
    .end local v6           #stream:Lcom/apportable/VerdeOutputStream;
    :catch_0
    move-exception v2

    .line 113
    .local v2, e:Lorg/apache/http/client/HttpResponseException;
    invoke-virtual {v2}, Lorg/apache/http/client/HttpResponseException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v7

    invoke-static {p2, p3, v7}, Lcom/apportable/VerdeOutputStream;->nativeError(JLjava/lang/String;)V

    .line 114
    const/4 v6, 0x0

    .line 122
    .restart local v6       #stream:Lcom/apportable/VerdeOutputStream;
    goto :goto_0

    .line 115
    .end local v2           #e:Lorg/apache/http/client/HttpResponseException;
    .end local v6           #stream:Lcom/apportable/VerdeOutputStream;
    :catch_1
    move-exception v2

    .line 116
    .local v2, e:Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_0

    .line 117
    invoke-virtual {v2}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v7

    invoke-static {p2, p3, v7}, Lcom/apportable/VerdeOutputStream;->nativeError(JLjava/lang/String;)V

    .line 121
    :goto_1
    const/4 v6, 0x0

    .restart local v6       #stream:Lcom/apportable/VerdeOutputStream;
    goto :goto_0

    .line 119
    .end local v6           #stream:Lcom/apportable/VerdeOutputStream;
    :cond_0
    const-string v7, "EXCEPTION HAD NO MESSAGE"

    invoke-static {p2, p3, v7}, Lcom/apportable/VerdeOutputStream;->nativeError(JLjava/lang/String;)V

    goto :goto_1
.end method

.method private static native nativeClose(J)V
.end method

.method private static native nativeError(JLjava/lang/String;)V
.end method

.method private static native nativeFlush(J)V
.end method

.method private static native nativeWrite(J[BII)V
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    .line 146
    monitor-enter p0

    .line 148
    :try_start_0
    iget-wide v0, p0, Lcom/apportable/VerdeOutputStream;->mDelegate:J

    invoke-static {v0, v1}, Lcom/apportable/VerdeOutputStream;->nativeClose(J)V

    .line 150
    monitor-exit p0

    .line 151
    return-void

    .line 150
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public flush()V
    .locals 2

    .prologue
    .line 154
    monitor-enter p0

    .line 156
    :try_start_0
    iget-wide v0, p0, Lcom/apportable/VerdeOutputStream;->mDelegate:J

    invoke-static {v0, v1}, Lcom/apportable/VerdeOutputStream;->nativeFlush(J)V

    .line 158
    monitor-exit p0

    .line 159
    return-void

    .line 158
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public write(I)V
    .locals 5
    .parameter "oneByte"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 184
    new-array v0, v1, [B

    int-to-byte v1, p1

    aput-byte v1, v0, v2

    .line 185
    .local v0, buffer:[B
    monitor-enter p0

    .line 187
    :try_start_0
    iget v1, p0, Lcom/apportable/VerdeOutputStream;->mWritten:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/apportable/VerdeOutputStream;->mWritten:I

    .line 188
    iget-wide v1, p0, Lcom/apportable/VerdeOutputStream;->mDelegate:J

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v1, v2, v0, v3, v4}, Lcom/apportable/VerdeOutputStream;->nativeWrite(J[BII)V

    .line 189
    iget v1, p0, Lcom/apportable/VerdeOutputStream;->mExpected:I

    if-lez v1, :cond_0

    iget v1, p0, Lcom/apportable/VerdeOutputStream;->mExpected:I

    iget v2, p0, Lcom/apportable/VerdeOutputStream;->mWritten:I

    if-le v1, v2, :cond_0

    .line 190
    iget-wide v1, p0, Lcom/apportable/VerdeOutputStream;->mDelegate:J

    invoke-static {v1, v2}, Lcom/apportable/VerdeOutputStream;->nativeClose(J)V

    .line 192
    :cond_0
    monitor-exit p0

    .line 193
    return-void

    .line 192
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public write([B)V
    .locals 4
    .parameter "buffer"

    .prologue
    .line 173
    monitor-enter p0

    .line 175
    :try_start_0
    iget v0, p0, Lcom/apportable/VerdeOutputStream;->mWritten:I

    array-length v1, p1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/apportable/VerdeOutputStream;->mWritten:I

    .line 176
    iget-wide v0, p0, Lcom/apportable/VerdeOutputStream;->mDelegate:J

    const/4 v2, 0x0

    array-length v3, p1

    invoke-static {v0, v1, p1, v2, v3}, Lcom/apportable/VerdeOutputStream;->nativeWrite(J[BII)V

    .line 177
    iget v0, p0, Lcom/apportable/VerdeOutputStream;->mExpected:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/apportable/VerdeOutputStream;->mExpected:I

    iget v1, p0, Lcom/apportable/VerdeOutputStream;->mWritten:I

    if-gt v0, v1, :cond_1

    :cond_0
    array-length v0, p1

    if-nez v0, :cond_2

    .line 178
    :cond_1
    iget-wide v0, p0, Lcom/apportable/VerdeOutputStream;->mDelegate:J

    invoke-static {v0, v1}, Lcom/apportable/VerdeOutputStream;->nativeClose(J)V

    .line 180
    :cond_2
    monitor-exit p0

    .line 181
    return-void

    .line 180
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public write([BII)V
    .locals 2
    .parameter "buffer"
    .parameter "offset"
    .parameter "count"

    .prologue
    .line 162
    monitor-enter p0

    .line 164
    :try_start_0
    iget v0, p0, Lcom/apportable/VerdeOutputStream;->mWritten:I

    add-int/2addr v0, p3

    iput v0, p0, Lcom/apportable/VerdeOutputStream;->mWritten:I

    .line 165
    iget-wide v0, p0, Lcom/apportable/VerdeOutputStream;->mDelegate:J

    invoke-static {v0, v1, p1, p2, p3}, Lcom/apportable/VerdeOutputStream;->nativeWrite(J[BII)V

    .line 166
    iget v0, p0, Lcom/apportable/VerdeOutputStream;->mExpected:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/apportable/VerdeOutputStream;->mExpected:I

    iget v1, p0, Lcom/apportable/VerdeOutputStream;->mWritten:I

    if-gt v0, v1, :cond_1

    :cond_0
    if-nez p3, :cond_2

    .line 167
    :cond_1
    iget-wide v0, p0, Lcom/apportable/VerdeOutputStream;->mDelegate:J

    invoke-static {v0, v1}, Lcom/apportable/VerdeOutputStream;->nativeClose(J)V

    .line 169
    :cond_2
    monitor-exit p0

    .line 170
    return-void

    .line 169
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

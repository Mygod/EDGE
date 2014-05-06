.class public Lcom/apportable/VerdeResponseHandler;
.super Ljava/lang/Object;
.source "VerdeResponseHandler.java"

# interfaces
.implements Lorg/apache/http/client/ResponseHandler;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/apache/http/client/ResponseHandler",
        "<",
        "Lcom/apportable/VerdeOutputStream;",
        ">;"
    }
.end annotation


# static fields
.field private static TAG:Ljava/lang/String;


# instance fields
.field private mDelegate:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 9
    const-string v0, "VerdeResponseHandler"

    sput-object v0, Lcom/apportable/VerdeResponseHandler;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(J)V
    .locals 0
    .parameter "delegate"

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-wide p1, p0, Lcom/apportable/VerdeResponseHandler;->mDelegate:J

    .line 17
    return-void
.end method

.method private static native nativeAddHeader(JLjava/lang/String;Ljava/lang/String;)V
.end method

.method private static native nativeStatus(JILjava/lang/String;)V
.end method


# virtual methods
.method public handleResponse(Lorg/apache/http/HttpResponse;)Lcom/apportable/VerdeOutputStream;
    .locals 12
    .parameter "response"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 23
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    .line 24
    .local v4, statusLine:Lorg/apache/http/StatusLine;
    iget-wide v8, p0, Lcom/apportable/VerdeResponseHandler;->mDelegate:J

    invoke-interface {v4}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v10

    invoke-interface {v4}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v11

    invoke-static {v8, v9, v10, v11}, Lcom/apportable/VerdeResponseHandler;->nativeStatus(JILjava/lang/String;)V

    .line 25
    invoke-interface {v4}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v8

    const/16 v9, 0x12c

    if-lt v8, v9, :cond_0

    move-object v5, v7

    .line 69
    :goto_0
    return-object v5

    .line 30
    :cond_0
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v1

    .line 31
    .local v1, headers:[Lorg/apache/http/Header;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    array-length v8, v1

    if-ge v2, v8, :cond_1

    .line 32
    iget-wide v8, p0, Lcom/apportable/VerdeResponseHandler;->mDelegate:J

    aget-object v10, v1, v2

    invoke-interface {v10}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v10

    aget-object v11, v1, v2

    invoke-interface {v11}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v11

    invoke-static {v8, v9, v10, v11}, Lcom/apportable/VerdeResponseHandler;->nativeAddHeader(JLjava/lang/String;Ljava/lang/String;)V

    .line 31
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 35
    :cond_1
    new-instance v5, Lcom/apportable/VerdeOutputStream;

    iget-wide v8, p0, Lcom/apportable/VerdeResponseHandler;->mDelegate:J

    invoke-direct {v5, v8, v9}, Lcom/apportable/VerdeOutputStream;-><init>(J)V

    .line 37
    .local v5, stream:Lcom/apportable/VerdeOutputStream;
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 38
    .local v0, entity:Lorg/apache/http/HttpEntity;
    if-nez v0, :cond_2

    move-object v5, v7

    .line 41
    goto :goto_0

    .line 43
    :cond_2
    move-object v3, v5

    .line 44
    .local v3, mStream:Lcom/apportable/VerdeOutputStream;
    new-instance v6, Ljava/lang/Thread;

    new-instance v7, Lcom/apportable/VerdeResponseHandler$1;

    invoke-direct {v7, p0, p1, v3, v0}, Lcom/apportable/VerdeResponseHandler$1;-><init>(Lcom/apportable/VerdeResponseHandler;Lorg/apache/http/HttpResponse;Lcom/apportable/VerdeOutputStream;Lorg/apache/http/HttpEntity;)V

    invoke-direct {v6, v7}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 66
    .local v6, t:Ljava/lang/Thread;
    invoke-virtual {v6}, Ljava/lang/Thread;->run()V

    goto :goto_0
.end method

.method public bridge synthetic handleResponse(Lorg/apache/http/HttpResponse;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 8
    invoke-virtual {p0, p1}, Lcom/apportable/VerdeResponseHandler;->handleResponse(Lorg/apache/http/HttpResponse;)Lcom/apportable/VerdeOutputStream;

    move-result-object v0

    return-object v0
.end method

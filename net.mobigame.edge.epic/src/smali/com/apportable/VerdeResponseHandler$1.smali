.class Lcom/apportable/VerdeResponseHandler$1;
.super Ljava/lang/Object;
.source "VerdeResponseHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/VerdeResponseHandler;->handleResponse(Lorg/apache/http/HttpResponse;)Lcom/apportable/VerdeOutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/VerdeResponseHandler;

.field final synthetic val$entity:Lorg/apache/http/HttpEntity;

.field final synthetic val$mStream:Lcom/apportable/VerdeOutputStream;

.field final synthetic val$response:Lorg/apache/http/HttpResponse;


# direct methods
.method constructor <init>(Lcom/apportable/VerdeResponseHandler;Lorg/apache/http/HttpResponse;Lcom/apportable/VerdeOutputStream;Lorg/apache/http/HttpEntity;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 44
    iput-object p1, p0, Lcom/apportable/VerdeResponseHandler$1;->this$0:Lcom/apportable/VerdeResponseHandler;

    iput-object p2, p0, Lcom/apportable/VerdeResponseHandler$1;->val$response:Lorg/apache/http/HttpResponse;

    iput-object p3, p0, Lcom/apportable/VerdeResponseHandler$1;->val$mStream:Lcom/apportable/VerdeOutputStream;

    iput-object p4, p0, Lcom/apportable/VerdeResponseHandler$1;->val$entity:Lorg/apache/http/HttpEntity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 48
    :try_start_0
    iget-object v4, p0, Lcom/apportable/VerdeResponseHandler$1;->val$response:Lorg/apache/http/HttpResponse;

    const-string v5, "Content-Encoding"

    invoke-interface {v4, v5}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v2

    .line 49
    .local v2, contentEncoding:Lorg/apache/http/Header;
    if-eqz v2, :cond_1

    invoke-interface {v2}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    const-string v5, "gzip"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 50
    new-instance v3, Ljava/util/zip/GZIPInputStream;

    iget-object v4, p0, Lcom/apportable/VerdeResponseHandler$1;->val$response:Lorg/apache/http/HttpResponse;

    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .line 51
    .local v3, instream:Ljava/util/zip/GZIPInputStream;
    const/16 v4, 0x400

    new-array v0, v4, [B

    .line 53
    .local v0, buffer:[B
    :goto_0
    invoke-virtual {v3, v0}, Ljava/util/zip/GZIPInputStream;->read([B)I

    move-result v1

    .local v1, bytesRead:I
    const/4 v4, -0x1

    if-eq v1, v4, :cond_0

    .line 55
    iget-object v4, p0, Lcom/apportable/VerdeResponseHandler$1;->val$mStream:Lcom/apportable/VerdeOutputStream;

    const/4 v5, 0x0

    invoke-virtual {v4, v0, v5, v1}, Lcom/apportable/VerdeOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 60
    .end local v0           #buffer:[B
    .end local v1           #bytesRead:I
    .end local v2           #contentEncoding:Lorg/apache/http/Header;
    .end local v3           #instream:Ljava/util/zip/GZIPInputStream;
    :catch_0
    move-exception v4

    .line 63
    :cond_0
    :goto_1
    iget-object v4, p0, Lcom/apportable/VerdeResponseHandler$1;->val$mStream:Lcom/apportable/VerdeOutputStream;

    invoke-virtual {v4}, Lcom/apportable/VerdeOutputStream;->close()V

    .line 64
    return-void

    .line 58
    .restart local v2       #contentEncoding:Lorg/apache/http/Header;
    :cond_1
    :try_start_1
    iget-object v4, p0, Lcom/apportable/VerdeResponseHandler$1;->val$entity:Lorg/apache/http/HttpEntity;

    iget-object v5, p0, Lcom/apportable/VerdeResponseHandler$1;->val$mStream:Lcom/apportable/VerdeOutputStream;

    invoke-interface {v4, v5}, Lorg/apache/http/HttpEntity;->writeTo(Ljava/io/OutputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

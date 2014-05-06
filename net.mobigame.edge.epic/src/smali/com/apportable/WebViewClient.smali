.class public Lcom/apportable/WebViewClient;
.super Landroid/webkit/WebViewClient;
.source "WebViewClient.java"


# instance fields
.field private context:J


# direct methods
.method public constructor <init>(J)V
    .locals 0
    .parameter "context"

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 17
    iput-wide p1, p0, Lcom/apportable/WebViewClient;->context:J

    .line 18
    return-void
.end method

.method private native nativeOnLink(JLjava/lang/String;)Z
.end method

.method private native nativeOnPageFinished(JLjava/lang/String;)V
.end method

.method private native nativeOnPageStarted(JLjava/lang/String;)V
.end method

.method private native nativeOnReceivedError(JILjava/lang/String;Ljava/lang/String;)V
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2
    .parameter "view"
    .parameter "url"

    .prologue
    .line 27
    iget-wide v0, p0, Lcom/apportable/WebViewClient;->context:J

    invoke-direct {p0, v0, v1, p2}, Lcom/apportable/WebViewClient;->nativeOnPageFinished(JLjava/lang/String;)V

    .line 28
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 2
    .parameter "view"
    .parameter "url"
    .parameter "favicon"

    .prologue
    .line 22
    iget-wide v0, p0, Lcom/apportable/WebViewClient;->context:J

    invoke-direct {p0, v0, v1, p2}, Lcom/apportable/WebViewClient;->nativeOnPageStarted(JLjava/lang/String;)V

    .line 23
    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 6
    .parameter "view"
    .parameter "errorCode"
    .parameter "description"
    .parameter "failingUrl"

    .prologue
    .line 32
    iget-wide v1, p0, Lcom/apportable/WebViewClient;->context:J

    move-object v0, p0

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/apportable/WebViewClient;->nativeOnReceivedError(JILjava/lang/String;Ljava/lang/String;)V

    .line 33
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 2
    .parameter "view"
    .parameter "url"

    .prologue
    .line 37
    iget-wide v0, p0, Lcom/apportable/WebViewClient;->context:J

    invoke-direct {p0, v0, v1, p2}, Lcom/apportable/WebViewClient;->nativeOnLink(JLjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 38
    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 39
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

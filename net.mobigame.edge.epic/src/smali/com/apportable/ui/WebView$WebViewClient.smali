.class Lcom/apportable/ui/WebView$WebViewClient;
.super Landroid/webkit/WebViewClient;
.source "WebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/apportable/ui/WebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WebViewClient"
.end annotation


# instance fields
.field private mOwner:Lcom/apportable/ui/WebView;

.field final synthetic this$0:Lcom/apportable/ui/WebView;


# direct methods
.method constructor <init>(Lcom/apportable/ui/WebView;Lcom/apportable/ui/WebView;)V
    .locals 0
    .parameter
    .parameter "owner"

    .prologue
    .line 68
    iput-object p1, p0, Lcom/apportable/ui/WebView$WebViewClient;->this$0:Lcom/apportable/ui/WebView;

    .line 69
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 70
    iput-object p2, p0, Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;

    .line 71
    return-void
.end method

.method static synthetic access$700(Lcom/apportable/ui/WebView$WebViewClient;)Lcom/apportable/ui/WebView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 64
    iget-object v0, p0, Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;

    return-object v0
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 4
    .parameter "view"
    .parameter "url"

    .prologue
    const/4 v3, 0x0

    .line 75
    const-string v0, "WebView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "finished "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    iget-object v0, p0, Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;

    #setter for: Lcom/apportable/ui/WebView;->mLoading:Z
    invoke-static {v0, v3}, Lcom/apportable/ui/WebView;->access$302(Lcom/apportable/ui/WebView;Z)Z

    .line 77
    iget-object v0, p0, Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;

    invoke-virtual {p1}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v1

    #setter for: Lcom/apportable/ui/WebView;->mCanGoBack:Z
    invoke-static {v0, v1}, Lcom/apportable/ui/WebView;->access$402(Lcom/apportable/ui/WebView;Z)Z

    .line 78
    iget-object v0, p0, Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;

    invoke-virtual {p1}, Landroid/webkit/WebView;->canGoForward()Z

    move-result v1

    #setter for: Lcom/apportable/ui/WebView;->mCanGoForward:Z
    invoke-static {v0, v1}, Lcom/apportable/ui/WebView;->access$502(Lcom/apportable/ui/WebView;Z)Z

    .line 79
    iget-object v0, p0, Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;

    #getter for: Lcom/apportable/ui/WebView;->mRequestUrl:Ljava/util/concurrent/atomic/AtomicReference;
    invoke-static {v0}, Lcom/apportable/ui/WebView;->access$600(Lcom/apportable/ui/WebView;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 80
    iget-object v0, p0, Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;

    new-instance v1, Lcom/apportable/ui/WebView$WebViewClient$1;

    invoke-direct {v1, p0, p2}, Lcom/apportable/ui/WebView$WebViewClient$1;-><init>(Lcom/apportable/ui/WebView$WebViewClient;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v3}, Lcom/apportable/ui/WebView;->runOnGlThread(Ljava/lang/Runnable;Z)V

    .line 86
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 3
    .parameter "view"
    .parameter "url"
    .parameter "favicon"

    .prologue
    .line 90
    const-string v0, "WebView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "started "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    iget-object v0, p0, Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;

    const/4 v1, 0x1

    #setter for: Lcom/apportable/ui/WebView;->mLoading:Z
    invoke-static {v0, v1}, Lcom/apportable/ui/WebView;->access$302(Lcom/apportable/ui/WebView;Z)Z

    .line 92
    iget-object v0, p0, Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;

    invoke-virtual {p1}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v1

    #setter for: Lcom/apportable/ui/WebView;->mCanGoBack:Z
    invoke-static {v0, v1}, Lcom/apportable/ui/WebView;->access$402(Lcom/apportable/ui/WebView;Z)Z

    .line 93
    iget-object v0, p0, Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;

    invoke-virtual {p1}, Landroid/webkit/WebView;->canGoForward()Z

    move-result v1

    #setter for: Lcom/apportable/ui/WebView;->mCanGoForward:Z
    invoke-static {v0, v1}, Lcom/apportable/ui/WebView;->access$502(Lcom/apportable/ui/WebView;Z)Z

    .line 94
    iget-object v0, p0, Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;

    #getter for: Lcom/apportable/ui/WebView;->mRequestUrl:Ljava/util/concurrent/atomic/AtomicReference;
    invoke-static {v0}, Lcom/apportable/ui/WebView;->access$600(Lcom/apportable/ui/WebView;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 95
    iget-object v0, p0, Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;

    new-instance v1, Lcom/apportable/ui/WebView$WebViewClient$2;

    invoke-direct {v1, p0, p2}, Lcom/apportable/ui/WebView$WebViewClient$2;-><init>(Lcom/apportable/ui/WebView$WebViewClient;Ljava/lang/String;)V

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/apportable/ui/WebView;->runOnGlThread(Ljava/lang/Runnable;Z)V

    .line 101
    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 4
    .parameter "view"
    .parameter "errorCode"
    .parameter "description"
    .parameter "failingUrl"

    .prologue
    const/4 v3, 0x0

    .line 105
    const-string v0, "WebView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "error "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    iget-object v0, p0, Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;

    #setter for: Lcom/apportable/ui/WebView;->mLoading:Z
    invoke-static {v0, v3}, Lcom/apportable/ui/WebView;->access$302(Lcom/apportable/ui/WebView;Z)Z

    .line 107
    iget-object v0, p0, Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;

    invoke-virtual {p1}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v1

    #setter for: Lcom/apportable/ui/WebView;->mCanGoBack:Z
    invoke-static {v0, v1}, Lcom/apportable/ui/WebView;->access$402(Lcom/apportable/ui/WebView;Z)Z

    .line 108
    iget-object v0, p0, Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;

    invoke-virtual {p1}, Landroid/webkit/WebView;->canGoForward()Z

    move-result v1

    #setter for: Lcom/apportable/ui/WebView;->mCanGoForward:Z
    invoke-static {v0, v1}, Lcom/apportable/ui/WebView;->access$502(Lcom/apportable/ui/WebView;Z)Z

    .line 109
    iget-object v0, p0, Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;

    #getter for: Lcom/apportable/ui/WebView;->mRequestUrl:Ljava/util/concurrent/atomic/AtomicReference;
    invoke-static {v0}, Lcom/apportable/ui/WebView;->access$600(Lcom/apportable/ui/WebView;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 110
    iget-object v0, p0, Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;

    new-instance v1, Lcom/apportable/ui/WebView$WebViewClient$3;

    invoke-direct {v1, p0, p2, p3, p4}, Lcom/apportable/ui/WebView$WebViewClient$3;-><init>(Lcom/apportable/ui/WebView$WebViewClient;ILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v3}, Lcom/apportable/ui/WebView;->runOnGlThread(Ljava/lang/Runnable;Z)V

    .line 116
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 6
    .parameter "view"
    .parameter "url"

    .prologue
    const/4 v5, 0x0

    .line 120
    const-string v2, "WebView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "shouldOverrideUrlLoading "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 122
    .local v1, shouldLoad:Ljava/util/concurrent/atomic/AtomicBoolean;
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 124
    .local v0, finished:Ljava/util/concurrent/atomic/AtomicBoolean;
    iget-object v2, p0, Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;

    new-instance v3, Lcom/apportable/ui/WebView$WebViewClient$4;

    invoke-direct {v3, p0, v1, p2, v0}, Lcom/apportable/ui/WebView$WebViewClient$4;-><init>(Lcom/apportable/ui/WebView$WebViewClient;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/lang/String;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    invoke-virtual {v2, v3, v5}, Lcom/apportable/ui/WebView;->runOnGlThread(Ljava/lang/Runnable;Z)V

    .line 134
    iget-object v3, p0, Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;

    monitor-enter v3

    .line 135
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-nez v2, :cond_0

    .line 137
    :try_start_1
    iget-object v2, p0, Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;

    invoke-virtual {v2}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 138
    :catch_0
    move-exception v2

    goto :goto_0

    .line 140
    :cond_0
    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 141
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 142
    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 143
    :cond_1
    return v5

    .line 140
    :catchall_0
    move-exception v2

    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v2
.end method

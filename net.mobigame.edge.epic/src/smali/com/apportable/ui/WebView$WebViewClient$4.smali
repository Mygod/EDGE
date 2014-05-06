.class Lcom/apportable/ui/WebView$WebViewClient$4;
.super Ljava/lang/Object;
.source "WebView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/WebView$WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/apportable/ui/WebView$WebViewClient;

.field final synthetic val$finished:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final synthetic val$shouldLoad:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/apportable/ui/WebView$WebViewClient;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/lang/String;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 124
    iput-object p1, p0, Lcom/apportable/ui/WebView$WebViewClient$4;->this$1:Lcom/apportable/ui/WebView$WebViewClient;

    iput-object p2, p0, Lcom/apportable/ui/WebView$WebViewClient$4;->val$shouldLoad:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p3, p0, Lcom/apportable/ui/WebView$WebViewClient$4;->val$url:Ljava/lang/String;

    iput-object p4, p0, Lcom/apportable/ui/WebView$WebViewClient$4;->val$finished:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 127
    iget-object v0, p0, Lcom/apportable/ui/WebView$WebViewClient$4;->this$1:Lcom/apportable/ui/WebView$WebViewClient;

    #getter for: Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;
    invoke-static {v0}, Lcom/apportable/ui/WebView$WebViewClient;->access$700(Lcom/apportable/ui/WebView$WebViewClient;)Lcom/apportable/ui/WebView;

    move-result-object v1

    monitor-enter v1

    .line 128
    :try_start_0
    iget-object v0, p0, Lcom/apportable/ui/WebView$WebViewClient$4;->val$shouldLoad:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-object v2, p0, Lcom/apportable/ui/WebView$WebViewClient$4;->this$1:Lcom/apportable/ui/WebView$WebViewClient;

    #getter for: Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;
    invoke-static {v2}, Lcom/apportable/ui/WebView$WebViewClient;->access$700(Lcom/apportable/ui/WebView$WebViewClient;)Lcom/apportable/ui/WebView;

    move-result-object v2

    iget-object v3, p0, Lcom/apportable/ui/WebView$WebViewClient$4;->this$1:Lcom/apportable/ui/WebView$WebViewClient;

    #getter for: Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;
    invoke-static {v3}, Lcom/apportable/ui/WebView$WebViewClient;->access$700(Lcom/apportable/ui/WebView$WebViewClient;)Lcom/apportable/ui/WebView;

    move-result-object v3

    iget v3, v3, Lcom/apportable/ui/WebView;->mObject:I

    iget-object v4, p0, Lcom/apportable/ui/WebView$WebViewClient$4;->val$url:Ljava/lang/String;

    #calls: Lcom/apportable/ui/WebView;->onLink(ILjava/lang/String;)Z
    invoke-static {v2, v3, v4}, Lcom/apportable/ui/WebView;->access$1100(Lcom/apportable/ui/WebView;ILjava/lang/String;)Z

    move-result v2

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 129
    iget-object v0, p0, Lcom/apportable/ui/WebView$WebViewClient$4;->val$finished:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 130
    iget-object v0, p0, Lcom/apportable/ui/WebView$WebViewClient$4;->this$1:Lcom/apportable/ui/WebView$WebViewClient;

    #getter for: Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;
    invoke-static {v0}, Lcom/apportable/ui/WebView$WebViewClient;->access$700(Lcom/apportable/ui/WebView$WebViewClient;)Lcom/apportable/ui/WebView;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 131
    monitor-exit v1

    .line 132
    return-void

    .line 131
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

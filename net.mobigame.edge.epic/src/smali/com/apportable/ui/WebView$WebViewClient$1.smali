.class Lcom/apportable/ui/WebView$WebViewClient$1;
.super Ljava/lang/Object;
.source "WebView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/WebView$WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/apportable/ui/WebView$WebViewClient;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/apportable/ui/WebView$WebViewClient;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 80
    iput-object p1, p0, Lcom/apportable/ui/WebView$WebViewClient$1;->this$1:Lcom/apportable/ui/WebView$WebViewClient;

    iput-object p2, p0, Lcom/apportable/ui/WebView$WebViewClient$1;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 83
    iget-object v0, p0, Lcom/apportable/ui/WebView$WebViewClient$1;->this$1:Lcom/apportable/ui/WebView$WebViewClient;

    #getter for: Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;
    invoke-static {v0}, Lcom/apportable/ui/WebView$WebViewClient;->access$700(Lcom/apportable/ui/WebView$WebViewClient;)Lcom/apportable/ui/WebView;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/WebView$WebViewClient$1;->this$1:Lcom/apportable/ui/WebView$WebViewClient;

    #getter for: Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;
    invoke-static {v1}, Lcom/apportable/ui/WebView$WebViewClient;->access$700(Lcom/apportable/ui/WebView$WebViewClient;)Lcom/apportable/ui/WebView;

    move-result-object v1

    iget v1, v1, Lcom/apportable/ui/WebView;->mObject:I

    iget-object v2, p0, Lcom/apportable/ui/WebView$WebViewClient$1;->val$url:Ljava/lang/String;

    #calls: Lcom/apportable/ui/WebView;->onPageFinished(ILjava/lang/String;)V
    invoke-static {v0, v1, v2}, Lcom/apportable/ui/WebView;->access$800(Lcom/apportable/ui/WebView;ILjava/lang/String;)V

    .line 84
    return-void
.end method

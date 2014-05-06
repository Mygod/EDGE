.class Lcom/apportable/ui/WebView$WebViewClient$3;
.super Ljava/lang/Object;
.source "WebView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/WebView$WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/apportable/ui/WebView$WebViewClient;

.field final synthetic val$description:Ljava/lang/String;

.field final synthetic val$errorCode:I

.field final synthetic val$failingUrl:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/apportable/ui/WebView$WebViewClient;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 110
    iput-object p1, p0, Lcom/apportable/ui/WebView$WebViewClient$3;->this$1:Lcom/apportable/ui/WebView$WebViewClient;

    iput p2, p0, Lcom/apportable/ui/WebView$WebViewClient$3;->val$errorCode:I

    iput-object p3, p0, Lcom/apportable/ui/WebView$WebViewClient$3;->val$description:Ljava/lang/String;

    iput-object p4, p0, Lcom/apportable/ui/WebView$WebViewClient$3;->val$failingUrl:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 113
    iget-object v0, p0, Lcom/apportable/ui/WebView$WebViewClient$3;->this$1:Lcom/apportable/ui/WebView$WebViewClient;

    #getter for: Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;
    invoke-static {v0}, Lcom/apportable/ui/WebView$WebViewClient;->access$700(Lcom/apportable/ui/WebView$WebViewClient;)Lcom/apportable/ui/WebView;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/WebView$WebViewClient$3;->this$1:Lcom/apportable/ui/WebView$WebViewClient;

    #getter for: Lcom/apportable/ui/WebView$WebViewClient;->mOwner:Lcom/apportable/ui/WebView;
    invoke-static {v1}, Lcom/apportable/ui/WebView$WebViewClient;->access$700(Lcom/apportable/ui/WebView$WebViewClient;)Lcom/apportable/ui/WebView;

    move-result-object v1

    iget v1, v1, Lcom/apportable/ui/WebView;->mObject:I

    iget v2, p0, Lcom/apportable/ui/WebView$WebViewClient$3;->val$errorCode:I

    iget-object v3, p0, Lcom/apportable/ui/WebView$WebViewClient$3;->val$description:Ljava/lang/String;

    iget-object v4, p0, Lcom/apportable/ui/WebView$WebViewClient$3;->val$failingUrl:Ljava/lang/String;

    #calls: Lcom/apportable/ui/WebView;->onReceivedError(IILjava/lang/String;Ljava/lang/String;)V
    invoke-static {v0, v1, v2, v3, v4}, Lcom/apportable/ui/WebView;->access$1000(Lcom/apportable/ui/WebView;IILjava/lang/String;Ljava/lang/String;)V

    .line 114
    return-void
.end method

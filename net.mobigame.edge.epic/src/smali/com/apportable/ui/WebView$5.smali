.class Lcom/apportable/ui/WebView$5;
.super Ljava/lang/Object;
.source "WebView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/WebView;->loadData([BLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/WebView;

.field final synthetic val$baseURL:Ljava/lang/String;

.field final synthetic val$data:[B

.field final synthetic val$encodingName:Ljava/lang/String;

.field final synthetic val$mimeType:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/apportable/ui/WebView;Ljava/lang/String;[BLjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 279
    iput-object p1, p0, Lcom/apportable/ui/WebView$5;->this$0:Lcom/apportable/ui/WebView;

    iput-object p2, p0, Lcom/apportable/ui/WebView$5;->val$baseURL:Ljava/lang/String;

    iput-object p3, p0, Lcom/apportable/ui/WebView$5;->val$data:[B

    iput-object p4, p0, Lcom/apportable/ui/WebView$5;->val$mimeType:Ljava/lang/String;

    iput-object p5, p0, Lcom/apportable/ui/WebView$5;->val$encodingName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 282
    iget-object v0, p0, Lcom/apportable/ui/WebView$5;->this$0:Lcom/apportable/ui/WebView;

    #getter for: Lcom/apportable/ui/WebView;->mWebView:Landroid/webkit/WebView;
    invoke-static {v0}, Lcom/apportable/ui/WebView;->access$1200(Lcom/apportable/ui/WebView;)Landroid/webkit/WebView;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/WebView$5;->val$baseURL:Ljava/lang/String;

    new-instance v2, Ljava/lang/String;

    iget-object v3, p0, Lcom/apportable/ui/WebView$5;->val$data:[B

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>([B)V

    iget-object v3, p0, Lcom/apportable/ui/WebView$5;->val$mimeType:Ljava/lang/String;

    iget-object v4, p0, Lcom/apportable/ui/WebView$5;->val$encodingName:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    return-void
.end method

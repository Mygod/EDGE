.class Lcom/apportable/ui/WebView$6;
.super Ljava/lang/Object;
.source "WebView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/WebView;->loadHTMLString(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/WebView;

.field final synthetic val$baseURL:Ljava/lang/String;

.field final synthetic val$html:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/apportable/ui/WebView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 288
    iput-object p1, p0, Lcom/apportable/ui/WebView$6;->this$0:Lcom/apportable/ui/WebView;

    iput-object p2, p0, Lcom/apportable/ui/WebView$6;->val$baseURL:Ljava/lang/String;

    iput-object p3, p0, Lcom/apportable/ui/WebView$6;->val$html:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v4, 0x0

    .line 291
    iget-object v0, p0, Lcom/apportable/ui/WebView$6;->this$0:Lcom/apportable/ui/WebView;

    #getter for: Lcom/apportable/ui/WebView;->mWebView:Landroid/webkit/WebView;
    invoke-static {v0}, Lcom/apportable/ui/WebView;->access$1200(Lcom/apportable/ui/WebView;)Landroid/webkit/WebView;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/WebView$6;->val$baseURL:Ljava/lang/String;

    iget-object v2, p0, Lcom/apportable/ui/WebView$6;->val$html:Ljava/lang/String;

    const-string v3, "text/html"

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 292
    return-void
.end method

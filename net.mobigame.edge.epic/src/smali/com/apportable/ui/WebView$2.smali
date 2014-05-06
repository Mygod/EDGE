.class Lcom/apportable/ui/WebView$2;
.super Ljava/lang/Object;
.source "WebView.java"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/WebView;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/WebView;


# direct methods
.method constructor <init>(Lcom/apportable/ui/WebView;)V
    .locals 0
    .parameter

    .prologue
    .line 184
    iput-object p1, p0, Lcom/apportable/ui/WebView$2;->this$0:Lcom/apportable/ui/WebView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 2
    .parameter "v"
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v0, 0x1

    .line 187
    const/4 v1, 0x4

    if-ne p2, v1, :cond_1

    .line 188
    iget-object v1, p0, Lcom/apportable/ui/WebView$2;->this$0:Lcom/apportable/ui/WebView;

    #getter for: Lcom/apportable/ui/WebView;->mWebView:Landroid/webkit/WebView;
    invoke-static {v1}, Lcom/apportable/ui/WebView;->access$1200(Lcom/apportable/ui/WebView;)Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v1

    if-ne v1, v0, :cond_0

    .line 189
    iget-object v1, p0, Lcom/apportable/ui/WebView$2;->this$0:Lcom/apportable/ui/WebView;

    #getter for: Lcom/apportable/ui/WebView;->mWebView:Landroid/webkit/WebView;
    invoke-static {v1}, Lcom/apportable/ui/WebView;->access$1200(Lcom/apportable/ui/WebView;)Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/WebView;->goBack()V

    .line 195
    :goto_0
    return v0

    .line 191
    :cond_0
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v1

    invoke-virtual {v1}, Lcom/apportable/app/VerdeApplication;->getSurface()Lcom/apportable/gl/VerdeSurfaceView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView;->requestFocus()Z

    goto :goto_0

    .line 195
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

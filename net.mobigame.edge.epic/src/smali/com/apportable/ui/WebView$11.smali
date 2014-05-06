.class Lcom/apportable/ui/WebView$11;
.super Ljava/lang/Object;
.source "WebView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/WebView;->goForward()V
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
    .line 357
    iput-object p1, p0, Lcom/apportable/ui/WebView$11;->this$0:Lcom/apportable/ui/WebView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 360
    iget-object v0, p0, Lcom/apportable/ui/WebView$11;->this$0:Lcom/apportable/ui/WebView;

    #getter for: Lcom/apportable/ui/WebView;->mWebView:Landroid/webkit/WebView;
    invoke-static {v0}, Lcom/apportable/ui/WebView;->access$1200(Lcom/apportable/ui/WebView;)Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebView;->goForward()V

    .line 361
    return-void
.end method

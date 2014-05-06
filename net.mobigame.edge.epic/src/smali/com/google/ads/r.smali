.class public Lcom/google/ads/r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/ads/n;


# static fields
.field private static final a:Lcom/google/ads/internal/a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    sget-object v0, Lcom/google/ads/internal/a;->a:Lcom/google/ads/util/f;

    invoke-interface {v0}, Lcom/google/ads/util/f;->b()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/ads/internal/a;

    sput-object v0, Lcom/google/ads/r;->a:Lcom/google/ads/internal/a;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/google/ads/internal/d;Ljava/util/HashMap;Landroid/webkit/WebView;)V
    .locals 3
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/internal/d;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Landroid/webkit/WebView;",
            ")V"
        }
    .end annotation

    .prologue
    .line 34
    const-string v0, "js"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 35
    if-nez v0, :cond_0

    .line 36
    const-string v0, "Could not get the JS to evaluate."

    invoke-static {v0}, Lcom/google/ads/util/b;->b(Ljava/lang/String;)V

    .line 65
    :goto_0
    return-void

    .line 42
    :cond_0
    instance-of v1, p3, Lcom/google/ads/internal/AdWebView;

    if-eqz v1, :cond_1

    .line 43
    check-cast p3, Lcom/google/ads/internal/AdWebView;

    .line 50
    invoke-virtual {p3}, Lcom/google/ads/internal/AdWebView;->b()Lcom/google/ads/AdActivity;

    move-result-object v1

    .line 51
    if-nez v1, :cond_2

    .line 52
    const-string v0, "Could not get the AdActivity from the AdWebView."

    invoke-static {v0}, Lcom/google/ads/util/b;->b(Ljava/lang/String;)V

    goto :goto_0

    .line 45
    :cond_1
    const-string v0, "Trying to evaluate JS in a WebView that isn\'t an AdWebView"

    invoke-static {v0}, Lcom/google/ads/util/b;->b(Ljava/lang/String;)V

    goto :goto_0

    .line 57
    :cond_2
    invoke-virtual {v1}, Lcom/google/ads/AdActivity;->getOpeningAdWebView()Lcom/google/ads/internal/AdWebView;

    move-result-object v1

    .line 58
    if-nez v1, :cond_3

    .line 59
    const-string v0, "Could not get the opening WebView."

    invoke-static {v0}, Lcom/google/ads/util/b;->b(Ljava/lang/String;)V

    goto :goto_0

    .line 64
    :cond_3
    sget-object v2, Lcom/google/ads/r;->a:Lcom/google/ads/internal/a;

    invoke-virtual {v2, v1, v0}, Lcom/google/ads/internal/a;->a(Landroid/webkit/WebView;Ljava/lang/String;)V

    goto :goto_0
.end method

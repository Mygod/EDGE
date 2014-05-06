.class Lcom/google/ads/internal/c$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/ads/internal/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "c"
.end annotation


# instance fields
.field final synthetic a:Lcom/google/ads/internal/c;

.field private final b:Ljava/lang/String;

.field private final c:Ljava/lang/String;

.field private final d:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>(Lcom/google/ads/internal/c;Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 141
    iput-object p1, p0, Lcom/google/ads/internal/c$c;->a:Lcom/google/ads/internal/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 142
    iput-object p2, p0, Lcom/google/ads/internal/c$c;->d:Landroid/webkit/WebView;

    .line 143
    iput-object p3, p0, Lcom/google/ads/internal/c$c;->b:Ljava/lang/String;

    .line 144
    iput-object p4, p0, Lcom/google/ads/internal/c$c;->c:Ljava/lang/String;

    .line 145
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 149
    iget-object v0, p0, Lcom/google/ads/internal/c$c;->c:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 150
    iget-object v0, p0, Lcom/google/ads/internal/c$c;->d:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/google/ads/internal/c$c;->b:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/ads/internal/c$c;->c:Ljava/lang/String;

    const-string v3, "text/html"

    const-string v4, "utf-8"

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    :goto_0
    return-void

    .line 152
    :cond_0
    iget-object v0, p0, Lcom/google/ads/internal/c$c;->d:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/google/ads/internal/c$c;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0
.end method

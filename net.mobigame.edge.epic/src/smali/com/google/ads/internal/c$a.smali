.class Lcom/google/ads/internal/c$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/ads/internal/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field private final a:Lcom/google/ads/internal/d;

.field private final b:Landroid/webkit/WebView;

.field private final c:Lcom/google/ads/internal/f;

.field private final d:Lcom/google/ads/AdRequest$ErrorCode;

.field private final e:Z


# direct methods
.method public constructor <init>(Lcom/google/ads/internal/d;Landroid/webkit/WebView;Lcom/google/ads/internal/f;Lcom/google/ads/AdRequest$ErrorCode;Z)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    iput-object p1, p0, Lcom/google/ads/internal/c$a;->a:Lcom/google/ads/internal/d;

    .line 102
    iput-object p2, p0, Lcom/google/ads/internal/c$a;->b:Landroid/webkit/WebView;

    .line 103
    iput-object p3, p0, Lcom/google/ads/internal/c$a;->c:Lcom/google/ads/internal/f;

    .line 104
    iput-object p4, p0, Lcom/google/ads/internal/c$a;->d:Lcom/google/ads/AdRequest$ErrorCode;

    .line 105
    iput-boolean p5, p0, Lcom/google/ads/internal/c$a;->e:Z

    .line 106
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 111
    iget-object v0, p0, Lcom/google/ads/internal/c$a;->b:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 112
    iget-object v0, p0, Lcom/google/ads/internal/c$a;->b:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 113
    iget-object v0, p0, Lcom/google/ads/internal/c$a;->b:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    .line 117
    :cond_0
    iget-object v0, p0, Lcom/google/ads/internal/c$a;->c:Lcom/google/ads/internal/f;

    if-eqz v0, :cond_1

    .line 118
    iget-object v0, p0, Lcom/google/ads/internal/c$a;->c:Lcom/google/ads/internal/f;

    invoke-virtual {v0}, Lcom/google/ads/internal/f;->a()V

    .line 122
    :cond_1
    iget-boolean v0, p0, Lcom/google/ads/internal/c$a;->e:Z

    if-eqz v0, :cond_2

    .line 123
    iget-object v0, p0, Lcom/google/ads/internal/c$a;->a:Lcom/google/ads/internal/d;

    invoke-virtual {v0}, Lcom/google/ads/internal/d;->j()Lcom/google/ads/internal/AdWebView;

    move-result-object v0

    .line 124
    invoke-virtual {v0}, Lcom/google/ads/internal/AdWebView;->stopLoading()V

    .line 125
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/AdWebView;->setVisibility(I)V

    .line 129
    :cond_2
    iget-object v0, p0, Lcom/google/ads/internal/c$a;->a:Lcom/google/ads/internal/d;

    iget-object v1, p0, Lcom/google/ads/internal/c$a;->d:Lcom/google/ads/AdRequest$ErrorCode;

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/d;->a(Lcom/google/ads/AdRequest$ErrorCode;)V

    .line 130
    return-void
.end method

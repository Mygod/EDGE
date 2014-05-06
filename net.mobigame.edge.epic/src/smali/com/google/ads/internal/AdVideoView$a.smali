.class Lcom/google/ads/internal/AdVideoView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/ads/internal/AdVideoView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field private a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/google/ads/internal/AdVideoView;",
            ">;"
        }
    .end annotation
.end field

.field private b:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Lcom/google/ads/internal/AdVideoView;)V
    .locals 1
    .parameter

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/ads/internal/AdVideoView$a;->a:Ljava/lang/ref/WeakReference;

    .line 53
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/google/ads/internal/AdVideoView$a;->b:Landroid/os/Handler;

    .line 54
    return-void
.end method


# virtual methods
.method public a()V
    .locals 3

    .prologue
    .line 68
    iget-object v0, p0, Lcom/google/ads/internal/AdVideoView$a;->b:Landroid/os/Handler;

    const-wide/16 v1, 0xfa

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 69
    return-void
.end method

.method public run()V
    .locals 3

    .prologue
    .line 58
    iget-object v0, p0, Lcom/google/ads/internal/AdVideoView$a;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/ads/internal/AdVideoView;

    .line 59
    if-nez v0, :cond_0

    .line 60
    const-string v0, "The video must be gone, so cancelling the timeupdate task."

    invoke-static {v0}, Lcom/google/ads/util/b;->d(Ljava/lang/String;)V

    .line 65
    :goto_0
    return-void

    .line 63
    :cond_0
    invoke-virtual {v0}, Lcom/google/ads/internal/AdVideoView;->f()V

    .line 64
    iget-object v0, p0, Lcom/google/ads/internal/AdVideoView$a;->b:Landroid/os/Handler;

    const-wide/16 v1, 0xfa

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

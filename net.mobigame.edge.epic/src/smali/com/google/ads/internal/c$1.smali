.class Lcom/google/ads/internal/c$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/ads/internal/c;->b()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/google/ads/c;

.field final synthetic b:Lcom/google/ads/internal/c;


# direct methods
.method constructor <init>(Lcom/google/ads/internal/c;Lcom/google/ads/c;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 675
    iput-object p1, p0, Lcom/google/ads/internal/c$1;->b:Lcom/google/ads/internal/c;

    iput-object p2, p0, Lcom/google/ads/internal/c$1;->a:Lcom/google/ads/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 678
    iget-object v0, p0, Lcom/google/ads/internal/c$1;->b:Lcom/google/ads/internal/c;

    invoke-static {v0}, Lcom/google/ads/internal/c;->a(Lcom/google/ads/internal/c;)Lcom/google/ads/internal/d;

    move-result-object v0

    iget-object v1, p0, Lcom/google/ads/internal/c$1;->a:Lcom/google/ads/c;

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/d;->a(Lcom/google/ads/c;)V

    .line 679
    return-void
.end method

.class public Lcom/google/ads/d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Lcom/google/ads/c;

.field private b:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/ads/d;->a:Lcom/google/ads/c;

    .line 39
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/google/ads/d;->b:J

    .line 40
    return-void
.end method


# virtual methods
.method public a(Lcom/google/ads/c;I)V
    .locals 4
    .parameter
    .parameter

    .prologue
    .line 57
    iput-object p1, p0, Lcom/google/ads/d;->a:Lcom/google/ads/c;

    .line 58
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long v1, p2

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    .line 60
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    .line 61
    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/ads/d;->b:J

    .line 62
    return-void
.end method

.method public a()Z
    .locals 4

    .prologue
    .line 47
    iget-object v0, p0, Lcom/google/ads/d;->a:Lcom/google/ads/c;

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/ads/d;->b:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public b()Lcom/google/ads/c;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/google/ads/d;->a:Lcom/google/ads/c;

    return-object v0
.end method

.class Lcom/google/ads/k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/ads/mediation/MediationInterstitialListener;


# instance fields
.field private final a:Lcom/google/ads/h;


# direct methods
.method constructor <init>(Lcom/google/ads/h;)V
    .locals 0
    .parameter

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/google/ads/k;->a:Lcom/google/ads/h;

    .line 22
    return-void
.end method


# virtual methods
.method public onDismissScreen(Lcom/google/ads/mediation/MediationInterstitialAdapter;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationInterstitialAdapter",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .line 69
    .local p1, adapter:Lcom/google/ads/mediation/MediationInterstitialAdapter;,"Lcom/google/ads/mediation/MediationInterstitialAdapter<**>;"
    iget-object v1, p0, Lcom/google/ads/k;->a:Lcom/google/ads/h;

    monitor-enter v1

    .line 70
    :try_start_0
    iget-object v0, p0, Lcom/google/ads/k;->a:Lcom/google/ads/h;

    invoke-virtual {v0}, Lcom/google/ads/h;->i()Lcom/google/ads/e;

    move-result-object v0

    iget-object v2, p0, Lcom/google/ads/k;->a:Lcom/google/ads/h;

    invoke-virtual {v0, v2}, Lcom/google/ads/e;->b(Lcom/google/ads/h;)V

    .line 71
    monitor-exit v1

    .line 72
    return-void

    .line 71
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onFailedToReceiveAd(Lcom/google/ads/mediation/MediationInterstitialAdapter;Lcom/google/ads/AdRequest$ErrorCode;)V
    .locals 3
    .parameter
    .parameter "error"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationInterstitialAdapter",
            "<**>;",
            "Lcom/google/ads/AdRequest$ErrorCode;",
            ")V"
        }
    .end annotation

    .prologue
    .line 43
    .local p1, adapter:Lcom/google/ads/mediation/MediationInterstitialAdapter;,"Lcom/google/ads/mediation/MediationInterstitialAdapter<**>;"
    iget-object v1, p0, Lcom/google/ads/k;->a:Lcom/google/ads/h;

    monitor-enter v1

    .line 44
    :try_start_0
    iget-object v0, p0, Lcom/google/ads/k;->a:Lcom/google/ads/h;

    invoke-virtual {v0}, Lcom/google/ads/h;->h()Lcom/google/ads/mediation/MediationAdapter;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/google/ads/util/a;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Mediation adapter "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " failed to receive ad with error code: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    .line 47
    iget-object v0, p0, Lcom/google/ads/k;->a:Lcom/google/ads/h;

    invoke-virtual {v0}, Lcom/google/ads/h;->c()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 48
    const-string v0, "Got an onFailedToReceiveAd() callback after loadAdTask is done from an interstitial adapter.  Ignoring callback."

    invoke-static {v0}, Lcom/google/ads/util/b;->b(Ljava/lang/String;)V

    .line 55
    :goto_0
    monitor-exit v1

    .line 56
    return-void

    .line 53
    :cond_0
    iget-object v0, p0, Lcom/google/ads/k;->a:Lcom/google/ads/h;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/google/ads/h;->a(Z)V

    goto :goto_0

    .line 55
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onLeaveApplication(Lcom/google/ads/mediation/MediationInterstitialAdapter;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationInterstitialAdapter",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .line 76
    .local p1, adapter:Lcom/google/ads/mediation/MediationInterstitialAdapter;,"Lcom/google/ads/mediation/MediationInterstitialAdapter<**>;"
    iget-object v1, p0, Lcom/google/ads/k;->a:Lcom/google/ads/h;

    monitor-enter v1

    .line 77
    :try_start_0
    iget-object v0, p0, Lcom/google/ads/k;->a:Lcom/google/ads/h;

    invoke-virtual {v0}, Lcom/google/ads/h;->i()Lcom/google/ads/e;

    move-result-object v0

    iget-object v2, p0, Lcom/google/ads/k;->a:Lcom/google/ads/h;

    invoke-virtual {v0, v2}, Lcom/google/ads/e;->c(Lcom/google/ads/h;)V

    .line 78
    monitor-exit v1

    .line 79
    return-void

    .line 78
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onPresentScreen(Lcom/google/ads/mediation/MediationInterstitialAdapter;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationInterstitialAdapter",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .line 61
    .local p1, adapter:Lcom/google/ads/mediation/MediationInterstitialAdapter;,"Lcom/google/ads/mediation/MediationInterstitialAdapter<**>;"
    iget-object v1, p0, Lcom/google/ads/k;->a:Lcom/google/ads/h;

    monitor-enter v1

    .line 62
    :try_start_0
    iget-object v0, p0, Lcom/google/ads/k;->a:Lcom/google/ads/h;

    invoke-virtual {v0}, Lcom/google/ads/h;->i()Lcom/google/ads/e;

    move-result-object v0

    iget-object v2, p0, Lcom/google/ads/k;->a:Lcom/google/ads/h;

    invoke-virtual {v0, v2}, Lcom/google/ads/e;->a(Lcom/google/ads/h;)V

    .line 63
    monitor-exit v1

    .line 64
    return-void

    .line 63
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onReceivedAd(Lcom/google/ads/mediation/MediationInterstitialAdapter;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationInterstitialAdapter",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p1, adapter:Lcom/google/ads/mediation/MediationInterstitialAdapter;,"Lcom/google/ads/mediation/MediationInterstitialAdapter<**>;"
    iget-object v1, p0, Lcom/google/ads/k;->a:Lcom/google/ads/h;

    monitor-enter v1

    .line 28
    :try_start_0
    iget-object v0, p0, Lcom/google/ads/k;->a:Lcom/google/ads/h;

    invoke-virtual {v0}, Lcom/google/ads/h;->h()Lcom/google/ads/mediation/MediationAdapter;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/google/ads/util/a;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 29
    iget-object v0, p0, Lcom/google/ads/k;->a:Lcom/google/ads/h;

    invoke-virtual {v0}, Lcom/google/ads/h;->c()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 30
    const-string v0, "Got an onReceivedAd() callback after loadAdTask is done from an interstitial adapter. Ignoring callback."

    invoke-static {v0}, Lcom/google/ads/util/b;->b(Ljava/lang/String;)V

    .line 37
    :goto_0
    monitor-exit v1

    .line 38
    return-void

    .line 35
    :cond_0
    iget-object v0, p0, Lcom/google/ads/k;->a:Lcom/google/ads/h;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/google/ads/h;->a(Z)V

    goto :goto_0

    .line 37
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

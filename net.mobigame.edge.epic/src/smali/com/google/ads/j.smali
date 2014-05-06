.class Lcom/google/ads/j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/ads/mediation/MediationBannerListener;


# instance fields
.field private final a:Lcom/google/ads/h;

.field private b:Z


# direct methods
.method public constructor <init>(Lcom/google/ads/h;)V
    .locals 0
    .parameter

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    .line 28
    return-void
.end method


# virtual methods
.method public onClick(Lcom/google/ads/mediation/MediationBannerAdapter;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationBannerAdapter",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .line 108
    .local p1, adapter:Lcom/google/ads/mediation/MediationBannerAdapter;,"Lcom/google/ads/mediation/MediationBannerAdapter<**>;"
    iget-object v1, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    monitor-enter v1

    .line 109
    :try_start_0
    iget-object v0, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    invoke-virtual {v0}, Lcom/google/ads/h;->c()Z

    move-result v0

    invoke-static {v0}, Lcom/google/ads/util/a;->a(Z)V

    .line 110
    iget-object v0, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    invoke-virtual {v0}, Lcom/google/ads/h;->i()Lcom/google/ads/e;

    move-result-object v0

    iget-object v2, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    iget-boolean v3, p0, Lcom/google/ads/j;->b:Z

    invoke-virtual {v0, v2, v3}, Lcom/google/ads/e;->a(Lcom/google/ads/h;Z)V

    .line 111
    monitor-exit v1

    .line 112
    return-void

    .line 111
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onDismissScreen(Lcom/google/ads/mediation/MediationBannerAdapter;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationBannerAdapter",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .line 94
    .local p1, adapter:Lcom/google/ads/mediation/MediationBannerAdapter;,"Lcom/google/ads/mediation/MediationBannerAdapter<**>;"
    iget-object v1, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    monitor-enter v1

    .line 95
    :try_start_0
    iget-object v0, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    invoke-virtual {v0}, Lcom/google/ads/h;->i()Lcom/google/ads/e;

    move-result-object v0

    iget-object v2, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    invoke-virtual {v0, v2}, Lcom/google/ads/e;->b(Lcom/google/ads/h;)V

    .line 96
    monitor-exit v1

    .line 97
    return-void

    .line 96
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onFailedToReceiveAd(Lcom/google/ads/mediation/MediationBannerAdapter;Lcom/google/ads/AdRequest$ErrorCode;)V
    .locals 3
    .parameter
    .parameter "error"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationBannerAdapter",
            "<**>;",
            "Lcom/google/ads/AdRequest$ErrorCode;",
            ")V"
        }
    .end annotation

    .prologue
    .line 70
    .local p1, adapter:Lcom/google/ads/mediation/MediationBannerAdapter;,"Lcom/google/ads/mediation/MediationBannerAdapter<**>;"
    iget-object v1, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    monitor-enter v1

    .line 71
    :try_start_0
    iget-object v0, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    invoke-virtual {v0}, Lcom/google/ads/h;->h()Lcom/google/ads/mediation/MediationAdapter;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/google/ads/util/a;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 72
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

    .line 74
    iget-object v0, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    invoke-virtual {v0}, Lcom/google/ads/h;->c()Z

    move-result v0

    if-nez v0, :cond_0

    .line 77
    iget-object v0, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/google/ads/h;->a(Z)V

    .line 81
    :cond_0
    monitor-exit v1

    .line 82
    return-void

    .line 81
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onLeaveApplication(Lcom/google/ads/mediation/MediationBannerAdapter;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationBannerAdapter",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .line 101
    .local p1, adapter:Lcom/google/ads/mediation/MediationBannerAdapter;,"Lcom/google/ads/mediation/MediationBannerAdapter<**>;"
    iget-object v1, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    monitor-enter v1

    .line 102
    :try_start_0
    iget-object v0, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    invoke-virtual {v0}, Lcom/google/ads/h;->i()Lcom/google/ads/e;

    move-result-object v0

    iget-object v2, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    invoke-virtual {v0, v2}, Lcom/google/ads/e;->c(Lcom/google/ads/h;)V

    .line 103
    monitor-exit v1

    .line 104
    return-void

    .line 103
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onPresentScreen(Lcom/google/ads/mediation/MediationBannerAdapter;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationBannerAdapter",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .line 87
    .local p1, adapter:Lcom/google/ads/mediation/MediationBannerAdapter;,"Lcom/google/ads/mediation/MediationBannerAdapter<**>;"
    iget-object v1, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    monitor-enter v1

    .line 88
    :try_start_0
    iget-object v0, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    invoke-virtual {v0}, Lcom/google/ads/h;->i()Lcom/google/ads/e;

    move-result-object v0

    iget-object v2, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    invoke-virtual {v0, v2}, Lcom/google/ads/e;->a(Lcom/google/ads/h;)V

    .line 89
    monitor-exit v1

    .line 90
    return-void

    .line 89
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onReceivedAd(Lcom/google/ads/mediation/MediationBannerAdapter;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationBannerAdapter",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p1, adapter:Lcom/google/ads/mediation/MediationBannerAdapter;,"Lcom/google/ads/mediation/MediationBannerAdapter<**>;"
    iget-object v1, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    monitor-enter v1

    .line 33
    :try_start_0
    iget-object v0, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    invoke-virtual {v0}, Lcom/google/ads/h;->h()Lcom/google/ads/mediation/MediationAdapter;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/google/ads/util/a;->a(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    :try_start_1
    iget-object v0, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    invoke-interface {p1}, Lcom/google/ads/mediation/MediationBannerAdapter;->getBannerView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/ads/h;->a(Landroid/view/View;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    .line 48
    :try_start_2
    iget-object v0, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    invoke-virtual {v0}, Lcom/google/ads/h;->c()Z

    move-result v0

    if-nez v0, :cond_1

    .line 51
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/ads/j;->b:Z

    .line 54
    iget-object v0, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/google/ads/h;->a(Z)V

    .line 55
    monitor-exit v1

    .line 64
    :goto_0
    return-void

    .line 37
    :catch_0
    move-exception v0

    .line 39
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error while getting banner View from adapter ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    invoke-virtual {v3}, Lcom/google/ads/h;->g()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/google/ads/util/b;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 42
    iget-object v0, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    invoke-virtual {v0}, Lcom/google/ads/h;->c()Z

    move-result v0

    if-nez v0, :cond_0

    .line 43
    iget-object v0, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/google/ads/h;->a(Z)V

    .line 45
    :cond_0
    monitor-exit v1

    goto :goto_0

    .line 63
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 60
    :cond_1
    const/4 v0, 0x1

    :try_start_3
    iput-boolean v0, p0, Lcom/google/ads/j;->b:Z

    .line 61
    iget-object v0, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    invoke-virtual {v0}, Lcom/google/ads/h;->i()Lcom/google/ads/e;

    move-result-object v0

    iget-object v2, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    iget-object v3, p0, Lcom/google/ads/j;->a:Lcom/google/ads/h;

    invoke-virtual {v3}, Lcom/google/ads/h;->e()Landroid/view/View;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/google/ads/e;->a(Lcom/google/ads/h;Landroid/view/View;)V

    .line 63
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0
.end method

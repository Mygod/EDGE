.class public Lcom/google/ads/h;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field final a:Lcom/google/ads/internal/h;

.field private final b:Lcom/google/ads/f;

.field private c:Z

.field private d:Z

.field private final e:Lcom/google/ads/e;

.field private f:Lcom/google/ads/mediation/MediationAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/ads/mediation/MediationAdapter",
            "<**>;"
        }
    .end annotation
.end field

.field private g:Z

.field private h:Z

.field private i:Landroid/view/View;

.field private final j:Landroid/os/Handler;

.field private final k:Ljava/lang/String;

.field private final l:Lcom/google/ads/AdRequest;

.field private final m:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/ads/e;Lcom/google/ads/internal/h;Lcom/google/ads/f;Ljava/lang/String;Lcom/google/ads/AdRequest;Ljava/util/HashMap;)V
    .locals 3
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/e;",
            "Lcom/google/ads/internal/h;",
            "Lcom/google/ads/f;",
            "Ljava/lang/String;",
            "Lcom/google/ads/AdRequest;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    invoke-static {v0}, Lcom/google/ads/util/a;->b(Z)V

    .line 99
    iput-object p1, p0, Lcom/google/ads/h;->e:Lcom/google/ads/e;

    .line 100
    iput-object p2, p0, Lcom/google/ads/h;->a:Lcom/google/ads/internal/h;

    .line 101
    iput-object p3, p0, Lcom/google/ads/h;->b:Lcom/google/ads/f;

    .line 102
    iput-object p4, p0, Lcom/google/ads/h;->k:Ljava/lang/String;

    .line 103
    iput-object p5, p0, Lcom/google/ads/h;->l:Lcom/google/ads/AdRequest;

    .line 104
    iput-object p6, p0, Lcom/google/ads/h;->m:Ljava/util/HashMap;

    .line 105
    iput-boolean v1, p0, Lcom/google/ads/h;->c:Z

    .line 106
    iput-boolean v1, p0, Lcom/google/ads/h;->d:Z

    .line 107
    iput-object v2, p0, Lcom/google/ads/h;->f:Lcom/google/ads/mediation/MediationAdapter;

    .line 108
    iput-boolean v1, p0, Lcom/google/ads/h;->g:Z

    .line 109
    iput-boolean v1, p0, Lcom/google/ads/h;->h:Z

    .line 110
    iput-object v2, p0, Lcom/google/ads/h;->i:Landroid/view/View;

    .line 111
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/google/ads/h;->j:Landroid/os/Handler;

    .line 112
    return-void
.end method

.method static synthetic a(Lcom/google/ads/h;)Lcom/google/ads/mediation/MediationAdapter;
    .locals 1
    .parameter

    .prologue
    .line 42
    iget-object v0, p0, Lcom/google/ads/h;->f:Lcom/google/ads/mediation/MediationAdapter;

    return-object v0
.end method


# virtual methods
.method public a()Lcom/google/ads/f;
    .locals 1

    .prologue
    .line 118
    iget-object v0, p0, Lcom/google/ads/h;->b:Lcom/google/ads/f;

    return-object v0
.end method

.method public declared-synchronized a(Landroid/app/Activity;)V
    .locals 7
    .parameter

    .prologue
    .line 132
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/ads/h;->g:Z

    const-string v1, "startLoadAdTask has already been called."

    invoke-static {v0, v1}, Lcom/google/ads/util/a;->b(ZLjava/lang/String;)V

    .line 134
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/ads/h;->g:Z

    .line 138
    iget-object v6, p0, Lcom/google/ads/h;->j:Landroid/os/Handler;

    new-instance v0, Lcom/google/ads/i;

    iget-object v3, p0, Lcom/google/ads/h;->k:Ljava/lang/String;

    iget-object v4, p0, Lcom/google/ads/h;->l:Lcom/google/ads/AdRequest;

    iget-object v5, p0, Lcom/google/ads/h;->m:Ljava/util/HashMap;

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/google/ads/i;-><init>(Lcom/google/ads/h;Landroid/app/Activity;Ljava/lang/String;Lcom/google/ads/AdRequest;Ljava/util/HashMap;)V

    invoke-virtual {v6, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    monitor-exit p0

    return-void

    .line 132
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized a(Landroid/view/View;)V
    .locals 1
    .parameter

    .prologue
    .line 266
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/google/ads/h;->i:Landroid/view/View;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 267
    monitor-exit p0

    return-void

    .line 266
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized a(Lcom/google/ads/mediation/MediationAdapter;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/mediation/MediationAdapter",
            "<**>;)V"
        }
    .end annotation

    .prologue
    .line 251
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/google/ads/h;->f:Lcom/google/ads/mediation/MediationAdapter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 252
    monitor-exit p0

    return-void

    .line 251
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized a(Z)V
    .locals 1
    .parameter

    .prologue
    .line 244
    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lcom/google/ads/h;->d:Z

    .line 245
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/ads/h;->c:Z

    .line 246
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 247
    monitor-exit p0

    return-void

    .line 244
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized b()V
    .locals 2

    .prologue
    .line 144
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/ads/h;->g:Z

    const-string v1, "destroy() called but startLoadAdTask has not been called."

    invoke-static {v0, v1}, Lcom/google/ads/util/a;->a(ZLjava/lang/String;)V

    .line 152
    iget-object v0, p0, Lcom/google/ads/h;->j:Landroid/os/Handler;

    new-instance v1, Lcom/google/ads/h$1;

    invoke-direct {v1, p0}, Lcom/google/ads/h$1;-><init>(Lcom/google/ads/h;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 174
    monitor-exit p0

    return-void

    .line 144
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized c()Z
    .locals 1

    .prologue
    .line 181
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/ads/h;->c:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized d()Z
    .locals 2

    .prologue
    .line 190
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/google/ads/h;->c()Z

    move-result v0

    const-string v1, "isLoadAdTaskSuccessful() called when isLoadAdTaskDone() is false."

    invoke-static {v0, v1}, Lcom/google/ads/util/a;->a(ZLjava/lang/String;)V

    .line 192
    iget-boolean v0, p0, Lcom/google/ads/h;->d:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .line 190
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized e()Landroid/view/View;
    .locals 2

    .prologue
    .line 196
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/google/ads/h;->c()Z

    move-result v0

    const-string v1, "getAdView() called when isLoadAdTaskDone() is false."

    invoke-static {v0, v1}, Lcom/google/ads/util/a;->a(ZLjava/lang/String;)V

    .line 198
    iget-object v0, p0, Lcom/google/ads/h;->i:Landroid/view/View;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 196
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized f()V
    .locals 3

    .prologue
    .line 202
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/ads/h;->a:Lcom/google/ads/internal/h;

    invoke-virtual {v0}, Lcom/google/ads/internal/h;->a()Z

    move-result v0

    invoke-static {v0}, Lcom/google/ads/util/a;->a(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 206
    :try_start_1
    iget-object v0, p0, Lcom/google/ads/h;->f:Lcom/google/ads/mediation/MediationAdapter;

    check-cast v0, Lcom/google/ads/mediation/MediationInterstitialAdapter;

    .line 208
    iget-object v1, p0, Lcom/google/ads/h;->j:Landroid/os/Handler;

    new-instance v2, Lcom/google/ads/h$2;

    invoke-direct {v2, p0, v0}, Lcom/google/ads/h$2;-><init>(Lcom/google/ads/h;Lcom/google/ads/mediation/MediationInterstitialAdapter;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1} :catch_0

    .line 228
    :goto_0
    monitor-exit p0

    return-void

    .line 224
    :catch_0
    move-exception v0

    .line 225
    :try_start_2
    const-string v1, "In Ambassador.show(): ambassador.adapter does not implement the MediationInterstitialAdapter interface."

    invoke-static {v1, v0}, Lcom/google/ads/util/b;->b(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 202
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized g()Ljava/lang/String;
    .locals 1

    .prologue
    .line 238
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/ads/h;->f:Lcom/google/ads/mediation/MediationAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/ads/h;->f:Lcom/google/ads/mediation/MediationAdapter;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    const-string v0, "\"adapter was not created.\""
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized h()Lcom/google/ads/mediation/MediationAdapter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/ads/mediation/MediationAdapter",
            "<**>;"
        }
    .end annotation

    .prologue
    .line 255
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/ads/h;->f:Lcom/google/ads/mediation/MediationAdapter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method i()Lcom/google/ads/e;
    .locals 1

    .prologue
    .line 262
    iget-object v0, p0, Lcom/google/ads/h;->e:Lcom/google/ads/e;

    return-object v0
.end method

.method declared-synchronized j()V
    .locals 1

    .prologue
    .line 270
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/google/ads/h;->h:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 271
    monitor-exit p0

    return-void

    .line 270
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized k()Z
    .locals 1

    .prologue
    .line 274
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/ads/h;->h:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

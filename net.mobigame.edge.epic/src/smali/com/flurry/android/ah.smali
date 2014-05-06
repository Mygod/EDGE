.class final Lcom/flurry/android/ah;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ljava/util/List;

.field private b:Landroid/os/Handler;

.field private c:Landroid/os/Handler;

.field private d:I

.field private e:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Landroid/os/Handler;I)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/ah;->a:Ljava/util/List;

    .line 22
    iput-object p1, p0, Lcom/flurry/android/ah;->b:Landroid/os/Handler;

    .line 23
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/ah;->c:Landroid/os/Handler;

    .line 24
    iput p2, p0, Lcom/flurry/android/ah;->d:I

    .line 26
    new-instance v0, Lcom/flurry/android/k;

    invoke-direct {v0, p0}, Lcom/flurry/android/k;-><init>(Lcom/flurry/android/ah;)V

    iput-object v0, p0, Lcom/flurry/android/ah;->e:Ljava/lang/Runnable;

    .line 34
    invoke-direct {p0}, Lcom/flurry/android/ah;->b()V

    .line 35
    return-void
.end method

.method private declared-synchronized a()V
    .locals 3

    .prologue
    .line 45
    monitor-enter p0

    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 46
    iget-object v0, p0, Lcom/flurry/android/ah;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 48
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/o;

    .line 49
    if-eqz v0, :cond_0

    .line 51
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 45
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 55
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/ah;->c:Landroid/os/Handler;

    new-instance v2, Lcom/flurry/android/j;

    invoke-direct {v2, v1}, Lcom/flurry/android/j;-><init>(Ljava/util/List;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 67
    invoke-direct {p0}, Lcom/flurry/android/ah;->b()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 68
    monitor-exit p0

    return-void
.end method

.method static synthetic a(Lcom/flurry/android/ah;)V
    .locals 0
    .parameter

    .prologue
    .line 10
    invoke-direct {p0}, Lcom/flurry/android/ah;->a()V

    return-void
.end method

.method private declared-synchronized b()V
    .locals 4

    .prologue
    .line 73
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/ah;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 75
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 76
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 78
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 73
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 82
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/ah;->b:Landroid/os/Handler;

    iget-object v1, p0, Lcom/flurry/android/ah;->e:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 83
    iget-object v0, p0, Lcom/flurry/android/ah;->b:Landroid/os/Handler;

    iget-object v1, p0, Lcom/flurry/android/ah;->e:Ljava/lang/Runnable;

    iget v2, p0, Lcom/flurry/android/ah;->d:I

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 84
    monitor-exit p0

    return-void
.end method


# virtual methods
.method final declared-synchronized a(Lcom/flurry/android/o;)V
    .locals 2
    .parameter

    .prologue
    .line 39
    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Lcom/flurry/android/o;->a()V

    .line 40
    iget-object v0, p0, Lcom/flurry/android/ah;->a:Ljava/util/List;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    monitor-exit p0

    return-void

    .line 39
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

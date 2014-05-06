.class Lcom/apportable/ui/Window;
.super Lcom/apportable/ui/View;
.source "Window.java"


# direct methods
.method protected constructor <init>(Landroid/content/Context;I)V
    .locals 0
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;I)V

    .line 23
    return-void
.end method

.method public static create(Landroid/content/Context;I)Lcom/apportable/ui/Window;
    .locals 2
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 26
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 27
    new-instance v1, Lcom/apportable/ui/Window;

    invoke-direct {v1, p0, p1}, Lcom/apportable/ui/Window;-><init>(Landroid/content/Context;I)V

    .line 46
    :goto_0
    return-object v1

    .line 29
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 30
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/Window;>;"
    new-instance v1, Lcom/apportable/ui/Window$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/apportable/ui/Window$1;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;I)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 39
    monitor-enter p0

    .line 40
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 42
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 43
    :catch_0
    move-exception v1

    goto :goto_1

    .line 45
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 46
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/Window;

    goto :goto_0

    .line 45
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method


# virtual methods
.method protected layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;
    .locals 2
    .parameter "frame"

    .prologue
    const/4 v1, -0x1

    .line 52
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public makeKeyAndOrderFront()V
    .locals 2

    .prologue
    .line 56
    new-instance v0, Lcom/apportable/ui/Window$2;

    invoke-direct {v0, p0}, Lcom/apportable/ui/Window$2;-><init>(Lcom/apportable/ui/Window;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Window;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 67
    return-void
.end method

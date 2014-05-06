.class Lcom/apportable/ui/ActivityIndicatorView;
.super Lcom/apportable/ui/View;
.source "ActivityIndicatorView.java"


# instance fields
.field private mProgressBar:Landroid/widget/ProgressBar;


# direct methods
.method protected constructor <init>(Landroid/content/Context;I)V
    .locals 0
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;I)V

    .line 37
    invoke-direct {p0}, Lcom/apportable/ui/ActivityIndicatorView;->init()V

    .line 38
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;ILandroid/graphics/RectF;)V
    .locals 0
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 41
    invoke-direct {p0, p1, p2, p3}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 42
    invoke-direct {p0}, Lcom/apportable/ui/ActivityIndicatorView;->init()V

    .line 43
    return-void
.end method

.method public static create(Landroid/content/Context;I)Lcom/apportable/ui/ActivityIndicatorView;
    .locals 2
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 46
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 47
    new-instance v1, Lcom/apportable/ui/ActivityIndicatorView;

    invoke-direct {v1, p0, p1}, Lcom/apportable/ui/ActivityIndicatorView;-><init>(Landroid/content/Context;I)V

    .line 66
    :goto_0
    return-object v1

    .line 49
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 50
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/ActivityIndicatorView;>;"
    new-instance v1, Lcom/apportable/ui/ActivityIndicatorView$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/apportable/ui/ActivityIndicatorView$1;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;I)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 59
    monitor-enter p0

    .line 60
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 62
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 63
    :catch_0
    move-exception v1

    goto :goto_1

    .line 65
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 66
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/ActivityIndicatorView;

    goto :goto_0

    .line 65
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public static create(Landroid/content/Context;ILandroid/graphics/RectF;)Lcom/apportable/ui/ActivityIndicatorView;
    .locals 2
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 71
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 72
    new-instance v1, Lcom/apportable/ui/ActivityIndicatorView;

    invoke-direct {v1, p0, p1, p2}, Lcom/apportable/ui/ActivityIndicatorView;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 91
    :goto_0
    return-object v1

    .line 74
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 75
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/ActivityIndicatorView;>;"
    new-instance v1, Lcom/apportable/ui/ActivityIndicatorView$2;

    invoke-direct {v1, p0, v0, p1, p2}, Lcom/apportable/ui/ActivityIndicatorView$2;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;ILandroid/graphics/RectF;)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 84
    monitor-enter p0

    .line 85
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 87
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 88
    :catch_0
    move-exception v1

    goto :goto_1

    .line 90
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 91
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/ActivityIndicatorView;

    goto :goto_0

    .line 90
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method private init()V
    .locals 4

    .prologue
    .line 25
    new-instance v0, Landroid/widget/ProgressBar;

    invoke-virtual {p0}, Lcom/apportable/ui/ActivityIndicatorView;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    const v3, 0x101007a

    invoke-direct {v0, v1, v2, v3}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v0, p0, Lcom/apportable/ui/ActivityIndicatorView;->mProgressBar:Landroid/widget/ProgressBar;

    .line 26
    iget-object v0, p0, Lcom/apportable/ui/ActivityIndicatorView;->mProgressBar:Landroid/widget/ProgressBar;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 27
    iget-object v0, p0, Lcom/apportable/ui/ActivityIndicatorView;->mProgressBar:Landroid/widget/ProgressBar;

    new-instance v1, Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/apportable/ui/ActivityIndicatorView;->getFrame()Landroid/graphics/RectF;

    move-result-object v2

    invoke-static {v2}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/apportable/ui/ActivityIndicatorView;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/ActivityIndicatorView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    return-void
.end method


# virtual methods
.method protected _setFrame(Landroid/graphics/RectF;)V
    .locals 2
    .parameter "frame"

    .prologue
    .line 31
    invoke-super {p0, p1}, Lcom/apportable/ui/View;->_setFrame(Landroid/graphics/RectF;)V

    .line 32
    iget-object v0, p0, Lcom/apportable/ui/ActivityIndicatorView;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-static {p1}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/apportable/ui/ActivityIndicatorView;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 33
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 0

    .prologue
    .line 97
    invoke-super {p0}, Lcom/apportable/ui/View;->onAttachedToWindow()V

    .line 98
    return-void
.end method

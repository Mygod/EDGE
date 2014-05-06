.class Lcom/apportable/ui/ScrollView;
.super Lcom/apportable/ui/View;
.source "ScrollView.java"


# instance fields
.field private mScrollContainer:Landroid/widget/AbsoluteLayout;

.field private mScrollView:Landroid/widget/ScrollView;


# direct methods
.method protected constructor <init>(Landroid/content/Context;I)V
    .locals 3
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 64
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;I)V

    .line 65
    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/apportable/ui/ScrollView;->mScrollView:Landroid/widget/ScrollView;

    .line 67
    invoke-direct {p0, p1}, Lcom/apportable/ui/ScrollView;->initView(Landroid/content/Context;)V

    .line 68
    iget-object v0, p0, Lcom/apportable/ui/ScrollView;->mScrollView:Landroid/widget/ScrollView;

    new-instance v1, Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/apportable/ui/ScrollView;->getFrame()Landroid/graphics/RectF;

    move-result-object v2

    invoke-static {v2}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/apportable/ui/ScrollView;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 69
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;ILandroid/graphics/RectF;)V
    .locals 3
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 72
    invoke-direct {p0, p1, p2, p3}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 73
    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/apportable/ui/ScrollView;->mScrollView:Landroid/widget/ScrollView;

    .line 75
    invoke-direct {p0, p1}, Lcom/apportable/ui/ScrollView;->initView(Landroid/content/Context;)V

    .line 76
    iget-object v0, p0, Lcom/apportable/ui/ScrollView;->mScrollView:Landroid/widget/ScrollView;

    new-instance v1, Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/apportable/ui/ScrollView;->getFrame()Landroid/graphics/RectF;

    move-result-object v2

    invoke-static {v2}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/apportable/ui/ScrollView;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 77
    return-void
.end method

.method static synthetic access$000(Lcom/apportable/ui/ScrollView;)Landroid/widget/AbsoluteLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 12
    iget-object v0, p0, Lcom/apportable/ui/ScrollView;->mScrollContainer:Landroid/widget/AbsoluteLayout;

    return-object v0
.end method

.method static synthetic access$100(Lcom/apportable/ui/ScrollView;)Landroid/widget/ScrollView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 12
    iget-object v0, p0, Lcom/apportable/ui/ScrollView;->mScrollView:Landroid/widget/ScrollView;

    return-object v0
.end method

.method public static create(Landroid/content/Context;I)Lcom/apportable/ui/ScrollView;
    .locals 2
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 17
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 18
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/ScrollView;>;"
    new-instance v1, Lcom/apportable/ui/ScrollView$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/apportable/ui/ScrollView$1;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;I)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 27
    monitor-enter p0

    .line 28
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_0

    .line 30
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 31
    :catch_0
    move-exception v1

    goto :goto_0

    .line 33
    :cond_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/ScrollView;

    return-object v1

    .line 33
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public static create(Landroid/content/Context;ILandroid/graphics/RectF;)Lcom/apportable/ui/ScrollView;
    .locals 2
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 38
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 39
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/ScrollView;>;"
    new-instance v1, Lcom/apportable/ui/ScrollView$2;

    invoke-direct {v1, p0, v0, p1, p2}, Lcom/apportable/ui/ScrollView$2;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;ILandroid/graphics/RectF;)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 48
    monitor-enter p0

    .line 49
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_0

    .line 51
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 52
    :catch_0
    move-exception v1

    goto :goto_0

    .line 54
    :cond_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 55
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/ScrollView;

    return-object v1

    .line 54
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method private initView(Landroid/content/Context;)V
    .locals 2
    .parameter "ctx"

    .prologue
    .line 59
    new-instance v0, Landroid/widget/AbsoluteLayout;

    invoke-direct {v0, p1}, Landroid/widget/AbsoluteLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/apportable/ui/ScrollView;->mScrollContainer:Landroid/widget/AbsoluteLayout;

    .line 60
    iget-object v0, p0, Lcom/apportable/ui/ScrollView;->mScrollView:Landroid/widget/ScrollView;

    iget-object v1, p0, Lcom/apportable/ui/ScrollView;->mScrollContainer:Landroid/widget/AbsoluteLayout;

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 61
    return-void
.end method


# virtual methods
.method public addSubviewToScrollContainer(Lcom/apportable/ui/View;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 80
    if-nez p1, :cond_0

    .line 90
    :goto_0
    return-void

    .line 83
    :cond_0
    new-instance v0, Lcom/apportable/ui/ScrollView$3;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/ScrollView$3;-><init>(Lcom/apportable/ui/ScrollView;Lcom/apportable/ui/View;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/ScrollView;->runOnUiThread(Ljava/lang/Runnable;Z)V

    goto :goto_0
.end method

.method public setContentSize(II)V
    .locals 3
    .parameter "width"
    .parameter "height"

    .prologue
    .line 99
    invoke-virtual {p0}, Lcom/apportable/ui/ScrollView;->getBounds()Landroid/graphics/RectF;

    move-result-object v0

    .line 100
    .local v0, bounds:Landroid/graphics/RectF;
    new-instance v1, Lcom/apportable/ui/ScrollView$4;

    invoke-direct {v1, p0, v0}, Lcom/apportable/ui/ScrollView$4;-><init>(Lcom/apportable/ui/ScrollView;Landroid/graphics/RectF;)V

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/apportable/ui/ScrollView;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 106
    return-void
.end method

.class Lcom/apportable/ui/PickerView;
.super Lcom/apportable/ui/View;
.source "PickerView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/apportable/ui/PickerView$PickerAdapter;
    }
.end annotation


# instance fields
.field private isInitialized:Z

.field private mNumberOfComponents:I

.field private mNumberOfRowsByComponent:[I

.field private mPickerView:Landroid/widget/LinearLayout;

.field private mRowHeightByComponent:[I

.field private mWidthByComponent:[I


# direct methods
.method protected constructor <init>(Landroid/content/Context;I)V
    .locals 3
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 113
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;I)V

    .line 114
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/apportable/ui/PickerView;->mPickerView:Landroid/widget/LinearLayout;

    .line 115
    iget-object v0, p0, Lcom/apportable/ui/PickerView;->mPickerView:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/apportable/ui/PickerView;->getFrame()Landroid/graphics/RectF;

    move-result-object v2

    invoke-static {v2}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/apportable/ui/PickerView;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/PickerView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 116
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;ILandroid/graphics/RectF;)V
    .locals 3
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 119
    invoke-direct {p0, p1, p2, p3}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 120
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/apportable/ui/PickerView;->mPickerView:Landroid/widget/LinearLayout;

    .line 121
    iget-object v0, p0, Lcom/apportable/ui/PickerView;->mPickerView:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/apportable/ui/PickerView;->getFrame()Landroid/graphics/RectF;

    move-result-object v2

    invoke-static {v2}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/apportable/ui/PickerView;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/PickerView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 122
    return-void
.end method

.method static synthetic access$000(Lcom/apportable/ui/PickerView;)[I
    .locals 1
    .parameter "x0"

    .prologue
    .line 16
    iget-object v0, p0, Lcom/apportable/ui/PickerView;->mRowHeightByComponent:[I

    return-object v0
.end method

.method public static create(Landroid/content/Context;I)Lcom/apportable/ui/PickerView;
    .locals 2
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 32
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 33
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/PickerView;>;"
    new-instance v1, Lcom/apportable/ui/PickerView$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/apportable/ui/PickerView$1;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;I)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 42
    monitor-enter p0

    .line 43
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_0

    .line 45
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 46
    :catch_0
    move-exception v1

    goto :goto_0

    .line 48
    :cond_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 49
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/PickerView;

    return-object v1

    .line 48
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public static create(Landroid/content/Context;ILandroid/graphics/RectF;)Lcom/apportable/ui/PickerView;
    .locals 2
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 53
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 54
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/PickerView;>;"
    new-instance v1, Lcom/apportable/ui/PickerView$2;

    invoke-direct {v1, p0, v0, p1, p2}, Lcom/apportable/ui/PickerView$2;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;ILandroid/graphics/RectF;)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 63
    monitor-enter p0

    .line 64
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_0

    .line 66
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 67
    :catch_0
    move-exception v1

    goto :goto_0

    .line 69
    :cond_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 70
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/PickerView;

    return-object v1

    .line 69
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method private initComponents()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 87
    iget-boolean v4, p0, Lcom/apportable/ui/PickerView;->isInitialized:Z

    if-nez v4, :cond_0

    .line 88
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/apportable/ui/PickerView;->isInitialized:Z

    .line 92
    iget-object v4, p0, Lcom/apportable/ui/PickerView;->mNumberOfRowsByComponent:[I

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/apportable/ui/PickerView;->mWidthByComponent:[I

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/apportable/ui/PickerView;->mRowHeightByComponent:[I

    if-nez v4, :cond_1

    .line 110
    :cond_0
    return-void

    .line 95
    :cond_1
    iget-object v4, p0, Lcom/apportable/ui/PickerView;->mPickerView:Landroid/widget/LinearLayout;

    invoke-virtual {v4}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 96
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget v4, p0, Lcom/apportable/ui/PickerView;->mNumberOfComponents:I

    if-ge v1, v4, :cond_0

    .line 97
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v4, p0, Lcom/apportable/ui/PickerView;->mWidthByComponent:[I

    aget v4, v4, v1

    const/4 v5, -0x1

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 98
    .local v3, params:Landroid/widget/LinearLayout$LayoutParams;
    new-instance v2, Landroid/widget/ListView;

    invoke-virtual {p0}, Lcom/apportable/ui/PickerView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 99
    .local v2, listView:Landroid/widget/ListView;
    invoke-virtual {v2, v6}, Landroid/widget/ListView;->setCacheColorHint(I)V

    .line 101
    invoke-virtual {v2, v6}, Landroid/widget/ListView;->setVerticalScrollBarEnabled(Z)V

    .line 102
    invoke-virtual {v2, v6}, Landroid/widget/ListView;->setHorizontalScrollBarEnabled(Z)V

    .line 104
    new-instance v0, Lcom/apportable/ui/PickerView$PickerAdapter;

    invoke-direct {v0, p0, p0, v1}, Lcom/apportable/ui/PickerView$PickerAdapter;-><init>(Lcom/apportable/ui/PickerView;Lcom/apportable/ui/PickerView;I)V

    .line 105
    .local v0, adapter:Lcom/apportable/ui/PickerView$PickerAdapter;
    iget-object v4, p0, Lcom/apportable/ui/PickerView;->mNumberOfRowsByComponent:[I

    aget v4, v4, v1

    invoke-virtual {v0, v4}, Lcom/apportable/ui/PickerView$PickerAdapter;->setNumberOfRowsInComponent(I)V

    .line 106
    invoke-virtual {v2, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 108
    iget-object v4, p0, Lcom/apportable/ui/PickerView;->mPickerView:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 96
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method public native numberOfComponents(I)I
.end method

.method public native numberOfRowsInComponent(II)I
.end method

.method protected onAttachedToWindow()V
    .locals 0

    .prologue
    .line 126
    invoke-super {p0}, Lcom/apportable/ui/View;->onAttachedToWindow()V

    .line 127
    invoke-direct {p0}, Lcom/apportable/ui/PickerView;->initComponents()V

    .line 128
    return-void
.end method

.method public reloadData()V
    .locals 3

    .prologue
    .line 74
    iget v1, p0, Lcom/apportable/ui/PickerView;->mObject:I

    invoke-virtual {p0, v1}, Lcom/apportable/ui/PickerView;->numberOfComponents(I)I

    move-result v1

    iput v1, p0, Lcom/apportable/ui/PickerView;->mNumberOfComponents:I

    .line 75
    iget v1, p0, Lcom/apportable/ui/PickerView;->mNumberOfComponents:I

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/apportable/ui/PickerView;->mNumberOfRowsByComponent:[I

    .line 76
    iget v1, p0, Lcom/apportable/ui/PickerView;->mNumberOfComponents:I

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/apportable/ui/PickerView;->mWidthByComponent:[I

    .line 77
    iget v1, p0, Lcom/apportable/ui/PickerView;->mNumberOfComponents:I

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/apportable/ui/PickerView;->mRowHeightByComponent:[I

    .line 79
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lcom/apportable/ui/PickerView;->mNumberOfComponents:I

    if-ge v0, v1, :cond_0

    .line 80
    iget-object v1, p0, Lcom/apportable/ui/PickerView;->mNumberOfRowsByComponent:[I

    iget v2, p0, Lcom/apportable/ui/PickerView;->mObject:I

    invoke-virtual {p0, v2, v0}, Lcom/apportable/ui/PickerView;->numberOfRowsInComponent(II)I

    move-result v2

    aput v2, v1, v0

    .line 81
    iget-object v1, p0, Lcom/apportable/ui/PickerView;->mWidthByComponent:[I

    iget v2, p0, Lcom/apportable/ui/PickerView;->mObject:I

    invoke-virtual {p0, v2, v0}, Lcom/apportable/ui/PickerView;->widthForComponent(II)I

    move-result v2

    aput v2, v1, v0

    .line 82
    iget-object v1, p0, Lcom/apportable/ui/PickerView;->mRowHeightByComponent:[I

    iget v2, p0, Lcom/apportable/ui/PickerView;->mObject:I

    invoke-virtual {p0, v2, v0}, Lcom/apportable/ui/PickerView;->rowHeightForComponent(II)I

    move-result v2

    aput v2, v1, v0

    .line 79
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 84
    :cond_0
    return-void
.end method

.method public native rowHeightForComponent(II)I
.end method

.method public native widthForComponent(II)I
.end method

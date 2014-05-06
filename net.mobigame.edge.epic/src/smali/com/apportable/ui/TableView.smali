.class Lcom/apportable/ui/TableView;
.super Lcom/apportable/ui/View;
.source "TableView.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/apportable/ui/TableView$TableViewAdapter;
    }
.end annotation


# instance fields
.field private mCellHeights:[F

.field private mListView:Landroid/widget/ListView;


# direct methods
.method protected constructor <init>(Landroid/content/Context;I)V
    .locals 0
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 118
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;I)V

    .line 119
    invoke-direct {p0}, Lcom/apportable/ui/TableView;->init()V

    .line 120
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;ILandroid/graphics/RectF;)V
    .locals 0
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 123
    invoke-direct {p0, p1, p2, p3}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 124
    invoke-direct {p0}, Lcom/apportable/ui/TableView;->init()V

    .line 125
    return-void
.end method

.method static synthetic access$000(Lcom/apportable/ui/TableView;)[F
    .locals 1
    .parameter "x0"

    .prologue
    .line 24
    iget-object v0, p0, Lcom/apportable/ui/TableView;->mCellHeights:[F

    return-object v0
.end method

.method static synthetic access$200(Lcom/apportable/ui/TableView;)Landroid/widget/ListView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 24
    iget-object v0, p0, Lcom/apportable/ui/TableView;->mListView:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/apportable/ui/TableView;II)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/TableView;->cellClicked(II)V

    return-void
.end method

.method private native cellClicked(II)V
.end method

.method private native cellHeight(II)F
.end method

.method public static create(Landroid/content/Context;I)Lcom/apportable/ui/TableView;
    .locals 2
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 128
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 129
    new-instance v1, Lcom/apportable/ui/TableView;

    invoke-direct {v1, p0, p1}, Lcom/apportable/ui/TableView;-><init>(Landroid/content/Context;I)V

    .line 148
    :goto_0
    return-object v1

    .line 131
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 132
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/TableView;>;"
    new-instance v1, Lcom/apportable/ui/TableView$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/apportable/ui/TableView$1;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;I)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 141
    monitor-enter p0

    .line 142
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 144
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 145
    :catch_0
    move-exception v1

    goto :goto_1

    .line 147
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 148
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/TableView;

    goto :goto_0

    .line 147
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public static create(Landroid/content/Context;ILandroid/graphics/RectF;)Lcom/apportable/ui/TableView;
    .locals 2
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 153
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 154
    new-instance v1, Lcom/apportable/ui/TableView;

    invoke-direct {v1, p0, p1, p2}, Lcom/apportable/ui/TableView;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 173
    :goto_0
    return-object v1

    .line 156
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 157
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/TableView;>;"
    new-instance v1, Lcom/apportable/ui/TableView$2;

    invoke-direct {v1, p0, v0, p1, p2}, Lcom/apportable/ui/TableView$2;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;ILandroid/graphics/RectF;)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 166
    monitor-enter p0

    .line 167
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 169
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 170
    :catch_0
    move-exception v1

    goto :goto_1

    .line 172
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 173
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/TableView;

    goto :goto_0

    .line 172
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method private init()V
    .locals 3

    .prologue
    .line 97
    new-instance v0, Landroid/widget/ListView;

    invoke-virtual {p0}, Lcom/apportable/ui/TableView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/apportable/ui/TableView;->mListView:Landroid/widget/ListView;

    .line 98
    iget-object v0, p0, Lcom/apportable/ui/TableView;->mListView:Landroid/widget/ListView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setCacheColorHint(I)V

    .line 99
    iget-object v0, p0, Lcom/apportable/ui/TableView;->mListView:Landroid/widget/ListView;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/high16 v2, -0x100

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 100
    iget-object v0, p0, Lcom/apportable/ui/TableView;->mListView:Landroid/widget/ListView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 101
    iget-object v0, p0, Lcom/apportable/ui/TableView;->mListView:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 102
    iget-object v0, p0, Lcom/apportable/ui/TableView;->mListView:Landroid/widget/ListView;

    new-instance v1, Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/apportable/ui/TableView;->getFrame()Landroid/graphics/RectF;

    move-result-object v2

    invoke-static {v2}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/apportable/ui/TableView;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/TableView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 103
    iget-object v0, p0, Lcom/apportable/ui/TableView;->mListView:Landroid/widget/ListView;

    new-instance v1, Lcom/apportable/ui/TableView$TableViewAdapter;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/apportable/ui/TableView$TableViewAdapter;-><init>(Lcom/apportable/ui/TableView;Lcom/apportable/ui/TableView$1;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 104
    return-void
.end method

.method private native onScroll(IIII)V
.end method


# virtual methods
.method protected __setBackgroundColor(I)V
    .locals 1
    .parameter "color"

    .prologue
    .line 208
    invoke-super {p0, p1}, Lcom/apportable/ui/View;->__setBackgroundColor(I)V

    .line 209
    iget-object v0, p0, Lcom/apportable/ui/TableView;->mListView:Landroid/widget/ListView;

    invoke-virtual {v0, p1}, Landroid/widget/ListView;->setBackgroundColor(I)V

    .line 210
    return-void
.end method

.method protected _setClipChildren(Z)V
    .locals 0
    .parameter "clips"

    .prologue
    .line 109
    return-void
.end method

.method protected _setFrame(Landroid/graphics/RectF;)V
    .locals 2
    .parameter "frame"

    .prologue
    .line 113
    invoke-super {p0, p1}, Lcom/apportable/ui/View;->_setFrame(Landroid/graphics/RectF;)V

    .line 114
    iget-object v0, p0, Lcom/apportable/ui/TableView;->mListView:Landroid/widget/ListView;

    invoke-static {p1}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/apportable/ui/TableView;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 115
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 3

    .prologue
    .line 224
    invoke-super {p0}, Lcom/apportable/ui/View;->onAttachedToWindow()V

    .line 225
    iget-object v0, p0, Lcom/apportable/ui/TableView;->mListView:Landroid/widget/ListView;

    new-instance v1, Lcom/apportable/ui/TableView$TableViewAdapter;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/apportable/ui/TableView$TableViewAdapter;-><init>(Lcom/apportable/ui/TableView;Lcom/apportable/ui/TableView$1;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 226
    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
    .parameter
    .parameter "view"
    .parameter "position"
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 230
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    new-instance v0, Lcom/apportable/ui/TableView$5;

    invoke-direct {v0, p0, p3}, Lcom/apportable/ui/TableView$5;-><init>(Lcom/apportable/ui/TableView;I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/TableView;->runOnGlThread(Ljava/lang/Runnable;Z)V

    .line 237
    return-void
.end method

.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 1
    .parameter "view"
    .parameter "firstVisibleItem"
    .parameter "visibleItemCount"
    .parameter "totalItemCount"

    .prologue
    .line 214
    iget v0, p0, Lcom/apportable/ui/TableView;->mObject:I

    invoke-direct {p0, v0, p2, p3, p4}, Lcom/apportable/ui/TableView;->onScroll(IIII)V

    .line 215
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 0
    .parameter "view"
    .parameter "scrollState"

    .prologue
    .line 220
    return-void
.end method

.method public reloadData(I)V
    .locals 3
    .parameter "count"

    .prologue
    .line 178
    new-array v1, p1, [F

    iput-object v1, p0, Lcom/apportable/ui/TableView;->mCellHeights:[F

    .line 180
    const/4 v0, 0x0

    .local v0, idx:I
    :goto_0
    if-ge v0, p1, :cond_0

    .line 182
    iget-object v1, p0, Lcom/apportable/ui/TableView;->mCellHeights:[F

    iget v2, p0, Lcom/apportable/ui/TableView;->mObject:I

    invoke-direct {p0, v2, v0}, Lcom/apportable/ui/TableView;->cellHeight(II)F

    move-result v2

    aput v2, v1, v0

    .line 180
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 185
    :cond_0
    iget-boolean v1, p0, Lcom/apportable/ui/TableView;->mInWindow:Z

    if-eqz v1, :cond_1

    .line 186
    new-instance v1, Lcom/apportable/ui/TableView$3;

    invoke-direct {v1, p0}, Lcom/apportable/ui/TableView$3;-><init>(Lcom/apportable/ui/TableView;)V

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/apportable/ui/TableView;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 193
    :cond_1
    return-void
.end method

.method public scrollToRow(IZ)V
    .locals 2
    .parameter "row"
    .parameter "animated"

    .prologue
    .line 196
    iget-boolean v0, p0, Lcom/apportable/ui/TableView;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 197
    new-instance v0, Lcom/apportable/ui/TableView$4;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/TableView$4;-><init>(Lcom/apportable/ui/TableView;I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/TableView;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 204
    :cond_0
    return-void
.end method

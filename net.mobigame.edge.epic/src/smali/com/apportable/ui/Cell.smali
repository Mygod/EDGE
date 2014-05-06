.class public abstract Lcom/apportable/ui/Cell;
.super Lcom/apportable/ui/View;
.source "Cell.java"


# instance fields
.field private mContainer:I

.field private mHeight:F

.field private mRow:I


# direct methods
.method public constructor <init>(Landroid/content/Context;IIF)V
    .locals 3
    .parameter "context"
    .parameter "row"
    .parameter "container"
    .parameter "height"

    .prologue
    .line 22
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;I)V

    .line 11
    const/high16 v0, 0x4230

    iput v0, p0, Lcom/apportable/ui/Cell;->mHeight:F

    .line 23
    iput p4, p0, Lcom/apportable/ui/Cell;->mHeight:F

    .line 24
    new-instance v0, Landroid/widget/AbsListView$LayoutParams;

    const/4 v1, -0x1

    float-to-int v2, p4

    invoke-direct {v0, v1, v2}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0}, Lcom/apportable/ui/Cell;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    iput p2, p0, Lcom/apportable/ui/Cell;->mRow:I

    .line 26
    iput p3, p0, Lcom/apportable/ui/Cell;->mContainer:I

    .line 27
    return-void
.end method

.method static synthetic access$000(Lcom/apportable/ui/Cell;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 8
    iget v0, p0, Lcom/apportable/ui/Cell;->mContainer:I

    return v0
.end method

.method static synthetic access$100(Lcom/apportable/ui/Cell;)F
    .locals 1
    .parameter "x0"

    .prologue
    .line 8
    iget v0, p0, Lcom/apportable/ui/Cell;->mHeight:F

    return v0
.end method


# virtual methods
.method public abstract getCellView(II)Lcom/apportable/ui/View;
.end method

.method protected layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;
    .locals 3
    .parameter "frame"

    .prologue
    .line 64
    new-instance v0, Landroid/widget/AbsListView$LayoutParams;

    const/4 v1, -0x1

    iget v2, p0, Lcom/apportable/ui/Cell;->mHeight:F

    float-to-int v2, v2

    invoke-direct {v0, v1, v2}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public loadView()V
    .locals 4

    .prologue
    .line 40
    iget v2, p0, Lcom/apportable/ui/Cell;->mContainer:I

    iget v3, p0, Lcom/apportable/ui/Cell;->mRow:I

    invoke-virtual {p0, v2, v3}, Lcom/apportable/ui/Cell;->getCellView(II)Lcom/apportable/ui/View;

    move-result-object v0

    .line 41
    .local v0, cellView:Lcom/apportable/ui/View;
    if-nez v0, :cond_0

    .line 61
    :goto_0
    return-void

    .line 45
    :cond_0
    iget v2, v0, Lcom/apportable/ui/View;->mObject:I

    iput v2, p0, Lcom/apportable/ui/Cell;->mObject:I

    .line 47
    move-object v1, v0

    .line 48
    .local v1, cellViewRef:Lcom/apportable/ui/View;
    new-instance v2, Lcom/apportable/ui/Cell$1;

    invoke-direct {v2, p0, v1}, Lcom/apportable/ui/Cell$1;-><init>(Lcom/apportable/ui/Cell;Lcom/apportable/ui/View;)V

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/apportable/ui/Cell;->runOnUiThread(Ljava/lang/Runnable;Z)V

    goto :goto_0
.end method

.method public abstract onCellAttached(II)V
.end method

.method public abstract onCellDetached(II)V
.end method

.method public prepareForReuse(IF)V
    .locals 3
    .parameter "row"
    .parameter "height"

    .prologue
    .line 30
    iget v0, p0, Lcom/apportable/ui/Cell;->mContainer:I

    iget v1, p0, Lcom/apportable/ui/Cell;->mObject:I

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Cell;->onCellDetached(II)V

    .line 31
    iput p1, p0, Lcom/apportable/ui/Cell;->mRow:I

    .line 32
    const/4 v0, 0x0

    iput v0, p0, Lcom/apportable/ui/Cell;->mObject:I

    .line 33
    invoke-virtual {p0}, Lcom/apportable/ui/Cell;->removeAllViews()V

    .line 34
    iput p2, p0, Lcom/apportable/ui/Cell;->mHeight:F

    .line 35
    new-instance v0, Landroid/widget/AbsListView$LayoutParams;

    const/4 v1, -0x1

    float-to-int v2, p2

    invoke-direct {v0, v1, v2}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0}, Lcom/apportable/ui/Cell;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    return-void
.end method

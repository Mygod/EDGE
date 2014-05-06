.class Lcom/apportable/ui/TableView$TableViewAdapter;
.super Landroid/widget/BaseAdapter;
.source "TableView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/apportable/ui/TableView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TableViewAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/TableView;


# direct methods
.method private constructor <init>(Lcom/apportable/ui/TableView;)V
    .locals 0
    .parameter

    .prologue
    .line 38
    iput-object p1, p0, Lcom/apportable/ui/TableView$TableViewAdapter;->this$0:Lcom/apportable/ui/TableView;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/apportable/ui/TableView;Lcom/apportable/ui/TableView$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/apportable/ui/TableView$TableViewAdapter;-><init>(Lcom/apportable/ui/TableView;)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/apportable/ui/TableView$TableViewAdapter;->this$0:Lcom/apportable/ui/TableView;

    #getter for: Lcom/apportable/ui/TableView;->mCellHeights:[F
    invoke-static {v0}, Lcom/apportable/ui/TableView;->access$000(Lcom/apportable/ui/TableView;)[F

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/apportable/ui/TableView$TableViewAdapter;->this$0:Lcom/apportable/ui/TableView;

    #getter for: Lcom/apportable/ui/TableView;->mCellHeights:[F
    invoke-static {v0}, Lcom/apportable/ui/TableView;->access$000(Lcom/apportable/ui/TableView;)[F

    move-result-object v0

    array-length v0, v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .parameter "position"

    .prologue
    .line 47
    const/4 v0, 0x0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .parameter "position"

    .prologue
    .line 52
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .parameter "position"

    .prologue
    .line 62
    const/4 v0, 0x0

    return v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 7
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 67
    move-object v0, p2

    check-cast v0, Lcom/apportable/ui/TableViewCell;

    .line 71
    .local v0, cell:Lcom/apportable/ui/TableViewCell;
    iget-object v4, p0, Lcom/apportable/ui/TableView$TableViewAdapter;->this$0:Lcom/apportable/ui/TableView;

    #getter for: Lcom/apportable/ui/TableView;->mCellHeights:[F
    invoke-static {v4}, Lcom/apportable/ui/TableView;->access$000(Lcom/apportable/ui/TableView;)[F

    move-result-object v2

    .line 72
    .local v2, cellHeights:[F
    if-eqz v2, :cond_0

    array-length v4, v2

    if-ge p1, v4, :cond_0

    aget v1, v2, p1

    .line 74
    .local v1, cellHeight:F
    :goto_0
    if-nez v0, :cond_1

    .line 75
    new-instance v0, Lcom/apportable/ui/TableViewCell;

    .end local v0           #cell:Lcom/apportable/ui/TableViewCell;
    iget-object v4, p0, Lcom/apportable/ui/TableView$TableViewAdapter;->this$0:Lcom/apportable/ui/TableView;

    invoke-virtual {v4}, Lcom/apportable/ui/TableView;->getContext()Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lcom/apportable/ui/TableView$TableViewAdapter;->this$0:Lcom/apportable/ui/TableView;

    iget v5, v5, Lcom/apportable/ui/TableView;->mObject:I

    invoke-direct {v0, v4, p1, v5, v1}, Lcom/apportable/ui/TableViewCell;-><init>(Landroid/content/Context;IIF)V

    .line 80
    .restart local v0       #cell:Lcom/apportable/ui/TableViewCell;
    :goto_1
    move-object v3, v0

    .line 81
    .local v3, cellRef:Lcom/apportable/ui/TableViewCell;
    iget-object v4, p0, Lcom/apportable/ui/TableView$TableViewAdapter;->this$0:Lcom/apportable/ui/TableView;

    invoke-virtual {v4}, Lcom/apportable/ui/TableView;->isAsyncDraw()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 82
    invoke-virtual {v3}, Lcom/apportable/ui/TableViewCell;->loadView()V

    .line 92
    :goto_2
    return-object v0

    .line 72
    .end local v1           #cellHeight:F
    .end local v3           #cellRef:Lcom/apportable/ui/TableViewCell;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 77
    .restart local v1       #cellHeight:F
    :cond_1
    invoke-virtual {v0, p1, v1}, Lcom/apportable/ui/TableViewCell;->prepareForReuse(IF)V

    goto :goto_1

    .line 84
    .restart local v3       #cellRef:Lcom/apportable/ui/TableViewCell;
    :cond_2
    iget-object v4, p0, Lcom/apportable/ui/TableView$TableViewAdapter;->this$0:Lcom/apportable/ui/TableView;

    new-instance v5, Lcom/apportable/ui/TableView$TableViewAdapter$1;

    invoke-direct {v5, p0, v3}, Lcom/apportable/ui/TableView$TableViewAdapter$1;-><init>(Lcom/apportable/ui/TableView$TableViewAdapter;Lcom/apportable/ui/TableViewCell;)V

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Lcom/apportable/ui/TableView;->runOnGlThread(Ljava/lang/Runnable;Z)V

    goto :goto_2
.end method

.method public getViewTypeCount()I
    .locals 1

    .prologue
    .line 57
    const/4 v0, 0x1

    return v0
.end method

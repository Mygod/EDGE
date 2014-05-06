.class Lcom/apportable/ui/Cell$1;
.super Ljava/lang/Object;
.source "Cell.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Cell;->loadView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Cell;

.field final synthetic val$cellViewRef:Lcom/apportable/ui/View;


# direct methods
.method constructor <init>(Lcom/apportable/ui/Cell;Lcom/apportable/ui/View;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 48
    iput-object p1, p0, Lcom/apportable/ui/Cell$1;->this$0:Lcom/apportable/ui/Cell;

    iput-object p2, p0, Lcom/apportable/ui/Cell$1;->val$cellViewRef:Lcom/apportable/ui/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 52
    iget-object v1, p0, Lcom/apportable/ui/Cell$1;->this$0:Lcom/apportable/ui/Cell;

    iget-object v2, p0, Lcom/apportable/ui/Cell$1;->this$0:Lcom/apportable/ui/Cell;

    #getter for: Lcom/apportable/ui/Cell;->mContainer:I
    invoke-static {v2}, Lcom/apportable/ui/Cell;->access$000(Lcom/apportable/ui/Cell;)I

    move-result v2

    iget-object v3, p0, Lcom/apportable/ui/Cell$1;->val$cellViewRef:Lcom/apportable/ui/View;

    iget v3, v3, Lcom/apportable/ui/View;->mObject:I

    invoke-virtual {v1, v2, v3}, Lcom/apportable/ui/Cell;->onCellAttached(II)V

    .line 53
    iget-object v1, p0, Lcom/apportable/ui/Cell$1;->val$cellViewRef:Lcom/apportable/ui/View;

    invoke-virtual {v1}, Lcom/apportable/ui/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 54
    .local v0, parent:Landroid/view/ViewGroup;
    if-eqz v0, :cond_0

    .line 56
    iget-object v1, p0, Lcom/apportable/ui/Cell$1;->val$cellViewRef:Lcom/apportable/ui/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 58
    :cond_0
    iget-object v1, p0, Lcom/apportable/ui/Cell$1;->this$0:Lcom/apportable/ui/Cell;

    iget-object v2, p0, Lcom/apportable/ui/Cell$1;->val$cellViewRef:Lcom/apportable/ui/View;

    new-instance v3, Landroid/widget/AbsoluteLayout$LayoutParams;

    iget-object v4, p0, Lcom/apportable/ui/Cell$1;->this$0:Lcom/apportable/ui/Cell;

    invoke-virtual {v4}, Lcom/apportable/ui/Cell;->getWidth()I

    move-result v4

    iget-object v5, p0, Lcom/apportable/ui/Cell$1;->this$0:Lcom/apportable/ui/Cell;

    #getter for: Lcom/apportable/ui/Cell;->mHeight:F
    invoke-static {v5}, Lcom/apportable/ui/Cell;->access$100(Lcom/apportable/ui/Cell;)F

    move-result v5

    float-to-int v5, v5

    invoke-direct {v3, v4, v5, v6, v6}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(IIII)V

    invoke-virtual {v1, v2, v3}, Lcom/apportable/ui/Cell;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 59
    return-void
.end method

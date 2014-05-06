.class Lcom/apportable/ui/ScrollView$4;
.super Ljava/lang/Object;
.source "ScrollView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/ScrollView;->setContentSize(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/ScrollView;

.field final synthetic val$bounds:Landroid/graphics/RectF;


# direct methods
.method constructor <init>(Lcom/apportable/ui/ScrollView;Landroid/graphics/RectF;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 100
    iput-object p1, p0, Lcom/apportable/ui/ScrollView$4;->this$0:Lcom/apportable/ui/ScrollView;

    iput-object p2, p0, Lcom/apportable/ui/ScrollView$4;->val$bounds:Landroid/graphics/RectF;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 103
    iget-object v0, p0, Lcom/apportable/ui/ScrollView$4;->this$0:Lcom/apportable/ui/ScrollView;

    #getter for: Lcom/apportable/ui/ScrollView;->mScrollView:Landroid/widget/ScrollView;
    invoke-static {v0}, Lcom/apportable/ui/ScrollView;->access$100(Lcom/apportable/ui/ScrollView;)Landroid/widget/ScrollView;

    move-result-object v0

    new-instance v1, Landroid/widget/AbsoluteLayout$LayoutParams;

    iget-object v2, p0, Lcom/apportable/ui/ScrollView$4;->val$bounds:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    float-to-int v2, v2

    iget-object v3, p0, Lcom/apportable/ui/ScrollView$4;->val$bounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    float-to-int v3, v3

    iget-object v4, p0, Lcom/apportable/ui/ScrollView$4;->val$bounds:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    float-to-int v4, v4

    iget-object v5, p0, Lcom/apportable/ui/ScrollView$4;->val$bounds:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    float-to-int v5, v5

    invoke-direct {v1, v2, v3, v4, v5}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(IIII)V

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 104
    return-void
.end method

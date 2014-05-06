.class Lcom/apportable/ui/NavigationBar$6;
.super Ljava/lang/Object;
.source "NavigationBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/NavigationBar;->beginAnimations(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/NavigationBar;

.field final synthetic val$animation:I


# direct methods
.method constructor <init>(Lcom/apportable/ui/NavigationBar;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 160
    iput-object p1, p0, Lcom/apportable/ui/NavigationBar$6;->this$0:Lcom/apportable/ui/NavigationBar;

    iput p2, p0, Lcom/apportable/ui/NavigationBar$6;->val$animation:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/high16 v3, 0x3f80

    const/4 v4, 0x0

    .line 163
    iget v0, p0, Lcom/apportable/ui/NavigationBar$6;->val$animation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 165
    iget-object v0, p0, Lcom/apportable/ui/NavigationBar$6;->this$0:Lcom/apportable/ui/NavigationBar;

    #getter for: Lcom/apportable/ui/NavigationBar;->mLeftItems:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/apportable/ui/NavigationBar;->access$000(Lcom/apportable/ui/NavigationBar;)Landroid/widget/LinearLayout;

    move-result-object v0

    new-instance v1, Landroid/view/animation/LayoutAnimationController;

    new-instance v2, Landroid/view/animation/TranslateAnimation;

    iget-object v3, p0, Lcom/apportable/ui/NavigationBar$6;->this$0:Lcom/apportable/ui/NavigationBar;

    invoke-virtual {v3}, Lcom/apportable/ui/NavigationBar;->getFrame()Landroid/graphics/RectF;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    invoke-direct {v2, v3, v4, v4, v4}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    invoke-direct {v1, v2}, Landroid/view/animation/LayoutAnimationController;-><init>(Landroid/view/animation/Animation;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutAnimation(Landroid/view/animation/LayoutAnimationController;)V

    .line 166
    iget-object v0, p0, Lcom/apportable/ui/NavigationBar$6;->this$0:Lcom/apportable/ui/NavigationBar;

    #getter for: Lcom/apportable/ui/NavigationBar;->mRightItems:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/apportable/ui/NavigationBar;->access$200(Lcom/apportable/ui/NavigationBar;)Landroid/widget/LinearLayout;

    move-result-object v0

    new-instance v1, Landroid/view/animation/LayoutAnimationController;

    new-instance v2, Landroid/view/animation/TranslateAnimation;

    iget-object v3, p0, Lcom/apportable/ui/NavigationBar$6;->this$0:Lcom/apportable/ui/NavigationBar;

    invoke-virtual {v3}, Lcom/apportable/ui/NavigationBar;->getFrame()Landroid/graphics/RectF;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    invoke-direct {v2, v3, v4, v4, v4}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    invoke-direct {v1, v2}, Landroid/view/animation/LayoutAnimationController;-><init>(Landroid/view/animation/Animation;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutAnimation(Landroid/view/animation/LayoutAnimationController;)V

    .line 178
    :cond_0
    :goto_0
    return-void

    .line 168
    :cond_1
    iget v0, p0, Lcom/apportable/ui/NavigationBar$6;->val$animation:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_2

    .line 170
    iget-object v0, p0, Lcom/apportable/ui/NavigationBar$6;->this$0:Lcom/apportable/ui/NavigationBar;

    #getter for: Lcom/apportable/ui/NavigationBar;->mLeftItems:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/apportable/ui/NavigationBar;->access$000(Lcom/apportable/ui/NavigationBar;)Landroid/widget/LinearLayout;

    move-result-object v0

    new-instance v1, Landroid/view/animation/LayoutAnimationController;

    new-instance v2, Landroid/view/animation/TranslateAnimation;

    iget-object v3, p0, Lcom/apportable/ui/NavigationBar$6;->this$0:Lcom/apportable/ui/NavigationBar;

    invoke-virtual {v3}, Lcom/apportable/ui/NavigationBar;->getFrame()Landroid/graphics/RectF;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    sub-float v3, v4, v3

    invoke-direct {v2, v3, v4, v4, v4}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    invoke-direct {v1, v2}, Landroid/view/animation/LayoutAnimationController;-><init>(Landroid/view/animation/Animation;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutAnimation(Landroid/view/animation/LayoutAnimationController;)V

    .line 171
    iget-object v0, p0, Lcom/apportable/ui/NavigationBar$6;->this$0:Lcom/apportable/ui/NavigationBar;

    #getter for: Lcom/apportable/ui/NavigationBar;->mRightItems:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/apportable/ui/NavigationBar;->access$200(Lcom/apportable/ui/NavigationBar;)Landroid/widget/LinearLayout;

    move-result-object v0

    new-instance v1, Landroid/view/animation/LayoutAnimationController;

    new-instance v2, Landroid/view/animation/TranslateAnimation;

    iget-object v3, p0, Lcom/apportable/ui/NavigationBar$6;->this$0:Lcom/apportable/ui/NavigationBar;

    invoke-virtual {v3}, Lcom/apportable/ui/NavigationBar;->getFrame()Landroid/graphics/RectF;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    sub-float v3, v4, v3

    invoke-direct {v2, v3, v4, v4, v4}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    invoke-direct {v1, v2}, Landroid/view/animation/LayoutAnimationController;-><init>(Landroid/view/animation/Animation;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutAnimation(Landroid/view/animation/LayoutAnimationController;)V

    goto :goto_0

    .line 173
    :cond_2
    iget v0, p0, Lcom/apportable/ui/NavigationBar$6;->val$animation:I

    if-nez v0, :cond_0

    .line 175
    iget-object v0, p0, Lcom/apportable/ui/NavigationBar$6;->this$0:Lcom/apportable/ui/NavigationBar;

    #getter for: Lcom/apportable/ui/NavigationBar;->mLeftItems:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/apportable/ui/NavigationBar;->access$000(Lcom/apportable/ui/NavigationBar;)Landroid/widget/LinearLayout;

    move-result-object v0

    new-instance v1, Landroid/view/animation/LayoutAnimationController;

    new-instance v2, Landroid/view/animation/AlphaAnimation;

    invoke-direct {v2, v4, v3}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    invoke-direct {v1, v2}, Landroid/view/animation/LayoutAnimationController;-><init>(Landroid/view/animation/Animation;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutAnimation(Landroid/view/animation/LayoutAnimationController;)V

    .line 176
    iget-object v0, p0, Lcom/apportable/ui/NavigationBar$6;->this$0:Lcom/apportable/ui/NavigationBar;

    #getter for: Lcom/apportable/ui/NavigationBar;->mRightItems:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/apportable/ui/NavigationBar;->access$200(Lcom/apportable/ui/NavigationBar;)Landroid/widget/LinearLayout;

    move-result-object v0

    new-instance v1, Landroid/view/animation/LayoutAnimationController;

    new-instance v2, Landroid/view/animation/AlphaAnimation;

    invoke-direct {v2, v4, v3}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    invoke-direct {v1, v2}, Landroid/view/animation/LayoutAnimationController;-><init>(Landroid/view/animation/Animation;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutAnimation(Landroid/view/animation/LayoutAnimationController;)V

    goto :goto_0
.end method

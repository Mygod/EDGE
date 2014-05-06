.class Lcom/apportable/ui/Toolbar$4;
.super Ljava/lang/Object;
.source "Toolbar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Toolbar;->beginAnimations()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Toolbar;


# direct methods
.method constructor <init>(Lcom/apportable/ui/Toolbar;)V
    .locals 0
    .parameter

    .prologue
    .line 118
    iput-object p1, p0, Lcom/apportable/ui/Toolbar$4;->this$0:Lcom/apportable/ui/Toolbar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 121
    iget-object v0, p0, Lcom/apportable/ui/Toolbar$4;->this$0:Lcom/apportable/ui/Toolbar;

    #getter for: Lcom/apportable/ui/Toolbar;->mToolbar:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/apportable/ui/Toolbar;->access$000(Lcom/apportable/ui/Toolbar;)Landroid/widget/LinearLayout;

    move-result-object v0

    new-instance v1, Landroid/view/animation/LayoutAnimationController;

    new-instance v2, Landroid/view/animation/TranslateAnimation;

    iget-object v3, p0, Lcom/apportable/ui/Toolbar$4;->this$0:Lcom/apportable/ui/Toolbar;

    invoke-virtual {v3}, Lcom/apportable/ui/Toolbar;->getFrame()Landroid/graphics/RectF;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    invoke-direct {v2, v3, v4, v4, v4}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    invoke-direct {v1, v2}, Landroid/view/animation/LayoutAnimationController;-><init>(Landroid/view/animation/Animation;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutAnimation(Landroid/view/animation/LayoutAnimationController;)V

    .line 122
    return-void
.end method

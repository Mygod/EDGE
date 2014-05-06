.class Lcom/apportable/ui/NavigationBar$7;
.super Ljava/lang/Object;
.source "NavigationBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/NavigationBar;->endAnimations()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/NavigationBar;


# direct methods
.method constructor <init>(Lcom/apportable/ui/NavigationBar;)V
    .locals 0
    .parameter

    .prologue
    .line 183
    iput-object p1, p0, Lcom/apportable/ui/NavigationBar$7;->this$0:Lcom/apportable/ui/NavigationBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 186
    iget-object v0, p0, Lcom/apportable/ui/NavigationBar$7;->this$0:Lcom/apportable/ui/NavigationBar;

    #getter for: Lcom/apportable/ui/NavigationBar;->mLeftItems:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/apportable/ui/NavigationBar;->access$000(Lcom/apportable/ui/NavigationBar;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutAnimation(Landroid/view/animation/LayoutAnimationController;)V

    .line 187
    iget-object v0, p0, Lcom/apportable/ui/NavigationBar$7;->this$0:Lcom/apportable/ui/NavigationBar;

    #getter for: Lcom/apportable/ui/NavigationBar;->mRightItems:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/apportable/ui/NavigationBar;->access$200(Lcom/apportable/ui/NavigationBar;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutAnimation(Landroid/view/animation/LayoutAnimationController;)V

    .line 188
    return-void
.end method

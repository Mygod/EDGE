.class Lcom/apportable/ui/NavigationBar$9;
.super Ljava/lang/Object;
.source "NavigationBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/NavigationBar;->addRightItem(Lcom/apportable/ui/BarItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/NavigationBar;

.field final synthetic val$item:Lcom/apportable/ui/BarItem;


# direct methods
.method constructor <init>(Lcom/apportable/ui/NavigationBar;Lcom/apportable/ui/BarItem;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 209
    iput-object p1, p0, Lcom/apportable/ui/NavigationBar$9;->this$0:Lcom/apportable/ui/NavigationBar;

    iput-object p2, p0, Lcom/apportable/ui/NavigationBar$9;->val$item:Lcom/apportable/ui/BarItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 212
    iget-object v2, p0, Lcom/apportable/ui/NavigationBar$9;->this$0:Lcom/apportable/ui/NavigationBar;

    #getter for: Lcom/apportable/ui/NavigationBar;->mRightItems:Landroid/widget/LinearLayout;
    invoke-static {v2}, Lcom/apportable/ui/NavigationBar;->access$200(Lcom/apportable/ui/NavigationBar;)Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 213
    iget-object v2, p0, Lcom/apportable/ui/NavigationBar$9;->val$item:Lcom/apportable/ui/BarItem;

    invoke-virtual {v2}, Lcom/apportable/ui/BarItem;->getView()Landroid/view/View;

    move-result-object v1

    .line 214
    .local v1, view:Landroid/view/View;
    iget-object v2, p0, Lcom/apportable/ui/NavigationBar$9;->val$item:Lcom/apportable/ui/BarItem;

    invoke-virtual {v2}, Lcom/apportable/ui/BarItem;->getLayout()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v0

    .line 215
    .local v0, params:Landroid/widget/LinearLayout$LayoutParams;
    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 216
    iget-object v2, p0, Lcom/apportable/ui/NavigationBar$9;->this$0:Lcom/apportable/ui/NavigationBar;

    #getter for: Lcom/apportable/ui/NavigationBar;->mRightItems:Landroid/widget/LinearLayout;
    invoke-static {v2}, Lcom/apportable/ui/NavigationBar;->access$200(Lcom/apportable/ui/NavigationBar;)Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 217
    :cond_0
    return-void
.end method

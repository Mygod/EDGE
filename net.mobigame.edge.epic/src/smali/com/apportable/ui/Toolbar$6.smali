.class Lcom/apportable/ui/Toolbar$6;
.super Ljava/lang/Object;
.source "Toolbar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Toolbar;->addItem(Lcom/apportable/ui/BarItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Toolbar;

.field final synthetic val$item:Lcom/apportable/ui/BarItem;


# direct methods
.method constructor <init>(Lcom/apportable/ui/Toolbar;Lcom/apportable/ui/BarItem;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 138
    iput-object p1, p0, Lcom/apportable/ui/Toolbar$6;->this$0:Lcom/apportable/ui/Toolbar;

    iput-object p2, p0, Lcom/apportable/ui/Toolbar$6;->val$item:Lcom/apportable/ui/BarItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 141
    iget-object v2, p0, Lcom/apportable/ui/Toolbar$6;->val$item:Lcom/apportable/ui/BarItem;

    invoke-virtual {v2}, Lcom/apportable/ui/BarItem;->getView()Landroid/view/View;

    move-result-object v1

    .line 142
    .local v1, view:Landroid/view/View;
    iget-object v2, p0, Lcom/apportable/ui/Toolbar$6;->val$item:Lcom/apportable/ui/BarItem;

    invoke-virtual {v2}, Lcom/apportable/ui/BarItem;->getLayout()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v0

    .line 143
    .local v0, params:Landroid/widget/LinearLayout$LayoutParams;
    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 144
    iget-object v2, p0, Lcom/apportable/ui/Toolbar$6;->this$0:Lcom/apportable/ui/Toolbar;

    #getter for: Lcom/apportable/ui/Toolbar;->mToolbar:Landroid/widget/LinearLayout;
    invoke-static {v2}, Lcom/apportable/ui/Toolbar;->access$000(Lcom/apportable/ui/Toolbar;)Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 145
    :cond_0
    return-void
.end method

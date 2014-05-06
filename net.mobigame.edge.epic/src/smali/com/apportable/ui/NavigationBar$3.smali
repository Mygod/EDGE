.class Lcom/apportable/ui/NavigationBar$3;
.super Ljava/lang/Object;
.source "NavigationBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/NavigationBar;->removeAllItems()V
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
    .line 131
    iput-object p1, p0, Lcom/apportable/ui/NavigationBar$3;->this$0:Lcom/apportable/ui/NavigationBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lcom/apportable/ui/NavigationBar$3;->this$0:Lcom/apportable/ui/NavigationBar;

    #getter for: Lcom/apportable/ui/NavigationBar;->mLeftItems:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/apportable/ui/NavigationBar;->access$000(Lcom/apportable/ui/NavigationBar;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 135
    iget-object v0, p0, Lcom/apportable/ui/NavigationBar$3;->this$0:Lcom/apportable/ui/NavigationBar;

    #getter for: Lcom/apportable/ui/NavigationBar;->mCenterItems:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/apportable/ui/NavigationBar;->access$100(Lcom/apportable/ui/NavigationBar;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 136
    iget-object v0, p0, Lcom/apportable/ui/NavigationBar$3;->this$0:Lcom/apportable/ui/NavigationBar;

    #getter for: Lcom/apportable/ui/NavigationBar;->mRightItems:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/apportable/ui/NavigationBar;->access$200(Lcom/apportable/ui/NavigationBar;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 137
    return-void
.end method

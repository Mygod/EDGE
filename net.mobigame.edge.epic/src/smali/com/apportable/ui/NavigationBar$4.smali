.class Lcom/apportable/ui/NavigationBar$4;
.super Ljava/lang/Object;
.source "NavigationBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/NavigationBar;->removeLeftItems()V
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
    .line 142
    iput-object p1, p0, Lcom/apportable/ui/NavigationBar$4;->this$0:Lcom/apportable/ui/NavigationBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lcom/apportable/ui/NavigationBar$4;->this$0:Lcom/apportable/ui/NavigationBar;

    #getter for: Lcom/apportable/ui/NavigationBar;->mLeftItems:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/apportable/ui/NavigationBar;->access$000(Lcom/apportable/ui/NavigationBar;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 146
    return-void
.end method

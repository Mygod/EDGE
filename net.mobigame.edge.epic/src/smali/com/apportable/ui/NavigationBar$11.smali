.class Lcom/apportable/ui/NavigationBar$11;
.super Ljava/lang/Object;
.source "NavigationBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/NavigationBar;->setTintColor(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/NavigationBar;

.field final synthetic val$tint:I


# direct methods
.method constructor <init>(Lcom/apportable/ui/NavigationBar;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 254
    iput-object p1, p0, Lcom/apportable/ui/NavigationBar$11;->this$0:Lcom/apportable/ui/NavigationBar;

    iput p2, p0, Lcom/apportable/ui/NavigationBar$11;->val$tint:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 257
    iget-object v0, p0, Lcom/apportable/ui/NavigationBar$11;->this$0:Lcom/apportable/ui/NavigationBar;

    #getter for: Lcom/apportable/ui/NavigationBar;->mNavigationBar:Landroid/widget/RelativeLayout;
    invoke-static {v0}, Lcom/apportable/ui/NavigationBar;->access$400(Lcom/apportable/ui/NavigationBar;)Landroid/widget/RelativeLayout;

    move-result-object v0

    iget v1, p0, Lcom/apportable/ui/NavigationBar$11;->val$tint:I

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 258
    return-void
.end method

.class Lcom/apportable/ui/Toolbar$5;
.super Ljava/lang/Object;
.source "Toolbar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Toolbar;->endAnimations()V
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
    .line 127
    iput-object p1, p0, Lcom/apportable/ui/Toolbar$5;->this$0:Lcom/apportable/ui/Toolbar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 130
    iget-object v0, p0, Lcom/apportable/ui/Toolbar$5;->this$0:Lcom/apportable/ui/Toolbar;

    #getter for: Lcom/apportable/ui/Toolbar;->mToolbar:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/apportable/ui/Toolbar;->access$000(Lcom/apportable/ui/Toolbar;)Landroid/widget/LinearLayout;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutAnimation(Landroid/view/animation/LayoutAnimationController;)V

    .line 131
    return-void
.end method

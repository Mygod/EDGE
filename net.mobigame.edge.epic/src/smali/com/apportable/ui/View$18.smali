.class Lcom/apportable/ui/View$18;
.super Ljava/lang/Object;
.source "View.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/View;->_startAnimation(Landroid/view/animation/Animation;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/View;

.field final synthetic val$anim:Landroid/view/animation/Animation;


# direct methods
.method constructor <init>(Lcom/apportable/ui/View;Landroid/view/animation/Animation;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 618
    iput-object p1, p0, Lcom/apportable/ui/View$18;->this$0:Lcom/apportable/ui/View;

    iput-object p2, p0, Lcom/apportable/ui/View$18;->val$anim:Landroid/view/animation/Animation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 621
    iget-object v0, p0, Lcom/apportable/ui/View$18;->this$0:Lcom/apportable/ui/View;

    iget-object v1, p0, Lcom/apportable/ui/View$18;->val$anim:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Lcom/apportable/ui/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 622
    return-void
.end method

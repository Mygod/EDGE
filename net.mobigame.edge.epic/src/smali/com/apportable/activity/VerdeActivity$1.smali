.class Lcom/apportable/activity/VerdeActivity$1;
.super Ljava/lang/Object;
.source "VerdeActivity.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/activity/VerdeActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/activity/VerdeActivity;

.field final synthetic val$activityRootView:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/apportable/activity/VerdeActivity;Landroid/view/View;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 213
    iput-object p1, p0, Lcom/apportable/activity/VerdeActivity$1;->this$0:Lcom/apportable/activity/VerdeActivity;

    iput-object p2, p0, Lcom/apportable/activity/VerdeActivity$1;->val$activityRootView:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 5

    .prologue
    const/16 v4, 0x400

    const/16 v3, 0x64

    .line 216
    iget-object v1, p0, Lcom/apportable/activity/VerdeActivity$1;->val$activityRootView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    iget-object v2, p0, Lcom/apportable/activity/VerdeActivity$1;->val$activityRootView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    sub-int v0, v1, v2

    .line 223
    .local v0, currHeightDiff:I
    iget-object v1, p0, Lcom/apportable/activity/VerdeActivity$1;->this$0:Lcom/apportable/activity/VerdeActivity;

    #getter for: Lcom/apportable/activity/VerdeActivity;->heightDiff:I
    invoke-static {v1}, Lcom/apportable/activity/VerdeActivity;->access$000(Lcom/apportable/activity/VerdeActivity;)I

    move-result v1

    if-le v1, v3, :cond_0

    if-ge v0, v3, :cond_0

    .line 225
    iget-object v1, p0, Lcom/apportable/activity/VerdeActivity$1;->this$0:Lcom/apportable/activity/VerdeActivity;

    invoke-virtual {v1}, Lcom/apportable/activity/VerdeActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v2, 0x800

    invoke-virtual {v1, v2}, Landroid/view/Window;->clearFlags(I)V

    .line 226
    iget-object v1, p0, Lcom/apportable/activity/VerdeActivity$1;->this$0:Lcom/apportable/activity/VerdeActivity;

    invoke-virtual {v1}, Lcom/apportable/activity/VerdeActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v4, v4}, Landroid/view/Window;->setFlags(II)V

    .line 228
    :cond_0
    iget-object v1, p0, Lcom/apportable/activity/VerdeActivity$1;->this$0:Lcom/apportable/activity/VerdeActivity;

    #setter for: Lcom/apportable/activity/VerdeActivity;->heightDiff:I
    invoke-static {v1, v0}, Lcom/apportable/activity/VerdeActivity;->access$002(Lcom/apportable/activity/VerdeActivity;I)I

    .line 229
    return-void
.end method

.class Lcom/apportable/ui/ScrollView$3;
.super Ljava/lang/Object;
.source "ScrollView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/ScrollView;->addSubviewToScrollContainer(Lcom/apportable/ui/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/ScrollView;

.field final synthetic val$view:Lcom/apportable/ui/View;


# direct methods
.method constructor <init>(Lcom/apportable/ui/ScrollView;Lcom/apportable/ui/View;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 83
    iput-object p1, p0, Lcom/apportable/ui/ScrollView$3;->this$0:Lcom/apportable/ui/ScrollView;

    iput-object p2, p0, Lcom/apportable/ui/ScrollView$3;->val$view:Lcom/apportable/ui/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 86
    iget-object v0, p0, Lcom/apportable/ui/ScrollView$3;->this$0:Lcom/apportable/ui/ScrollView;

    iget-object v1, p0, Lcom/apportable/ui/ScrollView$3;->val$view:Lcom/apportable/ui/View;

    invoke-virtual {v0, v1}, Lcom/apportable/ui/ScrollView;->sanitizeView(Lcom/apportable/ui/View;)V

    .line 87
    iget-object v0, p0, Lcom/apportable/ui/ScrollView$3;->this$0:Lcom/apportable/ui/ScrollView;

    #getter for: Lcom/apportable/ui/ScrollView;->mScrollContainer:Landroid/widget/AbsoluteLayout;
    invoke-static {v0}, Lcom/apportable/ui/ScrollView;->access$000(Lcom/apportable/ui/ScrollView;)Landroid/widget/AbsoluteLayout;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/ScrollView$3;->val$view:Lcom/apportable/ui/View;

    invoke-virtual {v0, v1}, Landroid/widget/AbsoluteLayout;->addView(Landroid/view/View;)V

    .line 88
    return-void
.end method

.class Lcom/apportable/ui/ProgressView$3;
.super Ljava/lang/Object;
.source "ProgressView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/ProgressView;->setProgress(FZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/ProgressView;

.field final synthetic val$progress:F


# direct methods
.method constructor <init>(Lcom/apportable/ui/ProgressView;F)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 98
    iput-object p1, p0, Lcom/apportable/ui/ProgressView$3;->this$0:Lcom/apportable/ui/ProgressView;

    iput p2, p0, Lcom/apportable/ui/ProgressView$3;->val$progress:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 101
    iget-object v0, p0, Lcom/apportable/ui/ProgressView$3;->this$0:Lcom/apportable/ui/ProgressView;

    #getter for: Lcom/apportable/ui/ProgressView;->mProgressBar:Landroid/widget/ProgressBar;
    invoke-static {v0}, Lcom/apportable/ui/ProgressView;->access$000(Lcom/apportable/ui/ProgressView;)Landroid/widget/ProgressBar;

    move-result-object v0

    iget v1, p0, Lcom/apportable/ui/ProgressView$3;->val$progress:F

    iget-object v2, p0, Lcom/apportable/ui/ProgressView$3;->this$0:Lcom/apportable/ui/ProgressView;

    #getter for: Lcom/apportable/ui/ProgressView;->mProgressBar:Landroid/widget/ProgressBar;
    invoke-static {v2}, Lcom/apportable/ui/ProgressView;->access$000(Lcom/apportable/ui/ProgressView;)Landroid/widget/ProgressBar;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/ProgressBar;->getMax()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v1, v2

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 102
    return-void
.end method

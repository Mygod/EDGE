.class Lcom/apportable/ui/View$MatrixAnimation;
.super Landroid/view/animation/Animation;
.source "View.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/apportable/ui/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MatrixAnimation"
.end annotation


# instance fields
.field mMatrix:Landroid/graphics/Matrix;

.field final synthetic this$0:Lcom/apportable/ui/View;


# direct methods
.method public constructor <init>(Lcom/apportable/ui/View;Landroid/graphics/Matrix;)V
    .locals 0
    .parameter
    .parameter "matrix"

    .prologue
    .line 278
    iput-object p1, p0, Lcom/apportable/ui/View$MatrixAnimation;->this$0:Lcom/apportable/ui/View;

    invoke-direct {p0}, Landroid/view/animation/Animation;-><init>()V

    .line 279
    iput-object p2, p0, Lcom/apportable/ui/View$MatrixAnimation;->mMatrix:Landroid/graphics/Matrix;

    .line 280
    return-void
.end method


# virtual methods
.method protected applyTransformation(FLandroid/view/animation/Transformation;)V
    .locals 2
    .parameter "interpolatedTime"
    .parameter "t"

    .prologue
    .line 284
    invoke-virtual {p2}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/View$MatrixAnimation;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 285
    return-void
.end method

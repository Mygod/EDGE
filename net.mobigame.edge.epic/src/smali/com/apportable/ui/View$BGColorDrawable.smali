.class Lcom/apportable/ui/View$BGColorDrawable;
.super Landroid/graphics/drawable/ColorDrawable;
.source "View.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/apportable/ui/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BGColorDrawable"
.end annotation


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .parameter "color"

    .prologue
    .line 525
    invoke-direct {p0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 526
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 2
    .parameter "canvas"

    .prologue
    .line 529
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .line 530
    .local v0, checkpoint:I
    invoke-virtual {p0}, Lcom/apportable/ui/View$BGColorDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 531
    invoke-super {p0, p1}, Landroid/graphics/drawable/ColorDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 532
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 533
    return-void
.end method

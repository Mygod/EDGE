.class Lcom/apportable/ui/Label$LabelView;
.super Landroid/widget/TextView;
.source "Label.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/apportable/ui/Label;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LabelView"
.end annotation


# instance fields
.field private mAdjustsSize:Z

.field private mMaxTextSize:F

.field private mMinTextSize:F

.field final synthetic this$0:Lcom/apportable/ui/Label;


# direct methods
.method public constructor <init>(Lcom/apportable/ui/Label;Landroid/content/Context;)V
    .locals 1
    .parameter
    .parameter "context"

    .prologue
    .line 30
    iput-object p1, p0, Lcom/apportable/ui/Label$LabelView;->this$0:Lcom/apportable/ui/Label;

    .line 31
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 26
    const/high16 v0, 0x3f80

    iput v0, p0, Lcom/apportable/ui/Label$LabelView;->mMinTextSize:F

    .line 27
    const/high16 v0, 0x41a0

    iput v0, p0, Lcom/apportable/ui/Label$LabelView;->mMaxTextSize:F

    .line 28
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/apportable/ui/Label$LabelView;->mAdjustsSize:Z

    .line 32
    return-void
.end method

.method private resize(Ljava/lang/String;F)V
    .locals 3
    .parameter "text"
    .parameter "textWidth"

    .prologue
    .line 92
    const/4 v1, 0x0

    cmpl-float v1, p2, v1

    if-lez v1, :cond_0

    .line 93
    invoke-virtual {p0, p2}, Lcom/apportable/ui/Label$LabelView;->getPointSize(F)F

    move-result v1

    invoke-virtual {p0}, Lcom/apportable/ui/Label$LabelView;->getTextSize()F

    move-result v2

    div-float v0, v1, v2

    .line 94
    .local v0, scale:F
    invoke-virtual {p0, v0}, Lcom/apportable/ui/Label$LabelView;->setTextScaleX(F)V

    .line 96
    .end local v0           #scale:F
    :cond_0
    return-void
.end method


# virtual methods
.method public adjustsFontSizeToFitWidth(Z)V
    .locals 2
    .parameter "adjust"

    .prologue
    const/high16 v1, 0x4000

    .line 60
    iget-boolean v0, p0, Lcom/apportable/ui/Label$LabelView;->mAdjustsSize:Z

    if-eq p1, v0, :cond_0

    .line 61
    iput-boolean p1, p0, Lcom/apportable/ui/Label$LabelView;->mAdjustsSize:Z

    .line 62
    invoke-virtual {p0, v1, v1}, Lcom/apportable/ui/Label$LabelView;->measure(II)V

    .line 64
    :cond_0
    return-void
.end method

.method public getAdjustsFontSizeToFitWidth()Z
    .locals 1

    .prologue
    .line 68
    iget-boolean v0, p0, Lcom/apportable/ui/Label$LabelView;->mAdjustsSize:Z

    return v0
.end method

.method public getMaxTextSize()F
    .locals 1

    .prologue
    .line 44
    iget v0, p0, Lcom/apportable/ui/Label$LabelView;->mMaxTextSize:F

    return v0
.end method

.method public getMinTextSize()F
    .locals 1

    .prologue
    .line 56
    iget v0, p0, Lcom/apportable/ui/Label$LabelView;->mMinTextSize:F

    return v0
.end method

.method public getPointSize(F)F
    .locals 9
    .parameter "textWidth"

    .prologue
    .line 72
    invoke-virtual {p0}, Lcom/apportable/ui/Label$LabelView;->getPaddingLeft()I

    move-result v7

    int-to-float v7, v7

    sub-float v7, p1, v7

    invoke-virtual {p0}, Lcom/apportable/ui/Label$LabelView;->getPaddingRight()I

    move-result v8

    int-to-float v8, v8

    sub-float v0, v7, v8

    .line 73
    .local v0, availableWidth:F
    invoke-virtual {p0}, Lcom/apportable/ui/Label$LabelView;->getPaint()Landroid/text/TextPaint;

    move-result-object v5

    .line 74
    .local v5, tp:Landroid/text/TextPaint;
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 75
    .local v2, rect:Landroid/graphics/Rect;
    invoke-virtual {p0}, Lcom/apportable/ui/Label$LabelView;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 76
    .local v4, text:Ljava/lang/String;
    const/4 v7, 0x0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {v5, v4, v7, v8, v2}, Landroid/text/TextPaint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 77
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v7

    int-to-float v6, v7

    .line 78
    .local v6, width:F
    invoke-virtual {p0}, Lcom/apportable/ui/Label$LabelView;->getTextSize()F

    move-result v1

    .line 79
    .local v1, effectivePointSize:F
    cmpl-float v7, v6, v0

    if-lez v7, :cond_1

    iget-boolean v7, p0, Lcom/apportable/ui/Label$LabelView;->mAdjustsSize:Z

    if-eqz v7, :cond_1

    .line 81
    div-float v3, v0, v6

    .line 82
    .local v3, scale:F
    invoke-virtual {p0}, Lcom/apportable/ui/Label$LabelView;->getTextSize()F

    move-result v7

    mul-float v1, v7, v3

    .line 83
    iget v7, p0, Lcom/apportable/ui/Label$LabelView;->mMinTextSize:F

    cmpg-float v7, v1, v7

    if-gez v7, :cond_0

    .line 84
    iget v1, p0, Lcom/apportable/ui/Label$LabelView;->mMinTextSize:F

    .line 85
    :cond_0
    iget v7, p0, Lcom/apportable/ui/Label$LabelView;->mMaxTextSize:F

    cmpl-float v7, v1, v7

    if-lez v7, :cond_1

    .line 86
    iget v1, p0, Lcom/apportable/ui/Label$LabelView;->mMaxTextSize:F

    .line 88
    .end local v3           #scale:F
    :cond_1
    return v1
.end method

.method protected onMeasure(II)V
    .locals 4
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 100
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->onMeasure(II)V

    .line 101
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    int-to-float v1, v2

    .line 102
    .local v1, parentWidth:F
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    int-to-float v0, v2

    .line 103
    .local v0, parentHeight:F
    invoke-virtual {p0}, Lcom/apportable/ui/Label$LabelView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2, v1}, Lcom/apportable/ui/Label$LabelView;->resize(Ljava/lang/String;F)V

    .line 104
    float-to-int v2, v1

    float-to-int v3, v0

    invoke-virtual {p0, v2, v3}, Lcom/apportable/ui/Label$LabelView;->setMeasuredDimension(II)V

    .line 105
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 2
    .parameter "w"
    .parameter "h"
    .parameter "oldw"
    .parameter "oldh"

    .prologue
    .line 114
    if-eq p1, p3, :cond_0

    .line 115
    invoke-virtual {p0}, Lcom/apportable/ui/Label$LabelView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    int-to-float v1, p1

    invoke-direct {p0, v0, v1}, Lcom/apportable/ui/Label$LabelView;->resize(Ljava/lang/String;F)V

    .line 117
    :cond_0
    return-void
.end method

.method protected onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 2
    .parameter "text"
    .parameter "start"
    .parameter "before"
    .parameter "after"

    .prologue
    .line 109
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/apportable/ui/Label$LabelView;->getWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-direct {p0, v0, v1}, Lcom/apportable/ui/Label$LabelView;->resize(Ljava/lang/String;F)V

    .line 110
    return-void
.end method

.method public setMaxTextSize(F)V
    .locals 2
    .parameter "sz"

    .prologue
    const/high16 v1, 0x4000

    .line 36
    iget v0, p0, Lcom/apportable/ui/Label$LabelView;->mMaxTextSize:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_0

    .line 37
    iput p1, p0, Lcom/apportable/ui/Label$LabelView;->mMaxTextSize:F

    .line 38
    invoke-virtual {p0, v1, v1}, Lcom/apportable/ui/Label$LabelView;->measure(II)V

    .line 40
    :cond_0
    return-void
.end method

.method public setMinTextSize(F)V
    .locals 2
    .parameter "sz"

    .prologue
    const/high16 v1, 0x4000

    .line 48
    iget v0, p0, Lcom/apportable/ui/Label$LabelView;->mMinTextSize:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_0

    .line 49
    iput p1, p0, Lcom/apportable/ui/Label$LabelView;->mMinTextSize:F

    .line 50
    invoke-virtual {p0, v1, v1}, Lcom/apportable/ui/Label$LabelView;->measure(II)V

    .line 52
    :cond_0
    return-void
.end method

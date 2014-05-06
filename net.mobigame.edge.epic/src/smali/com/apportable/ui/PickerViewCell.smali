.class Lcom/apportable/ui/PickerViewCell;
.super Lcom/apportable/ui/Cell;
.source "PickerViewCell.java"


# instance fields
.field private mComponent:I


# direct methods
.method public constructor <init>(Landroid/content/Context;IIFI)V
    .locals 0
    .parameter "context"
    .parameter "row"
    .parameter "tableObject"
    .parameter "height"
    .parameter "component"

    .prologue
    .line 20
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/apportable/ui/Cell;-><init>(Landroid/content/Context;IIF)V

    .line 21
    iput p5, p0, Lcom/apportable/ui/PickerViewCell;->mComponent:I

    .line 22
    return-void
.end method

.method private native cellAttached(III)V
.end method

.method private native cellDetached(III)V
.end method

.method private native cellForRowInComponent(III)Lcom/apportable/ui/View;
.end method


# virtual methods
.method public getCellView(II)Lcom/apportable/ui/View;
    .locals 1
    .parameter "container"
    .parameter "row"

    .prologue
    .line 36
    iget v0, p0, Lcom/apportable/ui/PickerViewCell;->mComponent:I

    invoke-direct {p0, p1, p2, v0}, Lcom/apportable/ui/PickerViewCell;->cellForRowInComponent(III)Lcom/apportable/ui/View;

    move-result-object v0

    return-object v0
.end method

.method public onCellAttached(II)V
    .locals 1
    .parameter "container"
    .parameter "cellObj"

    .prologue
    .line 26
    iget v0, p0, Lcom/apportable/ui/PickerViewCell;->mComponent:I

    invoke-direct {p0, p1, p2, v0}, Lcom/apportable/ui/PickerViewCell;->cellAttached(III)V

    .line 27
    return-void
.end method

.method public onCellDetached(II)V
    .locals 1
    .parameter "container"
    .parameter "cellObj"

    .prologue
    .line 31
    iget v0, p0, Lcom/apportable/ui/PickerViewCell;->mComponent:I

    invoke-direct {p0, p1, p2, v0}, Lcom/apportable/ui/PickerViewCell;->cellDetached(III)V

    .line 32
    return-void
.end method

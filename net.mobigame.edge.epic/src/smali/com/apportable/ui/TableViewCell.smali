.class Lcom/apportable/ui/TableViewCell;
.super Lcom/apportable/ui/Cell;
.source "TableViewCell.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;IIF)V
    .locals 0
    .parameter "context"
    .parameter "row"
    .parameter "tableObject"
    .parameter "height"

    .prologue
    .line 19
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/apportable/ui/Cell;-><init>(Landroid/content/Context;IIF)V

    .line 20
    return-void
.end method

.method private native cellAttached(II)V
.end method

.method private native cellDetached(II)V
.end method

.method private native cellForRow(II)Lcom/apportable/ui/View;
.end method


# virtual methods
.method public getCellView(II)Lcom/apportable/ui/View;
    .locals 1
    .parameter "container"
    .parameter "row"

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/TableViewCell;->cellForRow(II)Lcom/apportable/ui/View;

    move-result-object v0

    return-object v0
.end method

.method public onCellAttached(II)V
    .locals 0
    .parameter "container"
    .parameter "cellObj"

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/TableViewCell;->cellAttached(II)V

    .line 25
    return-void
.end method

.method public onCellDetached(II)V
    .locals 0
    .parameter "container"
    .parameter "cellObj"

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/TableViewCell;->cellDetached(II)V

    .line 30
    return-void
.end method

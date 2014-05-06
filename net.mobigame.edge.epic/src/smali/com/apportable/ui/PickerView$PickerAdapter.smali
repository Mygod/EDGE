.class Lcom/apportable/ui/PickerView$PickerAdapter;
.super Landroid/widget/BaseAdapter;
.source "PickerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/apportable/ui/PickerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PickerAdapter"
.end annotation


# instance fields
.field private mComponentNumber:I

.field private mNumberOfRowsInComponent:I

.field private mOwner:Lcom/apportable/ui/PickerView;

.field final synthetic this$0:Lcom/apportable/ui/PickerView;


# direct methods
.method public constructor <init>(Lcom/apportable/ui/PickerView;Lcom/apportable/ui/PickerView;I)V
    .locals 0
    .parameter
    .parameter "owner"
    .parameter "componentNumber"

    .prologue
    .line 135
    iput-object p1, p0, Lcom/apportable/ui/PickerView$PickerAdapter;->this$0:Lcom/apportable/ui/PickerView;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 136
    iput-object p2, p0, Lcom/apportable/ui/PickerView$PickerAdapter;->mOwner:Lcom/apportable/ui/PickerView;

    .line 137
    iput p3, p0, Lcom/apportable/ui/PickerView$PickerAdapter;->mComponentNumber:I

    .line 138
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 149
    invoke-virtual {p0}, Lcom/apportable/ui/PickerView$PickerAdapter;->getNumberOfRowsInComponent()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .parameter "position"

    .prologue
    .line 153
    const/4 v0, 0x0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .parameter "position"

    .prologue
    .line 157
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getNumberOfRowsInComponent()I
    .locals 1

    .prologue
    .line 145
    iget v0, p0, Lcom/apportable/ui/PickerView$PickerAdapter;->mNumberOfRowsInComponent:I

    return v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 7
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 162
    new-instance v6, Ljava/util/concurrent/atomic/AtomicReference;

    check-cast p2, Lcom/apportable/ui/PickerViewCell;

    .end local p2
    invoke-direct {v6, p2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 163
    .local v6, cell:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/PickerViewCell;>;"
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 164
    new-instance v0, Lcom/apportable/ui/PickerViewCell;

    iget-object v1, p0, Lcom/apportable/ui/PickerView$PickerAdapter;->mOwner:Lcom/apportable/ui/PickerView;

    invoke-virtual {v1}, Lcom/apportable/ui/PickerView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/apportable/ui/PickerView$PickerAdapter;->mOwner:Lcom/apportable/ui/PickerView;

    iget v3, v2, Lcom/apportable/ui/PickerView;->mObject:I

    iget-object v2, p0, Lcom/apportable/ui/PickerView$PickerAdapter;->mOwner:Lcom/apportable/ui/PickerView;

    #getter for: Lcom/apportable/ui/PickerView;->mRowHeightByComponent:[I
    invoke-static {v2}, Lcom/apportable/ui/PickerView;->access$000(Lcom/apportable/ui/PickerView;)[I

    move-result-object v2

    iget v4, p0, Lcom/apportable/ui/PickerView$PickerAdapter;->mComponentNumber:I

    aget v2, v2, v4

    int-to-float v4, v2

    iget v5, p0, Lcom/apportable/ui/PickerView$PickerAdapter;->mComponentNumber:I

    move v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/apportable/ui/PickerViewCell;-><init>(Landroid/content/Context;IIFI)V

    invoke-virtual {v6, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 169
    :goto_0
    iget-object v0, p0, Lcom/apportable/ui/PickerView$PickerAdapter;->mOwner:Lcom/apportable/ui/PickerView;

    new-instance v1, Lcom/apportable/ui/PickerView$PickerAdapter$1;

    invoke-direct {v1, p0, v6}, Lcom/apportable/ui/PickerView$PickerAdapter$1;-><init>(Lcom/apportable/ui/PickerView$PickerAdapter;Ljava/util/concurrent/atomic/AtomicReference;)V

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/apportable/ui/PickerView;->runOnGlThread(Ljava/lang/Runnable;Z)V

    .line 175
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    return-object v0

    .line 166
    :cond_0
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/apportable/ui/PickerViewCell;

    iget-object v1, p0, Lcom/apportable/ui/PickerView$PickerAdapter;->mOwner:Lcom/apportable/ui/PickerView;

    #getter for: Lcom/apportable/ui/PickerView;->mRowHeightByComponent:[I
    invoke-static {v1}, Lcom/apportable/ui/PickerView;->access$000(Lcom/apportable/ui/PickerView;)[I

    move-result-object v1

    iget v2, p0, Lcom/apportable/ui/PickerView$PickerAdapter;->mComponentNumber:I

    aget v1, v1, v2

    int-to-float v1, v1

    invoke-virtual {v0, p1, v1}, Lcom/apportable/ui/PickerViewCell;->prepareForReuse(IF)V

    goto :goto_0
.end method

.method public setNumberOfRowsInComponent(I)V
    .locals 0
    .parameter "rows"

    .prologue
    .line 141
    iput p1, p0, Lcom/apportable/ui/PickerView$PickerAdapter;->mNumberOfRowsInComponent:I

    .line 142
    return-void
.end method

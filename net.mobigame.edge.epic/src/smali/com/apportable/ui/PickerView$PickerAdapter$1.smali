.class Lcom/apportable/ui/PickerView$PickerAdapter$1;
.super Ljava/lang/Object;
.source "PickerView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/PickerView$PickerAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/apportable/ui/PickerView$PickerAdapter;

.field final synthetic val$cell:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method constructor <init>(Lcom/apportable/ui/PickerView$PickerAdapter;Ljava/util/concurrent/atomic/AtomicReference;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 169
    iput-object p1, p0, Lcom/apportable/ui/PickerView$PickerAdapter$1;->this$1:Lcom/apportable/ui/PickerView$PickerAdapter;

    iput-object p2, p0, Lcom/apportable/ui/PickerView$PickerAdapter$1;->val$cell:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 172
    iget-object v0, p0, Lcom/apportable/ui/PickerView$PickerAdapter$1;->val$cell:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/apportable/ui/PickerViewCell;

    invoke-virtual {v0}, Lcom/apportable/ui/PickerViewCell;->loadView()V

    .line 173
    return-void
.end method

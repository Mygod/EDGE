.class final Lcom/apportable/ui/PickerView$2;
.super Ljava/lang/Object;
.source "PickerView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/PickerView;->create(Landroid/content/Context;ILandroid/graphics/RectF;)Lcom/apportable/ui/PickerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$ctx:Landroid/content/Context;

.field final synthetic val$frame:Landroid/graphics/RectF;

.field final synthetic val$object:I

.field final synthetic val$view:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;ILandroid/graphics/RectF;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 54
    iput-object p1, p0, Lcom/apportable/ui/PickerView$2;->val$ctx:Landroid/content/Context;

    iput-object p2, p0, Lcom/apportable/ui/PickerView$2;->val$view:Ljava/util/concurrent/atomic/AtomicReference;

    iput p3, p0, Lcom/apportable/ui/PickerView$2;->val$object:I

    iput-object p4, p0, Lcom/apportable/ui/PickerView$2;->val$frame:Landroid/graphics/RectF;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 57
    iget-object v1, p0, Lcom/apportable/ui/PickerView$2;->val$ctx:Landroid/content/Context;

    monitor-enter v1

    .line 58
    :try_start_0
    iget-object v0, p0, Lcom/apportable/ui/PickerView$2;->val$view:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v2, Lcom/apportable/ui/PickerView;

    iget-object v3, p0, Lcom/apportable/ui/PickerView$2;->val$ctx:Landroid/content/Context;

    iget v4, p0, Lcom/apportable/ui/PickerView$2;->val$object:I

    iget-object v5, p0, Lcom/apportable/ui/PickerView$2;->val$frame:Landroid/graphics/RectF;

    invoke-direct {v2, v3, v4, v5}, Lcom/apportable/ui/PickerView;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 59
    iget-object v0, p0, Lcom/apportable/ui/PickerView$2;->val$ctx:Landroid/content/Context;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 60
    monitor-exit v1

    .line 61
    return-void

    .line 60
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.class final Lcom/apportable/ui/TextField$1;
.super Ljava/lang/Object;
.source "TextField.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/TextField;->create(Landroid/content/Context;I)Lcom/apportable/ui/TextField;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$ctx:Landroid/content/Context;

.field final synthetic val$object:I

.field final synthetic val$view:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;I)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 77
    iput-object p1, p0, Lcom/apportable/ui/TextField$1;->val$ctx:Landroid/content/Context;

    iput-object p2, p0, Lcom/apportable/ui/TextField$1;->val$view:Ljava/util/concurrent/atomic/AtomicReference;

    iput p3, p0, Lcom/apportable/ui/TextField$1;->val$object:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 80
    iget-object v1, p0, Lcom/apportable/ui/TextField$1;->val$ctx:Landroid/content/Context;

    monitor-enter v1

    .line 81
    :try_start_0
    iget-object v0, p0, Lcom/apportable/ui/TextField$1;->val$view:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v2, Lcom/apportable/ui/TextField;

    iget-object v3, p0, Lcom/apportable/ui/TextField$1;->val$ctx:Landroid/content/Context;

    iget v4, p0, Lcom/apportable/ui/TextField$1;->val$object:I

    invoke-direct {v2, v3, v4}, Lcom/apportable/ui/TextField;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 82
    iget-object v0, p0, Lcom/apportable/ui/TextField$1;->val$ctx:Landroid/content/Context;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 83
    monitor-exit v1

    .line 84
    return-void

    .line 83
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

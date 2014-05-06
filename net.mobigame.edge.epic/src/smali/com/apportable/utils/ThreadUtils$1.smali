.class final Lcom/apportable/utils/ThreadUtils$1;
.super Ljava/lang/Object;
.source "ThreadUtils.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/utils/ThreadUtils;->runOnThread(Ljava/lang/Runnable;ZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Lcom/apportable/activity/VerdeActivity;

.field final synthetic val$finished:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final synthetic val$r:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/apportable/activity/VerdeActivity;Ljava/lang/Runnable;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 23
    iput-object p1, p0, Lcom/apportable/utils/ThreadUtils$1;->val$activity:Lcom/apportable/activity/VerdeActivity;

    iput-object p2, p0, Lcom/apportable/utils/ThreadUtils$1;->val$r:Ljava/lang/Runnable;

    iput-object p3, p0, Lcom/apportable/utils/ThreadUtils$1;->val$finished:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 26
    iget-object v1, p0, Lcom/apportable/utils/ThreadUtils$1;->val$activity:Lcom/apportable/activity/VerdeActivity;

    monitor-enter v1

    .line 27
    :try_start_0
    iget-object v0, p0, Lcom/apportable/utils/ThreadUtils$1;->val$r:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 28
    iget-object v0, p0, Lcom/apportable/utils/ThreadUtils$1;->val$finished:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 29
    iget-object v0, p0, Lcom/apportable/utils/ThreadUtils$1;->val$activity:Lcom/apportable/activity/VerdeActivity;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 30
    monitor-exit v1

    .line 31
    return-void

    .line 30
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

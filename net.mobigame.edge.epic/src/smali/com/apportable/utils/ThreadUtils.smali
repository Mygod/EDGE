.class public Lcom/apportable/utils/ThreadUtils;
.super Ljava/lang/Object;
.source "ThreadUtils.java"


# static fields
.field public static final GL_THREAD:I = 0x1

.field public static final UI_THREAD:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static runOnGlThread(Ljava/lang/Runnable;)V
    .locals 1
    .parameter "r"

    .prologue
    .line 60
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/apportable/utils/ThreadUtils;->runOnThread(Ljava/lang/Runnable;I)V

    .line 61
    return-void
.end method

.method public static runOnGlThread(Ljava/lang/Runnable;Z)V
    .locals 1
    .parameter "r"
    .parameter "wait"

    .prologue
    .line 64
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/apportable/utils/ThreadUtils;->runOnThread(Ljava/lang/Runnable;ZI)V

    .line 65
    return-void
.end method

.method public static runOnThread(Ljava/lang/Runnable;I)V
    .locals 1
    .parameter "r"
    .parameter "thread"

    .prologue
    .line 16
    invoke-static {}, Lcom/apportable/activity/VerdeActivity;->getActivity()Lcom/apportable/activity/VerdeActivity;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/apportable/activity/VerdeActivity;->runOnThread(Ljava/lang/Runnable;I)V

    .line 17
    return-void
.end method

.method public static runOnThread(Ljava/lang/Runnable;ZI)V
    .locals 3
    .parameter "r"
    .parameter "wait"
    .parameter "thread"

    .prologue
    .line 20
    invoke-static {}, Lcom/apportable/activity/VerdeActivity;->getActivity()Lcom/apportable/activity/VerdeActivity;

    move-result-object v0

    .line 21
    .local v0, activity:Lcom/apportable/activity/VerdeActivity;
    if-eqz p1, :cond_1

    .line 22
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 23
    .local v1, finished:Ljava/util/concurrent/atomic/AtomicBoolean;
    new-instance v2, Lcom/apportable/utils/ThreadUtils$1;

    invoke-direct {v2, v0, p0, v1}, Lcom/apportable/utils/ThreadUtils$1;-><init>(Lcom/apportable/activity/VerdeActivity;Ljava/lang/Runnable;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    invoke-static {v2, p2}, Lcom/apportable/utils/ThreadUtils;->runOnThread(Ljava/lang/Runnable;I)V

    .line 33
    monitor-enter v0

    .line 34
    :goto_0
    :try_start_0
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-nez v2, :cond_0

    .line 36
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 37
    :catch_0
    move-exception v2

    goto :goto_0

    .line 39
    :cond_0
    :try_start_2
    monitor-exit v0

    .line 49
    .end local v1           #finished:Ljava/util/concurrent/atomic/AtomicBoolean;
    :goto_1
    return-void

    .line 39
    .restart local v1       #finished:Ljava/util/concurrent/atomic/AtomicBoolean;
    :catchall_0
    move-exception v2

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .line 41
    .end local v1           #finished:Ljava/util/concurrent/atomic/AtomicBoolean;
    :cond_1
    new-instance v2, Lcom/apportable/utils/ThreadUtils$2;

    invoke-direct {v2, p0}, Lcom/apportable/utils/ThreadUtils$2;-><init>(Ljava/lang/Runnable;)V

    invoke-static {v2, p2}, Lcom/apportable/utils/ThreadUtils;->runOnThread(Ljava/lang/Runnable;I)V

    goto :goto_1
.end method

.method public static runOnUiThread(Ljava/lang/Runnable;)V
    .locals 1
    .parameter "r"

    .prologue
    .line 52
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/apportable/utils/ThreadUtils;->runOnThread(Ljava/lang/Runnable;I)V

    .line 53
    return-void
.end method

.method public static runOnUiThread(Ljava/lang/Runnable;Z)V
    .locals 1
    .parameter "r"
    .parameter "wait"

    .prologue
    .line 56
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/apportable/utils/ThreadUtils;->runOnThread(Ljava/lang/Runnable;ZI)V

    .line 57
    return-void
.end method

.method public static runningOnUiThread()Z
    .locals 4

    .prologue
    .line 68
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.class public Lcom/apportable/ui/BarItem;
.super Ljava/lang/Object;
.source "BarItem.java"


# instance fields
.field protected mObject:I


# direct methods
.method protected constructor <init>(Landroid/content/Context;I)V
    .locals 1
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const/4 v0, 0x0

    iput v0, p0, Lcom/apportable/ui/BarItem;->mObject:I

    .line 29
    iput p2, p0, Lcom/apportable/ui/BarItem;->mObject:I

    .line 30
    return-void
.end method

.method public static create(Landroid/content/Context;I)Lcom/apportable/ui/BarItem;
    .locals 2
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 33
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 34
    new-instance v1, Lcom/apportable/ui/BarItem;

    invoke-direct {v1, p0, p1}, Lcom/apportable/ui/BarItem;-><init>(Landroid/content/Context;I)V

    .line 53
    :goto_0
    return-object v1

    .line 36
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 37
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/BarItem;>;"
    new-instance v1, Lcom/apportable/ui/BarItem$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/apportable/ui/BarItem$1;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;I)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 46
    monitor-enter p0

    .line 47
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 49
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 50
    :catch_0
    move-exception v1

    goto :goto_1

    .line 52
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 53
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/BarItem;

    goto :goto_0

    .line 52
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method


# virtual methods
.method getLayout()Landroid/widget/LinearLayout$LayoutParams;
    .locals 3

    .prologue
    .line 62
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    const/4 v2, -0x1

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method getView()Landroid/view/View;
    .locals 1

    .prologue
    .line 58
    const/4 v0, 0x0

    return-object v0
.end method

.method protected runOnGlThread(Ljava/lang/Runnable;Z)V
    .locals 1
    .parameter "r"
    .parameter "wait"

    .prologue
    .line 25
    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Lcom/apportable/utils/ThreadUtils;->runOnThread(Ljava/lang/Runnable;ZI)V

    .line 26
    return-void
.end method

.method protected runOnUiThread(Ljava/lang/Runnable;Z)V
    .locals 1
    .parameter "r"
    .parameter "wait"

    .prologue
    .line 21
    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Lcom/apportable/utils/ThreadUtils;->runOnThread(Ljava/lang/Runnable;ZI)V

    .line 22
    return-void
.end method

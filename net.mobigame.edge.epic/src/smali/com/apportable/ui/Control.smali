.class Lcom/apportable/ui/Control;
.super Lcom/apportable/ui/View;
.source "Control.java"


# static fields
.field public static final EDITING_CHANGED_EVENT:I = 0x20000

.field public static final EDITING_DIDBEGIN_EVENT:I = 0x10000

.field public static final EDITING_DIDENDONEXIT_EVENT:I = 0x80000

.field public static final EDITING_DIDEND_EVENT:I = 0x40000

.field public static final TOUCH_CANCEL_EVENT:I = 0x100

.field public static final TOUCH_DOWNREPEAT_EVENT:I = 0x2

.field public static final TOUCH_DOWN_EVENT:I = 0x1

.field public static final TOUCH_DRAGENTER_EVENT:I = 0x10

.field public static final TOUCH_DRAGEXIT_EVENT:I = 0x20

.field public static final TOUCH_DRAGINSIDE_EVENT:I = 0x4

.field public static final TOUCH_DRAGOUTSIDE_EVENT:I = 0x8

.field public static final TOUCH_UPINSIDE_EVENT:I = 0x40

.field public static final TOUCH_UPOUTSIDE_EVENT:I = 0x80

.field public static final VALUE_CHANGED_EVENT:I = 0x1000


# direct methods
.method protected constructor <init>(Landroid/content/Context;I)V
    .locals 0
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;I)V

    .line 37
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;ILandroid/graphics/RectF;)V
    .locals 0
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 40
    invoke-direct {p0, p1, p2, p3}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 41
    return-void
.end method

.method public static create(Landroid/content/Context;I)Lcom/apportable/ui/Control;
    .locals 2
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 44
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 45
    new-instance v1, Lcom/apportable/ui/Control;

    invoke-direct {v1, p0, p1}, Lcom/apportable/ui/Control;-><init>(Landroid/content/Context;I)V

    .line 64
    :goto_0
    return-object v1

    .line 47
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 48
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/Control;>;"
    new-instance v1, Lcom/apportable/ui/Control$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/apportable/ui/Control$1;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;I)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 57
    monitor-enter p0

    .line 58
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 60
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 61
    :catch_0
    move-exception v1

    goto :goto_1

    .line 63
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 64
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/Control;

    goto :goto_0

    .line 63
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public static create(Landroid/content/Context;ILandroid/graphics/RectF;)Lcom/apportable/ui/Control;
    .locals 2
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 69
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 70
    new-instance v1, Lcom/apportable/ui/Control;

    invoke-direct {v1, p0, p1, p2}, Lcom/apportable/ui/Control;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 89
    :goto_0
    return-object v1

    .line 72
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 73
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/Control;>;"
    new-instance v1, Lcom/apportable/ui/Control$2;

    invoke-direct {v1, p0, v0, p1, p2}, Lcom/apportable/ui/Control$2;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;ILandroid/graphics/RectF;)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 82
    monitor-enter p0

    .line 83
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 85
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 86
    :catch_0
    move-exception v1

    goto :goto_1

    .line 88
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 89
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/Control;

    goto :goto_0

    .line 88
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method


# virtual methods
.method protected native event(II)V
.end method

.method protected sendEvent(I)V
    .locals 2
    .parameter "e"

    .prologue
    .line 94
    new-instance v0, Lcom/apportable/ui/Control$3;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Control$3;-><init>(Lcom/apportable/ui/Control;I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Control;->runOnGlThread(Ljava/lang/Runnable;Z)V

    .line 100
    return-void
.end method

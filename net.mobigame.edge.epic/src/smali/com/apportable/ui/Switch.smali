.class Lcom/apportable/ui/Switch;
.super Lcom/apportable/ui/Control;
.source "Switch.java"


# instance fields
.field private mChecked:Z

.field private mSwitch:Landroid/widget/CheckBox;


# direct methods
.method protected constructor <init>(Landroid/content/Context;I)V
    .locals 1
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 81
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/Control;-><init>(Landroid/content/Context;I)V

    .line 14
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/apportable/ui/Switch;->mChecked:Z

    .line 82
    invoke-direct {p0}, Lcom/apportable/ui/Switch;->init()V

    .line 83
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;ILandroid/graphics/RectF;)V
    .locals 1
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 86
    invoke-direct {p0, p1, p2, p3}, Lcom/apportable/ui/Control;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 14
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/apportable/ui/Switch;->mChecked:Z

    .line 87
    new-instance v0, Landroid/widget/CheckBox;

    invoke-direct {v0, p1}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/apportable/ui/Switch;->mSwitch:Landroid/widget/CheckBox;

    .line 88
    invoke-direct {p0}, Lcom/apportable/ui/Switch;->init()V

    .line 89
    return-void
.end method

.method static synthetic access$000(Lcom/apportable/ui/Switch;)Landroid/widget/CheckBox;
    .locals 1
    .parameter "x0"

    .prologue
    .line 12
    iget-object v0, p0, Lcom/apportable/ui/Switch;->mSwitch:Landroid/widget/CheckBox;

    return-object v0
.end method

.method static synthetic access$100(Lcom/apportable/ui/Switch;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 12
    iget-boolean v0, p0, Lcom/apportable/ui/Switch;->mChecked:Z

    return v0
.end method

.method static synthetic access$102(Lcom/apportable/ui/Switch;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 12
    iput-boolean p1, p0, Lcom/apportable/ui/Switch;->mChecked:Z

    return p1
.end method

.method public static create(Landroid/content/Context;I)Lcom/apportable/ui/Switch;
    .locals 2
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 17
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 18
    new-instance v1, Lcom/apportable/ui/Switch;

    invoke-direct {v1, p0, p1}, Lcom/apportable/ui/Switch;-><init>(Landroid/content/Context;I)V

    .line 37
    :goto_0
    return-object v1

    .line 20
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 21
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/Switch;>;"
    new-instance v1, Lcom/apportable/ui/Switch$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/apportable/ui/Switch$1;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;I)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 30
    monitor-enter p0

    .line 31
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 33
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 34
    :catch_0
    move-exception v1

    goto :goto_1

    .line 36
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 37
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/Switch;

    goto :goto_0

    .line 36
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public static create(Landroid/content/Context;ILandroid/graphics/RectF;)Lcom/apportable/ui/Switch;
    .locals 2
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 42
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 43
    new-instance v1, Lcom/apportable/ui/Switch;

    invoke-direct {v1, p0, p1, p2}, Lcom/apportable/ui/Switch;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 62
    :goto_0
    return-object v1

    .line 45
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 46
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/Switch;>;"
    new-instance v1, Lcom/apportable/ui/Switch$2;

    invoke-direct {v1, p0, v0, p1, p2}, Lcom/apportable/ui/Switch$2;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;ILandroid/graphics/RectF;)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 55
    monitor-enter p0

    .line 56
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 58
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 59
    :catch_0
    move-exception v1

    goto :goto_1

    .line 61
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 62
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/Switch;

    goto :goto_0

    .line 61
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method private init()V
    .locals 3

    .prologue
    .line 67
    new-instance v0, Landroid/widget/CheckBox;

    invoke-virtual {p0}, Lcom/apportable/ui/Switch;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/apportable/ui/Switch;->mSwitch:Landroid/widget/CheckBox;

    .line 68
    iget-object v0, p0, Lcom/apportable/ui/Switch;->mSwitch:Landroid/widget/CheckBox;

    new-instance v1, Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/apportable/ui/Switch;->getFrame()Landroid/graphics/RectF;

    move-result-object v2

    invoke-static {v2}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/apportable/ui/Switch;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Switch;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 69
    iget-object v0, p0, Lcom/apportable/ui/Switch;->mSwitch:Landroid/widget/CheckBox;

    new-instance v1, Lcom/apportable/ui/Switch$3;

    invoke-direct {v1, p0}, Lcom/apportable/ui/Switch$3;-><init>(Lcom/apportable/ui/Switch;)V

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 78
    return-void
.end method


# virtual methods
.method protected _setFrame(Landroid/graphics/RectF;)V
    .locals 2
    .parameter "frame"

    .prologue
    .line 92
    invoke-super {p0, p1}, Lcom/apportable/ui/Control;->_setFrame(Landroid/graphics/RectF;)V

    .line 93
    iget-object v0, p0, Lcom/apportable/ui/Switch;->mSwitch:Landroid/widget/CheckBox;

    invoke-static {p1}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/apportable/ui/Switch;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 94
    return-void
.end method

.method public isChecked()Z
    .locals 1

    .prologue
    .line 110
    iget-boolean v0, p0, Lcom/apportable/ui/Switch;->mChecked:Z

    return v0
.end method

.method public setChecked(Z)V
    .locals 2
    .parameter "yesOrNo"

    .prologue
    .line 98
    iput-boolean p1, p0, Lcom/apportable/ui/Switch;->mChecked:Z

    .line 99
    iget-boolean v0, p0, Lcom/apportable/ui/Switch;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 100
    new-instance v0, Lcom/apportable/ui/Switch$4;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Switch$4;-><init>(Lcom/apportable/ui/Switch;Z)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Switch;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 107
    :cond_0
    return-void
.end method

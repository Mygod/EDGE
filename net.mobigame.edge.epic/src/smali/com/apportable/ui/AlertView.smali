.class public Lcom/apportable/ui/AlertView;
.super Lcom/apportable/ui/View;
.source "AlertView.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/content/DialogInterface$OnDismissListener;
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field private mButtonTitles:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation
.end field

.field private mCancelButton:I

.field private mCancelTitle:Ljava/lang/String;

.field private mDialog:Landroid/app/AlertDialog;

.field private mMessage:Ljava/lang/String;

.field private mTitle:Ljava/lang/String;

.field private mVisible:Z


# direct methods
.method protected constructor <init>(Landroid/content/Context;I)V
    .locals 2
    .parameter "ctx"
    .parameter "object"

    .prologue
    const/4 v1, 0x0

    .line 33
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;I)V

    .line 21
    const-string v0, ""

    iput-object v0, p0, Lcom/apportable/ui/AlertView;->mTitle:Ljava/lang/String;

    .line 22
    const-string v0, ""

    iput-object v0, p0, Lcom/apportable/ui/AlertView;->mMessage:Ljava/lang/String;

    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/apportable/ui/AlertView;->mVisible:Z

    .line 24
    const/4 v0, -0x1

    iput v0, p0, Lcom/apportable/ui/AlertView;->mCancelButton:I

    .line 25
    iput-object v1, p0, Lcom/apportable/ui/AlertView;->mCancelTitle:Ljava/lang/String;

    .line 26
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/apportable/ui/AlertView;->mButtonTitles:Ljava/util/HashMap;

    .line 27
    iput-object v1, p0, Lcom/apportable/ui/AlertView;->mDialog:Landroid/app/AlertDialog;

    .line 34
    invoke-direct {p0}, Lcom/apportable/ui/AlertView;->init()V

    .line 35
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;ILandroid/graphics/RectF;)V
    .locals 2
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    const/4 v1, 0x0

    .line 38
    invoke-direct {p0, p1, p2, p3}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 21
    const-string v0, ""

    iput-object v0, p0, Lcom/apportable/ui/AlertView;->mTitle:Ljava/lang/String;

    .line 22
    const-string v0, ""

    iput-object v0, p0, Lcom/apportable/ui/AlertView;->mMessage:Ljava/lang/String;

    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/apportable/ui/AlertView;->mVisible:Z

    .line 24
    const/4 v0, -0x1

    iput v0, p0, Lcom/apportable/ui/AlertView;->mCancelButton:I

    .line 25
    iput-object v1, p0, Lcom/apportable/ui/AlertView;->mCancelTitle:Ljava/lang/String;

    .line 26
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/apportable/ui/AlertView;->mButtonTitles:Ljava/util/HashMap;

    .line 27
    iput-object v1, p0, Lcom/apportable/ui/AlertView;->mDialog:Landroid/app/AlertDialog;

    .line 39
    invoke-direct {p0}, Lcom/apportable/ui/AlertView;->init()V

    .line 40
    return-void
.end method

.method static synthetic access$000(Lcom/apportable/ui/AlertView;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 15
    iget-object v0, p0, Lcom/apportable/ui/AlertView;->mTitle:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/apportable/ui/AlertView;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 15
    iget-object v0, p0, Lcom/apportable/ui/AlertView;->mMessage:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/apportable/ui/AlertView;)Landroid/app/AlertDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 15
    iget-object v0, p0, Lcom/apportable/ui/AlertView;->mDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$202(Lcom/apportable/ui/AlertView;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 15
    iput-object p1, p0, Lcom/apportable/ui/AlertView;->mDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$300(Lcom/apportable/ui/AlertView;)Ljava/util/HashMap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 15
    iget-object v0, p0, Lcom/apportable/ui/AlertView;->mButtonTitles:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$400(Lcom/apportable/ui/AlertView;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 15
    iget-object v0, p0, Lcom/apportable/ui/AlertView;->mCancelTitle:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/apportable/ui/AlertView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 15
    iget v0, p0, Lcom/apportable/ui/AlertView;->mCancelButton:I

    return v0
.end method

.method static synthetic access$600(Lcom/apportable/ui/AlertView;II)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 15
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/AlertView;->nativeOnClick(II)V

    return-void
.end method

.method static synthetic access$700(Lcom/apportable/ui/AlertView;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 15
    invoke-direct {p0, p1}, Lcom/apportable/ui/AlertView;->nativeOnDismiss(I)V

    return-void
.end method

.method static synthetic access$800(Lcom/apportable/ui/AlertView;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 15
    invoke-direct {p0, p1}, Lcom/apportable/ui/AlertView;->nativeOnCancel(I)V

    return-void
.end method

.method public static create(Landroid/content/Context;I)Lcom/apportable/ui/AlertView;
    .locals 2
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 43
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 44
    new-instance v1, Lcom/apportable/ui/AlertView;

    invoke-direct {v1, p0, p1}, Lcom/apportable/ui/AlertView;-><init>(Landroid/content/Context;I)V

    .line 63
    :goto_0
    return-object v1

    .line 46
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 47
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/AlertView;>;"
    new-instance v1, Lcom/apportable/ui/AlertView$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/apportable/ui/AlertView$1;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;I)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 56
    monitor-enter p0

    .line 57
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 59
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 60
    :catch_0
    move-exception v1

    goto :goto_1

    .line 62
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 63
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/AlertView;

    goto :goto_0

    .line 62
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public static create(Landroid/content/Context;ILandroid/graphics/RectF;)Lcom/apportable/ui/AlertView;
    .locals 2
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 68
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 69
    new-instance v1, Lcom/apportable/ui/AlertView;

    invoke-direct {v1, p0, p1, p2}, Lcom/apportable/ui/AlertView;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 88
    :goto_0
    return-object v1

    .line 71
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 72
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/AlertView;>;"
    new-instance v1, Lcom/apportable/ui/AlertView$2;

    invoke-direct {v1, p0, v0, p1, p2}, Lcom/apportable/ui/AlertView$2;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;ILandroid/graphics/RectF;)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 81
    monitor-enter p0

    .line 82
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 84
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 85
    :catch_0
    move-exception v1

    goto :goto_1

    .line 87
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 88
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/AlertView;

    goto :goto_0

    .line 87
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method private init()V
    .locals 0

    .prologue
    .line 30
    return-void
.end method

.method private native nativeOnCancel(I)V
.end method

.method private native nativeOnClick(II)V
.end method

.method private native nativeOnDismiss(I)V
.end method


# virtual methods
.method public addButtonWithTitle(Ljava/lang/String;I)V
    .locals 2
    .parameter "title"
    .parameter "index"

    .prologue
    .line 122
    iget-object v0, p0, Lcom/apportable/ui/AlertView;->mButtonTitles:Ljava/util/HashMap;

    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p2}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    return-void
.end method

.method public dismiss()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 161
    iget-boolean v0, p0, Lcom/apportable/ui/AlertView;->mVisible:Z

    if-ne v0, v1, :cond_0

    .line 162
    new-instance v0, Lcom/apportable/ui/AlertView$4;

    invoke-direct {v0, p0}, Lcom/apportable/ui/AlertView$4;-><init>(Lcom/apportable/ui/AlertView;)V

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/AlertView;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 169
    :cond_0
    return-void
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1
    .parameter "dialog"

    .prologue
    .line 205
    new-instance v0, Lcom/apportable/ui/AlertView$7;

    invoke-direct {v0, p0}, Lcom/apportable/ui/AlertView$7;-><init>(Lcom/apportable/ui/AlertView;)V

    invoke-static {v0}, Lcom/apportable/utils/ThreadUtils;->runOnGlThread(Ljava/lang/Runnable;)V

    .line 211
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 172
    new-instance v0, Lcom/apportable/ui/AlertView$5;

    invoke-direct {v0, p0, p2}, Lcom/apportable/ui/AlertView$5;-><init>(Lcom/apportable/ui/AlertView;I)V

    invoke-static {v0}, Lcom/apportable/utils/ThreadUtils;->runOnGlThread(Ljava/lang/Runnable;)V

    .line 193
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1
    .parameter "dialog"

    .prologue
    .line 196
    new-instance v0, Lcom/apportable/ui/AlertView$6;

    invoke-direct {v0, p0}, Lcom/apportable/ui/AlertView$6;-><init>(Lcom/apportable/ui/AlertView;)V

    invoke-static {v0}, Lcom/apportable/utils/ThreadUtils;->runOnGlThread(Ljava/lang/Runnable;)V

    .line 202
    return-void
.end method

.method public setCancelButtonIndex(I)V
    .locals 0
    .parameter "index"

    .prologue
    .line 110
    iput p1, p0, Lcom/apportable/ui/AlertView;->mCancelButton:I

    .line 111
    return-void
.end method

.method public setCancelButtonTitle(Ljava/lang/String;)V
    .locals 0
    .parameter "title"

    .prologue
    .line 118
    iput-object p1, p0, Lcom/apportable/ui/AlertView;->mCancelTitle:Ljava/lang/String;

    .line 119
    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0
    .parameter "message"

    .prologue
    .line 100
    if-eqz p1, :cond_0

    .line 102
    iput-object p1, p0, Lcom/apportable/ui/AlertView;->mMessage:Ljava/lang/String;

    .line 104
    :cond_0
    return-void
.end method

.method public setStyle(I)V
    .locals 0
    .parameter "style"

    .prologue
    .line 115
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0
    .parameter "title"

    .prologue
    .line 93
    if-eqz p1, :cond_0

    .line 95
    iput-object p1, p0, Lcom/apportable/ui/AlertView;->mTitle:Ljava/lang/String;

    .line 97
    :cond_0
    return-void
.end method

.method public show()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 126
    iget-boolean v0, p0, Lcom/apportable/ui/AlertView;->mVisible:Z

    if-nez v0, :cond_0

    .line 127
    iput-boolean v1, p0, Lcom/apportable/ui/AlertView;->mVisible:Z

    .line 128
    new-instance v0, Lcom/apportable/ui/AlertView$3;

    invoke-direct {v0, p0}, Lcom/apportable/ui/AlertView$3;-><init>(Lcom/apportable/ui/AlertView;)V

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/AlertView;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 158
    :cond_0
    return-void
.end method

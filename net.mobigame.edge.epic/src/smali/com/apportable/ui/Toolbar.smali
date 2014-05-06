.class public Lcom/apportable/ui/Toolbar;
.super Lcom/apportable/ui/View;
.source "Toolbar.java"


# static fields
.field private static final BLACK_OPAQUE_COLORS:[I = null

.field public static final BLACK_OPAQUE_STYLE:I = 0x1

.field public static final BLACK_STYLE:I = 0x1

.field private static final BLACK_TRANSLUCENT_COLORS:[I = null

.field public static final BLACK_TRANSLUCENT_STYLE:I = 0x2

.field private static DEFAULT_COLOR:I

.field public static final DEFAULT_STYLE:I


# instance fields
.field private mStyle:I

.field private mTint:I

.field private mToolbar:Landroid/widget/LinearLayout;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x2

    .line 28
    const v0, -0xeeeeef

    sput v0, Lcom/apportable/ui/Toolbar;->DEFAULT_COLOR:I

    .line 29
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/apportable/ui/Toolbar;->BLACK_OPAQUE_COLORS:[I

    .line 30
    new-array v0, v1, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/apportable/ui/Toolbar;->BLACK_TRANSLUCENT_COLORS:[I

    return-void

    .line 29
    nop

    :array_0
    .array-data 0x4
        0x33t 0x33t 0x33t 0xfft
        0x0t 0x0t 0x0t 0xfft
    .end array-data

    .line 30
    :array_1
    .array-data 0x4
        0x33t 0x33t 0x33t 0xcct
        0x0t 0x0t 0x0t 0xddt
    .end array-data
.end method

.method protected constructor <init>(Landroid/content/Context;I)V
    .locals 1
    .parameter "ctx"
    .parameter "object"

    .prologue
    const/4 v0, 0x0

    .line 43
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;I)V

    .line 33
    iput v0, p0, Lcom/apportable/ui/Toolbar;->mStyle:I

    .line 34
    iput v0, p0, Lcom/apportable/ui/Toolbar;->mTint:I

    .line 44
    invoke-direct {p0}, Lcom/apportable/ui/Toolbar;->init()V

    .line 45
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;ILandroid/graphics/RectF;)V
    .locals 1
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    const/4 v0, 0x0

    .line 48
    invoke-direct {p0, p1, p2, p3}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 33
    iput v0, p0, Lcom/apportable/ui/Toolbar;->mStyle:I

    .line 34
    iput v0, p0, Lcom/apportable/ui/Toolbar;->mTint:I

    .line 49
    invoke-direct {p0}, Lcom/apportable/ui/Toolbar;->init()V

    .line 50
    return-void
.end method

.method private _setStyle(I)V
    .locals 3
    .parameter "style"

    .prologue
    .line 150
    packed-switch p1, :pswitch_data_0

    .line 161
    :goto_0
    return-void

    .line 152
    :pswitch_0
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    sget v1, Lcom/apportable/ui/Toolbar;->DEFAULT_COLOR:I

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, v0}, Lcom/apportable/ui/Toolbar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 155
    :pswitch_1
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    sget-object v2, Lcom/apportable/ui/Toolbar;->BLACK_OPAQUE_COLORS:[I

    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    invoke-virtual {p0, v0}, Lcom/apportable/ui/Toolbar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 158
    :pswitch_2
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    sget-object v2, Lcom/apportable/ui/Toolbar;->BLACK_TRANSLUCENT_COLORS:[I

    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    invoke-virtual {p0, v0}, Lcom/apportable/ui/Toolbar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 150
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method static synthetic access$000(Lcom/apportable/ui/Toolbar;)Landroid/widget/LinearLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 21
    iget-object v0, p0, Lcom/apportable/ui/Toolbar;->mToolbar:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$100(Lcom/apportable/ui/Toolbar;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lcom/apportable/ui/Toolbar;->_setStyle(I)V

    return-void
.end method

.method public static create(Landroid/content/Context;I)Lcom/apportable/ui/Toolbar;
    .locals 2
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 53
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 54
    new-instance v1, Lcom/apportable/ui/Toolbar;

    invoke-direct {v1, p0, p1}, Lcom/apportable/ui/Toolbar;-><init>(Landroid/content/Context;I)V

    .line 73
    :goto_0
    return-object v1

    .line 56
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 57
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/Toolbar;>;"
    new-instance v1, Lcom/apportable/ui/Toolbar$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/apportable/ui/Toolbar$1;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;I)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 66
    monitor-enter p0

    .line 67
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 69
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 70
    :catch_0
    move-exception v1

    goto :goto_1

    .line 72
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 73
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/Toolbar;

    goto :goto_0

    .line 72
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public static create(Landroid/content/Context;ILandroid/graphics/RectF;)Lcom/apportable/ui/Toolbar;
    .locals 2
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 78
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 79
    new-instance v1, Lcom/apportable/ui/Toolbar;

    invoke-direct {v1, p0, p1, p2}, Lcom/apportable/ui/Toolbar;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 98
    :goto_0
    return-object v1

    .line 81
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 82
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/Toolbar;>;"
    new-instance v1, Lcom/apportable/ui/Toolbar$2;

    invoke-direct {v1, p0, v0, p1, p2}, Lcom/apportable/ui/Toolbar$2;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;ILandroid/graphics/RectF;)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 91
    monitor-enter p0

    .line 92
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 94
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 95
    :catch_0
    move-exception v1

    goto :goto_1

    .line 97
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 98
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/Toolbar;

    goto :goto_0

    .line 97
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method private init()V
    .locals 2

    .prologue
    .line 37
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/apportable/ui/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/apportable/ui/Toolbar;->mToolbar:Landroid/widget/LinearLayout;

    .line 38
    iget-object v0, p0, Lcom/apportable/ui/Toolbar;->mToolbar:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 39
    iget-object v0, p0, Lcom/apportable/ui/Toolbar;->mToolbar:Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/apportable/ui/Toolbar;->getFrame()Landroid/graphics/RectF;

    move-result-object v1

    invoke-static {v1}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/apportable/ui/Toolbar;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Toolbar;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 40
    return-void
.end method


# virtual methods
.method protected _setFrame(Landroid/graphics/RectF;)V
    .locals 2
    .parameter "frame"

    .prologue
    .line 104
    invoke-super {p0, p1}, Lcom/apportable/ui/View;->_setFrame(Landroid/graphics/RectF;)V

    .line 105
    iget-object v0, p0, Lcom/apportable/ui/Toolbar;->mToolbar:Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/apportable/ui/Toolbar;->getFrame()Landroid/graphics/RectF;

    move-result-object v1

    invoke-static {v1}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/apportable/ui/Toolbar;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 106
    return-void
.end method

.method public addItem(Lcom/apportable/ui/BarItem;)V
    .locals 2
    .parameter "item"

    .prologue
    .line 136
    if-nez p1, :cond_0

    .line 147
    :goto_0
    return-void

    .line 138
    :cond_0
    new-instance v0, Lcom/apportable/ui/Toolbar$6;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Toolbar$6;-><init>(Lcom/apportable/ui/Toolbar;Lcom/apportable/ui/BarItem;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Toolbar;->runOnUiThread(Ljava/lang/Runnable;Z)V

    goto :goto_0
.end method

.method public beginAnimations()V
    .locals 2

    .prologue
    .line 118
    new-instance v0, Lcom/apportable/ui/Toolbar$4;

    invoke-direct {v0, p0}, Lcom/apportable/ui/Toolbar$4;-><init>(Lcom/apportable/ui/Toolbar;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Toolbar;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 124
    return-void
.end method

.method public endAnimations()V
    .locals 2

    .prologue
    .line 127
    new-instance v0, Lcom/apportable/ui/Toolbar$5;

    invoke-direct {v0, p0}, Lcom/apportable/ui/Toolbar$5;-><init>(Lcom/apportable/ui/Toolbar;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Toolbar;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 133
    return-void
.end method

.method public getStyle()I
    .locals 1

    .prologue
    .line 176
    iget v0, p0, Lcom/apportable/ui/Toolbar;->mStyle:I

    return v0
.end method

.method public getTintColor()I
    .locals 1

    .prologue
    .line 192
    iget v0, p0, Lcom/apportable/ui/Toolbar;->mTint:I

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 2

    .prologue
    .line 196
    invoke-super {p0}, Lcom/apportable/ui/View;->onAttachedToWindow()V

    .line 197
    iget v0, p0, Lcom/apportable/ui/Toolbar;->mStyle:I

    invoke-direct {p0, v0}, Lcom/apportable/ui/Toolbar;->_setStyle(I)V

    .line 198
    iget-object v0, p0, Lcom/apportable/ui/Toolbar;->mToolbar:Landroid/widget/LinearLayout;

    iget v1, p0, Lcom/apportable/ui/Toolbar;->mTint:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 199
    return-void
.end method

.method public removeAllItems()V
    .locals 2

    .prologue
    .line 109
    new-instance v0, Lcom/apportable/ui/Toolbar$3;

    invoke-direct {v0, p0}, Lcom/apportable/ui/Toolbar$3;-><init>(Lcom/apportable/ui/Toolbar;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Toolbar;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 115
    return-void
.end method

.method public setStyle(I)V
    .locals 2
    .parameter "style"

    .prologue
    .line 164
    iput p1, p0, Lcom/apportable/ui/Toolbar;->mStyle:I

    .line 165
    iget-boolean v0, p0, Lcom/apportable/ui/Toolbar;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 166
    new-instance v0, Lcom/apportable/ui/Toolbar$7;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Toolbar$7;-><init>(Lcom/apportable/ui/Toolbar;I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Toolbar;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 173
    :cond_0
    return-void
.end method

.method public setTintColor(I)V
    .locals 2
    .parameter "tint"

    .prologue
    .line 180
    iput p1, p0, Lcom/apportable/ui/Toolbar;->mTint:I

    .line 181
    iget-boolean v0, p0, Lcom/apportable/ui/Toolbar;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 182
    new-instance v0, Lcom/apportable/ui/Toolbar$8;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Toolbar$8;-><init>(Lcom/apportable/ui/Toolbar;I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Toolbar;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 189
    :cond_0
    return-void
.end method

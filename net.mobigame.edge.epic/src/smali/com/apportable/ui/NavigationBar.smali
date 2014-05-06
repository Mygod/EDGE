.class public Lcom/apportable/ui/NavigationBar;
.super Lcom/apportable/ui/View;
.source "NavigationBar.java"


# static fields
.field private static final BLACK_OPAQUE_COLORS:[I

.field private static final BLACK_TRANSLUCENT_COLORS:[I

.field private static DEFAULT_COLOR:I


# instance fields
.field private mCenterItems:Landroid/widget/LinearLayout;

.field private mLeftItems:Landroid/widget/LinearLayout;

.field private mNavigationBar:Landroid/widget/RelativeLayout;

.field private mRightItems:Landroid/widget/LinearLayout;

.field private mStyle:I

.field private mTint:I

.field private mTitle:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x2

    .line 35
    const v0, -0xeeeeef

    sput v0, Lcom/apportable/ui/NavigationBar;->DEFAULT_COLOR:I

    .line 36
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/apportable/ui/NavigationBar;->BLACK_OPAQUE_COLORS:[I

    .line 37
    new-array v0, v1, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/apportable/ui/NavigationBar;->BLACK_TRANSLUCENT_COLORS:[I

    return-void

    .line 36
    nop

    :array_0
    .array-data 0x4
        0x33t 0x33t 0x33t 0xfft
        0x0t 0x0t 0x0t 0xfft
    .end array-data

    .line 37
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

    .line 65
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;I)V

    .line 31
    iput v0, p0, Lcom/apportable/ui/NavigationBar;->mStyle:I

    .line 32
    iput v0, p0, Lcom/apportable/ui/NavigationBar;->mTint:I

    .line 33
    const-string v0, ""

    iput-object v0, p0, Lcom/apportable/ui/NavigationBar;->mTitle:Ljava/lang/String;

    .line 66
    invoke-direct {p0}, Lcom/apportable/ui/NavigationBar;->init()V

    .line 67
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;ILandroid/graphics/RectF;)V
    .locals 1
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    const/4 v0, 0x0

    .line 70
    invoke-direct {p0, p1, p2, p3}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 31
    iput v0, p0, Lcom/apportable/ui/NavigationBar;->mStyle:I

    .line 32
    iput v0, p0, Lcom/apportable/ui/NavigationBar;->mTint:I

    .line 33
    const-string v0, ""

    iput-object v0, p0, Lcom/apportable/ui/NavigationBar;->mTitle:Ljava/lang/String;

    .line 71
    invoke-direct {p0}, Lcom/apportable/ui/NavigationBar;->init()V

    .line 72
    return-void
.end method

.method private _setStyle(I)V
    .locals 3
    .parameter "style"

    .prologue
    .line 222
    packed-switch p1, :pswitch_data_0

    .line 233
    :goto_0
    return-void

    .line 224
    :pswitch_0
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    sget v1, Lcom/apportable/ui/NavigationBar;->DEFAULT_COLOR:I

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, v0}, Lcom/apportable/ui/NavigationBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 227
    :pswitch_1
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    sget-object v2, Lcom/apportable/ui/NavigationBar;->BLACK_OPAQUE_COLORS:[I

    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    invoke-virtual {p0, v0}, Lcom/apportable/ui/NavigationBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 230
    :pswitch_2
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    sget-object v2, Lcom/apportable/ui/NavigationBar;->BLACK_TRANSLUCENT_COLORS:[I

    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    invoke-virtual {p0, v0}, Lcom/apportable/ui/NavigationBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 222
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private _setTitle(Ljava/lang/String;)V
    .locals 4
    .parameter "title"

    .prologue
    const/4 v3, -0x2

    .line 268
    iget-object v1, p0, Lcom/apportable/ui/NavigationBar;->mCenterItems:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 269
    new-instance v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/apportable/ui/NavigationBar;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 270
    .local v0, titleLabel:Landroid/widget/TextView;
    const/high16 v1, 0x41c0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 271
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 272
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 273
    const v1, -0x22111112

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 274
    iget-object v1, p0, Lcom/apportable/ui/NavigationBar;->mCenterItems:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 275
    return-void
.end method

.method static synthetic access$000(Lcom/apportable/ui/NavigationBar;)Landroid/widget/LinearLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 25
    iget-object v0, p0, Lcom/apportable/ui/NavigationBar;->mLeftItems:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$100(Lcom/apportable/ui/NavigationBar;)Landroid/widget/LinearLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 25
    iget-object v0, p0, Lcom/apportable/ui/NavigationBar;->mCenterItems:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$200(Lcom/apportable/ui/NavigationBar;)Landroid/widget/LinearLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 25
    iget-object v0, p0, Lcom/apportable/ui/NavigationBar;->mRightItems:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$300(Lcom/apportable/ui/NavigationBar;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lcom/apportable/ui/NavigationBar;->_setStyle(I)V

    return-void
.end method

.method static synthetic access$400(Lcom/apportable/ui/NavigationBar;)Landroid/widget/RelativeLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 25
    iget-object v0, p0, Lcom/apportable/ui/NavigationBar;->mNavigationBar:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method static synthetic access$500(Lcom/apportable/ui/NavigationBar;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lcom/apportable/ui/NavigationBar;->_setTitle(Ljava/lang/String;)V

    return-void
.end method

.method public static create(Landroid/content/Context;I)Lcom/apportable/ui/NavigationBar;
    .locals 2
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 75
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 76
    new-instance v1, Lcom/apportable/ui/NavigationBar;

    invoke-direct {v1, p0, p1}, Lcom/apportable/ui/NavigationBar;-><init>(Landroid/content/Context;I)V

    .line 95
    :goto_0
    return-object v1

    .line 78
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 79
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/NavigationBar;>;"
    new-instance v1, Lcom/apportable/ui/NavigationBar$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/apportable/ui/NavigationBar$1;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;I)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 88
    monitor-enter p0

    .line 89
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 91
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 92
    :catch_0
    move-exception v1

    goto :goto_1

    .line 94
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 95
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/NavigationBar;

    goto :goto_0

    .line 94
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public static create(Landroid/content/Context;ILandroid/graphics/RectF;)Lcom/apportable/ui/NavigationBar;
    .locals 2
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 100
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 101
    new-instance v1, Lcom/apportable/ui/NavigationBar;

    invoke-direct {v1, p0, p1, p2}, Lcom/apportable/ui/NavigationBar;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 120
    :goto_0
    return-object v1

    .line 103
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 104
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/NavigationBar;>;"
    new-instance v1, Lcom/apportable/ui/NavigationBar$2;

    invoke-direct {v1, p0, v0, p1, p2}, Lcom/apportable/ui/NavigationBar$2;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;ILandroid/graphics/RectF;)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 113
    monitor-enter p0

    .line 114
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 116
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 117
    :catch_0
    move-exception v1

    goto :goto_1

    .line 119
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 120
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/NavigationBar;

    goto :goto_0

    .line 119
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method private init()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    const/4 v6, -0x1

    const/4 v5, -0x2

    .line 40
    new-instance v3, Landroid/widget/RelativeLayout;

    invoke-virtual {p0}, Lcom/apportable/ui/NavigationBar;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/apportable/ui/NavigationBar;->mNavigationBar:Landroid/widget/RelativeLayout;

    .line 41
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/apportable/ui/NavigationBar;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/apportable/ui/NavigationBar;->mLeftItems:Landroid/widget/LinearLayout;

    .line 42
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/apportable/ui/NavigationBar;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/apportable/ui/NavigationBar;->mCenterItems:Landroid/widget/LinearLayout;

    .line 43
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/apportable/ui/NavigationBar;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/apportable/ui/NavigationBar;->mRightItems:Landroid/widget/LinearLayout;

    .line 45
    iget-object v3, p0, Lcom/apportable/ui/NavigationBar;->mLeftItems:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 46
    iget-object v3, p0, Lcom/apportable/ui/NavigationBar;->mCenterItems:Landroid/widget/LinearLayout;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 47
    iget-object v3, p0, Lcom/apportable/ui/NavigationBar;->mRightItems:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 49
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v5, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 50
    .local v1, leftLayout:Landroid/widget/RelativeLayout$LayoutParams;
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v5, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 51
    .local v0, centerLayout:Landroid/widget/RelativeLayout$LayoutParams;
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v5, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 53
    .local v2, rightLayout:Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v3, 0x9

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 54
    const/16 v3, 0xd

    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 55
    const/16 v3, 0xb

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 57
    iget-object v3, p0, Lcom/apportable/ui/NavigationBar;->mNavigationBar:Landroid/widget/RelativeLayout;

    iget-object v4, p0, Lcom/apportable/ui/NavigationBar;->mLeftItems:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v4, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 58
    iget-object v3, p0, Lcom/apportable/ui/NavigationBar;->mNavigationBar:Landroid/widget/RelativeLayout;

    iget-object v4, p0, Lcom/apportable/ui/NavigationBar;->mCenterItems:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v4, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 59
    iget-object v3, p0, Lcom/apportable/ui/NavigationBar;->mNavigationBar:Landroid/widget/RelativeLayout;

    iget-object v4, p0, Lcom/apportable/ui/NavigationBar;->mRightItems:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v4, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 61
    iget-object v3, p0, Lcom/apportable/ui/NavigationBar;->mNavigationBar:Landroid/widget/RelativeLayout;

    invoke-virtual {p0}, Lcom/apportable/ui/NavigationBar;->getFrame()Landroid/graphics/RectF;

    move-result-object v4

    invoke-static {v4}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/apportable/ui/NavigationBar;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/apportable/ui/NavigationBar;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    return-void
.end method


# virtual methods
.method protected _setFrame(Landroid/graphics/RectF;)V
    .locals 2
    .parameter "frame"

    .prologue
    .line 126
    invoke-super {p0, p1}, Lcom/apportable/ui/View;->_setFrame(Landroid/graphics/RectF;)V

    .line 127
    iget-object v0, p0, Lcom/apportable/ui/NavigationBar;->mNavigationBar:Landroid/widget/RelativeLayout;

    invoke-virtual {p0}, Lcom/apportable/ui/NavigationBar;->getFrame()Landroid/graphics/RectF;

    move-result-object v1

    invoke-static {v1}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/apportable/ui/NavigationBar;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 128
    return-void
.end method

.method public addLeftItem(Lcom/apportable/ui/BarItem;)V
    .locals 2
    .parameter "item"

    .prologue
    .line 193
    if-nez p1, :cond_0

    .line 204
    :goto_0
    return-void

    .line 195
    :cond_0
    new-instance v0, Lcom/apportable/ui/NavigationBar$8;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/NavigationBar$8;-><init>(Lcom/apportable/ui/NavigationBar;Lcom/apportable/ui/BarItem;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/NavigationBar;->runOnUiThread(Ljava/lang/Runnable;Z)V

    goto :goto_0
.end method

.method public addRightItem(Lcom/apportable/ui/BarItem;)V
    .locals 2
    .parameter "item"

    .prologue
    .line 207
    if-nez p1, :cond_0

    .line 219
    :goto_0
    return-void

    .line 209
    :cond_0
    new-instance v0, Lcom/apportable/ui/NavigationBar$9;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/NavigationBar$9;-><init>(Lcom/apportable/ui/NavigationBar;Lcom/apportable/ui/BarItem;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/NavigationBar;->runOnUiThread(Ljava/lang/Runnable;Z)V

    goto :goto_0
.end method

.method public beginAnimations(I)V
    .locals 2
    .parameter "animation"

    .prologue
    .line 160
    new-instance v0, Lcom/apportable/ui/NavigationBar$6;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/NavigationBar$6;-><init>(Lcom/apportable/ui/NavigationBar;I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/NavigationBar;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 180
    return-void
.end method

.method public endAnimations()V
    .locals 2

    .prologue
    .line 183
    new-instance v0, Lcom/apportable/ui/NavigationBar$7;

    invoke-direct {v0, p0}, Lcom/apportable/ui/NavigationBar$7;-><init>(Lcom/apportable/ui/NavigationBar;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/NavigationBar;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 190
    return-void
.end method

.method public getStyle()I
    .locals 1

    .prologue
    .line 248
    iget v0, p0, Lcom/apportable/ui/NavigationBar;->mStyle:I

    return v0
.end method

.method public getTintColor()I
    .locals 1

    .prologue
    .line 264
    iget v0, p0, Lcom/apportable/ui/NavigationBar;->mTint:I

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 2

    .prologue
    .line 294
    invoke-super {p0}, Lcom/apportable/ui/View;->onAttachedToWindow()V

    .line 295
    iget v0, p0, Lcom/apportable/ui/NavigationBar;->mStyle:I

    invoke-direct {p0, v0}, Lcom/apportable/ui/NavigationBar;->_setStyle(I)V

    .line 296
    iget-object v0, p0, Lcom/apportable/ui/NavigationBar;->mNavigationBar:Landroid/widget/RelativeLayout;

    iget v1, p0, Lcom/apportable/ui/NavigationBar;->mTint:I

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 297
    iget-object v0, p0, Lcom/apportable/ui/NavigationBar;->mTitle:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/apportable/ui/NavigationBar;->_setTitle(Ljava/lang/String;)V

    .line 298
    return-void
.end method

.method public removeAllItems()V
    .locals 2

    .prologue
    .line 131
    new-instance v0, Lcom/apportable/ui/NavigationBar$3;

    invoke-direct {v0, p0}, Lcom/apportable/ui/NavigationBar$3;-><init>(Lcom/apportable/ui/NavigationBar;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/NavigationBar;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 139
    return-void
.end method

.method public removeLeftItems()V
    .locals 2

    .prologue
    .line 142
    new-instance v0, Lcom/apportable/ui/NavigationBar$4;

    invoke-direct {v0, p0}, Lcom/apportable/ui/NavigationBar$4;-><init>(Lcom/apportable/ui/NavigationBar;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/NavigationBar;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 148
    return-void
.end method

.method public removeRightItems()V
    .locals 2

    .prologue
    .line 151
    new-instance v0, Lcom/apportable/ui/NavigationBar$5;

    invoke-direct {v0, p0}, Lcom/apportable/ui/NavigationBar$5;-><init>(Lcom/apportable/ui/NavigationBar;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/NavigationBar;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 157
    return-void
.end method

.method public setStyle(I)V
    .locals 2
    .parameter "style"

    .prologue
    .line 236
    iput p1, p0, Lcom/apportable/ui/NavigationBar;->mStyle:I

    .line 237
    iget-boolean v0, p0, Lcom/apportable/ui/NavigationBar;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 238
    new-instance v0, Lcom/apportable/ui/NavigationBar$10;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/NavigationBar$10;-><init>(Lcom/apportable/ui/NavigationBar;I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/NavigationBar;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 245
    :cond_0
    return-void
.end method

.method public setTintColor(I)V
    .locals 2
    .parameter "tint"

    .prologue
    .line 252
    iput p1, p0, Lcom/apportable/ui/NavigationBar;->mTint:I

    .line 253
    iget-boolean v0, p0, Lcom/apportable/ui/NavigationBar;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 254
    new-instance v0, Lcom/apportable/ui/NavigationBar$11;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/NavigationBar$11;-><init>(Lcom/apportable/ui/NavigationBar;I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/NavigationBar;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 261
    :cond_0
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 2
    .parameter "title"

    .prologue
    .line 278
    iput-object p1, p0, Lcom/apportable/ui/NavigationBar;->mTitle:Ljava/lang/String;

    .line 279
    iget-boolean v0, p0, Lcom/apportable/ui/NavigationBar;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 280
    new-instance v0, Lcom/apportable/ui/NavigationBar$12;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/NavigationBar$12;-><init>(Lcom/apportable/ui/NavigationBar;Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/NavigationBar;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 287
    :cond_0
    return-void
.end method

.method public setTitleView(Lcom/apportable/ui/View;)V
    .locals 0
    .parameter "view"

    .prologue
    .line 291
    return-void
.end method

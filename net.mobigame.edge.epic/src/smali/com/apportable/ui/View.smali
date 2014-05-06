.class public Lcom/apportable/ui/View;
.super Landroid/widget/AbsoluteLayout;
.source "View.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/apportable/ui/View$BackgroundBitmap;,
        Lcom/apportable/ui/View$BGColorDrawable;,
        Lcom/apportable/ui/View$MatrixAnimation;
    }
.end annotation


# static fields
.field private static sDrawBitmap:Landroid/graphics/Bitmap;

.field private static sDrawBitmapCache:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/ref/SoftReference",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation
.end field

.field private static sMaxDrawBitmapCacheArea:I


# instance fields
.field private mAlpha:F

.field private mAsyncDraw:Z

.field private mBackgroundBitmap:Lcom/apportable/ui/View$BackgroundBitmap;

.field private mBackgroundColor:I

.field private mBounds:Landroid/graphics/RectF;

.field private mClipsToBounds:Z

.field private mDrawBitmap:Landroid/graphics/Bitmap;

.field private mDrawBitmapPaint:Landroid/graphics/Paint;

.field private mDrawBitmapRect:Landroid/graphics/Rect;

.field private mFrame:Landroid/graphics/RectF;

.field private mHidden:Z

.field protected mInWindow:Z

.field protected mIsCustomBackgroundDrawableSet:Z

.field private mMatrix:Landroid/graphics/Matrix;

.field public mObject:I

.field private mSubviews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/apportable/ui/View;",
            ">;"
        }
    .end annotation
.end field

.field private mSuperview:Lcom/apportable/ui/View;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 64
    const/4 v0, 0x0

    sput-object v0, Lcom/apportable/ui/View;->sDrawBitmap:Landroid/graphics/Bitmap;

    .line 70
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/apportable/ui/View;->sDrawBitmapCache:Ljava/util/List;

    .line 71
    const/4 v0, 0x0

    sput v0, Lcom/apportable/ui/View;->sMaxDrawBitmapCacheArea:I

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;I)V
    .locals 3
    .parameter "ctx"
    .parameter "object"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 86
    invoke-direct {p0, p1}, Landroid/widget/AbsoluteLayout;-><init>(Landroid/content/Context;)V

    .line 39
    iput-boolean v2, p0, Lcom/apportable/ui/View;->mInWindow:Z

    .line 42
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v0, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    .line 43
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v0, p0, Lcom/apportable/ui/View;->mBounds:Landroid/graphics/RectF;

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/apportable/ui/View;->mSubviews:Ljava/util/ArrayList;

    .line 45
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/apportable/ui/View;->mMatrix:Landroid/graphics/Matrix;

    .line 47
    iput v2, p0, Lcom/apportable/ui/View;->mBackgroundColor:I

    .line 48
    iput-boolean v2, p0, Lcom/apportable/ui/View;->mHidden:Z

    .line 49
    const/high16 v0, 0x3f80

    iput v0, p0, Lcom/apportable/ui/View;->mAlpha:F

    .line 50
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/apportable/ui/View;->mClipsToBounds:Z

    .line 53
    iput-boolean v2, p0, Lcom/apportable/ui/View;->mAsyncDraw:Z

    .line 65
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/apportable/ui/View;->mDrawBitmap:Landroid/graphics/Bitmap;

    .line 66
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/apportable/ui/View;->mDrawBitmapRect:Landroid/graphics/Rect;

    .line 67
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/apportable/ui/View;->mDrawBitmapPaint:Landroid/graphics/Paint;

    .line 87
    iput p2, p0, Lcom/apportable/ui/View;->mObject:I

    .line 88
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;ILandroid/graphics/RectF;)V
    .locals 5
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 91
    invoke-direct {p0, p1}, Landroid/widget/AbsoluteLayout;-><init>(Landroid/content/Context;)V

    .line 39
    iput-boolean v4, p0, Lcom/apportable/ui/View;->mInWindow:Z

    .line 42
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, v3, v3, v3, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v0, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    .line 43
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, v3, v3, v3, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v0, p0, Lcom/apportable/ui/View;->mBounds:Landroid/graphics/RectF;

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/apportable/ui/View;->mSubviews:Ljava/util/ArrayList;

    .line 45
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/apportable/ui/View;->mMatrix:Landroid/graphics/Matrix;

    .line 47
    iput v4, p0, Lcom/apportable/ui/View;->mBackgroundColor:I

    .line 48
    iput-boolean v4, p0, Lcom/apportable/ui/View;->mHidden:Z

    .line 49
    const/high16 v0, 0x3f80

    iput v0, p0, Lcom/apportable/ui/View;->mAlpha:F

    .line 50
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/apportable/ui/View;->mClipsToBounds:Z

    .line 53
    iput-boolean v4, p0, Lcom/apportable/ui/View;->mAsyncDraw:Z

    .line 65
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/apportable/ui/View;->mDrawBitmap:Landroid/graphics/Bitmap;

    .line 66
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/apportable/ui/View;->mDrawBitmapRect:Landroid/graphics/Rect;

    .line 67
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/apportable/ui/View;->mDrawBitmapPaint:Landroid/graphics/Paint;

    .line 92
    iput p2, p0, Lcom/apportable/ui/View;->mObject:I

    .line 93
    iput-object p3, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    .line 94
    new-instance v0, Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    iget-object v2, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v0, p0, Lcom/apportable/ui/View;->mBounds:Landroid/graphics/RectF;

    .line 95
    invoke-virtual {p0, v4}, Lcom/apportable/ui/View;->setWillNotDraw(Z)V

    .line 96
    return-void
.end method

.method private _addSubview(Lcom/apportable/ui/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 344
    if-nez p1, :cond_0

    .line 348
    :goto_0
    return-void

    .line 346
    :cond_0
    invoke-virtual {p0, p1}, Lcom/apportable/ui/View;->sanitizeView(Lcom/apportable/ui/View;)V

    .line 347
    invoke-virtual {p1}, Lcom/apportable/ui/View;->getFrame()Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/apportable/ui/View;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/apportable/ui/View;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0
.end method

.method private _bringSubviewToFront(Lcom/apportable/ui/View;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 362
    invoke-virtual {p0, p1}, Lcom/apportable/ui/View;->detachViewFromParent(Landroid/view/View;)V

    .line 363
    invoke-virtual {p0}, Lcom/apportable/ui/View;->getChildCount()I

    move-result v0

    invoke-virtual {p1}, Lcom/apportable/ui/View;->layoutParameters()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/apportable/ui/View;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 364
    return-void
.end method

.method private _exchangeSubviews(Lcom/apportable/ui/View;Lcom/apportable/ui/View;)V
    .locals 5
    .parameter "view1"
    .parameter "view2"

    .prologue
    .line 443
    invoke-virtual {p0, p1}, Lcom/apportable/ui/View;->indexOfChild(Landroid/view/View;)I

    move-result v1

    .line 444
    .local v1, index1:I
    invoke-virtual {p0, p2}, Lcom/apportable/ui/View;->indexOfChild(Landroid/view/View;)I

    move-result v2

    .line 445
    .local v2, index2:I
    if-le v1, v2, :cond_0

    .line 447
    move v0, v2

    .local v0, index:I
    move v2, v1

    move v1, v0

    .line 448
    move-object v3, p2

    .local v3, view:Lcom/apportable/ui/View;
    move-object p2, p1

    move-object p1, v3

    .line 450
    .end local v0           #index:I
    .end local v3           #view:Lcom/apportable/ui/View;
    :cond_0
    invoke-virtual {p0, v1}, Lcom/apportable/ui/View;->detachViewFromParent(I)V

    .line 451
    invoke-virtual {p0, v2}, Lcom/apportable/ui/View;->detachViewFromParent(I)V

    .line 452
    invoke-virtual {p2}, Lcom/apportable/ui/View;->layoutParameters()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    invoke-virtual {p0, p2, v1, v4}, Lcom/apportable/ui/View;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 453
    invoke-virtual {p1}, Lcom/apportable/ui/View;->layoutParameters()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    invoke-virtual {p0, p1, v2, v4}, Lcom/apportable/ui/View;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 454
    return-void
.end method

.method private _removeFromSuperview()V
    .locals 1

    .prologue
    .line 402
    iget-object v0, p0, Lcom/apportable/ui/View;->mSuperview:Lcom/apportable/ui/View;

    if-eqz v0, :cond_0

    .line 403
    iget-object v0, p0, Lcom/apportable/ui/View;->mSuperview:Lcom/apportable/ui/View;

    invoke-virtual {v0, p0}, Lcom/apportable/ui/View;->removeView(Lcom/apportable/ui/View;)V

    .line 404
    :cond_0
    return-void
.end method

.method private _sendSubviewToBack(Lcom/apportable/ui/View;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 379
    invoke-virtual {p0, p1}, Lcom/apportable/ui/View;->detachViewFromParent(Landroid/view/View;)V

    .line 380
    const/4 v0, 0x0

    invoke-virtual {p1}, Lcom/apportable/ui/View;->layoutParameters()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/apportable/ui/View;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 381
    return-void
.end method

.method private _setBounds(Landroid/graphics/RectF;)V
    .locals 6
    .parameter "bounds"

    .prologue
    const/4 v5, 0x0

    .line 233
    iget v4, p1, Landroid/graphics/RectF;->left:F

    sub-float v4, v5, v4

    float-to-int v1, v4

    .line 234
    .local v1, l:I
    iget v4, p1, Landroid/graphics/RectF;->top:F

    sub-float v4, v5, v4

    float-to-int v3, v4

    .line 235
    .local v3, t:I
    iget v4, p1, Landroid/graphics/RectF;->right:F

    iget v5, p1, Landroid/graphics/RectF;->left:F

    sub-float/2addr v4, v5

    iget-object v5, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    sub-float/2addr v4, v5

    iget-object v5, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    add-float/2addr v4, v5

    iget v5, p1, Landroid/graphics/RectF;->left:F

    add-float/2addr v4, v5

    float-to-int v2, v4

    .line 236
    .local v2, r:I
    iget v4, p1, Landroid/graphics/RectF;->bottom:F

    iget v5, p1, Landroid/graphics/RectF;->top:F

    sub-float/2addr v4, v5

    iget-object v5, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v4, v5

    iget-object v5, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    add-float/2addr v4, v5

    iget v5, p1, Landroid/graphics/RectF;->top:F

    add-float/2addr v4, v5

    float-to-int v0, v4

    .line 237
    .local v0, b:I
    invoke-virtual {p0, v1, v3, v2, v0}, Lcom/apportable/ui/View;->setPadding(IIII)V

    .line 238
    return-void
.end method

.method private _setFrame()V
    .locals 1

    .prologue
    .line 208
    iget-object v0, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    invoke-virtual {p0, v0}, Lcom/apportable/ui/View;->_setFrame(Landroid/graphics/RectF;)V

    .line 209
    return-void
.end method

.method private _setHidden(Z)V
    .locals 5
    .parameter "hidden"

    .prologue
    const/16 v2, 0x8

    const/4 v3, 0x0

    .line 562
    if-eqz p1, :cond_0

    .line 563
    invoke-virtual {p0, v2}, Lcom/apportable/ui/View;->setVisibility(I)V

    .line 572
    :goto_0
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    invoke-virtual {p0}, Lcom/apportable/ui/View;->getChildCount()I

    move-result v1

    if-eq v0, v1, :cond_2

    .line 573
    invoke-virtual {p0, v0}, Lcom/apportable/ui/View;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    if-eqz p1, :cond_1

    move v1, v2

    :goto_2
    invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

    .line 572
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 565
    .end local v0           #i:I
    :cond_0
    invoke-virtual {p0, v3}, Lcom/apportable/ui/View;->setVisibility(I)V

    goto :goto_0

    .restart local v0       #i:I
    :cond_1
    move v1, v3

    .line 573
    goto :goto_2

    .line 575
    :cond_2
    return-void
.end method

.method static synthetic access$000(Lcom/apportable/ui/View;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget v0, p0, Lcom/apportable/ui/View;->mBackgroundColor:I

    return v0
.end method

.method static synthetic access$100(Lcom/apportable/ui/View;Landroid/graphics/RectF;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/apportable/ui/View;->_setBounds(Landroid/graphics/RectF;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/apportable/ui/View;I)Ljava/lang/String;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/apportable/ui/View;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/apportable/ui/View;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/apportable/ui/View;->_setFrame()V

    return-void
.end method

.method static synthetic access$300(Lcom/apportable/ui/View;Lcom/apportable/ui/View;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/apportable/ui/View;->_addSubview(Lcom/apportable/ui/View;)V

    return-void
.end method

.method static synthetic access$400(Lcom/apportable/ui/View;Lcom/apportable/ui/View;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/apportable/ui/View;->_bringSubviewToFront(Lcom/apportable/ui/View;)V

    return-void
.end method

.method static synthetic access$500(Lcom/apportable/ui/View;Lcom/apportable/ui/View;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/apportable/ui/View;->_sendSubviewToBack(Lcom/apportable/ui/View;)V

    return-void
.end method

.method static synthetic access$600(Lcom/apportable/ui/View;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/apportable/ui/View;->_removeFromSuperview()V

    return-void
.end method

.method static synthetic access$700(Lcom/apportable/ui/View;Lcom/apportable/ui/View;Lcom/apportable/ui/View;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/View;->_exchangeSubviews(Lcom/apportable/ui/View;Lcom/apportable/ui/View;)V

    return-void
.end method

.method static synthetic access$800(Lcom/apportable/ui/View;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/apportable/ui/View;->_setHidden(Z)V

    return-void
.end method

.method static synthetic access$900(Lcom/apportable/ui/View;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/apportable/ui/View;->callDrawRect(I)V

    return-void
.end method

.method public static boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;
    .locals 4
    .parameter "frame"

    .prologue
    const/4 v3, 0x0

    .line 192
    new-instance v0, Landroid/graphics/RectF;

    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    move-result v2

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object v0
.end method

.method private native callDrawRect(I)V
.end method

.method public static create(Landroid/content/Context;I)Lcom/apportable/ui/View;
    .locals 2
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 107
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 108
    new-instance v1, Lcom/apportable/ui/View;

    invoke-direct {v1, p0, p1}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;I)V

    .line 127
    :goto_0
    return-object v1

    .line 110
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 111
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/View;>;"
    new-instance v1, Lcom/apportable/ui/View$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/apportable/ui/View$1;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;I)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 120
    monitor-enter p0

    .line 121
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 123
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 124
    :catch_0
    move-exception v1

    goto :goto_1

    .line 126
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 127
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/View;

    goto :goto_0

    .line 126
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public static create(Landroid/content/Context;ILandroid/graphics/RectF;)Lcom/apportable/ui/View;
    .locals 2
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 133
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 134
    new-instance v1, Lcom/apportable/ui/View;

    invoke-direct {v1, p0, p1, p2}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 153
    :goto_0
    return-object v1

    .line 136
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 137
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/View;>;"
    new-instance v1, Lcom/apportable/ui/View$2;

    invoke-direct {v1, p0, v0, p1, p2}, Lcom/apportable/ui/View$2;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;ILandroid/graphics/RectF;)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 146
    monitor-enter p0

    .line 147
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 149
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 150
    :catch_0
    move-exception v1

    goto :goto_1

    .line 152
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 153
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/View;

    goto :goto_0

    .line 152
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method private static createDrawBitmap(II)Landroid/graphics/Bitmap;
    .locals 13
    .parameter "width"
    .parameter "height"

    .prologue
    .line 808
    sget-object v10, Lcom/apportable/ui/View;->sDrawBitmapCache:Ljava/util/List;

    monitor-enter v10

    .line 809
    const/high16 v3, 0x3e80

    .line 810
    .local v3, maxWasteRatio:F
    const/high16 v6, 0x3f00

    .line 812
    .local v6, minKeepRatio:F
    const v7, 0x7fffffff

    .line 813
    .local v7, minWastedArea:I
    const/4 v4, 0x0

    .line 814
    .local v4, minDrawBitmap:Landroid/graphics/Bitmap;
    const/4 v5, -0x1

    .line 815
    .local v5, minIndex:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    :try_start_0
    sget-object v9, Lcom/apportable/ui/View;->sDrawBitmapCache:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    if-eq v2, v9, :cond_2

    .line 816
    sget-object v9, Lcom/apportable/ui/View;->sDrawBitmapCache:Ljava/util/List;

    invoke-interface {v9, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/ref/SoftReference;

    invoke-virtual {v9}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    .line 817
    .local v1, bitmap:Landroid/graphics/Bitmap;
    if-nez v1, :cond_1

    .line 818
    sget-object v9, Lcom/apportable/ui/View;->sDrawBitmapCache:Ljava/util/List;

    invoke-interface {v9, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 819
    add-int/lit8 v2, v2, -0x1

    .line 815
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 822
    :cond_1
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    if-lt v9, p0, :cond_0

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    if-lt v9, p1, :cond_0

    .line 825
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    sub-int/2addr v9, p0

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v11

    sub-int/2addr v11, p1

    mul-int v8, v9, v11

    .line 826
    .local v8, wastedArea:I
    if-ge v8, v7, :cond_0

    .line 827
    move v7, v8

    .line 828
    move-object v4, v1

    .line 829
    move v5, v2

    goto :goto_1

    .line 833
    .end local v1           #bitmap:Landroid/graphics/Bitmap;
    .end local v8           #wastedArea:I
    :cond_2
    if-eqz v4, :cond_4

    .line 834
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v11

    mul-int v0, v9, v11

    .line 835
    .local v0, area:I
    int-to-float v9, v7

    int-to-float v11, v0

    const/high16 v12, 0x3e80

    mul-float/2addr v11, v12

    cmpl-float v9, v9, v11

    if-lez v9, :cond_4

    .line 836
    int-to-float v9, v7

    int-to-float v11, v0

    const/high16 v12, 0x3f00

    mul-float/2addr v11, v12

    cmpg-float v9, v9, v11

    if-gez v9, :cond_3

    .line 837
    sget-object v9, Lcom/apportable/ui/View;->sDrawBitmapCache:Ljava/util/List;

    invoke-interface {v9, v5}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 838
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V

    .line 840
    :cond_3
    const/4 v4, 0x0

    .line 844
    .end local v0           #area:I
    :cond_4
    if-eqz v4, :cond_5

    .line 845
    sget-object v9, Lcom/apportable/ui/View;->sDrawBitmapCache:Ljava/util/List;

    invoke-interface {v9, v5}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 846
    monitor-exit v10

    .line 848
    .end local v4           #minDrawBitmap:Landroid/graphics/Bitmap;
    :goto_2
    return-object v4

    .restart local v4       #minDrawBitmap:Landroid/graphics/Bitmap;
    :cond_5
    sget-object v9, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p0, p1, v9}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v9

    monitor-exit v10

    move-object v4, v9

    goto :goto_2

    .line 850
    :catchall_0
    move-exception v9

    monitor-exit v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v9
.end method

.method private native getDescription(I)Ljava/lang/String;
.end method

.method private getDrawBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 860
    invoke-static {}, Lcom/apportable/ui/View;->usingSharedDrawBitmap()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 861
    sget-object v0, Lcom/apportable/ui/View;->sDrawBitmap:Landroid/graphics/Bitmap;

    .line 863
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/apportable/ui/View;->mDrawBitmap:Landroid/graphics/Bitmap;

    goto :goto_0
.end method

.method private native isDrawRectImplemented(I)Z
.end method

.method private native layoutSubviews(I)V
.end method

.method private static recycleDrawBitmap(Landroid/content/Context;Landroid/graphics/Bitmap;)V
    .locals 8
    .parameter "context"
    .parameter "drawBitmap"

    .prologue
    .line 777
    sget-object v6, Lcom/apportable/ui/View;->sDrawBitmapCache:Ljava/util/List;

    monitor-enter v6

    .line 778
    :try_start_0
    sget v5, Lcom/apportable/ui/View;->sMaxDrawBitmapCacheArea:I

    if-nez v5, :cond_0

    .line 779
    new-instance v3, Landroid/util/DisplayMetrics;

    invoke-direct {v3}, Landroid/util/DisplayMetrics;-><init>()V

    .line 780
    .local v3, metrics:Landroid/util/DisplayMetrics;
    const-string v5, "window"

    invoke-virtual {p0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/WindowManager;

    invoke-interface {v5}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 782
    iget v5, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    iget v7, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    mul-int v4, v5, v7

    .line 784
    .local v4, screenArea:I
    int-to-float v5, v4

    const/high16 v7, 0x3fc0

    mul-float/2addr v5, v7

    float-to-int v5, v5

    sput v5, Lcom/apportable/ui/View;->sMaxDrawBitmapCacheArea:I

    .line 787
    .end local v3           #metrics:Landroid/util/DisplayMetrics;
    .end local v4           #screenArea:I
    :cond_0
    const/4 v1, 0x0

    .line 788
    .local v1, currentArea:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    sget-object v5, Lcom/apportable/ui/View;->sDrawBitmapCache:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-eq v2, v5, :cond_2

    .line 789
    sget-object v5, Lcom/apportable/ui/View;->sDrawBitmapCache:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/ref/SoftReference;

    invoke-virtual {v5}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 790
    .local v0, bitmap:Landroid/graphics/Bitmap;
    if-nez v0, :cond_1

    .line 791
    sget-object v5, Lcom/apportable/ui/View;->sDrawBitmapCache:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 792
    add-int/lit8 v2, v2, -0x1

    .line 788
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 795
    :cond_1
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    mul-int/2addr v5, v7

    add-int/2addr v1, v5

    goto :goto_1

    .line 798
    .end local v0           #bitmap:Landroid/graphics/Bitmap;
    :cond_2
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    mul-int/2addr v5, v7

    add-int/2addr v1, v5

    .line 799
    sget v5, Lcom/apportable/ui/View;->sMaxDrawBitmapCacheArea:I

    if-gt v1, v5, :cond_3

    .line 800
    sget-object v5, Lcom/apportable/ui/View;->sDrawBitmapCache:Ljava/util/List;

    new-instance v7, Ljava/lang/ref/SoftReference;

    invoke-direct {v7, p1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 804
    :goto_2
    monitor-exit v6

    .line 805
    return-void

    .line 802
    :cond_3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_2

    .line 804
    .end local v1           #currentArea:I
    .end local v2           #i:I
    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5
.end method

.method private resizeDrawBitmap(II)Landroid/graphics/Bitmap;
    .locals 3
    .parameter "width"
    .parameter "height"

    .prologue
    const/4 v2, 0x0

    .line 870
    invoke-static {}, Lcom/apportable/ui/View;->usingSharedDrawBitmap()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 871
    sget-object v0, Lcom/apportable/ui/View;->sDrawBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/apportable/ui/View;->sDrawBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    if-lt v0, p1, :cond_0

    sget-object v0, Lcom/apportable/ui/View;->sDrawBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    if-ge v0, p2, :cond_1

    .line 874
    :cond_0
    sget-object v0, Lcom/apportable/ui/View;->sDrawBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 875
    sput-object v2, Lcom/apportable/ui/View;->sDrawBitmap:Landroid/graphics/Bitmap;

    .line 877
    :cond_1
    sget-object v0, Lcom/apportable/ui/View;->sDrawBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_2

    .line 878
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    sput-object v0, Lcom/apportable/ui/View;->sDrawBitmap:Landroid/graphics/Bitmap;

    .line 880
    :cond_2
    sget-object v0, Lcom/apportable/ui/View;->sDrawBitmap:Landroid/graphics/Bitmap;

    .line 891
    :goto_0
    return-object v0

    .line 882
    :cond_3
    iget-object v0, p0, Lcom/apportable/ui/View;->mDrawBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/apportable/ui/View;->mDrawBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    if-lt v0, p1, :cond_4

    iget-object v0, p0, Lcom/apportable/ui/View;->mDrawBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    if-ge v0, p2, :cond_5

    .line 885
    :cond_4
    invoke-virtual {p0}, Lcom/apportable/ui/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/View;->mDrawBitmap:Landroid/graphics/Bitmap;

    invoke-static {v0, v1}, Lcom/apportable/ui/View;->recycleDrawBitmap(Landroid/content/Context;Landroid/graphics/Bitmap;)V

    .line 886
    iput-object v2, p0, Lcom/apportable/ui/View;->mDrawBitmap:Landroid/graphics/Bitmap;

    .line 888
    :cond_5
    iget-object v0, p0, Lcom/apportable/ui/View;->mDrawBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_6

    .line 889
    invoke-static {p1, p2}, Lcom/apportable/ui/View;->createDrawBitmap(II)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/apportable/ui/View;->mDrawBitmap:Landroid/graphics/Bitmap;

    .line 891
    :cond_6
    iget-object v0, p0, Lcom/apportable/ui/View;->mDrawBitmap:Landroid/graphics/Bitmap;

    goto :goto_0
.end method

.method private static usingSharedDrawBitmap()Z
    .locals 2

    .prologue
    .line 856
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected __setBackgroundColor(I)V
    .locals 1
    .parameter "color"

    .prologue
    .line 537
    iget-boolean v0, p0, Lcom/apportable/ui/View;->mAsyncDraw:Z

    if-eqz v0, :cond_0

    .line 538
    invoke-virtual {p0}, Lcom/apportable/ui/View;->invalidate()V

    .line 542
    :goto_0
    return-void

    .line 540
    :cond_0
    new-instance v0, Lcom/apportable/ui/View$BGColorDrawable;

    invoke-direct {v0, p1}, Lcom/apportable/ui/View$BGColorDrawable;-><init>(I)V

    invoke-virtual {p0, v0}, Lcom/apportable/ui/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method public _getAlpha()F
    .locals 1

    .prologue
    .line 613
    iget v0, p0, Lcom/apportable/ui/View;->mAlpha:F

    return v0
.end method

.method public _insertView(Lcom/apportable/ui/View;I)V
    .locals 1
    .parameter "view"
    .parameter "index"

    .prologue
    .line 416
    if-nez p1, :cond_0

    .line 420
    :goto_0
    return-void

    .line 418
    :cond_0
    invoke-virtual {p0, p1}, Lcom/apportable/ui/View;->sanitizeView(Lcom/apportable/ui/View;)V

    .line 419
    invoke-virtual {p1}, Lcom/apportable/ui/View;->getFrame()Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/apportable/ui/View;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/apportable/ui/View;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0
.end method

.method public _setAlpha(F)V
    .locals 2
    .parameter "alpha"

    .prologue
    .line 601
    iput p1, p0, Lcom/apportable/ui/View;->mAlpha:F

    .line 602
    iget-boolean v0, p0, Lcom/apportable/ui/View;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 603
    new-instance v0, Lcom/apportable/ui/View$17;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/View$17;-><init>(Lcom/apportable/ui/View;F)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/View;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 610
    :cond_0
    return-void
.end method

.method public _setBackgroundColor(I)V
    .locals 2
    .parameter "color"

    .prologue
    .line 545
    iget v0, p0, Lcom/apportable/ui/View;->mBackgroundColor:I

    if-eq p1, v0, :cond_0

    .line 547
    iput p1, p0, Lcom/apportable/ui/View;->mBackgroundColor:I

    .line 548
    new-instance v0, Lcom/apportable/ui/View$15;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/View$15;-><init>(Lcom/apportable/ui/View;I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/View;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 555
    :cond_0
    return-void
.end method

.method protected _setClipChildren(Z)V
    .locals 0
    .parameter "clips"

    .prologue
    .line 628
    invoke-virtual {p0, p1}, Lcom/apportable/ui/View;->setClipChildren(Z)V

    .line 629
    return-void
.end method

.method protected _setFrame(Landroid/graphics/RectF;)V
    .locals 1
    .parameter "frame"

    .prologue
    .line 212
    invoke-virtual {p0, p1}, Lcom/apportable/ui/View;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/apportable/ui/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 213
    return-void
.end method

.method protected _setTransform(Landroid/graphics/Matrix;)V
    .locals 3
    .parameter "transform"

    .prologue
    .line 289
    iget-object v1, p0, Lcom/apportable/ui/View;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, p1}, Landroid/graphics/Matrix;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 290
    new-instance v0, Lcom/apportable/ui/View$MatrixAnimation;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/View$MatrixAnimation;-><init>(Lcom/apportable/ui/View;Landroid/graphics/Matrix;)V

    .line 291
    .local v0, animation:Lcom/apportable/ui/View$MatrixAnimation;
    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/apportable/ui/View$MatrixAnimation;->setDuration(J)V

    .line 292
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/apportable/ui/View$MatrixAnimation;->setFillAfter(Z)V

    .line 293
    invoke-virtual {p0, v0}, Lcom/apportable/ui/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 295
    .end local v0           #animation:Lcom/apportable/ui/View$MatrixAnimation;
    :cond_0
    return-void
.end method

.method public _startAnimation(Landroid/view/animation/Animation;)V
    .locals 2
    .parameter "anim"

    .prologue
    .line 617
    iget-boolean v0, p0, Lcom/apportable/ui/View;->mInWindow:Z

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 618
    new-instance v0, Lcom/apportable/ui/View$18;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/View$18;-><init>(Lcom/apportable/ui/View;Landroid/view/animation/Animation;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/View;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 625
    :cond_0
    return-void
.end method

.method public addSubview(Lcom/apportable/ui/View;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 351
    iget-object v0, p0, Lcom/apportable/ui/View;->mSubviews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 352
    invoke-virtual {p1, p0}, Lcom/apportable/ui/View;->setSuperview(Lcom/apportable/ui/View;)V

    .line 353
    new-instance v0, Lcom/apportable/ui/View$8;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/View$8;-><init>(Lcom/apportable/ui/View;Lcom/apportable/ui/View;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/View;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 359
    return-void
.end method

.method protected applyAlpha(F)V
    .locals 3
    .parameter "alpha"

    .prologue
    .line 594
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    invoke-direct {v0, p1, p1}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 595
    .local v0, alphaAnimation:Landroid/view/animation/AlphaAnimation;
    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    .line 596
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setFillAfter(Z)V

    .line 597
    invoke-virtual {p0, v0}, Lcom/apportable/ui/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 598
    return-void
.end method

.method public bringSubviewToFront(Lcom/apportable/ui/View;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 367
    iget-object v0, p0, Lcom/apportable/ui/View;->mSubviews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 368
    iget-object v0, p0, Lcom/apportable/ui/View;->mSubviews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 369
    new-instance v0, Lcom/apportable/ui/View$9;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/View$9;-><init>(Lcom/apportable/ui/View;Lcom/apportable/ui/View;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/View;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 376
    :cond_0
    return-void
.end method

.method public exchangeSubviewAtIndex(II)V
    .locals 4
    .parameter "index1"
    .parameter "index2"

    .prologue
    .line 457
    iget-object v2, p0, Lcom/apportable/ui/View;->mSubviews:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/apportable/ui/View;

    .line 458
    .local v0, view1:Lcom/apportable/ui/View;
    iget-object v2, p0, Lcom/apportable/ui/View;->mSubviews:Ljava/util/ArrayList;

    invoke-virtual {v2, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/View;

    .line 459
    .local v1, view2:Lcom/apportable/ui/View;
    iget-object v2, p0, Lcom/apportable/ui/View;->mSubviews:Ljava/util/ArrayList;

    invoke-virtual {v2, p2, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 460
    iget-object v2, p0, Lcom/apportable/ui/View;->mSubviews:Ljava/util/ArrayList;

    invoke-virtual {v2, p1, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 461
    new-instance v2, Lcom/apportable/ui/View$13;

    invoke-direct {v2, p0, v0, v1}, Lcom/apportable/ui/View$13;-><init>(Lcom/apportable/ui/View;Lcom/apportable/ui/View;Lcom/apportable/ui/View;)V

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/apportable/ui/View;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 467
    return-void
.end method

.method public getBackgroundColor()I
    .locals 1

    .prologue
    .line 558
    iget v0, p0, Lcom/apportable/ui/View;->mBackgroundColor:I

    return v0
.end method

.method public getBounds()Landroid/graphics/RectF;
    .locals 1

    .prologue
    .line 253
    iget-object v0, p0, Lcom/apportable/ui/View;->mBounds:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getCenter()Landroid/graphics/PointF;
    .locals 6

    .prologue
    const/high16 v5, 0x4000

    .line 271
    new-instance v0, Landroid/graphics/PointF;

    iget-object v1, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->right:F

    iget-object v3, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    sub-float/2addr v2, v3

    div-float/2addr v2, v5

    add-float/2addr v1, v2

    iget-object v2, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    iget-object v3, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    iget-object v4, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    sub-float/2addr v3, v4

    div-float/2addr v3, v5

    add-float/2addr v2, v3

    invoke-direct {v0, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    return-object v0
.end method

.method public getFrame()Landroid/graphics/RectF;
    .locals 1

    .prologue
    .line 229
    iget-object v0, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getSuperview()Lcom/apportable/ui/View;
    .locals 1

    .prologue
    .line 330
    iget-object v0, p0, Lcom/apportable/ui/View;->mSuperview:Lcom/apportable/ui/View;

    return-object v0
.end method

.method public getTag()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 973
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 974
    .local v0, tag:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Ljava/lang/String;>;"
    new-instance v1, Lcom/apportable/ui/View$22;

    invoke-direct {v1, p0, v0}, Lcom/apportable/ui/View$22;-><init>(Lcom/apportable/ui/View;Ljava/util/concurrent/atomic/AtomicReference;)V

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lcom/apportable/ui/View;->runOnGlThread(Ljava/lang/Runnable;Z)V

    .line 980
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public getTransform()Landroid/graphics/Matrix;
    .locals 1

    .prologue
    .line 310
    iget-object v0, p0, Lcom/apportable/ui/View;->mMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public insertView(Lcom/apportable/ui/View;I)V
    .locals 2
    .parameter "view"
    .parameter "index"

    .prologue
    .line 423
    iget-object v0, p0, Lcom/apportable/ui/View;->mSubviews:Ljava/util/ArrayList;

    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 424
    new-instance v0, Lcom/apportable/ui/View$12;

    invoke-direct {v0, p0, p1, p2}, Lcom/apportable/ui/View$12;-><init>(Lcom/apportable/ui/View;Lcom/apportable/ui/View;I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/View;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 430
    return-void
.end method

.method public insertViewAbove(Lcom/apportable/ui/View;Lcom/apportable/ui/View;)V
    .locals 1
    .parameter "view"
    .parameter "relative"

    .prologue
    .line 433
    invoke-virtual {p0, p1}, Lcom/apportable/ui/View;->sanitizeView(Lcom/apportable/ui/View;)V

    .line 434
    iget-object v0, p0, Lcom/apportable/ui/View;->mSubviews:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/apportable/ui/View;->insertView(Lcom/apportable/ui/View;I)V

    .line 435
    return-void
.end method

.method public insertViewBelow(Lcom/apportable/ui/View;Lcom/apportable/ui/View;)V
    .locals 1
    .parameter "view"
    .parameter "relative"

    .prologue
    .line 438
    invoke-virtual {p0, p1}, Lcom/apportable/ui/View;->sanitizeView(Lcom/apportable/ui/View;)V

    .line 439
    iget-object v0, p0, Lcom/apportable/ui/View;->mSubviews:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/apportable/ui/View;->insertView(Lcom/apportable/ui/View;I)V

    .line 440
    return-void
.end method

.method public isAsyncDraw()Z
    .locals 1

    .prologue
    .line 162
    iget-boolean v0, p0, Lcom/apportable/ui/View;->mAsyncDraw:Z

    return v0
.end method

.method public isHidden()Z
    .locals 1

    .prologue
    .line 590
    iget-boolean v0, p0, Lcom/apportable/ui/View;->mHidden:Z

    return v0
.end method

.method public layoutIfNeeded()V
    .locals 0

    .prologue
    .line 500
    invoke-virtual {p0}, Lcom/apportable/ui/View;->setNeedsLayout()V

    .line 501
    return-void
.end method

.method protected layoutParameters()Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .prologue
    .line 196
    iget-object v0, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    invoke-virtual {p0, v0}, Lcom/apportable/ui/View;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;
    .locals 5
    .parameter "frame"

    .prologue
    .line 200
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v4

    float-to-int v1, v4

    .line 201
    .local v1, w:I
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v4

    float-to-int v0, v4

    .line 202
    .local v0, h:I
    iget v4, p1, Landroid/graphics/RectF;->left:F

    float-to-int v2, v4

    .line 203
    .local v2, x:I
    iget v4, p1, Landroid/graphics/RectF;->top:F

    float-to-int v3, v4

    .line 204
    .local v3, y:I
    new-instance v4, Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-direct {v4, v1, v0, v2, v3}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(IIII)V

    return-object v4
.end method

.method public lockBackgroundBitmap(II)Landroid/graphics/Bitmap;
    .locals 4
    .parameter "width"
    .parameter "height"

    .prologue
    const/4 v1, 0x0

    .line 898
    :try_start_0
    iget-boolean v2, p0, Lcom/apportable/ui/View;->mAsyncDraw:Z

    if-eqz v2, :cond_0

    .line 899
    iget-object v2, p0, Lcom/apportable/ui/View;->mDrawBitmapRect:Landroid/graphics/Rect;

    iput p1, v2, Landroid/graphics/Rect;->right:I

    .line 900
    iget-object v2, p0, Lcom/apportable/ui/View;->mDrawBitmapRect:Landroid/graphics/Rect;

    iput p2, v2, Landroid/graphics/Rect;->bottom:I

    .line 901
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/View;->resizeDrawBitmap(II)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 918
    :goto_0
    return-object v1

    .line 903
    :cond_0
    iget-object v2, p0, Lcom/apportable/ui/View;->mBackgroundBitmap:Lcom/apportable/ui/View$BackgroundBitmap;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/apportable/ui/View;->mBackgroundBitmap:Lcom/apportable/ui/View$BackgroundBitmap;

    invoke-virtual {v2, p1, p2}, Lcom/apportable/ui/View$BackgroundBitmap;->recycleOnMismatch(II)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 906
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/apportable/ui/View;->mBackgroundBitmap:Lcom/apportable/ui/View$BackgroundBitmap;

    .line 908
    :cond_1
    iget-object v2, p0, Lcom/apportable/ui/View;->mBackgroundBitmap:Lcom/apportable/ui/View$BackgroundBitmap;

    if-nez v2, :cond_2

    .line 909
    new-instance v2, Lcom/apportable/ui/View$BackgroundBitmap;

    const/4 v3, 0x1

    invoke-direct {v2, p1, p2, v3}, Lcom/apportable/ui/View$BackgroundBitmap;-><init>(IIZ)V

    iput-object v2, p0, Lcom/apportable/ui/View;->mBackgroundBitmap:Lcom/apportable/ui/View$BackgroundBitmap;

    .line 910
    iget-object v2, p0, Lcom/apportable/ui/View;->mBackgroundBitmap:Lcom/apportable/ui/View$BackgroundBitmap;

    invoke-virtual {p0, v2}, Lcom/apportable/ui/View;->setCustomBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 912
    :cond_2
    iget-object v2, p0, Lcom/apportable/ui/View;->mBackgroundBitmap:Lcom/apportable/ui/View$BackgroundBitmap;

    invoke-virtual {v2}, Lcom/apportable/ui/View$BackgroundBitmap;->lock()Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 915
    :catch_0
    move-exception v0

    .line 917
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public object()I
    .locals 1

    .prologue
    .line 158
    iget v0, p0, Lcom/apportable/ui/View;->mObject:I

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 2

    .prologue
    .line 660
    invoke-super {p0}, Landroid/widget/AbsoluteLayout;->onAttachedToWindow()V

    .line 661
    iget-object v0, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    invoke-virtual {p0, v0}, Lcom/apportable/ui/View;->_setFrame(Landroid/graphics/RectF;)V

    .line 662
    iget-object v0, p0, Lcom/apportable/ui/View;->mBounds:Landroid/graphics/RectF;

    invoke-direct {p0, v0}, Lcom/apportable/ui/View;->_setBounds(Landroid/graphics/RectF;)V

    .line 663
    iget-object v0, p0, Lcom/apportable/ui/View;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v0}, Lcom/apportable/ui/View;->_setTransform(Landroid/graphics/Matrix;)V

    .line 664
    iget-boolean v0, p0, Lcom/apportable/ui/View;->mHidden:Z

    invoke-direct {p0, v0}, Lcom/apportable/ui/View;->_setHidden(Z)V

    .line 665
    iget-boolean v0, p0, Lcom/apportable/ui/View;->mClipsToBounds:Z

    invoke-virtual {p0, v0}, Lcom/apportable/ui/View;->_setClipChildren(Z)V

    .line 666
    iget v0, p0, Lcom/apportable/ui/View;->mAlpha:F

    invoke-virtual {p0, v0}, Lcom/apportable/ui/View;->_setAlpha(F)V

    .line 667
    iget-boolean v0, p0, Lcom/apportable/ui/View;->mIsCustomBackgroundDrawableSet:Z

    if-nez v0, :cond_0

    .line 668
    iget v0, p0, Lcom/apportable/ui/View;->mBackgroundColor:I

    invoke-virtual {p0, v0}, Lcom/apportable/ui/View;->__setBackgroundColor(I)V

    .line 669
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/apportable/ui/View;->mInWindow:Z

    .line 670
    iget-boolean v0, p0, Lcom/apportable/ui/View;->mAsyncDraw:Z

    if-nez v0, :cond_1

    iget v0, p0, Lcom/apportable/ui/View;->mObject:I

    invoke-direct {p0, v0}, Lcom/apportable/ui/View;->isDrawRectImplemented(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 671
    new-instance v0, Lcom/apportable/ui/View$20;

    invoke-direct {v0, p0}, Lcom/apportable/ui/View$20;-><init>(Lcom/apportable/ui/View;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/View;->runOnGlThread(Ljava/lang/Runnable;Z)V

    .line 678
    :cond_1
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 682
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/apportable/ui/View;->mInWindow:Z

    .line 683
    iget-object v0, p0, Lcom/apportable/ui/View;->mBackgroundBitmap:Lcom/apportable/ui/View$BackgroundBitmap;

    if-eqz v0, :cond_0

    .line 684
    iget-object v0, p0, Lcom/apportable/ui/View;->mBackgroundBitmap:Lcom/apportable/ui/View$BackgroundBitmap;

    invoke-virtual {v0}, Lcom/apportable/ui/View$BackgroundBitmap;->recycle()V

    .line 685
    iput-object v2, p0, Lcom/apportable/ui/View;->mBackgroundBitmap:Lcom/apportable/ui/View$BackgroundBitmap;

    .line 687
    :cond_0
    iget-object v0, p0, Lcom/apportable/ui/View;->mDrawBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    .line 688
    invoke-virtual {p0}, Lcom/apportable/ui/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/View;->mDrawBitmap:Landroid/graphics/Bitmap;

    invoke-static {v0, v1}, Lcom/apportable/ui/View;->recycleDrawBitmap(Landroid/content/Context;Landroid/graphics/Bitmap;)V

    .line 689
    iput-object v2, p0, Lcom/apportable/ui/View;->mDrawBitmap:Landroid/graphics/Bitmap;

    .line 691
    :cond_1
    invoke-super {p0}, Landroid/widget/AbsoluteLayout;->onDetachedFromWindow()V

    .line 692
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 7
    .parameter "canvas"

    .prologue
    .line 936
    iget-boolean v4, p0, Lcom/apportable/ui/View;->mAsyncDraw:Z

    if-nez v4, :cond_1

    .line 965
    :cond_0
    :goto_0
    return-void

    .line 942
    :cond_1
    iget-object v4, p0, Lcom/apportable/ui/View;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v4

    float-to-int v4, v4

    if-lez v4, :cond_0

    iget-object v4, p0, Lcom/apportable/ui/View;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    float-to-int v4, v4

    if-lez v4, :cond_0

    .line 948
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 949
    .local v2, startTime:J
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .line 950
    .local v0, checkpoint:I
    iget-object v4, p0, Lcom/apportable/ui/View;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;)Z

    .line 951
    iget v4, p0, Lcom/apportable/ui/View;->mObject:I

    invoke-direct {p0, v4}, Lcom/apportable/ui/View;->isDrawRectImplemented(I)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 953
    iget v4, p0, Lcom/apportable/ui/View;->mObject:I

    invoke-direct {p0, v4}, Lcom/apportable/ui/View;->callDrawRect(I)V

    .line 955
    invoke-direct {p0}, Lcom/apportable/ui/View;->getDrawBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    .line 956
    .local v1, drawBitmap:Landroid/graphics/Bitmap;
    if-eqz v1, :cond_2

    .line 957
    iget-object v4, p0, Lcom/apportable/ui/View;->mDrawBitmapRect:Landroid/graphics/Rect;

    iget-object v5, p0, Lcom/apportable/ui/View;->mDrawBitmapRect:Landroid/graphics/Rect;

    iget-object v6, p0, Lcom/apportable/ui/View;->mDrawBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v4, v5, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 964
    .end local v1           #drawBitmap:Landroid/graphics/Bitmap;
    :cond_2
    :goto_1
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto :goto_0

    .line 962
    :cond_3
    iget v4, p0, Lcom/apportable/ui/View;->mBackgroundColor:I

    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->drawColor(I)V

    goto :goto_1
.end method

.method public removeFromSuperview()V
    .locals 2

    .prologue
    .line 407
    new-instance v0, Lcom/apportable/ui/View$11;

    invoke-direct {v0, p0}, Lcom/apportable/ui/View$11;-><init>(Lcom/apportable/ui/View;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/View;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 413
    return-void
.end method

.method public removeView(Lcom/apportable/ui/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 396
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/apportable/ui/View;->setSuperview(Lcom/apportable/ui/View;)V

    .line 397
    iget-object v0, p0, Lcom/apportable/ui/View;->mSubviews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 398
    invoke-super {p0, p1}, Landroid/widget/AbsoluteLayout;->removeView(Landroid/view/View;)V

    .line 399
    return-void
.end method

.method protected runOnGlThread(Ljava/lang/Runnable;Z)V
    .locals 1
    .parameter "r"
    .parameter "wait"

    .prologue
    .line 103
    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Lcom/apportable/utils/ThreadUtils;->runOnThread(Ljava/lang/Runnable;ZI)V

    .line 104
    return-void
.end method

.method protected runOnUiThread(Ljava/lang/Runnable;Z)V
    .locals 1
    .parameter "r"
    .parameter "wait"

    .prologue
    .line 99
    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Lcom/apportable/utils/ThreadUtils;->runOnThread(Ljava/lang/Runnable;ZI)V

    .line 100
    return-void
.end method

.method protected sanitizeView(Lcom/apportable/ui/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 338
    invoke-virtual {p1}, Lcom/apportable/ui/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 339
    .local v0, parent:Landroid/view/ViewGroup;
    if-eqz v0, :cond_0

    .line 340
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 341
    :cond_0
    return-void
.end method

.method public sendSubviewToBack(Lcom/apportable/ui/View;)V
    .locals 2
    .parameter "view"

    .prologue
    const/4 v1, 0x0

    .line 384
    iget-object v0, p0, Lcom/apportable/ui/View;->mSubviews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 385
    iget-object v0, p0, Lcom/apportable/ui/View;->mSubviews:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 386
    new-instance v0, Lcom/apportable/ui/View$10;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/View$10;-><init>(Lcom/apportable/ui/View;Lcom/apportable/ui/View;)V

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/View;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 393
    :cond_0
    return-void
.end method

.method public setAsyncDraw(Z)V
    .locals 2
    .parameter "async"

    .prologue
    .line 166
    iget-boolean v0, p0, Lcom/apportable/ui/View;->mAsyncDraw:Z

    if-eq v0, p1, :cond_0

    .line 167
    iput-boolean p1, p0, Lcom/apportable/ui/View;->mAsyncDraw:Z

    .line 168
    new-instance v0, Lcom/apportable/ui/View$3;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/View$3;-><init>(Lcom/apportable/ui/View;Z)V

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/View;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 181
    :cond_0
    return-void
.end method

.method public setBounds(Landroid/graphics/RectF;)V
    .locals 2
    .parameter "bounds"

    .prologue
    .line 241
    iput-object p1, p0, Lcom/apportable/ui/View;->mBounds:Landroid/graphics/RectF;

    .line 242
    iget-boolean v0, p0, Lcom/apportable/ui/View;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 243
    new-instance v0, Lcom/apportable/ui/View$5;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/View$5;-><init>(Lcom/apportable/ui/View;Landroid/graphics/RectF;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/View;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 250
    :cond_0
    return-void
.end method

.method public setCenter(Landroid/graphics/PointF;)V
    .locals 6
    .parameter "point"

    .prologue
    const/high16 v5, 0x4000

    .line 257
    iget-object v2, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->right:F

    iget-object v3, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    sub-float v1, v2, v3

    .line 258
    .local v1, width:F
    iget-object v2, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    iget-object v3, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    sub-float v0, v2, v3

    .line 259
    .local v0, height:F
    iget-object v2, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    iget v3, p1, Landroid/graphics/PointF;->x:F

    div-float v4, v1, v5

    sub-float/2addr v3, v4

    iget v4, p1, Landroid/graphics/PointF;->y:F

    div-float v5, v0, v5

    sub-float/2addr v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/graphics/RectF;->offsetTo(FF)V

    .line 260
    iget-boolean v2, p0, Lcom/apportable/ui/View;->mInWindow:Z

    if-eqz v2, :cond_0

    .line 261
    new-instance v2, Lcom/apportable/ui/View$6;

    invoke-direct {v2, p0}, Lcom/apportable/ui/View$6;-><init>(Lcom/apportable/ui/View;)V

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/apportable/ui/View;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 268
    :cond_0
    return-void
.end method

.method public setClipsToBounds(Z)V
    .locals 2
    .parameter "clips"

    .prologue
    .line 632
    iput-boolean p1, p0, Lcom/apportable/ui/View;->mClipsToBounds:Z

    .line 633
    iget-boolean v0, p0, Lcom/apportable/ui/View;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 634
    new-instance v0, Lcom/apportable/ui/View$19;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/View$19;-><init>(Lcom/apportable/ui/View;Z)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/View;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 641
    :cond_0
    return-void
.end method

.method protected setCustomBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 2
    .parameter "drawable"

    .prologue
    .line 695
    new-instance v0, Lcom/apportable/ui/View$21;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/View$21;-><init>(Lcom/apportable/ui/View;Landroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/View;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 702
    return-void
.end method

.method public setDebugTag(Ljava/lang/String;)V
    .locals 0
    .parameter "tag"

    .prologue
    .line 968
    invoke-virtual {p0, p1}, Lcom/apportable/ui/View;->setTag(Ljava/lang/Object;)V

    .line 969
    return-void
.end method

.method public setFrame(Landroid/graphics/RectF;)V
    .locals 5
    .parameter "frame"

    .prologue
    .line 216
    iput-object p1, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    .line 217
    new-instance v0, Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/apportable/ui/View;->mBounds:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Lcom/apportable/ui/View;->mBounds:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    iget-object v3, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    iget-object v4, p0, Lcom/apportable/ui/View;->mFrame:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v0, p0, Lcom/apportable/ui/View;->mBounds:Landroid/graphics/RectF;

    .line 218
    iget-boolean v0, p0, Lcom/apportable/ui/View;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 219
    new-instance v0, Lcom/apportable/ui/View$4;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/View$4;-><init>(Lcom/apportable/ui/View;Landroid/graphics/RectF;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/View;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 226
    :cond_0
    return-void
.end method

.method public setHidden(Z)V
    .locals 2
    .parameter "hidden"

    .prologue
    .line 578
    iput-boolean p1, p0, Lcom/apportable/ui/View;->mHidden:Z

    .line 579
    iget-boolean v0, p0, Lcom/apportable/ui/View;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 580
    new-instance v0, Lcom/apportable/ui/View$16;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/View$16;-><init>(Lcom/apportable/ui/View;Z)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/View;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 587
    :cond_0
    return-void
.end method

.method public setNeedsDisplay()V
    .locals 0

    .prologue
    .line 512
    invoke-virtual {p0}, Lcom/apportable/ui/View;->postInvalidate()V

    .line 513
    return-void
.end method

.method public setNeedsDisplayInRect(Landroid/graphics/RectF;)V
    .locals 5
    .parameter "rectf"

    .prologue
    .line 516
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 517
    .local v0, rect:Landroid/graphics/Rect;
    invoke-virtual {p1, v0}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 518
    iget v1, v0, Landroid/graphics/Rect;->left:I

    iget v2, v0, Landroid/graphics/Rect;->top:I

    iget v3, v0, Landroid/graphics/Rect;->right:I

    iget v4, v0, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/apportable/ui/View;->postInvalidate(IIII)V

    .line 519
    return-void
.end method

.method public setNeedsLayout()V
    .locals 2

    .prologue
    .line 491
    new-instance v0, Lcom/apportable/ui/View$14;

    invoke-direct {v0, p0}, Lcom/apportable/ui/View$14;-><init>(Lcom/apportable/ui/View;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/View;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 497
    return-void
.end method

.method protected setSuperview(Lcom/apportable/ui/View;)V
    .locals 0
    .parameter "superview"

    .prologue
    .line 334
    iput-object p1, p0, Lcom/apportable/ui/View;->mSuperview:Lcom/apportable/ui/View;

    .line 335
    return-void
.end method

.method public setTransform(Landroid/graphics/Matrix;)V
    .locals 2
    .parameter "transform"

    .prologue
    .line 298
    iput-object p1, p0, Lcom/apportable/ui/View;->mMatrix:Landroid/graphics/Matrix;

    .line 299
    iget-boolean v0, p0, Lcom/apportable/ui/View;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 300
    new-instance v0, Lcom/apportable/ui/View$7;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/View$7;-><init>(Lcom/apportable/ui/View;Landroid/graphics/Matrix;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/View;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 307
    :cond_0
    return-void
.end method

.method public unlockBackgroundBitmap()V
    .locals 1

    .prologue
    .line 924
    iget-boolean v0, p0, Lcom/apportable/ui/View;->mAsyncDraw:Z

    if-eqz v0, :cond_1

    .line 932
    :cond_0
    :goto_0
    return-void

    .line 927
    :cond_1
    iget-object v0, p0, Lcom/apportable/ui/View;->mBackgroundBitmap:Lcom/apportable/ui/View$BackgroundBitmap;

    if-eqz v0, :cond_0

    .line 928
    iget-object v0, p0, Lcom/apportable/ui/View;->mBackgroundBitmap:Lcom/apportable/ui/View$BackgroundBitmap;

    invoke-virtual {v0}, Lcom/apportable/ui/View$BackgroundBitmap;->unlock()V

    .line 929
    invoke-virtual {p0}, Lcom/apportable/ui/View;->postInvalidate()V

    goto :goto_0
.end method

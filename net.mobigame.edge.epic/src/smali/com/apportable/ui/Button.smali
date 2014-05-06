.class Lcom/apportable/ui/Button;
.super Lcom/apportable/ui/Control;
.source "Button.java"


# instance fields
.field private mButton:Landroid/widget/Button;

.field private mContentMode:I

.field private mEnabled:Z

.field private mFontSize:F

.field private mHighlighted:Z

.field private mIconDrawable:Landroid/graphics/drawable/Drawable;

.field private mPathStore:Ljava/lang/String;

.field private mShadowColor:I

.field private mShadowOffsetX:F

.field private mShadowOffsetY:F

.field private mText:Ljava/lang/String;

.field private mTextAlignment:I

.field private mTextColor:I

.field private mTypeface:Landroid/graphics/Typeface;

.field private mUseSystemTheme:Z


# direct methods
.method protected constructor <init>(Landroid/content/Context;I)V
    .locals 4
    .parameter "ctx"
    .parameter "object"

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 141
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/Control;-><init>(Landroid/content/Context;I)V

    .line 31
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    iput-object v0, p0, Lcom/apportable/ui/Button;->mTypeface:Landroid/graphics/Typeface;

    .line 32
    const/high16 v0, 0x4188

    iput v0, p0, Lcom/apportable/ui/Button;->mFontSize:F

    .line 33
    iput-boolean v1, p0, Lcom/apportable/ui/Button;->mHighlighted:Z

    .line 34
    iput-boolean v2, p0, Lcom/apportable/ui/Button;->mEnabled:Z

    .line 35
    iput-object v3, p0, Lcom/apportable/ui/Button;->mPathStore:Ljava/lang/String;

    .line 36
    iput-boolean v1, p0, Lcom/apportable/ui/Button;->mUseSystemTheme:Z

    .line 37
    iput-object v3, p0, Lcom/apportable/ui/Button;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 38
    iput v1, p0, Lcom/apportable/ui/Button;->mContentMode:I

    .line 39
    const/high16 v0, -0x100

    iput v0, p0, Lcom/apportable/ui/Button;->mTextColor:I

    .line 40
    iput v2, p0, Lcom/apportable/ui/Button;->mTextAlignment:I

    .line 41
    iput v1, p0, Lcom/apportable/ui/Button;->mShadowColor:I

    .line 42
    const/4 v0, 0x0

    iput v0, p0, Lcom/apportable/ui/Button;->mShadowOffsetX:F

    .line 43
    const/high16 v0, 0x3f80

    iput v0, p0, Lcom/apportable/ui/Button;->mShadowOffsetY:F

    .line 142
    invoke-direct {p0}, Lcom/apportable/ui/Button;->init()V

    .line 143
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;ILandroid/graphics/RectF;)V
    .locals 4
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 146
    invoke-direct {p0, p1, p2, p3}, Lcom/apportable/ui/Control;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 31
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    iput-object v0, p0, Lcom/apportable/ui/Button;->mTypeface:Landroid/graphics/Typeface;

    .line 32
    const/high16 v0, 0x4188

    iput v0, p0, Lcom/apportable/ui/Button;->mFontSize:F

    .line 33
    iput-boolean v1, p0, Lcom/apportable/ui/Button;->mHighlighted:Z

    .line 34
    iput-boolean v2, p0, Lcom/apportable/ui/Button;->mEnabled:Z

    .line 35
    iput-object v3, p0, Lcom/apportable/ui/Button;->mPathStore:Ljava/lang/String;

    .line 36
    iput-boolean v1, p0, Lcom/apportable/ui/Button;->mUseSystemTheme:Z

    .line 37
    iput-object v3, p0, Lcom/apportable/ui/Button;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 38
    iput v1, p0, Lcom/apportable/ui/Button;->mContentMode:I

    .line 39
    const/high16 v0, -0x100

    iput v0, p0, Lcom/apportable/ui/Button;->mTextColor:I

    .line 40
    iput v2, p0, Lcom/apportable/ui/Button;->mTextAlignment:I

    .line 41
    iput v1, p0, Lcom/apportable/ui/Button;->mShadowColor:I

    .line 42
    const/4 v0, 0x0

    iput v0, p0, Lcom/apportable/ui/Button;->mShadowOffsetX:F

    .line 43
    const/high16 v0, 0x3f80

    iput v0, p0, Lcom/apportable/ui/Button;->mShadowOffsetY:F

    .line 147
    invoke-direct {p0}, Lcom/apportable/ui/Button;->init()V

    .line 148
    return-void
.end method

.method private _setEnabled(Z)V
    .locals 2
    .parameter "enabled"

    .prologue
    .line 267
    if-eqz p1, :cond_0

    .line 268
    const/high16 v0, 0x3f80

    invoke-virtual {p0}, Lcom/apportable/ui/Button;->_getAlpha()F

    move-result v1

    mul-float/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/apportable/ui/Button;->applyAlpha(F)V

    .line 273
    :goto_0
    return-void

    .line 271
    :cond_0
    const v0, 0x3f19999a

    invoke-virtual {p0}, Lcom/apportable/ui/Button;->_getAlpha()F

    move-result v1

    mul-float/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/apportable/ui/Button;->applyAlpha(F)V

    goto :goto_0
.end method

.method private _useSystemUi(Z)V
    .locals 2
    .parameter "systemTheme"

    .prologue
    .line 293
    if-nez p1, :cond_0

    .line 294
    iget-object v0, p0, Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 296
    :cond_0
    return-void
.end method

.method static synthetic access$000(Lcom/apportable/ui/Button;)Landroid/widget/Button;
    .locals 1
    .parameter "x0"

    .prologue
    .line 27
    iget-object v0, p0, Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$100(Lcom/apportable/ui/Button;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 27
    iget v0, p0, Lcom/apportable/ui/Button;->mContentMode:I

    return v0
.end method

.method static synthetic access$200(Lcom/apportable/ui/Button;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lcom/apportable/ui/Button;->_setEnabled(Z)V

    return-void
.end method

.method static synthetic access$300(Lcom/apportable/ui/Button;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lcom/apportable/ui/Button;->_useSystemUi(Z)V

    return-void
.end method

.method private native clicked(I)V
.end method

.method public static create(Landroid/content/Context;I)Lcom/apportable/ui/Button;
    .locals 2
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 48
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 49
    new-instance v1, Lcom/apportable/ui/Button;

    invoke-direct {v1, p0, p1}, Lcom/apportable/ui/Button;-><init>(Landroid/content/Context;I)V

    .line 68
    :goto_0
    return-object v1

    .line 51
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 52
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/Button;>;"
    new-instance v1, Lcom/apportable/ui/Button$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/apportable/ui/Button$1;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;I)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 61
    monitor-enter p0

    .line 62
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 64
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 65
    :catch_0
    move-exception v1

    goto :goto_1

    .line 67
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 68
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/Button;

    goto :goto_0

    .line 67
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public static create(Landroid/content/Context;ILandroid/graphics/RectF;)Lcom/apportable/ui/Button;
    .locals 2
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 73
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 74
    new-instance v1, Lcom/apportable/ui/Button;

    invoke-direct {v1, p0, p1, p2}, Lcom/apportable/ui/Button;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 93
    :goto_0
    return-object v1

    .line 76
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 77
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/Button;>;"
    new-instance v1, Lcom/apportable/ui/Button$2;

    invoke-direct {v1, p0, v0, p1, p2}, Lcom/apportable/ui/Button$2;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;ILandroid/graphics/RectF;)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 86
    monitor-enter p0

    .line 87
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 89
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 90
    :catch_0
    move-exception v1

    goto :goto_1

    .line 92
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 93
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/Button;

    goto :goto_0

    .line 92
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method private getDrawableWithHighlight(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 9
    .parameter "d"

    .prologue
    const/4 v8, 0x0

    .line 164
    move-object v2, p1

    check-cast v2, Landroid/graphics/drawable/BitmapDrawable;

    .line 165
    .local v2, drawable:Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual {v2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 166
    .local v0, bitmap:Landroid/graphics/Bitmap;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    sget-object v7, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v5, v6, v7}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 167
    .local v3, newBitmap:Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 168
    .local v1, canvas:Landroid/graphics/Canvas;
    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    .line 169
    .local v4, paint:Landroid/graphics/Paint;
    const v5, -0x55000001

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 170
    invoke-virtual {v1, v0, v8, v8, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 171
    new-instance v5, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v5, v3}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    return-object v5
.end method

.method private init()V
    .locals 3

    .prologue
    .line 98
    new-instance v0, Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/apportable/ui/Button;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;

    .line 99
    iget-object v0, p0, Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;

    new-instance v1, Lcom/apportable/ui/Button$3;

    invoke-direct {v1, p0}, Lcom/apportable/ui/Button$3;-><init>(Lcom/apportable/ui/Button;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 131
    iget-object v0, p0, Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;

    new-instance v1, Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/apportable/ui/Button;->getFrame()Landroid/graphics/RectF;

    move-result-object v2

    invoke-static {v2}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/apportable/ui/Button;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Button;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 132
    return-void
.end method

.method private setBackgroundDrawableWithInferredStates(Landroid/graphics/drawable/Drawable;)V
    .locals 4
    .parameter "drawable"

    .prologue
    const/4 v3, 0x0

    .line 175
    iget-boolean v1, p0, Lcom/apportable/ui/Button;->mInWindow:Z

    if-eqz v1, :cond_0

    .line 176
    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 177
    .local v0, stateListDrawable:Landroid/graphics/drawable/StateListDrawable;
    const/4 v1, 0x1

    new-array v1, v1, [I

    const v2, 0x10100a7

    aput v2, v1, v3

    invoke-direct {p0, p1}, Lcom/apportable/ui/Button;->getDrawableWithHighlight(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 178
    sget-object v1, Landroid/util/StateSet;->WILD_CARD:[I

    invoke-virtual {v0, v1, p1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 179
    new-instance v1, Lcom/apportable/ui/Button$5;

    invoke-direct {v1, p0, v0}, Lcom/apportable/ui/Button$5;-><init>(Lcom/apportable/ui/Button;Landroid/graphics/drawable/StateListDrawable;)V

    invoke-virtual {p0, v1, v3}, Lcom/apportable/ui/Button;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 186
    .end local v0           #stateListDrawable:Landroid/graphics/drawable/StateListDrawable;
    :cond_0
    return-void
.end method

.method private setIconDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 2
    .parameter "drawable"

    .prologue
    .line 202
    iput-object p1, p0, Lcom/apportable/ui/Button;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 203
    iget-boolean v0, p0, Lcom/apportable/ui/Button;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 204
    new-instance v0, Lcom/apportable/ui/Button$6;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Button$6;-><init>(Lcom/apportable/ui/Button;Landroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Button;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 226
    :cond_0
    return-void
.end method

.method private updateShadow(IFF)V
    .locals 2
    .parameter "color"
    .parameter "x"
    .parameter "y"

    .prologue
    .line 357
    iput p1, p0, Lcom/apportable/ui/Button;->mShadowColor:I

    .line 358
    iput p2, p0, Lcom/apportable/ui/Button;->mShadowOffsetX:F

    .line 359
    iput p3, p0, Lcom/apportable/ui/Button;->mShadowOffsetY:F

    .line 360
    iget-boolean v0, p0, Lcom/apportable/ui/Button;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 361
    new-instance v0, Lcom/apportable/ui/Button$12;

    invoke-direct {v0, p0, p2, p3, p1}, Lcom/apportable/ui/Button$12;-><init>(Lcom/apportable/ui/Button;FFI)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Button;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 368
    :cond_0
    return-void
.end method


# virtual methods
.method protected _setFrame(Landroid/graphics/RectF;)V
    .locals 2
    .parameter "frame"

    .prologue
    .line 136
    invoke-super {p0, p1}, Lcom/apportable/ui/Control;->_setFrame(Landroid/graphics/RectF;)V

    .line 137
    iget-object v0, p0, Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;

    invoke-static {p1}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/apportable/ui/Button;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 138
    return-void
.end method

.method public _setHighlighted(Z)V
    .locals 1
    .parameter "highlighted"

    .prologue
    .line 242
    if-eqz p1, :cond_0

    .line 243
    iget-object v0, p0, Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->requestFocus()Z

    .line 247
    :goto_0
    return-void

    .line 245
    :cond_0
    invoke-virtual {p0}, Lcom/apportable/ui/Button;->requestFocus()Z

    goto :goto_0
.end method

.method public getEnabled()Z
    .locals 1

    .prologue
    .line 289
    iget-boolean v0, p0, Lcom/apportable/ui/Button;->mEnabled:Z

    return v0
.end method

.method public getHighlighted()Z
    .locals 1

    .prologue
    .line 263
    iget-boolean v0, p0, Lcom/apportable/ui/Button;->mHighlighted:Z

    return v0
.end method

.method public getShadowColor()I
    .locals 1

    .prologue
    .line 375
    iget v0, p0, Lcom/apportable/ui/Button;->mShadowColor:I

    return v0
.end method

.method public getShadowOffsetX()F
    .locals 1

    .prologue
    .line 383
    iget v0, p0, Lcom/apportable/ui/Button;->mShadowOffsetX:F

    return v0
.end method

.method public getShadowOffsetY()F
    .locals 1

    .prologue
    .line 387
    iget v0, p0, Lcom/apportable/ui/Button;->mShadowOffsetY:F

    return v0
.end method

.method public getTextAlignment()I
    .locals 1

    .prologue
    .line 353
    iget v0, p0, Lcom/apportable/ui/Button;->mTextAlignment:I

    return v0
.end method

.method public getTextColor()I
    .locals 1

    .prologue
    .line 327
    iget v0, p0, Lcom/apportable/ui/Button;->mTextColor:I

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 5

    .prologue
    .line 406
    invoke-super {p0}, Lcom/apportable/ui/Control;->onAttachedToWindow()V

    .line 407
    iget-object v0, p0, Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/apportable/ui/Button;->mTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    .line 408
    iget-object v0, p0, Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;

    iget v1, p0, Lcom/apportable/ui/Button;->mFontSize:F

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 409
    iget-object v0, p0, Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/apportable/ui/Button;->mText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 410
    iget-boolean v0, p0, Lcom/apportable/ui/Button;->mUseSystemTheme:Z

    invoke-direct {p0, v0}, Lcom/apportable/ui/Button;->_useSystemUi(Z)V

    .line 411
    iget-boolean v0, p0, Lcom/apportable/ui/Button;->mHighlighted:Z

    invoke-virtual {p0, v0}, Lcom/apportable/ui/Button;->_setHighlighted(Z)V

    .line 412
    iget-boolean v0, p0, Lcom/apportable/ui/Button;->mEnabled:Z

    invoke-direct {p0, v0}, Lcom/apportable/ui/Button;->_setEnabled(Z)V

    .line 413
    iget-object v0, p0, Lcom/apportable/ui/Button;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    .line 414
    iget-object v0, p0, Lcom/apportable/ui/Button;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v0}, Lcom/apportable/ui/Button;->setIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 416
    :cond_0
    iget-object v0, p0, Lcom/apportable/ui/Button;->mPathStore:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 417
    iget-object v0, p0, Lcom/apportable/ui/Button;->mPathStore:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/apportable/ui/Button;->setBackgroundDrawableWithInferredStates(Ljava/lang/String;)V

    .line 418
    :cond_1
    iget v0, p0, Lcom/apportable/ui/Button;->mTextAlignment:I

    packed-switch v0, :pswitch_data_0

    .line 429
    :goto_0
    iget-object v0, p0, Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;

    const/high16 v1, 0x3f80

    iget v2, p0, Lcom/apportable/ui/Button;->mShadowOffsetX:F

    iget v3, p0, Lcom/apportable/ui/Button;->mShadowOffsetY:F

    iget v4, p0, Lcom/apportable/ui/Button;->mShadowColor:I

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/Button;->setShadowLayer(FFFI)V

    .line 430
    return-void

    .line 420
    :pswitch_0
    iget-object v0, p0, Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;

    const/16 v1, 0x13

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setGravity(I)V

    goto :goto_0

    .line 423
    :pswitch_1
    iget-object v0, p0, Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setGravity(I)V

    goto :goto_0

    .line 426
    :pswitch_2
    iget-object v0, p0, Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;

    const/16 v1, 0x15

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setGravity(I)V

    goto :goto_0

    .line 418
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public setBackgroundDrawableWithInferredStates(Ljava/lang/String;)V
    .locals 4
    .parameter "path"

    .prologue
    .line 193
    iput-object p1, p0, Lcom/apportable/ui/Button;->mPathStore:Ljava/lang/String;

    .line 195
    :try_start_0
    invoke-static {p1}, Lcom/apportable/utils/ImageUtils;->Drawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/apportable/ui/Button;->setBackgroundDrawableWithInferredStates(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 199
    :goto_0
    return-void

    .line 196
    :catch_0
    move-exception v0

    .line 197
    .local v0, e:Ljava/lang/Exception;
    const-string v1, "Button"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not load image from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public setBackgroundDrawableWithInferredStates([BIIIIII)V
    .locals 1
    .parameter "bytes"
    .parameter "offset"
    .parameter "length"
    .parameter "imageWidth"
    .parameter "imageHeight"
    .parameter "scaledWidth"
    .parameter "scaledHeight"

    .prologue
    .line 189
    invoke-static {p1, p4, p5, p6, p7}, Lcom/apportable/utils/ImageUtils;->DrawableFromBytes([BIIII)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/apportable/ui/Button;->setBackgroundDrawableWithInferredStates(Landroid/graphics/drawable/Drawable;)V

    .line 190
    return-void
.end method

.method public setContentMode(I)V
    .locals 0
    .parameter "mode"

    .prologue
    .line 311
    iput p1, p0, Lcom/apportable/ui/Button;->mContentMode:I

    .line 312
    return-void
.end method

.method public setEnabled(Z)V
    .locals 2
    .parameter "enabled"

    .prologue
    .line 277
    iput-boolean p1, p0, Lcom/apportable/ui/Button;->mEnabled:Z

    .line 278
    iget-boolean v0, p0, Lcom/apportable/ui/Button;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 279
    new-instance v0, Lcom/apportable/ui/Button$8;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Button$8;-><init>(Lcom/apportable/ui/Button;Z)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Button;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 286
    :cond_0
    return-void
.end method

.method public setFont(Landroid/graphics/Typeface;F)V
    .locals 2
    .parameter "font"
    .parameter "size"

    .prologue
    .line 391
    iput-object p1, p0, Lcom/apportable/ui/Button;->mTypeface:Landroid/graphics/Typeface;

    .line 392
    iput p2, p0, Lcom/apportable/ui/Button;->mFontSize:F

    .line 393
    iget-boolean v0, p0, Lcom/apportable/ui/Button;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 394
    new-instance v0, Lcom/apportable/ui/Button$13;

    invoke-direct {v0, p0, p1, p2}, Lcom/apportable/ui/Button$13;-><init>(Lcom/apportable/ui/Button;Landroid/graphics/Typeface;F)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Button;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 402
    :cond_0
    return-void
.end method

.method public setHighlighted(Z)V
    .locals 2
    .parameter "highlighted"

    .prologue
    .line 250
    iput-boolean p1, p0, Lcom/apportable/ui/Button;->mHighlighted:Z

    .line 251
    iget-boolean v0, p0, Lcom/apportable/ui/Button;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 252
    new-instance v0, Lcom/apportable/ui/Button$7;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Button$7;-><init>(Lcom/apportable/ui/Button;Z)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Button;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 259
    :cond_0
    return-void
.end method

.method public setIconDrawable(Ljava/lang/String;)V
    .locals 4
    .parameter "path"

    .prologue
    .line 231
    if-eqz p1, :cond_0

    :try_start_0
    invoke-static {p1}, Lcom/apportable/utils/ImageUtils;->Drawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    :goto_0
    invoke-direct {p0, v1}, Lcom/apportable/ui/Button;->setIconDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 235
    :goto_1
    return-void

    .line 231
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 232
    :catch_0
    move-exception v0

    .line 233
    .local v0, e:Ljava/lang/Exception;
    const-string v1, "Button"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not load image from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public setIconDrawable([BIIIIII)V
    .locals 1
    .parameter "bytes"
    .parameter "offset"
    .parameter "length"
    .parameter "imageWidth"
    .parameter "imageHeight"
    .parameter "scaledWidth"
    .parameter "scaledHeight"

    .prologue
    .line 238
    invoke-static {p1, p4, p5, p6, p7}, Lcom/apportable/utils/ImageUtils;->DrawableWithInferredStatesFromBytes([BIIII)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/apportable/ui/Button;->setIconDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 239
    return-void
.end method

.method public setShadowColor(I)V
    .locals 2
    .parameter "color"

    .prologue
    .line 371
    iget v0, p0, Lcom/apportable/ui/Button;->mShadowOffsetX:F

    iget v1, p0, Lcom/apportable/ui/Button;->mShadowOffsetY:F

    invoke-direct {p0, p1, v0, v1}, Lcom/apportable/ui/Button;->updateShadow(IFF)V

    .line 372
    return-void
.end method

.method public setShadowOffset(FF)V
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 379
    iget v0, p0, Lcom/apportable/ui/Button;->mShadowColor:I

    invoke-direct {p0, v0, p1, p2}, Lcom/apportable/ui/Button;->updateShadow(IFF)V

    .line 380
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 2
    .parameter "text"

    .prologue
    .line 152
    iput-object p1, p0, Lcom/apportable/ui/Button;->mText:Ljava/lang/String;

    .line 153
    iget-boolean v0, p0, Lcom/apportable/ui/Button;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 154
    new-instance v0, Lcom/apportable/ui/Button$4;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Button$4;-><init>(Lcom/apportable/ui/Button;Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Button;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 161
    :cond_0
    return-void
.end method

.method public setTextAlignment(I)V
    .locals 2
    .parameter "alignment"

    .prologue
    .line 331
    iput p1, p0, Lcom/apportable/ui/Button;->mTextAlignment:I

    .line 332
    iget-boolean v0, p0, Lcom/apportable/ui/Button;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 333
    new-instance v0, Lcom/apportable/ui/Button$11;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Button$11;-><init>(Lcom/apportable/ui/Button;I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Button;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 350
    :cond_0
    return-void
.end method

.method public setTextColor(I)V
    .locals 2
    .parameter "color"

    .prologue
    .line 315
    iput p1, p0, Lcom/apportable/ui/Button;->mTextColor:I

    .line 316
    iget-boolean v0, p0, Lcom/apportable/ui/Button;->mInWindow:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/apportable/ui/Button;->mHighlighted:Z

    if-nez v0, :cond_0

    .line 317
    new-instance v0, Lcom/apportable/ui/Button$10;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Button$10;-><init>(Lcom/apportable/ui/Button;I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Button;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 324
    :cond_0
    return-void
.end method

.method public useSystemUi(Z)V
    .locals 2
    .parameter "systemTheme"

    .prologue
    .line 299
    iput-boolean p1, p0, Lcom/apportable/ui/Button;->mUseSystemTheme:Z

    .line 300
    iget-boolean v0, p0, Lcom/apportable/ui/Button;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 301
    new-instance v0, Lcom/apportable/ui/Button$9;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Button$9;-><init>(Lcom/apportable/ui/Button;Z)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Button;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 308
    :cond_0
    return-void
.end method

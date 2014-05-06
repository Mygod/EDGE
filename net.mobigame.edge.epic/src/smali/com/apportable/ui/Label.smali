.class Lcom/apportable/ui/Label;
.super Lcom/apportable/ui/View;
.source "Label.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/apportable/ui/Label$LabelView;
    }
.end annotation


# instance fields
.field private mAdjustsSize:Z

.field private mBaselineAdjustment:I

.field private mEnabled:Z

.field private mFontSize:F

.field private mHighlighted:Z

.field private mHighlightedColor:I

.field private mLineBreakMode:I

.field private mMinimumFontSize:F

.field private mNumberOfLines:I

.field private mShadowColor:I

.field private mShadowOffsetX:F

.field private mShadowOffsetY:F

.field private mText:Ljava/lang/String;

.field private mTextAlignment:I

.field private mTextColor:I

.field private mTextView:Lcom/apportable/ui/Label$LabelView;

.field private mTypeface:Landroid/graphics/Typeface;

.field private mUserInteractionEnabled:Z


# direct methods
.method protected constructor <init>(Landroid/content/Context;I)V
    .locals 5
    .parameter "ctx"
    .parameter "object"

    .prologue
    const/4 v4, 0x1

    const/high16 v3, -0x100

    const/high16 v2, 0x3f80

    const/4 v1, 0x0

    .line 147
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;I)V

    .line 121
    const-string v0, ""

    iput-object v0, p0, Lcom/apportable/ui/Label;->mText:Ljava/lang/String;

    .line 122
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    iput-object v0, p0, Lcom/apportable/ui/Label;->mTypeface:Landroid/graphics/Typeface;

    .line 123
    iput v3, p0, Lcom/apportable/ui/Label;->mTextColor:I

    .line 124
    iput v1, p0, Lcom/apportable/ui/Label;->mTextAlignment:I

    .line 125
    const/4 v0, 0x3

    iput v0, p0, Lcom/apportable/ui/Label;->mLineBreakMode:I

    .line 126
    iput-boolean v4, p0, Lcom/apportable/ui/Label;->mEnabled:Z

    .line 127
    iput-boolean v1, p0, Lcom/apportable/ui/Label;->mAdjustsSize:Z

    .line 128
    iput v2, p0, Lcom/apportable/ui/Label;->mMinimumFontSize:F

    .line 129
    iput v4, p0, Lcom/apportable/ui/Label;->mNumberOfLines:I

    .line 130
    iput-boolean v1, p0, Lcom/apportable/ui/Label;->mHighlighted:Z

    .line 131
    iput v3, p0, Lcom/apportable/ui/Label;->mHighlightedColor:I

    .line 132
    iput v1, p0, Lcom/apportable/ui/Label;->mShadowColor:I

    .line 133
    const/4 v0, 0x0

    iput v0, p0, Lcom/apportable/ui/Label;->mShadowOffsetX:F

    .line 134
    iput v2, p0, Lcom/apportable/ui/Label;->mShadowOffsetY:F

    .line 135
    iput-boolean v1, p0, Lcom/apportable/ui/Label;->mUserInteractionEnabled:Z

    .line 137
    const/high16 v0, 0x4188

    iput v0, p0, Lcom/apportable/ui/Label;->mFontSize:F

    .line 148
    invoke-direct {p0}, Lcom/apportable/ui/Label;->init()V

    .line 149
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;ILandroid/graphics/RectF;)V
    .locals 5
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    const/4 v4, 0x1

    const/high16 v3, -0x100

    const/high16 v2, 0x3f80

    const/4 v1, 0x0

    .line 152
    invoke-direct {p0, p1, p2, p3}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 121
    const-string v0, ""

    iput-object v0, p0, Lcom/apportable/ui/Label;->mText:Ljava/lang/String;

    .line 122
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    iput-object v0, p0, Lcom/apportable/ui/Label;->mTypeface:Landroid/graphics/Typeface;

    .line 123
    iput v3, p0, Lcom/apportable/ui/Label;->mTextColor:I

    .line 124
    iput v1, p0, Lcom/apportable/ui/Label;->mTextAlignment:I

    .line 125
    const/4 v0, 0x3

    iput v0, p0, Lcom/apportable/ui/Label;->mLineBreakMode:I

    .line 126
    iput-boolean v4, p0, Lcom/apportable/ui/Label;->mEnabled:Z

    .line 127
    iput-boolean v1, p0, Lcom/apportable/ui/Label;->mAdjustsSize:Z

    .line 128
    iput v2, p0, Lcom/apportable/ui/Label;->mMinimumFontSize:F

    .line 129
    iput v4, p0, Lcom/apportable/ui/Label;->mNumberOfLines:I

    .line 130
    iput-boolean v1, p0, Lcom/apportable/ui/Label;->mHighlighted:Z

    .line 131
    iput v3, p0, Lcom/apportable/ui/Label;->mHighlightedColor:I

    .line 132
    iput v1, p0, Lcom/apportable/ui/Label;->mShadowColor:I

    .line 133
    const/4 v0, 0x0

    iput v0, p0, Lcom/apportable/ui/Label;->mShadowOffsetX:F

    .line 134
    iput v2, p0, Lcom/apportable/ui/Label;->mShadowOffsetY:F

    .line 135
    iput-boolean v1, p0, Lcom/apportable/ui/Label;->mUserInteractionEnabled:Z

    .line 137
    const/high16 v0, 0x4188

    iput v0, p0, Lcom/apportable/ui/Label;->mFontSize:F

    .line 153
    invoke-direct {p0}, Lcom/apportable/ui/Label;->init()V

    .line 154
    return-void
.end method

.method static synthetic access$000(Lcom/apportable/ui/Label;)Lcom/apportable/ui/Label$LabelView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 23
    iget-object v0, p0, Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/apportable/ui/Label;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/apportable/ui/Label;->updateHighlight()V

    return-void
.end method

.method public static create(Landroid/content/Context;I)Lcom/apportable/ui/Label;
    .locals 2
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 157
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 158
    new-instance v1, Lcom/apportable/ui/Label;

    invoke-direct {v1, p0, p1}, Lcom/apportable/ui/Label;-><init>(Landroid/content/Context;I)V

    .line 177
    :goto_0
    return-object v1

    .line 160
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 161
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/Label;>;"
    new-instance v1, Lcom/apportable/ui/Label$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/apportable/ui/Label$1;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;I)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 170
    monitor-enter p0

    .line 171
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 173
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 174
    :catch_0
    move-exception v1

    goto :goto_1

    .line 176
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 177
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/Label;

    goto :goto_0

    .line 176
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public static create(Landroid/content/Context;ILandroid/graphics/RectF;)Lcom/apportable/ui/Label;
    .locals 2
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 182
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 183
    new-instance v1, Lcom/apportable/ui/Label;

    invoke-direct {v1, p0, p1, p2}, Lcom/apportable/ui/Label;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 202
    :goto_0
    return-object v1

    .line 185
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 186
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/Label;>;"
    new-instance v1, Lcom/apportable/ui/Label$2;

    invoke-direct {v1, p0, v0, p1, p2}, Lcom/apportable/ui/Label$2;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;ILandroid/graphics/RectF;)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 195
    monitor-enter p0

    .line 196
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 198
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 199
    :catch_0
    move-exception v1

    goto :goto_1

    .line 201
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 202
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/Label;

    goto :goto_0

    .line 201
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
    .line 140
    new-instance v0, Lcom/apportable/ui/Label$LabelView;

    invoke-virtual {p0}, Lcom/apportable/ui/Label;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/apportable/ui/Label$LabelView;-><init>(Lcom/apportable/ui/Label;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;

    .line 141
    iget-object v0, p0, Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;

    iget-object v1, p0, Lcom/apportable/ui/Label;->mText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/apportable/ui/Label$LabelView;->setText(Ljava/lang/CharSequence;)V

    .line 142
    iget-object v0, p0, Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;

    iget v1, p0, Lcom/apportable/ui/Label;->mNumberOfLines:I

    invoke-virtual {v0, v1}, Lcom/apportable/ui/Label$LabelView;->setMaxLines(I)V

    .line 143
    iget-object v0, p0, Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;

    invoke-virtual {p0}, Lcom/apportable/ui/Label;->getFrame()Landroid/graphics/RectF;

    move-result-object v1

    invoke-static {v1}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/apportable/ui/Label;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Label;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 144
    return-void
.end method

.method private updateHighlight()V
    .locals 2

    .prologue
    .line 402
    iget-boolean v0, p0, Lcom/apportable/ui/Label;->mHighlighted:Z

    if-eqz v0, :cond_0

    .line 403
    iget-object v0, p0, Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;

    iget v1, p0, Lcom/apportable/ui/Label;->mHighlightedColor:I

    invoke-virtual {v0, v1}, Lcom/apportable/ui/Label$LabelView;->setTextColor(I)V

    .line 406
    :goto_0
    return-void

    .line 405
    :cond_0
    iget-object v0, p0, Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;

    iget v1, p0, Lcom/apportable/ui/Label;->mTextColor:I

    invoke-virtual {v0, v1}, Lcom/apportable/ui/Label$LabelView;->setTextColor(I)V

    goto :goto_0
.end method

.method private updateShadow(IFF)V
    .locals 2
    .parameter "color"
    .parameter "x"
    .parameter "y"

    .prologue
    .line 431
    iput p1, p0, Lcom/apportable/ui/Label;->mShadowColor:I

    .line 432
    iput p2, p0, Lcom/apportable/ui/Label;->mShadowOffsetX:F

    .line 433
    iput p3, p0, Lcom/apportable/ui/Label;->mShadowOffsetY:F

    .line 434
    iget-boolean v0, p0, Lcom/apportable/ui/Label;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 435
    new-instance v0, Lcom/apportable/ui/Label$12;

    invoke-direct {v0, p0, p2, p3, p1}, Lcom/apportable/ui/Label$12;-><init>(Lcom/apportable/ui/Label;FFI)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Label;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 442
    :cond_0
    return-void
.end method


# virtual methods
.method protected _setFrame(Landroid/graphics/RectF;)V
    .locals 2
    .parameter "frame"

    .prologue
    .line 510
    invoke-super {p0, p1}, Lcom/apportable/ui/View;->_setFrame(Landroid/graphics/RectF;)V

    .line 511
    iget-object v0, p0, Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;

    invoke-virtual {p0}, Lcom/apportable/ui/Label;->getFrame()Landroid/graphics/RectF;

    move-result-object v1

    invoke-static {v1}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/apportable/ui/Label;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/apportable/ui/Label$LabelView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 512
    return-void
.end method

.method public adjustsFontSizeToFitWidth(Z)V
    .locals 2
    .parameter "adjust"

    .prologue
    .line 323
    iput-boolean p1, p0, Lcom/apportable/ui/Label;->mAdjustsSize:Z

    .line 324
    iget-boolean v0, p0, Lcom/apportable/ui/Label;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 325
    new-instance v0, Lcom/apportable/ui/Label$7;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Label$7;-><init>(Lcom/apportable/ui/Label;Z)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Label;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 332
    :cond_0
    return-void
.end method

.method public getAdjustsFontSizeToFitWidth()Z
    .locals 1

    .prologue
    .line 335
    iget-boolean v0, p0, Lcom/apportable/ui/Label;->mAdjustsSize:Z

    return v0
.end method

.method public getBaselineAdjustment()I
    .locals 1

    .prologue
    .line 344
    iget v0, p0, Lcom/apportable/ui/Label;->mBaselineAdjustment:I

    return v0
.end method

.method public getEnabled()Z
    .locals 1

    .prologue
    .line 311
    iget-boolean v0, p0, Lcom/apportable/ui/Label;->mEnabled:Z

    return v0
.end method

.method public getFont()Landroid/graphics/Typeface;
    .locals 1

    .prologue
    .line 248
    iget-object v0, p0, Lcom/apportable/ui/Label;->mTypeface:Landroid/graphics/Typeface;

    return-object v0
.end method

.method public getFontSize()F
    .locals 1

    .prologue
    .line 252
    iget v0, p0, Lcom/apportable/ui/Label;->mFontSize:F

    return v0
.end method

.method public getHighlightedTextColor()I
    .locals 1

    .prologue
    .line 398
    iget v0, p0, Lcom/apportable/ui/Label;->mHighlightedColor:I

    return v0
.end method

.method public getLineBreakMode()I
    .locals 1

    .prologue
    .line 303
    iget v0, p0, Lcom/apportable/ui/Label;->mLineBreakMode:I

    return v0
.end method

.method public getMinimumFontSize()F
    .locals 1

    .prologue
    .line 360
    iget v0, p0, Lcom/apportable/ui/Label;->mMinimumFontSize:F

    return v0
.end method

.method public getNumberOfLines()I
    .locals 1

    .prologue
    .line 376
    iget v0, p0, Lcom/apportable/ui/Label;->mNumberOfLines:I

    return v0
.end method

.method public getShadowColor()I
    .locals 1

    .prologue
    .line 449
    iget v0, p0, Lcom/apportable/ui/Label;->mShadowColor:I

    return v0
.end method

.method public getShadowOffsetX()F
    .locals 1

    .prologue
    .line 457
    iget v0, p0, Lcom/apportable/ui/Label;->mShadowOffsetX:F

    return v0
.end method

.method public getShadowOffsetY()F
    .locals 1

    .prologue
    .line 461
    iget v0, p0, Lcom/apportable/ui/Label;->mShadowOffsetY:F

    return v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 229
    iget-object v0, p0, Lcom/apportable/ui/Label;->mText:Ljava/lang/String;

    return-object v0
.end method

.method public getTextAlignment()I
    .locals 1

    .prologue
    .line 294
    iget v0, p0, Lcom/apportable/ui/Label;->mTextAlignment:I

    return v0
.end method

.method public getTextColor()I
    .locals 1

    .prologue
    .line 268
    iget v0, p0, Lcom/apportable/ui/Label;->mTextColor:I

    return v0
.end method

.method public getUserInteractionEnabled()Z
    .locals 1

    .prologue
    .line 481
    iget-boolean v0, p0, Lcom/apportable/ui/Label;->mUserInteractionEnabled:Z

    return v0
.end method

.method public highlighted()Z
    .locals 1

    .prologue
    .line 421
    iget-boolean v0, p0, Lcom/apportable/ui/Label;->mHighlighted:Z

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 5

    .prologue
    .line 523
    invoke-super {p0}, Lcom/apportable/ui/View;->onAttachedToWindow()V

    .line 524
    iget-object v0, p0, Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;

    iget-object v1, p0, Lcom/apportable/ui/Label;->mText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/apportable/ui/Label$LabelView;->setText(Ljava/lang/CharSequence;)V

    .line 525
    iget-object v0, p0, Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;

    iget-object v1, p0, Lcom/apportable/ui/Label;->mTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Lcom/apportable/ui/Label$LabelView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 526
    iget-object v0, p0, Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;

    const/4 v1, 0x0

    iget v2, p0, Lcom/apportable/ui/Label;->mFontSize:F

    invoke-virtual {v0, v1, v2}, Lcom/apportable/ui/Label$LabelView;->setTextSize(IF)V

    .line 527
    invoke-direct {p0}, Lcom/apportable/ui/Label;->updateHighlight()V

    .line 528
    iget v0, p0, Lcom/apportable/ui/Label;->mTextAlignment:I

    packed-switch v0, :pswitch_data_0

    .line 539
    :goto_0
    iget-object v0, p0, Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;

    iget-boolean v1, p0, Lcom/apportable/ui/Label;->mAdjustsSize:Z

    invoke-virtual {v0, v1}, Lcom/apportable/ui/Label$LabelView;->adjustsFontSizeToFitWidth(Z)V

    .line 540
    iget-object v0, p0, Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;

    iget v1, p0, Lcom/apportable/ui/Label;->mMinimumFontSize:F

    invoke-virtual {v0, v1}, Lcom/apportable/ui/Label$LabelView;->setMinTextSize(F)V

    .line 541
    iget-object v0, p0, Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;

    const/high16 v1, 0x3f80

    iget v2, p0, Lcom/apportable/ui/Label;->mShadowOffsetX:F

    iget v3, p0, Lcom/apportable/ui/Label;->mShadowOffsetY:F

    iget v4, p0, Lcom/apportable/ui/Label;->mShadowColor:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/apportable/ui/Label$LabelView;->setShadowLayer(FFFI)V

    .line 542
    return-void

    .line 530
    :pswitch_0
    iget-object v0, p0, Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;

    const/16 v1, 0x13

    invoke-virtual {v0, v1}, Lcom/apportable/ui/Label$LabelView;->setGravity(I)V

    goto :goto_0

    .line 533
    :pswitch_1
    iget-object v0, p0, Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Lcom/apportable/ui/Label$LabelView;->setGravity(I)V

    goto :goto_0

    .line 536
    :pswitch_2
    iget-object v0, p0, Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;

    const/16 v1, 0x15

    invoke-virtual {v0, v1}, Lcom/apportable/ui/Label$LabelView;->setGravity(I)V

    goto :goto_0

    .line 528
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .parameter "event"

    .prologue
    const/4 v2, 0x1

    .line 485
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    and-int/lit16 v1, v1, 0xff

    packed-switch v1, :pswitch_data_0

    .line 504
    :cond_0
    :goto_0
    :pswitch_0
    invoke-super {p0, p1}, Lcom/apportable/ui/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 505
    .local v0, supress:Z
    return v0

    .line 488
    .end local v0           #supress:Z
    :pswitch_1
    iget-boolean v1, p0, Lcom/apportable/ui/Label;->mUserInteractionEnabled:Z

    if-eqz v1, :cond_0

    .line 490
    iput-boolean v2, p0, Lcom/apportable/ui/Label;->mHighlighted:Z

    .line 491
    invoke-direct {p0}, Lcom/apportable/ui/Label;->updateHighlight()V

    goto :goto_0

    .line 497
    :pswitch_2
    iget-boolean v1, p0, Lcom/apportable/ui/Label;->mUserInteractionEnabled:Z

    if-eqz v1, :cond_0

    .line 499
    iput-boolean v2, p0, Lcom/apportable/ui/Label;->mHighlighted:Z

    .line 500
    invoke-direct {p0}, Lcom/apportable/ui/Label;->updateHighlight()V

    goto :goto_0

    .line 485
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public setBaselineAdjustment(I)V
    .locals 0
    .parameter "adjustment"

    .prologue
    .line 339
    iput p1, p0, Lcom/apportable/ui/Label;->mBaselineAdjustment:I

    .line 341
    return-void
.end method

.method public setEnabled(Z)V
    .locals 0
    .parameter "enabled"

    .prologue
    .line 307
    iput-boolean p1, p0, Lcom/apportable/ui/Label;->mEnabled:Z

    .line 308
    return-void
.end method

.method public setFont(Landroid/graphics/Typeface;F)V
    .locals 2
    .parameter "font"
    .parameter "size"

    .prologue
    .line 233
    iput-object p1, p0, Lcom/apportable/ui/Label;->mTypeface:Landroid/graphics/Typeface;

    .line 234
    iput p2, p0, Lcom/apportable/ui/Label;->mFontSize:F

    .line 235
    iget-boolean v0, p0, Lcom/apportable/ui/Label;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 236
    new-instance v0, Lcom/apportable/ui/Label$4;

    invoke-direct {v0, p0, p1, p2}, Lcom/apportable/ui/Label$4;-><init>(Lcom/apportable/ui/Label;Landroid/graphics/Typeface;F)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Label;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 245
    :cond_0
    return-void
.end method

.method public setHighlighted(Z)V
    .locals 2
    .parameter "highlighted"

    .prologue
    .line 409
    iput-boolean p1, p0, Lcom/apportable/ui/Label;->mHighlighted:Z

    .line 410
    iget-boolean v0, p0, Lcom/apportable/ui/Label;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 411
    new-instance v0, Lcom/apportable/ui/Label$11;

    invoke-direct {v0, p0}, Lcom/apportable/ui/Label$11;-><init>(Lcom/apportable/ui/Label;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Label;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 418
    :cond_0
    return-void
.end method

.method public setHighlightedTextColor(I)V
    .locals 2
    .parameter "color"

    .prologue
    .line 386
    iput p1, p0, Lcom/apportable/ui/Label;->mHighlightedColor:I

    .line 387
    iget-boolean v0, p0, Lcom/apportable/ui/Label;->mInWindow:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/apportable/ui/Label;->mHighlighted:Z

    if-eqz v0, :cond_0

    .line 388
    new-instance v0, Lcom/apportable/ui/Label$10;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Label$10;-><init>(Lcom/apportable/ui/Label;I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Label;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 395
    :cond_0
    return-void
.end method

.method public setLineBreakMode(I)V
    .locals 0
    .parameter "lineBreakMode"

    .prologue
    .line 298
    iput p1, p0, Lcom/apportable/ui/Label;->mLineBreakMode:I

    .line 300
    return-void
.end method

.method public setMinimumFontSize(F)V
    .locals 2
    .parameter "sz"

    .prologue
    .line 348
    iput p1, p0, Lcom/apportable/ui/Label;->mMinimumFontSize:F

    .line 349
    iget-boolean v0, p0, Lcom/apportable/ui/Label;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 350
    new-instance v0, Lcom/apportable/ui/Label$8;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Label$8;-><init>(Lcom/apportable/ui/Label;F)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Label;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 357
    :cond_0
    return-void
.end method

.method public setNumberOfLines(I)V
    .locals 2
    .parameter "count"

    .prologue
    .line 364
    iput p1, p0, Lcom/apportable/ui/Label;->mNumberOfLines:I

    .line 365
    iget-boolean v0, p0, Lcom/apportable/ui/Label;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 366
    new-instance v0, Lcom/apportable/ui/Label$9;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Label$9;-><init>(Lcom/apportable/ui/Label;I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Label;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 373
    :cond_0
    return-void
.end method

.method public setShadowColor(I)V
    .locals 2
    .parameter "color"

    .prologue
    .line 445
    iget v0, p0, Lcom/apportable/ui/Label;->mShadowOffsetX:F

    iget v1, p0, Lcom/apportable/ui/Label;->mShadowOffsetY:F

    invoke-direct {p0, p1, v0, v1}, Lcom/apportable/ui/Label;->updateShadow(IFF)V

    .line 446
    return-void
.end method

.method public setShadowOffset(FF)V
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 453
    iget v0, p0, Lcom/apportable/ui/Label;->mShadowColor:I

    invoke-direct {p0, v0, p1, p2}, Lcom/apportable/ui/Label;->updateShadow(IFF)V

    .line 454
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 2
    .parameter "text"

    .prologue
    .line 217
    iput-object p1, p0, Lcom/apportable/ui/Label;->mText:Ljava/lang/String;

    .line 218
    iget-boolean v0, p0, Lcom/apportable/ui/Label;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 219
    new-instance v0, Lcom/apportable/ui/Label$3;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Label$3;-><init>(Lcom/apportable/ui/Label;Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Label;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 226
    :cond_0
    return-void
.end method

.method public setTextAlignment(I)V
    .locals 2
    .parameter "alignment"

    .prologue
    .line 272
    iput p1, p0, Lcom/apportable/ui/Label;->mTextAlignment:I

    .line 273
    iget-boolean v0, p0, Lcom/apportable/ui/Label;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 274
    new-instance v0, Lcom/apportable/ui/Label$6;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Label$6;-><init>(Lcom/apportable/ui/Label;I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Label;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 291
    :cond_0
    return-void
.end method

.method public setTextColor(I)V
    .locals 2
    .parameter "color"

    .prologue
    .line 256
    iput p1, p0, Lcom/apportable/ui/Label;->mTextColor:I

    .line 257
    iget-boolean v0, p0, Lcom/apportable/ui/Label;->mInWindow:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/apportable/ui/Label;->mHighlighted:Z

    if-nez v0, :cond_0

    .line 258
    new-instance v0, Lcom/apportable/ui/Label$5;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Label$5;-><init>(Lcom/apportable/ui/Label;I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Label;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 265
    :cond_0
    return-void
.end method

.method public setUserInteractionEnabled(Z)V
    .locals 2
    .parameter "enabled"

    .prologue
    const/4 v1, 0x0

    .line 465
    iput-boolean p1, p0, Lcom/apportable/ui/Label;->mUserInteractionEnabled:Z

    .line 466
    iget-boolean v0, p0, Lcom/apportable/ui/Label;->mUserInteractionEnabled:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/apportable/ui/Label;->mHighlighted:Z

    if-eqz v0, :cond_0

    .line 468
    iput-boolean v1, p0, Lcom/apportable/ui/Label;->mHighlighted:Z

    .line 469
    iget-boolean v0, p0, Lcom/apportable/ui/Label;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 470
    new-instance v0, Lcom/apportable/ui/Label$13;

    invoke-direct {v0, p0}, Lcom/apportable/ui/Label$13;-><init>(Lcom/apportable/ui/Label;)V

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Label;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 478
    :cond_0
    return-void
.end method

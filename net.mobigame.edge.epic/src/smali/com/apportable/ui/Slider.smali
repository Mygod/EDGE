.class Lcom/apportable/ui/Slider;
.super Lcom/apportable/ui/Control;
.source "Slider.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# static fields
.field private static RANGE:I


# instance fields
.field private mBackgroundImage:Landroid/graphics/drawable/Drawable;

.field private mContinuous:Z

.field private mProgress:I

.field private mProgressImage:Landroid/graphics/drawable/ClipDrawable;

.field private mSlider:Landroid/widget/SeekBar;

.field private mThumbImage:Landroid/graphics/drawable/Drawable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const/16 v0, 0x2710

    sput v0, Lcom/apportable/ui/Slider;->RANGE:I

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;I)V
    .locals 1
    .parameter "ctx"
    .parameter "object"

    .prologue
    const/4 v0, 0x0

    .line 103
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/Control;-><init>(Landroid/content/Context;I)V

    .line 21
    iput-object v0, p0, Lcom/apportable/ui/Slider;->mProgressImage:Landroid/graphics/drawable/ClipDrawable;

    .line 22
    iput-object v0, p0, Lcom/apportable/ui/Slider;->mThumbImage:Landroid/graphics/drawable/Drawable;

    .line 23
    iput-object v0, p0, Lcom/apportable/ui/Slider;->mBackgroundImage:Landroid/graphics/drawable/Drawable;

    .line 24
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/apportable/ui/Slider;->mContinuous:Z

    .line 104
    invoke-direct {p0}, Lcom/apportable/ui/Slider;->init()V

    .line 105
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;ILandroid/graphics/RectF;)V
    .locals 1
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    const/4 v0, 0x0

    .line 108
    invoke-direct {p0, p1, p2, p3}, Lcom/apportable/ui/Control;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 21
    iput-object v0, p0, Lcom/apportable/ui/Slider;->mProgressImage:Landroid/graphics/drawable/ClipDrawable;

    .line 22
    iput-object v0, p0, Lcom/apportable/ui/Slider;->mThumbImage:Landroid/graphics/drawable/Drawable;

    .line 23
    iput-object v0, p0, Lcom/apportable/ui/Slider;->mBackgroundImage:Landroid/graphics/drawable/Drawable;

    .line 24
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/apportable/ui/Slider;->mContinuous:Z

    .line 109
    invoke-direct {p0}, Lcom/apportable/ui/Slider;->init()V

    .line 110
    return-void
.end method

.method private _setBackgroundImage(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .parameter "drawable"

    .prologue
    .line 200
    iget-object v0, p0, Lcom/apportable/ui/Slider;->mSlider:Landroid/widget/SeekBar;

    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 201
    return-void
.end method

.method private _setProgressImage(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .parameter "drawable"

    .prologue
    .line 135
    iget-object v0, p0, Lcom/apportable/ui/Slider;->mSlider:Landroid/widget/SeekBar;

    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 136
    return-void
.end method

.method private _setThumbImage(Landroid/graphics/drawable/Drawable;)V
    .locals 2
    .parameter "drawable"

    .prologue
    .line 163
    iget-object v0, p0, Lcom/apportable/ui/Slider;->mSlider:Landroid/widget/SeekBar;

    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    .line 172
    iget-object v0, p0, Lcom/apportable/ui/Slider;->mSlider:Landroid/widget/SeekBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setThumbOffset(I)V

    .line 173
    return-void
.end method

.method static synthetic access$000(Lcom/apportable/ui/Slider;)Landroid/graphics/drawable/ClipDrawable;
    .locals 1
    .parameter "x0"

    .prologue
    .line 18
    iget-object v0, p0, Lcom/apportable/ui/Slider;->mProgressImage:Landroid/graphics/drawable/ClipDrawable;

    return-object v0
.end method

.method static synthetic access$100(Lcom/apportable/ui/Slider;)Landroid/widget/SeekBar;
    .locals 1
    .parameter "x0"

    .prologue
    .line 18
    iget-object v0, p0, Lcom/apportable/ui/Slider;->mSlider:Landroid/widget/SeekBar;

    return-object v0
.end method

.method static synthetic access$200(Lcom/apportable/ui/Slider;Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lcom/apportable/ui/Slider;->_setProgressImage(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method static synthetic access$300(Lcom/apportable/ui/Slider;Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lcom/apportable/ui/Slider;->_setThumbImage(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method static synthetic access$400(Lcom/apportable/ui/Slider;Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lcom/apportable/ui/Slider;->_setBackgroundImage(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public static create(Landroid/content/Context;I)Lcom/apportable/ui/Slider;
    .locals 2
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 36
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 37
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/Slider;>;"
    new-instance v1, Lcom/apportable/ui/Slider$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/apportable/ui/Slider$1;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;I)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 46
    monitor-enter p0

    .line 47
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_0

    .line 49
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 50
    :catch_0
    move-exception v1

    goto :goto_0

    .line 52
    :cond_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 53
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/Slider;

    return-object v1

    .line 52
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public static create(Landroid/content/Context;ILandroid/graphics/RectF;)Lcom/apportable/ui/Slider;
    .locals 2
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 57
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 58
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/Slider;>;"
    new-instance v1, Lcom/apportable/ui/Slider$2;

    invoke-direct {v1, p0, v0, p1, p2}, Lcom/apportable/ui/Slider$2;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;ILandroid/graphics/RectF;)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 67
    monitor-enter p0

    .line 68
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_0

    .line 70
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 71
    :catch_0
    move-exception v1

    goto :goto_0

    .line 73
    :cond_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 74
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/Slider;

    return-object v1

    .line 73
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
    .line 95
    new-instance v0, Landroid/widget/SeekBar;

    invoke-virtual {p0}, Lcom/apportable/ui/Slider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/apportable/ui/Slider;->mSlider:Landroid/widget/SeekBar;

    .line 96
    iget-object v0, p0, Lcom/apportable/ui/Slider;->mSlider:Landroid/widget/SeekBar;

    sget v1, Lcom/apportable/ui/Slider;->RANGE:I

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setMax(I)V

    .line 97
    iget-object v0, p0, Lcom/apportable/ui/Slider;->mSlider:Landroid/widget/SeekBar;

    invoke-virtual {v0, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 98
    iget-object v0, p0, Lcom/apportable/ui/Slider;->mSlider:Landroid/widget/SeekBar;

    sget v1, Lcom/apportable/ui/Slider;->RANGE:I

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 99
    iget-object v0, p0, Lcom/apportable/ui/Slider;->mSlider:Landroid/widget/SeekBar;

    new-instance v1, Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/apportable/ui/Slider;->getFrame()Landroid/graphics/RectF;

    move-result-object v2

    invoke-static {v2}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/apportable/ui/Slider;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Slider;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 100
    return-void
.end method


# virtual methods
.method public getValue()I
    .locals 1

    .prologue
    .line 91
    iget v0, p0, Lcom/apportable/ui/Slider;->mProgress:I

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .prologue
    .line 233
    invoke-super {p0}, Lcom/apportable/ui/Control;->onAttachedToWindow()V

    .line 234
    iget-object v0, p0, Lcom/apportable/ui/Slider;->mBackgroundImage:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    .line 235
    iget-object v0, p0, Lcom/apportable/ui/Slider;->mBackgroundImage:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v0}, Lcom/apportable/ui/Slider;->_setBackgroundImage(Landroid/graphics/drawable/Drawable;)V

    .line 236
    :cond_0
    iget-object v0, p0, Lcom/apportable/ui/Slider;->mProgressImage:Landroid/graphics/drawable/ClipDrawable;

    if-eqz v0, :cond_1

    .line 237
    iget-object v0, p0, Lcom/apportable/ui/Slider;->mProgressImage:Landroid/graphics/drawable/ClipDrawable;

    invoke-direct {p0, v0}, Lcom/apportable/ui/Slider;->_setProgressImage(Landroid/graphics/drawable/Drawable;)V

    .line 238
    :cond_1
    iget-object v0, p0, Lcom/apportable/ui/Slider;->mThumbImage:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_2

    .line 239
    iget-object v0, p0, Lcom/apportable/ui/Slider;->mThumbImage:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v0}, Lcom/apportable/ui/Slider;->_setThumbImage(Landroid/graphics/drawable/Drawable;)V

    .line 240
    :cond_2
    return-void
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 2
    .parameter "seekBar"
    .parameter "progress"
    .parameter "fromUser"

    .prologue
    .line 114
    iput p2, p0, Lcom/apportable/ui/Slider;->mProgress:I

    .line 115
    iget-object v0, p0, Lcom/apportable/ui/Slider;->mProgressImage:Landroid/graphics/drawable/ClipDrawable;

    if-eqz v0, :cond_0

    .line 116
    iget-object v0, p0, Lcom/apportable/ui/Slider;->mProgressImage:Landroid/graphics/drawable/ClipDrawable;

    iget v1, p0, Lcom/apportable/ui/Slider;->mProgress:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/ClipDrawable;->setLevel(I)Z

    .line 118
    :cond_0
    iget-boolean v0, p0, Lcom/apportable/ui/Slider;->mContinuous:Z

    if-eqz v0, :cond_1

    .line 119
    const/16 v0, 0x1000

    invoke-virtual {p0, v0}, Lcom/apportable/ui/Slider;->sendEvent(I)V

    .line 121
    :cond_1
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 1
    .parameter "seekBar"

    .prologue
    .line 124
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/apportable/ui/Slider;->sendEvent(I)V

    .line 125
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 1
    .parameter "seekBar"

    .prologue
    .line 128
    const/16 v0, 0x40

    invoke-virtual {p0, v0}, Lcom/apportable/ui/Slider;->sendEvent(I)V

    .line 129
    iget-boolean v0, p0, Lcom/apportable/ui/Slider;->mContinuous:Z

    if-nez v0, :cond_0

    .line 130
    const/16 v0, 0x1000

    invoke-virtual {p0, v0}, Lcom/apportable/ui/Slider;->sendEvent(I)V

    .line 132
    :cond_0
    return-void
.end method

.method protected setBackgroundImage(Landroid/graphics/drawable/Drawable;)V
    .locals 2
    .parameter "drawable"

    .prologue
    .line 204
    iput-object p1, p0, Lcom/apportable/ui/Slider;->mBackgroundImage:Landroid/graphics/drawable/Drawable;

    .line 205
    iget-boolean v0, p0, Lcom/apportable/ui/Slider;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 206
    new-instance v0, Lcom/apportable/ui/Slider$6;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Slider$6;-><init>(Lcom/apportable/ui/Slider;Landroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Slider;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 213
    :cond_0
    return-void
.end method

.method public setBackgroundImage(Ljava/lang/String;)V
    .locals 4
    .parameter "path"

    .prologue
    .line 217
    :try_start_0
    invoke-static {p1}, Lcom/apportable/utils/ImageUtils;->Drawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/apportable/ui/Slider;->setBackgroundImage(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 221
    :goto_0
    return-void

    .line 218
    :catch_0
    move-exception v0

    .line 219
    .local v0, e:Ljava/lang/Exception;
    const-string v1, "Slider"

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

.method public setBackgroundImage([BIIIIII)V
    .locals 1
    .parameter "bytes"
    .parameter "offset"
    .parameter "length"
    .parameter "imageWidth"
    .parameter "imageHeight"
    .parameter "scaledWidth"
    .parameter "scaledHeight"

    .prologue
    .line 224
    invoke-static {p1, p4, p5, p6, p7}, Lcom/apportable/utils/ImageUtils;->DrawableFromBytes([BIIII)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/apportable/ui/Slider;->setBackgroundImage(Landroid/graphics/drawable/Drawable;)V

    .line 225
    return-void
.end method

.method public setContinuous(Z)V
    .locals 0
    .parameter "value"

    .prologue
    .line 228
    iput-boolean p1, p0, Lcom/apportable/ui/Slider;->mContinuous:Z

    .line 229
    return-void
.end method

.method protected setProgressImage(Landroid/graphics/drawable/ClipDrawable;)V
    .locals 2
    .parameter "drawable"

    .prologue
    .line 139
    iput-object p1, p0, Lcom/apportable/ui/Slider;->mProgressImage:Landroid/graphics/drawable/ClipDrawable;

    .line 140
    iget-boolean v0, p0, Lcom/apportable/ui/Slider;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 141
    new-instance v0, Lcom/apportable/ui/Slider$4;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Slider$4;-><init>(Lcom/apportable/ui/Slider;Landroid/graphics/drawable/ClipDrawable;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Slider;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 148
    :cond_0
    return-void
.end method

.method public setProgressImage(Ljava/lang/String;)V
    .locals 5
    .parameter "path"

    .prologue
    .line 152
    :try_start_0
    new-instance v1, Landroid/graphics/drawable/ClipDrawable;

    invoke-static {p1}, Lcom/apportable/utils/ImageUtils;->Drawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const/16 v3, 0x77

    const/4 v4, 0x1

    invoke-direct {v1, v2, v3, v4}, Landroid/graphics/drawable/ClipDrawable;-><init>(Landroid/graphics/drawable/Drawable;II)V

    invoke-virtual {p0, v1}, Lcom/apportable/ui/Slider;->setProgressImage(Landroid/graphics/drawable/ClipDrawable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 156
    :goto_0
    return-void

    .line 153
    :catch_0
    move-exception v0

    .line 154
    .local v0, e:Ljava/lang/Exception;
    const-string v1, "Slider"

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

.method public setProgressImage([BIIIIII)V
    .locals 4
    .parameter "bytes"
    .parameter "offset"
    .parameter "length"
    .parameter "imageWidth"
    .parameter "imageHeight"
    .parameter "scaledWidth"
    .parameter "scaledHeight"

    .prologue
    .line 159
    new-instance v0, Landroid/graphics/drawable/ClipDrawable;

    invoke-static {p1, p4, p5, p6, p7}, Lcom/apportable/utils/ImageUtils;->DrawableFromBytes([BIIII)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    const/16 v2, 0x77

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Landroid/graphics/drawable/ClipDrawable;-><init>(Landroid/graphics/drawable/Drawable;II)V

    invoke-virtual {p0, v0}, Lcom/apportable/ui/Slider;->setProgressImage(Landroid/graphics/drawable/ClipDrawable;)V

    .line 160
    return-void
.end method

.method protected setThumbImage(Landroid/graphics/drawable/Drawable;)V
    .locals 2
    .parameter "drawable"

    .prologue
    .line 176
    iput-object p1, p0, Lcom/apportable/ui/Slider;->mThumbImage:Landroid/graphics/drawable/Drawable;

    .line 177
    iget-boolean v0, p0, Lcom/apportable/ui/Slider;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 178
    new-instance v0, Lcom/apportable/ui/Slider$5;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Slider$5;-><init>(Lcom/apportable/ui/Slider;Landroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Slider;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 185
    :cond_0
    return-void
.end method

.method public setThumbImage(Ljava/lang/String;)V
    .locals 4
    .parameter "path"

    .prologue
    .line 189
    :try_start_0
    invoke-static {p1}, Lcom/apportable/utils/ImageUtils;->Drawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/apportable/ui/Slider;->setThumbImage(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 193
    :goto_0
    return-void

    .line 190
    :catch_0
    move-exception v0

    .line 191
    .local v0, e:Ljava/lang/Exception;
    const-string v1, "Slider"

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

.method public setThumbImage([BIIIIII)V
    .locals 1
    .parameter "bytes"
    .parameter "offset"
    .parameter "length"
    .parameter "imageWidth"
    .parameter "imageHeight"
    .parameter "scaledWidth"
    .parameter "scaledHeight"

    .prologue
    .line 196
    invoke-static {p1, p4, p5, p6, p7}, Lcom/apportable/utils/ImageUtils;->DrawableWithInferredStatesFromBytes([BIIII)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/apportable/ui/Slider;->setThumbImage(Landroid/graphics/drawable/Drawable;)V

    .line 197
    return-void
.end method

.method public setValue(I)V
    .locals 2
    .parameter "value"

    .prologue
    .line 78
    iput p1, p0, Lcom/apportable/ui/Slider;->mProgress:I

    .line 79
    new-instance v0, Lcom/apportable/ui/Slider$3;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/Slider$3;-><init>(Lcom/apportable/ui/Slider;I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/Slider;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 88
    return-void
.end method

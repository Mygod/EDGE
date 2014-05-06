.class Lcom/apportable/ui/ImageView;
.super Lcom/apportable/ui/View;
.source "ImageView.java"


# instance fields
.field private mContentMode:I

.field private mImageHeight:I

.field private mImageView:Landroid/widget/ImageView;

.field private mImageWidth:I

.field private mPathStore:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Landroid/content/Context;I)V
    .locals 1
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 88
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;I)V

    .line 21
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/apportable/ui/ImageView;->mPathStore:Ljava/lang/String;

    .line 24
    const/4 v0, 0x0

    iput v0, p0, Lcom/apportable/ui/ImageView;->mContentMode:I

    .line 89
    invoke-direct {p0}, Lcom/apportable/ui/ImageView;->init()V

    .line 90
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;ILandroid/graphics/RectF;)V
    .locals 1
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 93
    invoke-direct {p0, p1, p2, p3}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 21
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/apportable/ui/ImageView;->mPathStore:Ljava/lang/String;

    .line 24
    const/4 v0, 0x0

    iput v0, p0, Lcom/apportable/ui/ImageView;->mContentMode:I

    .line 94
    invoke-direct {p0}, Lcom/apportable/ui/ImageView;->init()V

    .line 95
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/graphics/RectF;)V
    .locals 2
    .parameter "ctx"
    .parameter "frame"

    .prologue
    const/4 v1, 0x0

    .line 99
    invoke-direct {p0, p1, v1, p2}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 21
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/apportable/ui/ImageView;->mPathStore:Ljava/lang/String;

    .line 24
    iput v1, p0, Lcom/apportable/ui/ImageView;->mContentMode:I

    .line 100
    invoke-direct {p0}, Lcom/apportable/ui/ImageView;->init()V

    .line 101
    return-void
.end method

.method private _setBitmapDrawableFromPath(Ljava/lang/String;)V
    .locals 4
    .parameter "path"

    .prologue
    .line 127
    :try_start_0
    iget-object v1, p0, Lcom/apportable/ui/ImageView;->mImageView:Landroid/widget/ImageView;

    invoke-static {p1}, Lcom/apportable/utils/ImageUtils;->Drawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 131
    :goto_0
    return-void

    .line 128
    :catch_0
    move-exception v0

    .line 129
    .local v0, e:Ljava/io/IOException;
    const-string v1, "ImageView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not load image from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private _setContentMode(I)V
    .locals 2
    .parameter "mode"

    .prologue
    .line 205
    packed-switch p1, :pswitch_data_0

    .line 246
    :goto_0
    iget-object v0, p0, Lcom/apportable/ui/ImageView;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/apportable/ui/ImageView;->getFrame()Landroid/graphics/RectF;

    move-result-object v1

    invoke-static {v1}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/apportable/ui/ImageView;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 247
    return-void

    .line 207
    :pswitch_0
    iget-object v0, p0, Lcom/apportable/ui/ImageView;->mImageView:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_0

    .line 210
    :pswitch_1
    iget-object v0, p0, Lcom/apportable/ui/ImageView;->mImageView:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_0

    .line 213
    :pswitch_2
    iget-object v0, p0, Lcom/apportable/ui/ImageView;->mImageView:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_0

    .line 216
    :pswitch_3
    iget-object v0, p0, Lcom/apportable/ui/ImageView;->mImageView:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_0

    .line 219
    :pswitch_4
    iget-object v0, p0, Lcom/apportable/ui/ImageView;->mImageView:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_0

    .line 222
    :pswitch_5
    iget-object v0, p0, Lcom/apportable/ui/ImageView;->mImageView:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_0

    .line 225
    :pswitch_6
    iget-object v0, p0, Lcom/apportable/ui/ImageView;->mImageView:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_0

    .line 228
    :pswitch_7
    iget-object v0, p0, Lcom/apportable/ui/ImageView;->mImageView:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_0

    .line 231
    :pswitch_8
    iget-object v0, p0, Lcom/apportable/ui/ImageView;->mImageView:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_0

    .line 234
    :pswitch_9
    iget-object v0, p0, Lcom/apportable/ui/ImageView;->mImageView:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_0

    .line 237
    :pswitch_a
    iget-object v0, p0, Lcom/apportable/ui/ImageView;->mImageView:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_0

    .line 240
    :pswitch_b
    iget-object v0, p0, Lcom/apportable/ui/ImageView;->mImageView:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_0

    .line 243
    :pswitch_c
    iget-object v0, p0, Lcom/apportable/ui/ImageView;->mImageView:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_0

    .line 205
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
    .end packed-switch
.end method

.method static synthetic access$000(Lcom/apportable/ui/ImageView;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 19
    iget-object v0, p0, Lcom/apportable/ui/ImageView;->mImageView:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/apportable/ui/ImageView;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 19
    iget-object v0, p0, Lcom/apportable/ui/ImageView;->mPathStore:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/apportable/ui/ImageView;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/apportable/ui/ImageView;->_setBitmapDrawableFromPath(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/apportable/ui/ImageView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 19
    iget v0, p0, Lcom/apportable/ui/ImageView;->mContentMode:I

    return v0
.end method

.method static synthetic access$400(Lcom/apportable/ui/ImageView;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/apportable/ui/ImageView;->_setContentMode(I)V

    return-void
.end method

.method public static create(Landroid/content/Context;I)Lcom/apportable/ui/ImageView;
    .locals 2
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 27
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 28
    new-instance v1, Lcom/apportable/ui/ImageView;

    invoke-direct {v1, p0, p1}, Lcom/apportable/ui/ImageView;-><init>(Landroid/content/Context;I)V

    .line 47
    :goto_0
    return-object v1

    .line 30
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 31
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/ImageView;>;"
    new-instance v1, Lcom/apportable/ui/ImageView$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/apportable/ui/ImageView$1;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;I)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 40
    monitor-enter p0

    .line 41
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 43
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 44
    :catch_0
    move-exception v1

    goto :goto_1

    .line 46
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 47
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/ImageView;

    goto :goto_0

    .line 46
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public static create(Landroid/content/Context;ILandroid/graphics/RectF;)Lcom/apportable/ui/ImageView;
    .locals 2
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 52
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 53
    new-instance v1, Lcom/apportable/ui/ImageView;

    invoke-direct {v1, p0, p1, p2}, Lcom/apportable/ui/ImageView;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 72
    :goto_0
    return-object v1

    .line 55
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 56
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/ImageView;>;"
    new-instance v1, Lcom/apportable/ui/ImageView$2;

    invoke-direct {v1, p0, v0, p1, p2}, Lcom/apportable/ui/ImageView$2;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;ILandroid/graphics/RectF;)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 65
    monitor-enter p0

    .line 66
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 68
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 69
    :catch_0
    move-exception v1

    goto :goto_1

    .line 71
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 72
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/ImageView;

    goto :goto_0

    .line 71
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
    .line 77
    new-instance v0, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/apportable/ui/ImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/apportable/ui/ImageView;->mImageView:Landroid/widget/ImageView;

    .line 79
    iget-object v0, p0, Lcom/apportable/ui/ImageView;->mImageView:Landroid/widget/ImageView;

    new-instance v1, Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/apportable/ui/ImageView;->getFrame()Landroid/graphics/RectF;

    move-result-object v2

    invoke-static {v2}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/apportable/ui/ImageView;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/ImageView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    return-void
.end method


# virtual methods
.method protected _setFrame(Landroid/graphics/RectF;)V
    .locals 2
    .parameter "frame"

    .prologue
    .line 83
    invoke-super {p0, p1}, Lcom/apportable/ui/View;->_setFrame(Landroid/graphics/RectF;)V

    .line 84
    iget-object v0, p0, Lcom/apportable/ui/ImageView;->mImageView:Landroid/widget/ImageView;

    invoke-static {p1}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/apportable/ui/ImageView;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 85
    return-void
.end method

.method public getContentMode()I
    .locals 1

    .prologue
    .line 262
    iget v0, p0, Lcom/apportable/ui/ImageView;->mContentMode:I

    return v0
.end method

.method protected layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;
    .locals 7
    .parameter "frame"

    .prologue
    const/high16 v6, 0x4000

    .line 146
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v4

    float-to-int v1, v4

    .line 147
    .local v1, w:I
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v4

    float-to-int v0, v4

    .line 148
    .local v0, h:I
    iget v4, p1, Landroid/graphics/RectF;->left:F

    float-to-int v2, v4

    .line 149
    .local v2, x:I
    iget v4, p1, Landroid/graphics/RectF;->top:F

    float-to-int v3, v4

    .line 151
    .local v3, y:I
    iget v4, p0, Lcom/apportable/ui/ImageView;->mContentMode:I

    packed-switch v4, :pswitch_data_0

    .line 201
    :goto_0
    new-instance v4, Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-direct {v4, v1, v0, v2, v3}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(IIII)V

    return-object v4

    .line 153
    :pswitch_0
    iget v1, p0, Lcom/apportable/ui/ImageView;->mImageWidth:I

    .line 154
    iget v0, p0, Lcom/apportable/ui/ImageView;->mImageHeight:I

    .line 155
    const/4 v3, 0x2

    .line 156
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v4

    iget v5, p0, Lcom/apportable/ui/ImageView;->mImageWidth:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    div-float/2addr v4, v6

    float-to-int v2, v4

    .line 157
    goto :goto_0

    .line 159
    :pswitch_1
    iget v1, p0, Lcom/apportable/ui/ImageView;->mImageWidth:I

    .line 160
    iget v0, p0, Lcom/apportable/ui/ImageView;->mImageHeight:I

    .line 161
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v4

    float-to-int v4, v4

    iget v5, p0, Lcom/apportable/ui/ImageView;->mImageHeight:I

    sub-int v3, v4, v5

    .line 162
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v4

    iget v5, p0, Lcom/apportable/ui/ImageView;->mImageWidth:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    div-float/2addr v4, v6

    float-to-int v2, v4

    .line 163
    goto :goto_0

    .line 165
    :pswitch_2
    iget v1, p0, Lcom/apportable/ui/ImageView;->mImageWidth:I

    .line 166
    iget v0, p0, Lcom/apportable/ui/ImageView;->mImageHeight:I

    .line 167
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v4

    iget v5, p0, Lcom/apportable/ui/ImageView;->mImageHeight:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    div-float/2addr v4, v6

    float-to-int v3, v4

    .line 168
    const/4 v2, 0x0

    .line 169
    goto :goto_0

    .line 171
    :pswitch_3
    iget v1, p0, Lcom/apportable/ui/ImageView;->mImageWidth:I

    .line 172
    iget v0, p0, Lcom/apportable/ui/ImageView;->mImageHeight:I

    .line 173
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v4

    iget v5, p0, Lcom/apportable/ui/ImageView;->mImageHeight:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    div-float/2addr v4, v6

    float-to-int v3, v4

    .line 174
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v4

    iget v5, p0, Lcom/apportable/ui/ImageView;->mImageWidth:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    float-to-int v2, v4

    .line 175
    goto :goto_0

    .line 177
    :pswitch_4
    iget v1, p0, Lcom/apportable/ui/ImageView;->mImageWidth:I

    .line 178
    iget v0, p0, Lcom/apportable/ui/ImageView;->mImageHeight:I

    .line 179
    const/4 v3, 0x0

    .line 180
    const/4 v2, 0x0

    .line 181
    goto :goto_0

    .line 183
    :pswitch_5
    iget v1, p0, Lcom/apportable/ui/ImageView;->mImageWidth:I

    .line 184
    iget v0, p0, Lcom/apportable/ui/ImageView;->mImageHeight:I

    .line 185
    const/4 v3, 0x0

    .line 186
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v4

    iget v5, p0, Lcom/apportable/ui/ImageView;->mImageWidth:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    float-to-int v2, v4

    .line 187
    goto :goto_0

    .line 189
    :pswitch_6
    iget v1, p0, Lcom/apportable/ui/ImageView;->mImageWidth:I

    .line 190
    iget v0, p0, Lcom/apportable/ui/ImageView;->mImageHeight:I

    .line 191
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v4

    iget v5, p0, Lcom/apportable/ui/ImageView;->mImageHeight:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    float-to-int v3, v4

    .line 192
    const/4 v2, 0x0

    .line 193
    goto :goto_0

    .line 195
    :pswitch_7
    iget v1, p0, Lcom/apportable/ui/ImageView;->mImageWidth:I

    .line 196
    iget v0, p0, Lcom/apportable/ui/ImageView;->mImageHeight:I

    .line 197
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v4

    iget v5, p0, Lcom/apportable/ui/ImageView;->mImageHeight:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    float-to-int v3, v4

    .line 198
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v4

    iget v5, p0, Lcom/apportable/ui/ImageView;->mImageWidth:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    float-to-int v2, v4

    goto/16 :goto_0

    .line 151
    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .prologue
    .line 267
    invoke-super {p0}, Lcom/apportable/ui/View;->onAttachedToWindow()V

    .line 268
    iget-object v0, p0, Lcom/apportable/ui/ImageView;->mPathStore:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 269
    iget-object v0, p0, Lcom/apportable/ui/ImageView;->mPathStore:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/apportable/ui/ImageView;->_setBitmapDrawableFromPath(Ljava/lang/String;)V

    .line 270
    :cond_0
    iget v0, p0, Lcom/apportable/ui/ImageView;->mContentMode:I

    invoke-direct {p0, v0}, Lcom/apportable/ui/ImageView;->_setContentMode(I)V

    .line 271
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .prologue
    .line 275
    invoke-super {p0}, Lcom/apportable/ui/View;->onDetachedFromWindow()V

    .line 276
    iget-object v0, p0, Lcom/apportable/ui/ImageView;->mImageView:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 277
    return-void
.end method

.method public setBitmapDrawable(Landroid/graphics/Bitmap;)V
    .locals 3
    .parameter "bitmap"

    .prologue
    .line 104
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 105
    .local v0, drawable:Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iput v1, p0, Lcom/apportable/ui/ImageView;->mImageWidth:I

    .line 106
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    iput v1, p0, Lcom/apportable/ui/ImageView;->mImageHeight:I

    .line 107
    new-instance v1, Lcom/apportable/ui/ImageView$3;

    invoke-direct {v1, p0, v0}, Lcom/apportable/ui/ImageView$3;-><init>(Lcom/apportable/ui/ImageView;Landroid/graphics/drawable/BitmapDrawable;)V

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/apportable/ui/ImageView;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 113
    return-void
.end method

.method public setBitmapDrawableFromBytes([BIIIIII)V
    .locals 3
    .parameter "bytes"
    .parameter "offset"
    .parameter "length"
    .parameter "imageWidth"
    .parameter "imageHeight"
    .parameter "scaledWidth"
    .parameter "scaledHeight"

    .prologue
    .line 116
    invoke-static {p1, p4, p5, p6, p7}, Lcom/apportable/utils/ImageUtils;->DrawableFromBytes([BIIII)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 117
    .local v0, drawable:Landroid/graphics/drawable/Drawable;
    new-instance v1, Lcom/apportable/ui/ImageView$4;

    invoke-direct {v1, p0, v0}, Lcom/apportable/ui/ImageView$4;-><init>(Lcom/apportable/ui/ImageView;Landroid/graphics/drawable/Drawable;)V

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/apportable/ui/ImageView;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 123
    return-void
.end method

.method public setBitmapDrawableFromPath(Ljava/lang/String;)V
    .locals 2
    .parameter "path"

    .prologue
    .line 134
    iput-object p1, p0, Lcom/apportable/ui/ImageView;->mPathStore:Ljava/lang/String;

    .line 135
    iget-boolean v0, p0, Lcom/apportable/ui/ImageView;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 136
    new-instance v0, Lcom/apportable/ui/ImageView$5;

    invoke-direct {v0, p0}, Lcom/apportable/ui/ImageView$5;-><init>(Lcom/apportable/ui/ImageView;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/ImageView;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 143
    :cond_0
    return-void
.end method

.method public setContentMode(I)V
    .locals 2
    .parameter "mode"

    .prologue
    .line 250
    iput p1, p0, Lcom/apportable/ui/ImageView;->mContentMode:I

    .line 251
    iget-boolean v0, p0, Lcom/apportable/ui/ImageView;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 252
    new-instance v0, Lcom/apportable/ui/ImageView$6;

    invoke-direct {v0, p0}, Lcom/apportable/ui/ImageView$6;-><init>(Lcom/apportable/ui/ImageView;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/ImageView;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 259
    :cond_0
    return-void
.end method

.class Lcom/apportable/ui/MediaPlayer;
.super Lcom/apportable/ui/View;
.source "MediaPlayer.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# instance fields
.field private mMediaPlayer:Lcom/apportable/ui/VideoView;

.field private mPlaybackPossible:Z


# direct methods
.method protected constructor <init>(Landroid/app/Activity;I)V
    .locals 0
    .parameter "activity"
    .parameter "object"

    .prologue
    .line 68
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;I)V

    .line 69
    invoke-direct {p0, p1}, Lcom/apportable/ui/MediaPlayer;->init(Landroid/app/Activity;)V

    .line 70
    return-void
.end method

.method protected constructor <init>(Landroid/app/Activity;ILandroid/graphics/RectF;)V
    .locals 0
    .parameter "activity"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 73
    invoke-direct {p0, p1, p2, p3}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 74
    invoke-direct {p0, p1}, Lcom/apportable/ui/MediaPlayer;->init(Landroid/app/Activity;)V

    .line 75
    return-void
.end method

.method static synthetic access$000(Lcom/apportable/ui/MediaPlayer;)Lcom/apportable/ui/VideoView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 17
    iget-object v0, p0, Lcom/apportable/ui/MediaPlayer;->mMediaPlayer:Lcom/apportable/ui/VideoView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/apportable/ui/MediaPlayer;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 17
    iget-boolean v0, p0, Lcom/apportable/ui/MediaPlayer;->mPlaybackPossible:Z

    return v0
.end method

.method static synthetic access$102(Lcom/apportable/ui/MediaPlayer;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 17
    iput-boolean p1, p0, Lcom/apportable/ui/MediaPlayer;->mPlaybackPossible:Z

    return p1
.end method

.method static synthetic access$200(Lcom/apportable/ui/MediaPlayer;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lcom/apportable/ui/MediaPlayer;->playbackCompleted(I)V

    return-void
.end method

.method public static create(Landroid/app/Activity;I)Lcom/apportable/ui/MediaPlayer;
    .locals 2
    .parameter "activity"
    .parameter "object"

    .prologue
    .line 25
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 26
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/MediaPlayer;>;"
    new-instance v1, Lcom/apportable/ui/MediaPlayer$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/apportable/ui/MediaPlayer$1;-><init>(Landroid/app/Activity;Ljava/util/concurrent/atomic/AtomicReference;I)V

    invoke-virtual {p0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 35
    monitor-enter p0

    .line 36
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_0

    .line 38
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 39
    :catch_0
    move-exception v1

    goto :goto_0

    .line 41
    :cond_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 42
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/MediaPlayer;

    return-object v1

    .line 41
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public static create(Landroid/app/Activity;ILandroid/graphics/RectF;)Lcom/apportable/ui/MediaPlayer;
    .locals 2
    .parameter "activity"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 46
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 47
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/MediaPlayer;>;"
    new-instance v1, Lcom/apportable/ui/MediaPlayer$2;

    invoke-direct {v1, p0, v0, p1, p2}, Lcom/apportable/ui/MediaPlayer$2;-><init>(Landroid/app/Activity;Ljava/util/concurrent/atomic/AtomicReference;ILandroid/graphics/RectF;)V

    invoke-virtual {p0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 56
    monitor-enter p0

    .line 57
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_0

    .line 59
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 60
    :catch_0
    move-exception v1

    goto :goto_0

    .line 62
    :cond_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 63
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/MediaPlayer;

    return-object v1

    .line 62
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method private init(Landroid/app/Activity;)V
    .locals 3
    .parameter "activity"

    .prologue
    .line 79
    new-instance v0, Lcom/apportable/ui/VideoView;

    invoke-direct {v0, p1}, Lcom/apportable/ui/VideoView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/apportable/ui/MediaPlayer;->mMediaPlayer:Lcom/apportable/ui/VideoView;

    .line 80
    iget-object v0, p0, Lcom/apportable/ui/MediaPlayer;->mMediaPlayer:Lcom/apportable/ui/VideoView;

    invoke-virtual {v0, p0}, Lcom/apportable/ui/VideoView;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 81
    iget-object v0, p0, Lcom/apportable/ui/MediaPlayer;->mMediaPlayer:Lcom/apportable/ui/VideoView;

    new-instance v1, Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/apportable/ui/MediaPlayer;->getFrame()Landroid/graphics/RectF;

    move-result-object v2

    invoke-static {v2}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/apportable/ui/MediaPlayer;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/MediaPlayer;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 82
    return-void
.end method

.method private native playbackCompleted(I)V
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 2
    .parameter "mp"

    .prologue
    .line 141
    new-instance v0, Lcom/apportable/ui/MediaPlayer$7;

    invoke-direct {v0, p0}, Lcom/apportable/ui/MediaPlayer$7;-><init>(Lcom/apportable/ui/MediaPlayer;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/MediaPlayer;->runOnGlThread(Ljava/lang/Runnable;Z)V

    .line 147
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 7
    .parameter "changed"
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    .line 151
    invoke-super/range {p0 .. p5}, Lcom/apportable/ui/View;->onLayout(ZIIII)V

    .line 154
    iget-object v2, p0, Lcom/apportable/ui/MediaPlayer;->mMediaPlayer:Lcom/apportable/ui/VideoView;

    invoke-virtual {v2}, Lcom/apportable/ui/VideoView;->getVisibility()I

    move-result v2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_0

    .line 155
    new-instance v0, Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/apportable/ui/MediaPlayer;->getPaddingLeft()I

    move-result v2

    invoke-virtual {p0}, Lcom/apportable/ui/MediaPlayer;->getPaddingTop()I

    move-result v3

    sub-int v4, p4, p2

    invoke-virtual {p0}, Lcom/apportable/ui/MediaPlayer;->getPaddingRight()I

    move-result v5

    sub-int/2addr v4, v5

    sub-int v5, p5, p3

    invoke-virtual {p0}, Lcom/apportable/ui/MediaPlayer;->getPaddingBottom()I

    move-result v6

    sub-int/2addr v5, v6

    invoke-direct {v0, v2, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 159
    .local v0, frameRect:Landroid/graphics/Rect;
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 160
    .local v1, playerRect:Landroid/graphics/Rect;
    const/16 v2, 0x11

    iget-object v3, p0, Lcom/apportable/ui/MediaPlayer;->mMediaPlayer:Lcom/apportable/ui/VideoView;

    invoke-virtual {v3}, Lcom/apportable/ui/VideoView;->getMeasuredWidth()I

    move-result v3

    iget-object v4, p0, Lcom/apportable/ui/MediaPlayer;->mMediaPlayer:Lcom/apportable/ui/VideoView;

    invoke-virtual {v4}, Lcom/apportable/ui/VideoView;->getMeasuredHeight()I

    move-result v4

    invoke-static {v2, v3, v4, v0, v1}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 163
    iget-object v2, p0, Lcom/apportable/ui/MediaPlayer;->mMediaPlayer:Lcom/apportable/ui/VideoView;

    iget v3, v1, Landroid/graphics/Rect;->left:I

    iget v4, v1, Landroid/graphics/Rect;->top:I

    iget v5, v1, Landroid/graphics/Rect;->right:I

    iget v6, v1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/apportable/ui/VideoView;->layout(IIII)V

    .line 167
    .end local v0           #frameRect:Landroid/graphics/Rect;
    .end local v1           #playerRect:Landroid/graphics/Rect;
    :cond_0
    return-void
.end method

.method public pause()V
    .locals 2

    .prologue
    .line 122
    new-instance v0, Lcom/apportable/ui/MediaPlayer$5;

    invoke-direct {v0, p0}, Lcom/apportable/ui/MediaPlayer$5;-><init>(Lcom/apportable/ui/MediaPlayer;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/MediaPlayer;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 128
    return-void
.end method

.method public play()V
    .locals 2

    .prologue
    .line 105
    new-instance v0, Lcom/apportable/ui/MediaPlayer$4;

    invoke-direct {v0, p0}, Lcom/apportable/ui/MediaPlayer$4;-><init>(Lcom/apportable/ui/MediaPlayer;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/MediaPlayer;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 119
    return-void
.end method

.method public setContentURI(Ljava/lang/String;)V
    .locals 2
    .parameter "uriString"

    .prologue
    .line 85
    new-instance v0, Lcom/apportable/ui/MediaPlayer$3;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/MediaPlayer$3;-><init>(Lcom/apportable/ui/MediaPlayer;Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/MediaPlayer;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 102
    return-void
.end method

.method public stop()V
    .locals 2

    .prologue
    .line 131
    new-instance v0, Lcom/apportable/ui/MediaPlayer$6;

    invoke-direct {v0, p0}, Lcom/apportable/ui/MediaPlayer$6;-><init>(Lcom/apportable/ui/MediaPlayer;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/MediaPlayer;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 137
    return-void
.end method

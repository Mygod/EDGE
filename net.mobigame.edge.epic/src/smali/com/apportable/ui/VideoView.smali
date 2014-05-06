.class public Lcom/apportable/ui/VideoView;
.super Landroid/view/SurfaceView;
.source "VideoView.java"

# interfaces
.implements Landroid/widget/MediaController$MediaPlayerControl;


# static fields
.field private static final METADATA_PAUSE_AVAILABLE:I = 0x1d

.field private static final METADATA_SEEK_BACKWARD_AVAILABLE:I = 0x1e

.field private static final METADATA_SEEK_FORWARD_AVAILABLE:I = 0x1f

.field private static final STATE_ERROR:I = -0x1

.field private static final STATE_IDLE:I = 0x0

.field private static final STATE_PAUSED:I = 0x4

.field private static final STATE_PLAYBACK_COMPLETED:I = 0x5

.field private static final STATE_PLAYING:I = 0x3

.field private static final STATE_PREPARED:I = 0x2

.field private static final STATE_PREPARING:I = 0x1


# instance fields
.field private TAG:Ljava/lang/String;

.field private mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

.field private mCanPause:Z

.field private mCanSeekBack:Z

.field private mCanSeekForward:Z

.field private mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

.field private mCurrentBufferPercentage:I

.field private mCurrentState:I

.field private mDuration:I

.field private mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

.field private mFd:Ljava/io/FileDescriptor;

.field private mFdLength:J

.field private mFdOffset:J

.field private mMediaController:Landroid/widget/MediaController;

.field private mMediaPlayer:Landroid/media/MediaPlayer;

.field private mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

.field private mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

.field private mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

.field mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

.field mSHCallback:Landroid/view/SurfaceHolder$Callback;

.field private mSeekWhenPrepared:I

.field mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

.field private mSurfaceHeight:I

.field private mSurfaceHolder:Landroid/view/SurfaceHolder;

.field private mSurfaceWidth:I

.field private mTargetState:I

.field private mUri:Landroid/net/Uri;

.field private mVideoHeight:I

.field private mVideoWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 71
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 28
    const-string v0, "VideoView"

    iput-object v0, p0, Lcom/apportable/ui/VideoView;->TAG:Ljava/lang/String;

    .line 50
    iput v1, p0, Lcom/apportable/ui/VideoView;->mCurrentState:I

    .line 51
    iput v1, p0, Lcom/apportable/ui/VideoView;->mTargetState:I

    .line 54
    iput-object v2, p0, Lcom/apportable/ui/VideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 55
    iput-object v2, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 264
    new-instance v0, Lcom/apportable/ui/VideoView$1;

    invoke-direct {v0, p0}, Lcom/apportable/ui/VideoView$1;-><init>(Lcom/apportable/ui/VideoView;)V

    iput-object v0, p0, Lcom/apportable/ui/VideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    .line 275
    new-instance v0, Lcom/apportable/ui/VideoView$2;

    invoke-direct {v0, p0}, Lcom/apportable/ui/VideoView$2;-><init>(Lcom/apportable/ui/VideoView;)V

    iput-object v0, p0, Lcom/apportable/ui/VideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 336
    new-instance v0, Lcom/apportable/ui/VideoView$3;

    invoke-direct {v0, p0}, Lcom/apportable/ui/VideoView$3;-><init>(Lcom/apportable/ui/VideoView;)V

    iput-object v0, p0, Lcom/apportable/ui/VideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 350
    new-instance v0, Lcom/apportable/ui/VideoView$4;

    invoke-direct {v0, p0}, Lcom/apportable/ui/VideoView$4;-><init>(Lcom/apportable/ui/VideoView;)V

    iput-object v0, p0, Lcom/apportable/ui/VideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    .line 371
    new-instance v0, Lcom/apportable/ui/VideoView$5;

    invoke-direct {v0, p0}, Lcom/apportable/ui/VideoView$5;-><init>(Lcom/apportable/ui/VideoView;)V

    iput-object v0, p0, Lcom/apportable/ui/VideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    .line 413
    new-instance v0, Lcom/apportable/ui/VideoView$6;

    invoke-direct {v0, p0}, Lcom/apportable/ui/VideoView$6;-><init>(Lcom/apportable/ui/VideoView;)V

    iput-object v0, p0, Lcom/apportable/ui/VideoView;->mSHCallback:Landroid/view/SurfaceHolder$Callback;

    .line 72
    invoke-direct {p0}, Lcom/apportable/ui/VideoView;->initVideoView()V

    .line 73
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 76
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/apportable/ui/VideoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 77
    invoke-direct {p0}, Lcom/apportable/ui/VideoView;->initVideoView()V

    .line 78
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 81
    invoke-direct {p0, p1, p2, p3}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 28
    const-string v0, "VideoView"

    iput-object v0, p0, Lcom/apportable/ui/VideoView;->TAG:Ljava/lang/String;

    .line 50
    iput v1, p0, Lcom/apportable/ui/VideoView;->mCurrentState:I

    .line 51
    iput v1, p0, Lcom/apportable/ui/VideoView;->mTargetState:I

    .line 54
    iput-object v2, p0, Lcom/apportable/ui/VideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 55
    iput-object v2, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 264
    new-instance v0, Lcom/apportable/ui/VideoView$1;

    invoke-direct {v0, p0}, Lcom/apportable/ui/VideoView$1;-><init>(Lcom/apportable/ui/VideoView;)V

    iput-object v0, p0, Lcom/apportable/ui/VideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    .line 275
    new-instance v0, Lcom/apportable/ui/VideoView$2;

    invoke-direct {v0, p0}, Lcom/apportable/ui/VideoView$2;-><init>(Lcom/apportable/ui/VideoView;)V

    iput-object v0, p0, Lcom/apportable/ui/VideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 336
    new-instance v0, Lcom/apportable/ui/VideoView$3;

    invoke-direct {v0, p0}, Lcom/apportable/ui/VideoView$3;-><init>(Lcom/apportable/ui/VideoView;)V

    iput-object v0, p0, Lcom/apportable/ui/VideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 350
    new-instance v0, Lcom/apportable/ui/VideoView$4;

    invoke-direct {v0, p0}, Lcom/apportable/ui/VideoView$4;-><init>(Lcom/apportable/ui/VideoView;)V

    iput-object v0, p0, Lcom/apportable/ui/VideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    .line 371
    new-instance v0, Lcom/apportable/ui/VideoView$5;

    invoke-direct {v0, p0}, Lcom/apportable/ui/VideoView$5;-><init>(Lcom/apportable/ui/VideoView;)V

    iput-object v0, p0, Lcom/apportable/ui/VideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    .line 413
    new-instance v0, Lcom/apportable/ui/VideoView$6;

    invoke-direct {v0, p0}, Lcom/apportable/ui/VideoView$6;-><init>(Lcom/apportable/ui/VideoView;)V

    iput-object v0, p0, Lcom/apportable/ui/VideoView;->mSHCallback:Landroid/view/SurfaceHolder$Callback;

    .line 82
    invoke-direct {p0}, Lcom/apportable/ui/VideoView;->initVideoView()V

    .line 83
    return-void
.end method

.method static synthetic access$000(Lcom/apportable/ui/VideoView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 27
    iget v0, p0, Lcom/apportable/ui/VideoView;->mVideoWidth:I

    return v0
.end method

.method static synthetic access$002(Lcom/apportable/ui/VideoView;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 27
    iput p1, p0, Lcom/apportable/ui/VideoView;->mVideoWidth:I

    return p1
.end method

.method static synthetic access$100(Lcom/apportable/ui/VideoView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 27
    iget v0, p0, Lcom/apportable/ui/VideoView;->mVideoHeight:I

    return v0
.end method

.method static synthetic access$1000(Lcom/apportable/ui/VideoView;)Landroid/media/MediaPlayer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 27
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    return-object v0
.end method

.method static synthetic access$102(Lcom/apportable/ui/VideoView;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 27
    iput p1, p0, Lcom/apportable/ui/VideoView;->mVideoHeight:I

    return p1
.end method

.method static synthetic access$1100(Lcom/apportable/ui/VideoView;)Landroid/widget/MediaController;
    .locals 1
    .parameter "x0"

    .prologue
    .line 27
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/apportable/ui/VideoView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 27
    iget v0, p0, Lcom/apportable/ui/VideoView;->mSeekWhenPrepared:I

    return v0
.end method

.method static synthetic access$1300(Lcom/apportable/ui/VideoView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 27
    iget v0, p0, Lcom/apportable/ui/VideoView;->mSurfaceWidth:I

    return v0
.end method

.method static synthetic access$1302(Lcom/apportable/ui/VideoView;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 27
    iput p1, p0, Lcom/apportable/ui/VideoView;->mSurfaceWidth:I

    return p1
.end method

.method static synthetic access$1400(Lcom/apportable/ui/VideoView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 27
    iget v0, p0, Lcom/apportable/ui/VideoView;->mSurfaceHeight:I

    return v0
.end method

.method static synthetic access$1402(Lcom/apportable/ui/VideoView;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 27
    iput p1, p0, Lcom/apportable/ui/VideoView;->mSurfaceHeight:I

    return p1
.end method

.method static synthetic access$1500(Lcom/apportable/ui/VideoView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 27
    iget v0, p0, Lcom/apportable/ui/VideoView;->mTargetState:I

    return v0
.end method

.method static synthetic access$1502(Lcom/apportable/ui/VideoView;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 27
    iput p1, p0, Lcom/apportable/ui/VideoView;->mTargetState:I

    return p1
.end method

.method static synthetic access$1600(Lcom/apportable/ui/VideoView;)Landroid/media/MediaPlayer$OnCompletionListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 27
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/apportable/ui/VideoView;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 27
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/apportable/ui/VideoView;)Landroid/media/MediaPlayer$OnErrorListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 27
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    return-object v0
.end method

.method static synthetic access$1902(Lcom/apportable/ui/VideoView;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 27
    iput p1, p0, Lcom/apportable/ui/VideoView;->mCurrentBufferPercentage:I

    return p1
.end method

.method static synthetic access$2002(Lcom/apportable/ui/VideoView;Landroid/view/SurfaceHolder;)Landroid/view/SurfaceHolder;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 27
    iput-object p1, p0, Lcom/apportable/ui/VideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    return-object p1
.end method

.method static synthetic access$202(Lcom/apportable/ui/VideoView;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 27
    iput p1, p0, Lcom/apportable/ui/VideoView;->mCurrentState:I

    return p1
.end method

.method static synthetic access$2100(Lcom/apportable/ui/VideoView;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/apportable/ui/VideoView;->openVideo()V

    return-void
.end method

.method static synthetic access$2200(Lcom/apportable/ui/VideoView;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lcom/apportable/ui/VideoView;->release(Z)V

    return-void
.end method

.method static synthetic access$300(Landroid/media/MediaPlayer;ZZ)Ljava/lang/Object;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 27
    invoke-static {p0, p1, p2}, Lcom/apportable/ui/VideoView;->getMetadata(Landroid/media/MediaPlayer;ZZ)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$402(Lcom/apportable/ui/VideoView;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 27
    iput-boolean p1, p0, Lcom/apportable/ui/VideoView;->mCanPause:Z

    return p1
.end method

.method static synthetic access$500(Ljava/lang/Object;I)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 27
    invoke-static {p0, p1}, Lcom/apportable/ui/VideoView;->metadataHas(Ljava/lang/Object;I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$600(Ljava/lang/Object;I)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 27
    invoke-static {p0, p1}, Lcom/apportable/ui/VideoView;->metadataGetBoolean(Ljava/lang/Object;I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$702(Lcom/apportable/ui/VideoView;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 27
    iput-boolean p1, p0, Lcom/apportable/ui/VideoView;->mCanSeekBack:Z

    return p1
.end method

.method static synthetic access$802(Lcom/apportable/ui/VideoView;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 27
    iput-boolean p1, p0, Lcom/apportable/ui/VideoView;->mCanSeekForward:Z

    return p1
.end method

.method static synthetic access$900(Lcom/apportable/ui/VideoView;)Landroid/media/MediaPlayer$OnPreparedListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 27
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    return-object v0
.end method

.method private attachMediaController()V
    .locals 3

    .prologue
    .line 255
    iget-object v1, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v1, :cond_0

    .line 256
    iget-object v1, p0, Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v1, p0}, Landroid/widget/MediaController;->setMediaPlayer(Landroid/widget/MediaController$MediaPlayerControl;)V

    .line 257
    invoke-virtual {p0}, Lcom/apportable/ui/VideoView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/View;

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/apportable/ui/VideoView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    move-object v0, v1

    .line 259
    .local v0, anchorView:Landroid/view/View;
    :goto_0
    iget-object v1, p0, Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v1, v0}, Landroid/widget/MediaController;->setAnchorView(Landroid/view/View;)V

    .line 260
    iget-object v1, p0, Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-direct {p0}, Lcom/apportable/ui/VideoView;->isInPlaybackState()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/MediaController;->setEnabled(Z)V

    .line 262
    .end local v0           #anchorView:Landroid/view/View;
    :cond_0
    return-void

    :cond_1
    move-object v0, p0

    .line 257
    goto :goto_0
.end method

.method private static getMetadata(Landroid/media/MediaPlayer;ZZ)Ljava/lang/Object;
    .locals 1
    .parameter "mp"
    .parameter "updateOnly"
    .parameter "applyFilter"

    .prologue
    .line 607
    const/4 v0, 0x0

    return-object v0
.end method

.method private getVideoContentDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 176
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mUri:Landroid/net/Uri;

    if-eqz v0, :cond_0

    .line 177
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mUri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    .line 181
    :goto_0
    return-object v0

    .line 178
    :cond_0
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mFd:Ljava/io/FileDescriptor;

    if-eqz v0, :cond_1

    .line 179
    const-string v0, "<file descriptor>"

    goto :goto_0

    .line 181
    :cond_1
    const-string v0, "<no content>"

    goto :goto_0
.end method

.method private hasVideoContent()Z
    .locals 1

    .prologue
    .line 172
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mUri:Landroid/net/Uri;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mFd:Ljava/io/FileDescriptor;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private initVideoView()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 137
    iput v2, p0, Lcom/apportable/ui/VideoView;->mVideoWidth:I

    .line 138
    iput v2, p0, Lcom/apportable/ui/VideoView;->mVideoHeight:I

    .line 139
    invoke-virtual {p0}, Lcom/apportable/ui/VideoView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/VideoView;->mSHCallback:Landroid/view/SurfaceHolder$Callback;

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 140
    invoke-virtual {p0}, Lcom/apportable/ui/VideoView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 141
    invoke-virtual {p0, v3}, Lcom/apportable/ui/VideoView;->setFocusable(Z)V

    .line 142
    invoke-virtual {p0, v3}, Lcom/apportable/ui/VideoView;->setFocusableInTouchMode(Z)V

    .line 143
    invoke-virtual {p0}, Lcom/apportable/ui/VideoView;->requestFocus()Z

    .line 144
    iput v2, p0, Lcom/apportable/ui/VideoView;->mCurrentState:I

    .line 145
    iput v2, p0, Lcom/apportable/ui/VideoView;->mTargetState:I

    .line 146
    return-void
.end method

.method private isInPlaybackState()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 578
    iget-object v1, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/apportable/ui/VideoView;->mCurrentState:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    iget v1, p0, Lcom/apportable/ui/VideoView;->mCurrentState:I

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/apportable/ui/VideoView;->mCurrentState:I

    if-eq v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static metadataGetBoolean(Ljava/lang/Object;I)Z
    .locals 1
    .parameter "metadata"
    .parameter "metadataId"

    .prologue
    .line 617
    const/4 v0, 0x1

    return v0
.end method

.method private static metadataHas(Ljava/lang/Object;I)Z
    .locals 1
    .parameter "metadata"
    .parameter "metadataId"

    .prologue
    .line 612
    const/4 v0, 0x1

    return v0
.end method

.method private openVideo()V
    .locals 11

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    const/4 v8, -0x1

    .line 196
    invoke-direct {p0}, Lcom/apportable/ui/VideoView;->hasVideoContent()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    if-nez v0, :cond_1

    .line 244
    :cond_0
    :goto_0
    return-void

    .line 202
    :cond_1
    new-instance v7, Landroid/content/Intent;

    const-string v0, "com.android.music.musicservicecommand"

    invoke-direct {v7, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 203
    .local v7, i:Landroid/content/Intent;
    const-string v0, "command"

    const-string v1, "pause"

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 204
    invoke-virtual {p0}, Lcom/apportable/ui/VideoView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 208
    invoke-direct {p0, v9}, Lcom/apportable/ui/VideoView;->release(Z)V

    .line 210
    :try_start_0
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 211
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lcom/apportable/ui/VideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 212
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lcom/apportable/ui/VideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnVideoSizeChangedListener(Landroid/media/MediaPlayer$OnVideoSizeChangedListener;)V

    .line 213
    const/4 v0, -0x1

    iput v0, p0, Lcom/apportable/ui/VideoView;->mDuration:I

    .line 214
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lcom/apportable/ui/VideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 215
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lcom/apportable/ui/VideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 216
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lcom/apportable/ui/VideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnBufferingUpdateListener(Landroid/media/MediaPlayer$OnBufferingUpdateListener;)V

    .line 217
    const/4 v0, 0x0

    iput v0, p0, Lcom/apportable/ui/VideoView;->mCurrentBufferPercentage:I

    .line 218
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mFd:Ljava/io/FileDescriptor;

    if-eqz v0, :cond_2

    .line 219
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lcom/apportable/ui/VideoView;->mFd:Ljava/io/FileDescriptor;

    iget-wide v2, p0, Lcom/apportable/ui/VideoView;->mFdOffset:J

    iget-wide v4, p0, Lcom/apportable/ui/VideoView;->mFdLength:J

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 223
    :goto_1
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lcom/apportable/ui/VideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    .line 224
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 225
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setScreenOnWhilePlaying(Z)V

    .line 226
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 229
    const/4 v0, 0x1

    iput v0, p0, Lcom/apportable/ui/VideoView;->mCurrentState:I

    .line 230
    invoke-direct {p0}, Lcom/apportable/ui/VideoView;->attachMediaController()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 231
    :catch_0
    move-exception v6

    .line 232
    .local v6, ex:Ljava/io/IOException;
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to open content: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0}, Lcom/apportable/ui/VideoView;->getVideoContentDescription()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 233
    iput v8, p0, Lcom/apportable/ui/VideoView;->mCurrentState:I

    .line 234
    iput v8, p0, Lcom/apportable/ui/VideoView;->mTargetState:I

    .line 235
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    iget-object v1, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-interface {v0, v1, v10, v9}, Landroid/media/MediaPlayer$OnErrorListener;->onError(Landroid/media/MediaPlayer;II)Z

    goto/16 :goto_0

    .line 221
    .end local v6           #ex:Ljava/io/IOException;
    :cond_2
    :try_start_1
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p0}, Lcom/apportable/ui/VideoView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/apportable/ui/VideoView;->mUri:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 237
    :catch_1
    move-exception v6

    .line 238
    .local v6, ex:Ljava/lang/IllegalArgumentException;
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to open content: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0}, Lcom/apportable/ui/VideoView;->getVideoContentDescription()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 239
    iput v8, p0, Lcom/apportable/ui/VideoView;->mCurrentState:I

    .line 240
    iput v8, p0, Lcom/apportable/ui/VideoView;->mTargetState:I

    .line 241
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    iget-object v1, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-interface {v0, v1, v10, v9}, Landroid/media/MediaPlayer$OnErrorListener;->onError(Landroid/media/MediaPlayer;II)Z

    goto/16 :goto_0
.end method

.method private release(Z)V
    .locals 2
    .parameter "cleartargetstate"

    .prologue
    const/4 v1, 0x0

    .line 452
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 453
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    .line 454
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 455
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 456
    iput v1, p0, Lcom/apportable/ui/VideoView;->mCurrentState:I

    .line 457
    if-eqz p1, :cond_0

    .line 458
    iput v1, p0, Lcom/apportable/ui/VideoView;->mTargetState:I

    .line 461
    :cond_0
    return-void
.end method

.method private setVideoContent(Landroid/net/Uri;Ljava/io/FileDescriptor;JJ)V
    .locals 1
    .parameter "uri"
    .parameter "fd"
    .parameter "fdOffset"
    .parameter "fdLength"

    .prologue
    .line 161
    iput-object p1, p0, Lcom/apportable/ui/VideoView;->mUri:Landroid/net/Uri;

    .line 162
    iput-object p2, p0, Lcom/apportable/ui/VideoView;->mFd:Ljava/io/FileDescriptor;

    .line 163
    iput-wide p3, p0, Lcom/apportable/ui/VideoView;->mFdOffset:J

    .line 164
    iput-wide p5, p0, Lcom/apportable/ui/VideoView;->mFdLength:J

    .line 165
    const/4 v0, 0x0

    iput v0, p0, Lcom/apportable/ui/VideoView;->mSeekWhenPrepared:I

    .line 166
    invoke-direct {p0}, Lcom/apportable/ui/VideoView;->openVideo()V

    .line 167
    invoke-virtual {p0}, Lcom/apportable/ui/VideoView;->requestLayout()V

    .line 168
    invoke-virtual {p0}, Lcom/apportable/ui/VideoView;->invalidate()V

    .line 169
    return-void
.end method

.method private toggleMediaControlsVisiblity()V
    .locals 1

    .prologue
    .line 512
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 513
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    .line 517
    :goto_0
    return-void

    .line 515
    :cond_0
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->show()V

    goto :goto_0
.end method


# virtual methods
.method public canPause()Z
    .locals 1

    .prologue
    .line 585
    iget-boolean v0, p0, Lcom/apportable/ui/VideoView;->mCanPause:Z

    return v0
.end method

.method public canSeekBackward()Z
    .locals 1

    .prologue
    .line 589
    iget-boolean v0, p0, Lcom/apportable/ui/VideoView;->mCanSeekBack:Z

    return v0
.end method

.method public canSeekForward()Z
    .locals 1

    .prologue
    .line 593
    iget-boolean v0, p0, Lcom/apportable/ui/VideoView;->mCanSeekForward:Z

    return v0
.end method

.method public getBufferPercentage()I
    .locals 1

    .prologue
    .line 571
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 572
    iget v0, p0, Lcom/apportable/ui/VideoView;->mCurrentBufferPercentage:I

    .line 574
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCurrentPosition()I
    .locals 1

    .prologue
    .line 551
    invoke-direct {p0}, Lcom/apportable/ui/VideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 552
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    .line 554
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getDuration()I
    .locals 1

    .prologue
    .line 539
    invoke-direct {p0}, Lcom/apportable/ui/VideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 540
    iget v0, p0, Lcom/apportable/ui/VideoView;->mDuration:I

    if-lez v0, :cond_0

    .line 541
    iget v0, p0, Lcom/apportable/ui/VideoView;->mDuration:I

    .line 547
    :goto_0
    return v0

    .line 543
    :cond_0
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v0

    iput v0, p0, Lcom/apportable/ui/VideoView;->mDuration:I

    .line 544
    iget v0, p0, Lcom/apportable/ui/VideoView;->mDuration:I

    goto :goto_0

    .line 546
    :cond_1
    const/4 v0, -0x1

    iput v0, p0, Lcom/apportable/ui/VideoView;->mDuration:I

    .line 547
    iget v0, p0, Lcom/apportable/ui/VideoView;->mDuration:I

    goto :goto_0
.end method

.method public isPlaying()Z
    .locals 1

    .prologue
    .line 567
    invoke-direct {p0}, Lcom/apportable/ui/VideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v1, 0x1

    .line 482
    const/4 v2, 0x4

    if-eq p1, v2, :cond_1

    const/16 v2, 0x18

    if-eq p1, v2, :cond_1

    const/16 v2, 0x19

    if-eq p1, v2, :cond_1

    const/16 v2, 0x52

    if-eq p1, v2, :cond_1

    const/4 v2, 0x5

    if-eq p1, v2, :cond_1

    const/4 v2, 0x6

    if-eq p1, v2, :cond_1

    move v0, v1

    .line 488
    .local v0, isKeyCodeSupported:Z
    :goto_0
    invoke-direct {p0}, Lcom/apportable/ui/VideoView;->isInPlaybackState()Z

    move-result v2

    if-eqz v2, :cond_4

    if-eqz v0, :cond_4

    iget-object v2, p0, Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v2, :cond_4

    .line 489
    const/16 v2, 0x4f

    if-eq p1, v2, :cond_0

    const/16 v2, 0x55

    if-ne p1, v2, :cond_3

    .line 491
    :cond_0
    iget-object v2, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 492
    invoke-virtual {p0}, Lcom/apportable/ui/VideoView;->pause()V

    .line 493
    iget-object v2, p0, Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v2}, Landroid/widget/MediaController;->show()V

    .line 508
    :goto_1
    return v1

    .line 482
    .end local v0           #isKeyCodeSupported:Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 495
    .restart local v0       #isKeyCodeSupported:Z
    :cond_2
    invoke-virtual {p0}, Lcom/apportable/ui/VideoView;->start()V

    .line 496
    iget-object v2, p0, Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v2}, Landroid/widget/MediaController;->hide()V

    goto :goto_1

    .line 499
    :cond_3
    const/16 v1, 0x56

    if-ne p1, v1, :cond_5

    iget-object v1, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 501
    invoke-virtual {p0}, Lcom/apportable/ui/VideoView;->pause()V

    .line 502
    iget-object v1, p0, Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v1}, Landroid/widget/MediaController;->show()V

    .line 508
    :cond_4
    :goto_2
    invoke-super {p0, p1, p2}, Landroid/view/SurfaceView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_1

    .line 504
    :cond_5
    invoke-direct {p0}, Lcom/apportable/ui/VideoView;->toggleMediaControlsVisiblity()V

    goto :goto_2
.end method

.method protected onMeasure(II)V
    .locals 4
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 88
    iget v2, p0, Lcom/apportable/ui/VideoView;->mVideoWidth:I

    invoke-static {v2, p1}, Lcom/apportable/ui/VideoView;->getDefaultSize(II)I

    move-result v1

    .line 89
    .local v1, width:I
    iget v2, p0, Lcom/apportable/ui/VideoView;->mVideoHeight:I

    invoke-static {v2, p2}, Lcom/apportable/ui/VideoView;->getDefaultSize(II)I

    move-result v0

    .line 90
    .local v0, height:I
    iget v2, p0, Lcom/apportable/ui/VideoView;->mVideoWidth:I

    if-lez v2, :cond_0

    iget v2, p0, Lcom/apportable/ui/VideoView;->mVideoHeight:I

    if-lez v2, :cond_0

    .line 91
    iget v2, p0, Lcom/apportable/ui/VideoView;->mVideoWidth:I

    mul-int/2addr v2, v0

    iget v3, p0, Lcom/apportable/ui/VideoView;->mVideoHeight:I

    mul-int/2addr v3, v1

    if-le v2, v3, :cond_1

    .line 93
    iget v2, p0, Lcom/apportable/ui/VideoView;->mVideoHeight:I

    mul-int/2addr v2, v1

    iget v3, p0, Lcom/apportable/ui/VideoView;->mVideoWidth:I

    div-int v0, v2, v3

    .line 104
    :cond_0
    :goto_0
    invoke-virtual {p0, v1, v0}, Lcom/apportable/ui/VideoView;->setMeasuredDimension(II)V

    .line 105
    return-void

    .line 94
    :cond_1
    iget v2, p0, Lcom/apportable/ui/VideoView;->mVideoWidth:I

    mul-int/2addr v2, v0

    iget v3, p0, Lcom/apportable/ui/VideoView;->mVideoHeight:I

    mul-int/2addr v3, v1

    if-ge v2, v3, :cond_0

    .line 96
    iget v2, p0, Lcom/apportable/ui/VideoView;->mVideoWidth:I

    mul-int/2addr v2, v0

    iget v3, p0, Lcom/apportable/ui/VideoView;->mVideoHeight:I

    div-int v1, v2, v3

    goto :goto_0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "ev"

    .prologue
    .line 465
    invoke-direct {p0}, Lcom/apportable/ui/VideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v0, :cond_0

    .line 466
    invoke-direct {p0}, Lcom/apportable/ui/VideoView;->toggleMediaControlsVisiblity()V

    .line 468
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "ev"

    .prologue
    .line 473
    invoke-direct {p0}, Lcom/apportable/ui/VideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v0, :cond_0

    .line 474
    invoke-direct {p0}, Lcom/apportable/ui/VideoView;->toggleMediaControlsVisiblity()V

    .line 476
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public pause()V
    .locals 2

    .prologue
    const/4 v1, 0x4

    .line 528
    invoke-direct {p0}, Lcom/apportable/ui/VideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 529
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 530
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 531
    iput v1, p0, Lcom/apportable/ui/VideoView;->mCurrentState:I

    .line 534
    :cond_0
    iput v1, p0, Lcom/apportable/ui/VideoView;->mTargetState:I

    .line 535
    return-void
.end method

.method public resolveAdjustedSize(II)I
    .locals 3
    .parameter "desiredSize"
    .parameter "measureSpec"

    .prologue
    .line 108
    move v0, p1

    .line 109
    .local v0, result:I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 110
    .local v1, specMode:I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 112
    .local v2, specSize:I
    sparse-switch v1, :sswitch_data_0

    .line 133
    :goto_0
    return v0

    .line 117
    :sswitch_0
    move v0, p1

    .line 118
    goto :goto_0

    .line 125
    :sswitch_1
    invoke-static {p1, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 126
    goto :goto_0

    .line 130
    :sswitch_2
    move v0, v2

    goto :goto_0

    .line 112
    :sswitch_data_0
    .sparse-switch
        -0x80000000 -> :sswitch_1
        0x0 -> :sswitch_0
        0x40000000 -> :sswitch_2
    .end sparse-switch
.end method

.method public seekTo(I)V
    .locals 1
    .parameter "msec"

    .prologue
    .line 558
    invoke-direct {p0}, Lcom/apportable/ui/VideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 559
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 560
    const/4 v0, 0x0

    iput v0, p0, Lcom/apportable/ui/VideoView;->mSeekWhenPrepared:I

    .line 564
    :goto_0
    return-void

    .line 562
    :cond_0
    iput p1, p0, Lcom/apportable/ui/VideoView;->mSeekWhenPrepared:I

    goto :goto_0
.end method

.method public setMediaController(Landroid/widget/MediaController;)V
    .locals 1
    .parameter "controller"

    .prologue
    .line 247
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v0, :cond_0

    .line 248
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    .line 250
    :cond_0
    iput-object p1, p0, Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;

    .line 251
    invoke-direct {p0}, Lcom/apportable/ui/VideoView;->attachMediaController()V

    .line 252
    return-void
.end method

.method public setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V
    .locals 0
    .parameter "l"

    .prologue
    .line 397
    iput-object p1, p0, Lcom/apportable/ui/VideoView;->mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 398
    return-void
.end method

.method public setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V
    .locals 0
    .parameter "l"

    .prologue
    .line 410
    iput-object p1, p0, Lcom/apportable/ui/VideoView;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    .line 411
    return-void
.end method

.method public setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V
    .locals 0
    .parameter "l"

    .prologue
    .line 386
    iput-object p1, p0, Lcom/apportable/ui/VideoView;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 387
    return-void
.end method

.method public setVideoPath(Ljava/lang/String;)V
    .locals 1
    .parameter "path"

    .prologue
    .line 149
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/apportable/ui/VideoView;->setVideoURI(Landroid/net/Uri;)V

    .line 150
    return-void
.end method

.method public setVideoSource(Ljava/io/FileDescriptor;JJ)V
    .locals 7
    .parameter "fd"
    .parameter "offset"
    .parameter "length"

    .prologue
    .line 157
    const/4 v1, 0x0

    move-object v0, p0

    move-object v2, p1

    move-wide v3, p2

    move-wide v5, p4

    invoke-direct/range {v0 .. v6}, Lcom/apportable/ui/VideoView;->setVideoContent(Landroid/net/Uri;Ljava/io/FileDescriptor;JJ)V

    .line 158
    return-void
.end method

.method public setVideoURI(Landroid/net/Uri;)V
    .locals 7
    .parameter "uri"

    .prologue
    const-wide/16 v3, 0x0

    .line 153
    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v5, v3

    invoke-direct/range {v0 .. v6}, Lcom/apportable/ui/VideoView;->setVideoContent(Landroid/net/Uri;Ljava/io/FileDescriptor;JJ)V

    .line 154
    return-void
.end method

.method public start()V
    .locals 2

    .prologue
    const/4 v1, 0x3

    .line 520
    invoke-direct {p0}, Lcom/apportable/ui/VideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 521
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 522
    iput v1, p0, Lcom/apportable/ui/VideoView;->mCurrentState:I

    .line 524
    :cond_0
    iput v1, p0, Lcom/apportable/ui/VideoView;->mTargetState:I

    .line 525
    return-void
.end method

.method public stopPlayback()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 186
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 187
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 188
    iget-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 189
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 190
    iput v1, p0, Lcom/apportable/ui/VideoView;->mCurrentState:I

    .line 191
    iput v1, p0, Lcom/apportable/ui/VideoView;->mTargetState:I

    .line 193
    :cond_0
    return-void
.end method

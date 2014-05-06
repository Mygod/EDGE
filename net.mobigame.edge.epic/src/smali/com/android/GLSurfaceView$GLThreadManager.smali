.class Lcom/android/GLSurfaceView$GLThreadManager;
.super Ljava/lang/Object;
.source "GLSurfaceView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/GLSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "GLThreadManager"
.end annotation


# static fields
.field private static TAG:Ljava/lang/String; = null

.field private static final kGLES_20:I = 0x20000

.field private static final kMSM7K_RENDERER_PREFIX:Ljava/lang/String; = "Q3Dimension MSM7500 "


# instance fields
.field private mEglOwner:Lcom/android/GLSurfaceView$GLThread;

.field private mGLESDriverCheckComplete:Z

.field private mGLESVersion:I

.field private mGLESVersionCheckComplete:Z

.field private mMultipleGLESContextsAllowed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 2037
    const-string v0, "GLThreadManager"

    sput-object v0, Lcom/android/GLSurfaceView$GLThreadManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 2036
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/GLSurfaceView$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 2036
    invoke-direct {p0}, Lcom/android/GLSurfaceView$GLThreadManager;-><init>()V

    return-void
.end method

.method private checkGLESVersion()V
    .locals 1

    .prologue
    .line 2111
    iget-boolean v0, p0, Lcom/android/GLSurfaceView$GLThreadManager;->mGLESVersionCheckComplete:Z

    if-nez v0, :cond_0

    .line 2124
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/GLSurfaceView$GLThreadManager;->mGLESVersionCheckComplete:Z

    .line 2126
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized checkGLDriver(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 4
    .parameter "gl"

    .prologue
    const/4 v1, 0x1

    .line 2094
    monitor-enter p0

    :try_start_0
    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThreadManager;->mGLESDriverCheckComplete:Z

    if-nez v2, :cond_1

    .line 2095
    invoke-direct {p0}, Lcom/android/GLSurfaceView$GLThreadManager;->checkGLESVersion()V

    .line 2096
    iget v2, p0, Lcom/android/GLSurfaceView$GLThreadManager;->mGLESVersion:I

    const/high16 v3, 0x2

    if-ge v2, v3, :cond_0

    .line 2097
    const/16 v2, 0x1f01

    invoke-interface {p1, v2}, Ljavax/microedition/khronos/opengles/GL10;->glGetString(I)Ljava/lang/String;

    move-result-object v0

    .line 2098
    .local v0, renderer:Ljava/lang/String;
    const-string v2, "Q3Dimension MSM7500 "

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    :goto_0
    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThreadManager;->mMultipleGLESContextsAllowed:Z

    .line 2104
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 2106
    .end local v0           #renderer:Ljava/lang/String;
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThreadManager;->mGLESDriverCheckComplete:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2108
    :cond_1
    monitor-exit p0

    return-void

    .line 2098
    .restart local v0       #renderer:Ljava/lang/String;
    :cond_2
    const/4 v1, 0x0

    goto :goto_0

    .line 2094
    .end local v0           #renderer:Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public releaseEglContextLocked(Lcom/android/GLSurfaceView$GLThread;)V
    .locals 1
    .parameter "thread"

    .prologue
    .line 2075
    iget-object v0, p0, Lcom/android/GLSurfaceView$GLThreadManager;->mEglOwner:Lcom/android/GLSurfaceView$GLThread;

    if-ne v0, p1, :cond_0

    .line 2076
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/GLSurfaceView$GLThreadManager;->mEglOwner:Lcom/android/GLSurfaceView$GLThread;

    .line 2078
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 2079
    return-void
.end method

.method public declared-synchronized shouldReleaseEGLContextWhenPausing()Z
    .locals 1

    .prologue
    .line 2085
    monitor-enter p0

    const/4 v0, 0x1

    monitor-exit p0

    return v0
.end method

.method public declared-synchronized shouldTerminateEGLWhenPausing()Z
    .locals 1

    .prologue
    .line 2089
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/android/GLSurfaceView$GLThreadManager;->checkGLESVersion()V

    .line 2090
    iget-boolean v0, p0, Lcom/android/GLSurfaceView$GLThreadManager;->mMultipleGLESContextsAllowed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 2089
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized threadExiting(Lcom/android/GLSurfaceView$GLThread;)V
    .locals 1
    .parameter "thread"

    .prologue
    .line 2043
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    #setter for: Lcom/android/GLSurfaceView$GLThread;->mExited:Z
    invoke-static {p1, v0}, Lcom/android/GLSurfaceView$GLThread;->access$902(Lcom/android/GLSurfaceView$GLThread;Z)Z

    .line 2044
    iget-object v0, p0, Lcom/android/GLSurfaceView$GLThreadManager;->mEglOwner:Lcom/android/GLSurfaceView$GLThread;

    if-ne v0, p1, :cond_0

    .line 2045
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/GLSurfaceView$GLThreadManager;->mEglOwner:Lcom/android/GLSurfaceView$GLThread;

    .line 2047
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2048
    monitor-exit p0

    return-void

    .line 2043
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public tryAcquireEglContextLocked(Lcom/android/GLSurfaceView$GLThread;)Z
    .locals 2
    .parameter "thread"

    .prologue
    const/4 v0, 0x1

    .line 2058
    iget-object v1, p0, Lcom/android/GLSurfaceView$GLThreadManager;->mEglOwner:Lcom/android/GLSurfaceView$GLThread;

    if-eq v1, p1, :cond_0

    iget-object v1, p0, Lcom/android/GLSurfaceView$GLThreadManager;->mEglOwner:Lcom/android/GLSurfaceView$GLThread;

    if-nez v1, :cond_2

    .line 2059
    :cond_0
    iput-object p1, p0, Lcom/android/GLSurfaceView$GLThreadManager;->mEglOwner:Lcom/android/GLSurfaceView$GLThread;

    .line 2060
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 2067
    :cond_1
    :goto_0
    return v0

    .line 2063
    :cond_2
    invoke-direct {p0}, Lcom/android/GLSurfaceView$GLThreadManager;->checkGLESVersion()V

    .line 2064
    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThreadManager;->mMultipleGLESContextsAllowed:Z

    if-nez v1, :cond_1

    .line 2067
    const/4 v0, 0x0

    goto :goto_0
.end method

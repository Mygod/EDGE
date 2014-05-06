.class public Lcom/android/GLSurfaceView;
.super Landroid/view/SurfaceView;
.source "GLSurfaceView.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/GLSurfaceView$1;,
        Lcom/android/GLSurfaceView$GLThreadManager;,
        Lcom/android/GLSurfaceView$LogWriter;,
        Lcom/android/GLSurfaceView$GLThread;,
        Lcom/android/GLSurfaceView$EglHelper;,
        Lcom/android/GLSurfaceView$SimpleEGLConfigChooser;,
        Lcom/android/GLSurfaceView$ComponentSizeChooser;,
        Lcom/android/GLSurfaceView$BaseConfigChooser;,
        Lcom/android/GLSurfaceView$EGLConfigChooser;,
        Lcom/android/GLSurfaceView$DefaultWindowSurfaceFactory;,
        Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;,
        Lcom/android/GLSurfaceView$DefaultContextFactory;,
        Lcom/android/GLSurfaceView$EGLContextFactory;,
        Lcom/android/GLSurfaceView$Renderer;,
        Lcom/android/GLSurfaceView$GLWrapper;
    }
.end annotation


# static fields
.field public static final DEBUG_CHECK_GL_ERROR:I = 0x1

.field public static final DEBUG_LOG_GL_CALLS:I = 0x2

.field private static final DRAW_TWICE_AFTER_SIZE_CHANGED:Z = true

.field private static final LOG_EGL:Z = false

.field private static final LOG_PAUSE_RESUME:Z = false

.field private static final LOG_RENDERER:Z = false

.field private static final LOG_RENDERER_DRAW_FRAME:Z = false

.field private static final LOG_SURFACE:Z = false

.field private static final LOG_THREADS:Z = false

.field public static final RENDERMODE_CONTINUOUSLY:I = 0x1

.field public static final RENDERMODE_WHEN_DIRTY:I

.field private static ignoreResizeWhenZero:I

.field private static final sGLThreadManager:Lcom/android/GLSurfaceView$GLThreadManager;


# instance fields
.field private mDebugFlags:I

.field private mEGLConfigChooser:Lcom/android/GLSurfaceView$EGLConfigChooser;

.field private mEGLContextClientVersion:I

.field private mEGLContextFactory:Lcom/android/GLSurfaceView$EGLContextFactory;

.field private mEGLWindowSurfaceFactory:Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;

.field private mGLThread:Lcom/android/GLSurfaceView$GLThread;

.field private mGLWrapper:Lcom/android/GLSurfaceView$GLWrapper;

.field private mSizeChanged:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 210
    const/4 v0, 0x1

    sput v0, Lcom/android/GLSurfaceView;->ignoreResizeWhenZero:I

    .line 2138
    new-instance v0, Lcom/android/GLSurfaceView$GLThreadManager;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/GLSurfaceView$GLThreadManager;-><init>(Lcom/android/GLSurfaceView$1;)V

    sput-object v0, Lcom/android/GLSurfaceView;->sGLThreadManager:Lcom/android/GLSurfaceView$GLThreadManager;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 216
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 2139
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/GLSurfaceView;->mSizeChanged:Z

    .line 217
    invoke-direct {p0}, Lcom/android/GLSurfaceView;->init()V

    .line 218
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 225
    invoke-direct {p0, p1, p2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2139
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/GLSurfaceView;->mSizeChanged:Z

    .line 226
    invoke-direct {p0}, Lcom/android/GLSurfaceView;->init()V

    .line 227
    return-void
.end method

.method static synthetic access$200(Lcom/android/GLSurfaceView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 161
    iget v0, p0, Lcom/android/GLSurfaceView;->mEGLContextClientVersion:I

    return v0
.end method

.method static synthetic access$300(Lcom/android/GLSurfaceView;)Lcom/android/GLSurfaceView$EGLConfigChooser;
    .locals 1
    .parameter "x0"

    .prologue
    .line 161
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mEGLConfigChooser:Lcom/android/GLSurfaceView$EGLConfigChooser;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/GLSurfaceView;)Lcom/android/GLSurfaceView$EGLContextFactory;
    .locals 1
    .parameter "x0"

    .prologue
    .line 161
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mEGLContextFactory:Lcom/android/GLSurfaceView$EGLContextFactory;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/GLSurfaceView;)Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;
    .locals 1
    .parameter "x0"

    .prologue
    .line 161
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mEGLWindowSurfaceFactory:Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/GLSurfaceView;)Lcom/android/GLSurfaceView$GLWrapper;
    .locals 1
    .parameter "x0"

    .prologue
    .line 161
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mGLWrapper:Lcom/android/GLSurfaceView$GLWrapper;

    return-object v0
.end method

.method static synthetic access$700()Lcom/android/GLSurfaceView$GLThreadManager;
    .locals 1

    .prologue
    .line 161
    sget-object v0, Lcom/android/GLSurfaceView;->sGLThreadManager:Lcom/android/GLSurfaceView$GLThreadManager;

    return-object v0
.end method

.method static synthetic access$800(Lcom/android/GLSurfaceView;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 161
    iget-boolean v0, p0, Lcom/android/GLSurfaceView;->mSizeChanged:Z

    return v0
.end method

.method static synthetic access$802(Lcom/android/GLSurfaceView;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 161
    iput-boolean p1, p0, Lcom/android/GLSurfaceView;->mSizeChanged:Z

    return p1
.end method

.method private checkRenderThreadState()V
    .locals 2

    .prologue
    .line 2022
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mGLThread:Lcom/android/GLSurfaceView$GLThread;

    if-eqz v0, :cond_0

    .line 2023
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "setRenderer has already been called for this instance."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2026
    :cond_0
    return-void
.end method

.method private init()V
    .locals 2

    .prologue
    .line 232
    invoke-virtual {p0}, Lcom/android/GLSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    .line 233
    .local v0, holder:Landroid/view/SurfaceHolder;
    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 234
    const/4 v1, 0x1

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setFormat(I)V

    .line 238
    return-void
.end method

.method public static native nativeStart(Lcom/android/GLSurfaceView$GLThread;)V
.end method


# virtual methods
.method public createSharedContext(ILjavax/microedition/khronos/egl/EGLContext;)Ljavax/microedition/khronos/egl/EGLContext;
    .locals 1
    .parameter "api"
    .parameter "ctx"

    .prologue
    .line 561
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mGLThread:Lcom/android/GLSurfaceView$GLThread;

    invoke-virtual {v0, p1, p2}, Lcom/android/GLSurfaceView$GLThread;->createSharedContext(ILjavax/microedition/khronos/egl/EGLContext;)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v0

    return-object v0
.end method

.method public destroyContext(Ljavax/microedition/khronos/egl/EGLContext;)Z
    .locals 1
    .parameter "ctx"

    .prologue
    .line 565
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mGLThread:Lcom/android/GLSurfaceView$GLThread;

    invoke-virtual {v0, p1}, Lcom/android/GLSurfaceView$GLThread;->destroyContext(Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v0

    return v0
.end method

.method public getDebugFlags()I
    .locals 1

    .prologue
    .line 275
    iget v0, p0, Lcom/android/GLSurfaceView;->mDebugFlags:I

    return v0
.end method

.method public getPrimaryContext()Ljavax/microedition/khronos/egl/EGLContext;
    .locals 1

    .prologue
    .line 551
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mGLThread:Lcom/android/GLSurfaceView$GLThread;

    invoke-virtual {v0}, Lcom/android/GLSurfaceView$GLThread;->getPrimaryContext()Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v0

    return-object v0
.end method

.method public getRenderMode()I
    .locals 1

    .prologue
    .line 461
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mGLThread:Lcom/android/GLSurfaceView$GLThread;

    invoke-virtual {v0}, Lcom/android/GLSurfaceView$GLThread;->getRenderMode()I

    move-result v0

    return v0
.end method

.method public loopForSurface()V
    .locals 1

    .prologue
    .line 526
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mGLThread:Lcom/android/GLSurfaceView$GLThread;

    invoke-virtual {v0}, Lcom/android/GLSurfaceView$GLThread;->loopForSurface()V

    .line 527
    return-void
.end method

.method public makeCurrentContext(Ljavax/microedition/khronos/egl/EGLContext;)Z
    .locals 1
    .parameter "ctx"

    .prologue
    .line 556
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mGLThread:Lcom/android/GLSurfaceView$GLThread;

    invoke-virtual {v0, p1}, Lcom/android/GLSurfaceView$GLThread;->makeCurrentContext(Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v0

    return v0
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .prologue
    .line 546
    invoke-super {p0}, Landroid/view/SurfaceView;->onDetachedFromWindow()V

    .line 547
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 507
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mGLThread:Lcom/android/GLSurfaceView$GLThread;

    invoke-virtual {v0}, Lcom/android/GLSurfaceView$GLThread;->onPause()V

    .line 508
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 518
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mGLThread:Lcom/android/GLSurfaceView$GLThread;

    invoke-virtual {v0}, Lcom/android/GLSurfaceView$GLThread;->onResume()V

    .line 519
    return-void
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 1
    .parameter "r"

    .prologue
    .line 536
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mGLThread:Lcom/android/GLSurfaceView$GLThread;

    invoke-virtual {v0, p1}, Lcom/android/GLSurfaceView$GLThread;->queueEvent(Ljava/lang/Runnable;)V

    .line 537
    return-void
.end method

.method public requestRender()V
    .locals 1

    .prologue
    .line 472
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mGLThread:Lcom/android/GLSurfaceView$GLThread;

    invoke-virtual {v0}, Lcom/android/GLSurfaceView$GLThread;->requestRender()V

    .line 473
    return-void
.end method

.method public setDebugFlags(I)V
    .locals 0
    .parameter "debugFlags"

    .prologue
    .line 267
    iput p1, p0, Lcom/android/GLSurfaceView;->mDebugFlags:I

    .line 268
    return-void
.end method

.method public setEGLConfigChooser(IIIIII)V
    .locals 8
    .parameter "redSize"
    .parameter "greenSize"
    .parameter "blueSize"
    .parameter "alphaSize"
    .parameter "depthSize"
    .parameter "stencilSize"

    .prologue
    .line 398
    new-instance v0, Lcom/android/GLSurfaceView$ComponentSizeChooser;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-direct/range {v0 .. v7}, Lcom/android/GLSurfaceView$ComponentSizeChooser;-><init>(Lcom/android/GLSurfaceView;IIIIII)V

    invoke-virtual {p0, v0}, Lcom/android/GLSurfaceView;->setEGLConfigChooser(Lcom/android/GLSurfaceView$EGLConfigChooser;)V

    .line 400
    return-void
.end method

.method public setEGLConfigChooser(Lcom/android/GLSurfaceView$EGLConfigChooser;)V
    .locals 0
    .parameter "configChooser"

    .prologue
    .line 361
    invoke-direct {p0}, Lcom/android/GLSurfaceView;->checkRenderThreadState()V

    .line 362
    iput-object p1, p0, Lcom/android/GLSurfaceView;->mEGLConfigChooser:Lcom/android/GLSurfaceView$EGLConfigChooser;

    .line 363
    return-void
.end method

.method public setEGLConfigChooser(Z)V
    .locals 1
    .parameter "needDepth"

    .prologue
    .line 380
    new-instance v0, Lcom/android/GLSurfaceView$SimpleEGLConfigChooser;

    invoke-direct {v0, p0, p1}, Lcom/android/GLSurfaceView$SimpleEGLConfigChooser;-><init>(Lcom/android/GLSurfaceView;Z)V

    invoke-virtual {p0, v0}, Lcom/android/GLSurfaceView;->setEGLConfigChooser(Lcom/android/GLSurfaceView$EGLConfigChooser;)V

    .line 381
    return-void
.end method

.method public setEGLContextClientVersion(I)V
    .locals 0
    .parameter "version"

    .prologue
    .line 429
    invoke-direct {p0}, Lcom/android/GLSurfaceView;->checkRenderThreadState()V

    .line 430
    iput p1, p0, Lcom/android/GLSurfaceView;->mEGLContextClientVersion:I

    .line 431
    return-void
.end method

.method public setEGLContextFactory(Lcom/android/GLSurfaceView$EGLContextFactory;)V
    .locals 0
    .parameter "factory"

    .prologue
    .line 330
    invoke-direct {p0}, Lcom/android/GLSurfaceView;->checkRenderThreadState()V

    .line 331
    iput-object p1, p0, Lcom/android/GLSurfaceView;->mEGLContextFactory:Lcom/android/GLSurfaceView$EGLContextFactory;

    .line 332
    return-void
.end method

.method public setEGLWindowSurfaceFactory(Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;)V
    .locals 0
    .parameter "factory"

    .prologue
    .line 344
    invoke-direct {p0}, Lcom/android/GLSurfaceView;->checkRenderThreadState()V

    .line 345
    iput-object p1, p0, Lcom/android/GLSurfaceView;->mEGLWindowSurfaceFactory:Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;

    .line 346
    return-void
.end method

.method public setGLWrapper(Lcom/android/GLSurfaceView$GLWrapper;)V
    .locals 0
    .parameter "glWrapper"

    .prologue
    .line 254
    iput-object p1, p0, Lcom/android/GLSurfaceView;->mGLWrapper:Lcom/android/GLSurfaceView$GLWrapper;

    .line 255
    return-void
.end method

.method public setRenderMode(I)V
    .locals 1
    .parameter "renderMode"

    .prologue
    .line 450
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mGLThread:Lcom/android/GLSurfaceView$GLThread;

    invoke-virtual {v0, p1}, Lcom/android/GLSurfaceView$GLThread;->setRenderMode(I)V

    .line 451
    return-void
.end method

.method public setRenderer(Lcom/android/GLSurfaceView$Renderer;)V
    .locals 3
    .parameter "renderer"

    .prologue
    const/4 v2, 0x0

    .line 305
    invoke-direct {p0}, Lcom/android/GLSurfaceView;->checkRenderThreadState()V

    .line 306
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mEGLConfigChooser:Lcom/android/GLSurfaceView$EGLConfigChooser;

    if-nez v0, :cond_0

    .line 307
    new-instance v0, Lcom/android/GLSurfaceView$SimpleEGLConfigChooser;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lcom/android/GLSurfaceView$SimpleEGLConfigChooser;-><init>(Lcom/android/GLSurfaceView;Z)V

    iput-object v0, p0, Lcom/android/GLSurfaceView;->mEGLConfigChooser:Lcom/android/GLSurfaceView$EGLConfigChooser;

    .line 309
    :cond_0
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mEGLContextFactory:Lcom/android/GLSurfaceView$EGLContextFactory;

    if-nez v0, :cond_1

    .line 310
    new-instance v0, Lcom/android/GLSurfaceView$DefaultContextFactory;

    invoke-direct {v0, p0, v2}, Lcom/android/GLSurfaceView$DefaultContextFactory;-><init>(Lcom/android/GLSurfaceView;Lcom/android/GLSurfaceView$1;)V

    iput-object v0, p0, Lcom/android/GLSurfaceView;->mEGLContextFactory:Lcom/android/GLSurfaceView$EGLContextFactory;

    .line 312
    :cond_1
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mEGLWindowSurfaceFactory:Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;

    if-nez v0, :cond_2

    .line 313
    new-instance v0, Lcom/android/GLSurfaceView$DefaultWindowSurfaceFactory;

    invoke-direct {v0, v2}, Lcom/android/GLSurfaceView$DefaultWindowSurfaceFactory;-><init>(Lcom/android/GLSurfaceView$1;)V

    iput-object v0, p0, Lcom/android/GLSurfaceView;->mEGLWindowSurfaceFactory:Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;

    .line 315
    :cond_2
    new-instance v0, Lcom/android/GLSurfaceView$GLThread;

    invoke-direct {v0, p0, p1}, Lcom/android/GLSurfaceView$GLThread;-><init>(Lcom/android/GLSurfaceView;Lcom/android/GLSurfaceView$Renderer;)V

    iput-object v0, p0, Lcom/android/GLSurfaceView;->mGLThread:Lcom/android/GLSurfaceView$GLThread;

    .line 316
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mGLThread:Lcom/android/GLSurfaceView$GLThread;

    invoke-virtual {v0}, Lcom/android/GLSurfaceView$GLThread;->start()V

    .line 317
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 1
    .parameter "holder"
    .parameter "format"
    .parameter "w"
    .parameter "h"

    .prologue
    .line 497
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mGLThread:Lcom/android/GLSurfaceView$GLThread;

    invoke-virtual {v0, p3, p4}, Lcom/android/GLSurfaceView$GLThread;->onWindowResize(II)V

    .line 498
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1
    .parameter "holder"

    .prologue
    .line 480
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mGLThread:Lcom/android/GLSurfaceView$GLThread;

    invoke-virtual {v0}, Lcom/android/GLSurfaceView$GLThread;->surfaceCreated()V

    .line 481
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1
    .parameter "holder"

    .prologue
    .line 489
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mGLThread:Lcom/android/GLSurfaceView$GLThread;

    invoke-virtual {v0}, Lcom/android/GLSurfaceView$GLThread;->surfaceDestroyed()V

    .line 490
    return-void
.end method

.method public swapBuffers()V
    .locals 1

    .prologue
    .line 2030
    :try_start_0
    iget-object v0, p0, Lcom/android/GLSurfaceView;->mGLThread:Lcom/android/GLSurfaceView$GLThread;

    invoke-virtual {v0}, Lcom/android/GLSurfaceView$GLThread;->swapBuffers()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2034
    :goto_0
    return-void

    .line 2031
    :catch_0
    move-exception v0

    goto :goto_0
.end method

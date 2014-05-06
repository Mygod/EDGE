.class Lcom/android/GLSurfaceView$GLThread;
.super Ljava/lang/Thread;
.source "GLSurfaceView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/GLSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GLThread"
.end annotation


# instance fields
.field createEglContext:Z

.field createEglSurface:Z

.field doRenderNotification:Z

.field event:Ljava/lang/Runnable;

.field gl:Ljavax/microedition/khronos/opengles/GL10;

.field h:I

.field private mEglHelper:Lcom/android/GLSurfaceView$EglHelper;

.field private mEventQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private mExited:Z

.field private mHasSurface:Z

.field private mHaveEglContext:Z

.field private mHaveEglSurface:Z

.field private mHeight:I

.field private mLoopForSurface:Z

.field mLostEglContext:Z

.field private mPaused:Z

.field private mRenderComplete:Z

.field private mRenderMode:I

.field private mRenderer:Lcom/android/GLSurfaceView$Renderer;

.field private mRequestPaused:Z

.field private mRequestRender:Z

.field private mWaitingForSurface:Z

.field private mWidth:I

.field sizeChanged:Z

.field final synthetic this$0:Lcom/android/GLSurfaceView;

.field w:I

.field wantRenderNotification:Z


# direct methods
.method constructor <init>(Lcom/android/GLSurfaceView;Lcom/android/GLSurfaceView$Renderer;)V
    .locals 3
    .parameter
    .parameter "renderer"

    .prologue
    const/4 v0, 0x0

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 1296
    iput-object p1, p0, Lcom/android/GLSurfaceView$GLThread;->this$0:Lcom/android/GLSurfaceView;

    .line 1297
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 1349
    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mLostEglContext:Z

    .line 1350
    iput-object v0, p0, Lcom/android/GLSurfaceView$GLThread;->gl:Ljavax/microedition/khronos/opengles/GL10;

    .line 1351
    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->createEglContext:Z

    .line 1352
    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->createEglSurface:Z

    .line 1354
    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->sizeChanged:Z

    .line 1355
    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->wantRenderNotification:Z

    .line 1356
    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->doRenderNotification:Z

    .line 1357
    iput v1, p0, Lcom/android/GLSurfaceView$GLThread;->w:I

    .line 1358
    iput v1, p0, Lcom/android/GLSurfaceView$GLThread;->h:I

    .line 1359
    iput-object v0, p0, Lcom/android/GLSurfaceView$GLThread;->event:Ljava/lang/Runnable;

    .line 1979
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/GLSurfaceView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    .line 1298
    iput v1, p0, Lcom/android/GLSurfaceView$GLThread;->mWidth:I

    .line 1299
    iput v1, p0, Lcom/android/GLSurfaceView$GLThread;->mHeight:I

    .line 1300
    iput-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mRequestRender:Z

    .line 1301
    iput v2, p0, Lcom/android/GLSurfaceView$GLThread;->mRenderMode:I

    .line 1302
    iput-object p2, p0, Lcom/android/GLSurfaceView$GLThread;->mRenderer:Lcom/android/GLSurfaceView$Renderer;

    .line 1303
    return-void
.end method

.method static synthetic access$902(Lcom/android/GLSurfaceView$GLThread;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1294
    iput-boolean p1, p0, Lcom/android/GLSurfaceView$GLThread;->mExited:Z

    return p1
.end method

.method private eventUnprotected()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1581
    :goto_0
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v3

    monitor-enter v3

    .line 1584
    :goto_1
    :try_start_0
    iget-object v2, p0, Lcom/android/GLSurfaceView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1585
    iget-object v2, p0, Lcom/android/GLSurfaceView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Runnable;

    iput-object v2, p0, Lcom/android/GLSurfaceView$GLThread;->event:Ljava/lang/Runnable;

    .line 1716
    :goto_2
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1718
    iget-object v2, p0, Lcom/android/GLSurfaceView$GLThread;->event:Ljava/lang/Runnable;

    if-eqz v2, :cond_11

    .line 1722
    iget-object v2, p0, Lcom/android/GLSurfaceView$GLThread;->event:Ljava/lang/Runnable;

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 1726
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/android/GLSurfaceView$GLThread;->event:Ljava/lang/Runnable;

    .line 1728
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v3

    monitor-enter v3

    .line 1729
    :try_start_1
    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mLoopForSurface:Z

    if-eqz v2, :cond_f

    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mWaitingForSurface:Z

    if-eqz v2, :cond_f

    .line 1733
    monitor-exit v3

    goto :goto_0

    .line 1735
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 1590
    :cond_0
    :try_start_2
    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mPaused:Z

    iget-boolean v4, p0, Lcom/android/GLSurfaceView$GLThread;->mRequestPaused:Z

    if-eq v2, v4, :cond_1

    .line 1591
    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mRequestPaused:Z

    iput-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mPaused:Z

    .line 1592
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 1599
    :cond_1
    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mLostEglContext:Z

    if-eqz v2, :cond_2

    .line 1600
    invoke-direct {p0}, Lcom/android/GLSurfaceView$GLThread;->stopEglSurfaceLocked()V

    .line 1601
    invoke-direct {p0}, Lcom/android/GLSurfaceView$GLThread;->stopEglContextLocked()V

    .line 1602
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mLostEglContext:Z

    .line 1606
    :cond_2
    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    if-eqz v2, :cond_4

    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mPaused:Z

    if-eqz v2, :cond_4

    .line 1610
    invoke-direct {p0}, Lcom/android/GLSurfaceView$GLThread;->stopEglSurfaceLocked()V

    .line 1611
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/GLSurfaceView$GLThreadManager;->shouldReleaseEGLContextWhenPausing()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1612
    invoke-direct {p0}, Lcom/android/GLSurfaceView$GLThread;->stopEglContextLocked()V

    .line 1617
    :cond_3
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/GLSurfaceView$GLThreadManager;->shouldTerminateEGLWhenPausing()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1618
    iget-object v2, p0, Lcom/android/GLSurfaceView$GLThread;->mEglHelper:Lcom/android/GLSurfaceView$EglHelper;

    invoke-virtual {v2}, Lcom/android/GLSurfaceView$EglHelper;->finish()V

    .line 1626
    :cond_4
    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mHasSurface:Z

    if-nez v2, :cond_6

    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mWaitingForSurface:Z

    if-nez v2, :cond_6

    .line 1630
    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    if-eqz v2, :cond_5

    .line 1631
    invoke-direct {p0}, Lcom/android/GLSurfaceView$GLThread;->stopEglSurfaceLocked()V

    .line 1633
    :cond_5
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mWaitingForSurface:Z

    .line 1634
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 1638
    :cond_6
    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mHasSurface:Z

    if-eqz v2, :cond_7

    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mWaitingForSurface:Z

    if-eqz v2, :cond_7

    .line 1642
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mWaitingForSurface:Z

    .line 1643
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mLoopForSurface:Z

    .line 1644
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 1647
    :cond_7
    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->doRenderNotification:Z

    if-eqz v2, :cond_8

    .line 1648
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->wantRenderNotification:Z

    .line 1649
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->doRenderNotification:Z

    .line 1650
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mRenderComplete:Z

    .line 1651
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 1655
    :cond_8
    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mPaused:Z

    if-nez v2, :cond_d

    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mHasSurface:Z

    if-eqz v2, :cond_d

    iget v2, p0, Lcom/android/GLSurfaceView$GLThread;->mWidth:I

    if-lez v2, :cond_d

    iget v2, p0, Lcom/android/GLSurfaceView$GLThread;->mHeight:I

    if-lez v2, :cond_d

    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mRequestRender:Z

    if-nez v2, :cond_9

    iget v2, p0, Lcom/android/GLSurfaceView$GLThread;->mRenderMode:I

    if-ne v2, v7, :cond_d

    .line 1660
    :cond_9
    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mHaveEglContext:Z

    if-nez v2, :cond_a

    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/android/GLSurfaceView$GLThreadManager;->tryAcquireEglContextLocked(Lcom/android/GLSurfaceView$GLThread;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-result v2

    if-eqz v2, :cond_a

    .line 1662
    :try_start_3
    iget-object v2, p0, Lcom/android/GLSurfaceView$GLThread;->mEglHelper:Lcom/android/GLSurfaceView$EglHelper;

    invoke-virtual {v2}, Lcom/android/GLSurfaceView$EglHelper;->start()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_0

    .line 1667
    const/4 v2, 0x1

    :try_start_4
    iput-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mHaveEglContext:Z

    .line 1668
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->createEglContext:Z

    .line 1670
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 1673
    :cond_a
    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mHaveEglContext:Z

    if-eqz v2, :cond_b

    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    if-nez v2, :cond_b

    .line 1674
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    .line 1675
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->createEglSurface:Z

    .line 1676
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->sizeChanged:Z

    .line 1679
    :cond_b
    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    if-eqz v2, :cond_d

    .line 1680
    iget-object v2, p0, Lcom/android/GLSurfaceView$GLThread;->this$0:Lcom/android/GLSurfaceView;

    #getter for: Lcom/android/GLSurfaceView;->mSizeChanged:Z
    invoke-static {v2}, Lcom/android/GLSurfaceView;->access$800(Lcom/android/GLSurfaceView;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 1681
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->sizeChanged:Z

    .line 1682
    iget v2, p0, Lcom/android/GLSurfaceView$GLThread;->mWidth:I

    iput v2, p0, Lcom/android/GLSurfaceView$GLThread;->w:I

    .line 1683
    iget v2, p0, Lcom/android/GLSurfaceView$GLThread;->mHeight:I

    iput v2, p0, Lcom/android/GLSurfaceView$GLThread;->h:I

    .line 1684
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->wantRenderNotification:Z

    .line 1693
    iget-object v2, p0, Lcom/android/GLSurfaceView$GLThread;->this$0:Lcom/android/GLSurfaceView;

    const/4 v4, 0x0

    #setter for: Lcom/android/GLSurfaceView;->mSizeChanged:Z
    invoke-static {v2, v4}, Lcom/android/GLSurfaceView;->access$802(Lcom/android/GLSurfaceView;Z)Z

    .line 1697
    :goto_3
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    goto/16 :goto_2

    .line 1716
    :catchall_1
    move-exception v2

    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v2

    .line 1663
    :catch_0
    move-exception v1

    .line 1664
    .local v1, t:Ljava/lang/RuntimeException;
    :try_start_5
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/android/GLSurfaceView$GLThreadManager;->releaseEglContextLocked(Lcom/android/GLSurfaceView$GLThread;)V

    .line 1665
    throw v1

    .line 1695
    .end local v1           #t:Ljava/lang/RuntimeException;
    :cond_c
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mRequestRender:Z

    goto :goto_3

    .line 1706
    :cond_d
    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->mPaused:Z

    if-eqz v2, :cond_e

    .line 1707
    iget-object v2, p0, Lcom/android/GLSurfaceView$GLThread;->mRenderer:Lcom/android/GLSurfaceView$Renderer;

    iget-object v4, p0, Lcom/android/GLSurfaceView$GLThread;->gl:Ljavax/microedition/khronos/opengles/GL10;

    invoke-interface {v2, v4}, Lcom/android/GLSurfaceView$Renderer;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 1710
    :cond_e
    :try_start_6
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->wait()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_6} :catch_1

    goto/16 :goto_1

    .line 1712
    :catch_1
    move-exception v0

    .line 1713
    .local v0, e:Ljava/lang/InterruptedException;
    goto/16 :goto_2

    .line 1735
    .end local v0           #e:Ljava/lang/InterruptedException;
    :cond_f
    :try_start_7
    monitor-exit v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 1775
    :cond_10
    :goto_4
    return-void

    .line 1744
    :cond_11
    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->createEglSurface:Z

    if-eqz v2, :cond_12

    .line 1748
    iget-object v2, p0, Lcom/android/GLSurfaceView$GLThread;->mEglHelper:Lcom/android/GLSurfaceView$EglHelper;

    iget-object v3, p0, Lcom/android/GLSurfaceView$GLThread;->this$0:Lcom/android/GLSurfaceView;

    invoke-virtual {v3}, Lcom/android/GLSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/GLSurfaceView$EglHelper;->createSurface(Landroid/view/SurfaceHolder;)Ljavax/microedition/khronos/opengles/GL;

    move-result-object v2

    check-cast v2, Ljavax/microedition/khronos/opengles/GL10;

    iput-object v2, p0, Lcom/android/GLSurfaceView$GLThread;->gl:Ljavax/microedition/khronos/opengles/GL10;

    .line 1749
    iget-object v2, p0, Lcom/android/GLSurfaceView$GLThread;->gl:Ljavax/microedition/khronos/opengles/GL10;

    if-eqz v2, :cond_10

    .line 1753
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v2

    iget-object v3, p0, Lcom/android/GLSurfaceView$GLThread;->gl:Ljavax/microedition/khronos/opengles/GL10;

    invoke-virtual {v2, v3}, Lcom/android/GLSurfaceView$GLThreadManager;->checkGLDriver(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 1754
    iput-boolean v6, p0, Lcom/android/GLSurfaceView$GLThread;->createEglSurface:Z

    .line 1757
    :cond_12
    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->createEglContext:Z

    if-eqz v2, :cond_13

    .line 1761
    iget-object v2, p0, Lcom/android/GLSurfaceView$GLThread;->mRenderer:Lcom/android/GLSurfaceView$Renderer;

    iget-object v3, p0, Lcom/android/GLSurfaceView$GLThread;->gl:Ljavax/microedition/khronos/opengles/GL10;

    iget-object v4, p0, Lcom/android/GLSurfaceView$GLThread;->mEglHelper:Lcom/android/GLSurfaceView$EglHelper;

    iget-object v4, v4, Lcom/android/GLSurfaceView$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    invoke-interface {v2, v3, v4}, Lcom/android/GLSurfaceView$Renderer;->onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V

    .line 1762
    iput-boolean v6, p0, Lcom/android/GLSurfaceView$GLThread;->createEglContext:Z

    .line 1765
    :cond_13
    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->sizeChanged:Z

    if-eqz v2, :cond_14

    .line 1769
    iget-object v2, p0, Lcom/android/GLSurfaceView$GLThread;->mRenderer:Lcom/android/GLSurfaceView$Renderer;

    iget-object v3, p0, Lcom/android/GLSurfaceView$GLThread;->gl:Ljavax/microedition/khronos/opengles/GL10;

    iget v4, p0, Lcom/android/GLSurfaceView$GLThread;->w:I

    iget v5, p0, Lcom/android/GLSurfaceView$GLThread;->h:I

    invoke-interface {v2, v3, v4, v5}, Lcom/android/GLSurfaceView$Renderer;->onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V

    .line 1770
    iput-boolean v6, p0, Lcom/android/GLSurfaceView$GLThread;->sizeChanged:Z

    .line 1772
    :cond_14
    iget-boolean v2, p0, Lcom/android/GLSurfaceView$GLThread;->wantRenderNotification:Z

    if-eqz v2, :cond_10

    .line 1773
    iput-boolean v7, p0, Lcom/android/GLSurfaceView$GLThread;->doRenderNotification:Z

    goto :goto_4
.end method

.method private guardedRun()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v3, 0x0

    .line 1362
    new-instance v1, Lcom/android/GLSurfaceView$EglHelper;

    iget-object v2, p0, Lcom/android/GLSurfaceView$GLThread;->this$0:Lcom/android/GLSurfaceView;

    invoke-direct {v1, v2}, Lcom/android/GLSurfaceView$EglHelper;-><init>(Lcom/android/GLSurfaceView;)V

    iput-object v1, p0, Lcom/android/GLSurfaceView$GLThread;->mEglHelper:Lcom/android/GLSurfaceView$EglHelper;

    .line 1363
    iput-boolean v3, p0, Lcom/android/GLSurfaceView$GLThread;->mHaveEglContext:Z

    .line 1364
    iput-boolean v3, p0, Lcom/android/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    .line 1365
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    const-string v2, "GLThread"

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 1368
    :cond_0
    :goto_0
    :try_start_0
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v2

    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1371
    :goto_1
    :try_start_1
    iget-object v1, p0, Lcom/android/GLSurfaceView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1372
    iget-object v1, p0, Lcom/android/GLSurfaceView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    iput-object v1, p0, Lcom/android/GLSurfaceView$GLThread;->event:Ljava/lang/Runnable;

    .line 1496
    :goto_2
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1498
    :try_start_2
    iget-object v1, p0, Lcom/android/GLSurfaceView$GLThread;->event:Ljava/lang/Runnable;

    if-eqz v1, :cond_10

    .line 1502
    iget-object v1, p0, Lcom/android/GLSurfaceView$GLThread;->event:Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 1506
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/GLSurfaceView$GLThread;->event:Ljava/lang/Runnable;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 1559
    :catchall_0
    move-exception v1

    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1560
    :try_start_3
    invoke-direct {p0}, Lcom/android/GLSurfaceView$GLThread;->stopEglSurfaceLocked()V

    .line 1561
    invoke-direct {p0}, Lcom/android/GLSurfaceView$GLThread;->stopEglContextLocked()V

    .line 1562
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    throw v1

    .line 1377
    :cond_1
    :try_start_4
    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mPaused:Z

    iget-boolean v3, p0, Lcom/android/GLSurfaceView$GLThread;->mRequestPaused:Z

    if-eq v1, v3, :cond_2

    .line 1378
    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mRequestPaused:Z

    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mPaused:Z

    .line 1379
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1386
    :cond_2
    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mLostEglContext:Z

    if-eqz v1, :cond_3

    .line 1387
    invoke-direct {p0}, Lcom/android/GLSurfaceView$GLThread;->stopEglSurfaceLocked()V

    .line 1388
    invoke-direct {p0}, Lcom/android/GLSurfaceView$GLThread;->stopEglContextLocked()V

    .line 1389
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mLostEglContext:Z

    .line 1393
    :cond_3
    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    if-eqz v1, :cond_5

    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mPaused:Z

    if-eqz v1, :cond_5

    .line 1397
    invoke-direct {p0}, Lcom/android/GLSurfaceView$GLThread;->stopEglSurfaceLocked()V

    .line 1398
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/GLSurfaceView$GLThreadManager;->shouldReleaseEGLContextWhenPausing()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1399
    invoke-direct {p0}, Lcom/android/GLSurfaceView$GLThread;->stopEglContextLocked()V

    .line 1404
    :cond_4
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/GLSurfaceView$GLThreadManager;->shouldTerminateEGLWhenPausing()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1405
    iget-object v1, p0, Lcom/android/GLSurfaceView$GLThread;->mEglHelper:Lcom/android/GLSurfaceView$EglHelper;

    invoke-virtual {v1}, Lcom/android/GLSurfaceView$EglHelper;->finish()V

    .line 1413
    :cond_5
    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mHasSurface:Z

    if-nez v1, :cond_7

    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mWaitingForSurface:Z

    if-nez v1, :cond_7

    .line 1417
    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    if-eqz v1, :cond_6

    .line 1418
    invoke-direct {p0}, Lcom/android/GLSurfaceView$GLThread;->stopEglSurfaceLocked()V

    .line 1420
    :cond_6
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mWaitingForSurface:Z

    .line 1421
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1425
    :cond_7
    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mHasSurface:Z

    if-eqz v1, :cond_8

    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mWaitingForSurface:Z

    if-eqz v1, :cond_8

    .line 1429
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mWaitingForSurface:Z

    .line 1430
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1433
    :cond_8
    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->doRenderNotification:Z

    if-eqz v1, :cond_9

    .line 1434
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->wantRenderNotification:Z

    .line 1435
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->doRenderNotification:Z

    .line 1436
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mRenderComplete:Z

    .line 1437
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1441
    :cond_9
    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mPaused:Z

    if-nez v1, :cond_e

    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mHasSurface:Z

    if-eqz v1, :cond_e

    iget v1, p0, Lcom/android/GLSurfaceView$GLThread;->mWidth:I

    if-lez v1, :cond_e

    iget v1, p0, Lcom/android/GLSurfaceView$GLThread;->mHeight:I

    if-lez v1, :cond_e

    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mRequestRender:Z

    if-nez v1, :cond_a

    iget v1, p0, Lcom/android/GLSurfaceView$GLThread;->mRenderMode:I

    if-ne v1, v5, :cond_e

    .line 1446
    :cond_a
    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mHaveEglContext:Z

    if-nez v1, :cond_b

    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/GLSurfaceView$GLThreadManager;->tryAcquireEglContextLocked(Lcom/android/GLSurfaceView$GLThread;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-result v1

    if-eqz v1, :cond_b

    .line 1448
    :try_start_5
    iget-object v1, p0, Lcom/android/GLSurfaceView$GLThread;->mEglHelper:Lcom/android/GLSurfaceView$EglHelper;

    invoke-virtual {v1}, Lcom/android/GLSurfaceView$EglHelper;->start()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_0

    .line 1453
    const/4 v1, 0x1

    :try_start_6
    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mHaveEglContext:Z

    .line 1454
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->createEglContext:Z

    .line 1456
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1459
    :cond_b
    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mHaveEglContext:Z

    if-eqz v1, :cond_c

    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    if-nez v1, :cond_c

    .line 1460
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    .line 1461
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->createEglSurface:Z

    .line 1462
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->sizeChanged:Z

    .line 1465
    :cond_c
    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    if-eqz v1, :cond_e

    .line 1466
    iget-object v1, p0, Lcom/android/GLSurfaceView$GLThread;->this$0:Lcom/android/GLSurfaceView;

    #getter for: Lcom/android/GLSurfaceView;->mSizeChanged:Z
    invoke-static {v1}, Lcom/android/GLSurfaceView;->access$800(Lcom/android/GLSurfaceView;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 1467
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->sizeChanged:Z

    .line 1468
    iget v1, p0, Lcom/android/GLSurfaceView$GLThread;->mWidth:I

    iput v1, p0, Lcom/android/GLSurfaceView$GLThread;->w:I

    .line 1469
    iget v1, p0, Lcom/android/GLSurfaceView$GLThread;->mHeight:I

    iput v1, p0, Lcom/android/GLSurfaceView$GLThread;->h:I

    .line 1470
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->wantRenderNotification:Z

    .line 1479
    iget-object v1, p0, Lcom/android/GLSurfaceView$GLThread;->this$0:Lcom/android/GLSurfaceView;

    const/4 v3, 0x0

    #setter for: Lcom/android/GLSurfaceView;->mSizeChanged:Z
    invoke-static {v1, v3}, Lcom/android/GLSurfaceView;->access$802(Lcom/android/GLSurfaceView;Z)Z

    .line 1483
    :goto_3
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    goto/16 :goto_2

    .line 1496
    :catchall_1
    move-exception v1

    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :try_start_7
    throw v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 1449
    :catch_0
    move-exception v0

    .line 1450
    .local v0, t:Ljava/lang/RuntimeException;
    :try_start_8
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/GLSurfaceView$GLThreadManager;->releaseEglContextLocked(Lcom/android/GLSurfaceView$GLThread;)V

    .line 1451
    throw v0

    .line 1481
    .end local v0           #t:Ljava/lang/RuntimeException;
    :cond_d
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mRequestRender:Z

    goto :goto_3

    .line 1492
    :cond_e
    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mPaused:Z

    if-eqz v1, :cond_f

    .line 1493
    iget-object v1, p0, Lcom/android/GLSurfaceView$GLThread;->mRenderer:Lcom/android/GLSurfaceView$Renderer;

    iget-object v3, p0, Lcom/android/GLSurfaceView$GLThread;->gl:Ljavax/microedition/khronos/opengles/GL10;

    invoke-interface {v1, v3}, Lcom/android/GLSurfaceView$Renderer;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 1494
    :cond_f
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    goto/16 :goto_1

    .line 1510
    :cond_10
    :try_start_9
    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->createEglSurface:Z

    if-eqz v1, :cond_12

    .line 1514
    iget-object v1, p0, Lcom/android/GLSurfaceView$GLThread;->mEglHelper:Lcom/android/GLSurfaceView$EglHelper;

    iget-object v2, p0, Lcom/android/GLSurfaceView$GLThread;->this$0:Lcom/android/GLSurfaceView;

    invoke-virtual {v2}, Lcom/android/GLSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/GLSurfaceView$EglHelper;->createSurface(Landroid/view/SurfaceHolder;)Ljavax/microedition/khronos/opengles/GL;

    move-result-object v1

    check-cast v1, Ljavax/microedition/khronos/opengles/GL10;

    iput-object v1, p0, Lcom/android/GLSurfaceView$GLThread;->gl:Ljavax/microedition/khronos/opengles/GL10;

    .line 1515
    iget-object v1, p0, Lcom/android/GLSurfaceView$GLThread;->gl:Ljavax/microedition/khronos/opengles/GL10;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    if-nez v1, :cond_11

    .line 1559
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1560
    :try_start_a
    invoke-direct {p0}, Lcom/android/GLSurfaceView$GLThread;->stopEglSurfaceLocked()V

    .line 1561
    invoke-direct {p0}, Lcom/android/GLSurfaceView$GLThread;->stopEglContextLocked()V

    .line 1562
    monitor-exit v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 1564
    return-void

    .line 1519
    :cond_11
    :try_start_b
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    iget-object v2, p0, Lcom/android/GLSurfaceView$GLThread;->gl:Ljavax/microedition/khronos/opengles/GL10;

    invoke-virtual {v1, v2}, Lcom/android/GLSurfaceView$GLThreadManager;->checkGLDriver(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 1520
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->createEglSurface:Z

    .line 1523
    :cond_12
    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->createEglContext:Z

    if-eqz v1, :cond_13

    .line 1527
    iget-object v1, p0, Lcom/android/GLSurfaceView$GLThread;->mRenderer:Lcom/android/GLSurfaceView$Renderer;

    iget-object v2, p0, Lcom/android/GLSurfaceView$GLThread;->gl:Ljavax/microedition/khronos/opengles/GL10;

    iget-object v3, p0, Lcom/android/GLSurfaceView$GLThread;->mEglHelper:Lcom/android/GLSurfaceView$EglHelper;

    iget-object v3, v3, Lcom/android/GLSurfaceView$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    invoke-interface {v1, v2, v3}, Lcom/android/GLSurfaceView$Renderer;->onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V

    .line 1528
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->createEglContext:Z

    .line 1531
    :cond_13
    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->sizeChanged:Z

    if-eqz v1, :cond_14

    .line 1535
    iget-object v1, p0, Lcom/android/GLSurfaceView$GLThread;->mRenderer:Lcom/android/GLSurfaceView$Renderer;

    iget-object v2, p0, Lcom/android/GLSurfaceView$GLThread;->gl:Ljavax/microedition/khronos/opengles/GL10;

    iget v3, p0, Lcom/android/GLSurfaceView$GLThread;->w:I

    iget v4, p0, Lcom/android/GLSurfaceView$GLThread;->h:I

    invoke-interface {v1, v2, v3, v4}, Lcom/android/GLSurfaceView$Renderer;->onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V

    .line 1536
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->sizeChanged:Z

    .line 1542
    :cond_14
    iget-object v1, p0, Lcom/android/GLSurfaceView$GLThread;->mRenderer:Lcom/android/GLSurfaceView$Renderer;

    iget-object v2, p0, Lcom/android/GLSurfaceView$GLThread;->gl:Ljavax/microedition/khronos/opengles/GL10;

    invoke-interface {v1, v2}, Lcom/android/GLSurfaceView$Renderer;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 1550
    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->wantRenderNotification:Z

    if-eqz v1, :cond_0

    .line 1551
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->doRenderNotification:Z
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    goto/16 :goto_0

    .line 1562
    :catchall_2
    move-exception v1

    :try_start_c
    monitor-exit v2
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    throw v1

    :catchall_3
    move-exception v1

    :try_start_d
    monitor-exit v2
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    throw v1
.end method

.method private stopEglContextLocked()V
    .locals 1

    .prologue
    .line 1342
    iget-boolean v0, p0, Lcom/android/GLSurfaceView$GLThread;->mHaveEglContext:Z

    if-eqz v0, :cond_0

    .line 1343
    iget-object v0, p0, Lcom/android/GLSurfaceView$GLThread;->mEglHelper:Lcom/android/GLSurfaceView$EglHelper;

    invoke-virtual {v0}, Lcom/android/GLSurfaceView$EglHelper;->finish()V

    .line 1344
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/GLSurfaceView$GLThread;->mHaveEglContext:Z

    .line 1345
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/GLSurfaceView$GLThreadManager;->releaseEglContextLocked(Lcom/android/GLSurfaceView$GLThread;)V

    .line 1347
    :cond_0
    return-void
.end method

.method private stopEglSurfaceLocked()V
    .locals 1

    .prologue
    .line 1331
    iget-boolean v0, p0, Lcom/android/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    if-eqz v0, :cond_0

    .line 1332
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/GLSurfaceView$GLThread;->mHaveEglSurface:Z

    .line 1333
    iget-object v0, p0, Lcom/android/GLSurfaceView$GLThread;->mEglHelper:Lcom/android/GLSurfaceView$EglHelper;

    invoke-virtual {v0}, Lcom/android/GLSurfaceView$EglHelper;->destroySurface()V

    .line 1335
    :cond_0
    return-void
.end method


# virtual methods
.method public createSharedContext(ILjavax/microedition/khronos/egl/EGLContext;)Ljavax/microedition/khronos/egl/EGLContext;
    .locals 3
    .parameter "api"
    .parameter "ctx"

    .prologue
    .line 1948
    const/4 v0, 0x0

    .line 1949
    .local v0, shared:Ljavax/microedition/khronos/egl/EGLContext;
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1950
    :try_start_0
    iget-object v1, p0, Lcom/android/GLSurfaceView$GLThread;->mEglHelper:Lcom/android/GLSurfaceView$EglHelper;

    invoke-virtual {v1, p1, p2}, Lcom/android/GLSurfaceView$EglHelper;->createSharedContext(ILjavax/microedition/khronos/egl/EGLContext;)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v0

    .line 1951
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1952
    monitor-exit v2

    .line 1953
    return-object v0

    .line 1952
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public destroyContext(Ljavax/microedition/khronos/egl/EGLContext;)Z
    .locals 3
    .parameter "ctx"

    .prologue
    .line 1957
    const/4 v0, 0x0

    .line 1958
    .local v0, success:Z
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1959
    :try_start_0
    iget-object v1, p0, Lcom/android/GLSurfaceView$GLThread;->mEglHelper:Lcom/android/GLSurfaceView$EglHelper;

    invoke-virtual {v1, p1}, Lcom/android/GLSurfaceView$EglHelper;->destroyContext(Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v0

    .line 1960
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1961
    monitor-exit v2

    .line 1962
    return v0

    .line 1961
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public event()V
    .locals 1

    .prologue
    .line 1572
    :try_start_0
    invoke-direct {p0}, Lcom/android/GLSurfaceView$GLThread;->eventUnprotected()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1577
    :goto_0
    return-void

    .line 1574
    :catch_0
    move-exception v0

    .line 1575
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public getPrimaryContext()Ljavax/microedition/khronos/egl/EGLContext;
    .locals 3

    .prologue
    .line 1928
    const/4 v0, 0x0

    .line 1929
    .local v0, ctx:Ljavax/microedition/khronos/egl/EGLContext;
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1930
    :try_start_0
    iget-object v1, p0, Lcom/android/GLSurfaceView$GLThread;->mEglHelper:Lcom/android/GLSurfaceView$EglHelper;

    invoke-virtual {v1}, Lcom/android/GLSurfaceView$EglHelper;->getPrimaryContext()Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v0

    .line 1931
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1932
    monitor-exit v2

    .line 1933
    return-object v0

    .line 1932
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getRenderMode()I
    .locals 2

    .prologue
    .line 1788
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    monitor-enter v1

    .line 1789
    :try_start_0
    iget v0, p0, Lcom/android/GLSurfaceView$GLThread;->mRenderMode:I

    monitor-exit v1

    return v0

    .line 1790
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public loopForSurface()V
    .locals 2

    .prologue
    .line 1836
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    monitor-enter v1

    .line 1837
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/android/GLSurfaceView$GLThread;->mLoopForSurface:Z

    .line 1838
    monitor-exit v1

    .line 1839
    return-void

    .line 1838
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public makeCurrentContext(Ljavax/microedition/khronos/egl/EGLContext;)Z
    .locals 3
    .parameter "ctx"

    .prologue
    .line 1938
    const/4 v0, 0x0

    .line 1939
    .local v0, success:Z
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1940
    :try_start_0
    iget-object v1, p0, Lcom/android/GLSurfaceView$GLThread;->mEglHelper:Lcom/android/GLSurfaceView$EglHelper;

    invoke-virtual {v1, p1}, Lcom/android/GLSurfaceView$EglHelper;->makeCurrentContext(Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v0

    .line 1941
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1942
    monitor-exit v2

    .line 1943
    return v0

    .line 1942
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onPause()V
    .locals 3

    .prologue
    .line 1842
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1846
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mRequestPaused:Z

    .line 1847
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mHasSurface:Z

    .line 1848
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1849
    :goto_0
    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mExited:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mPaused:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1854
    :try_start_1
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1855
    :catch_0
    move-exception v0

    .line 1856
    .local v0, ex:Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1859
    .end local v0           #ex:Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1860
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 1863
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1867
    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mRequestPaused:Z

    .line 1868
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mRequestRender:Z

    .line 1869
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mRenderComplete:Z

    .line 1870
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1871
    :goto_0
    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mExited:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mPaused:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mRenderComplete:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1876
    :try_start_1
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1877
    :catch_0
    move-exception v0

    .line 1878
    .local v0, ex:Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1881
    .end local v0           #ex:Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1882
    return-void
.end method

.method public onWindowResize(II)V
    .locals 3
    .parameter "w"
    .parameter "h"

    .prologue
    .line 1885
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    monitor-enter v1

    .line 1886
    :try_start_0
    iput p1, p0, Lcom/android/GLSurfaceView$GLThread;->mWidth:I

    .line 1887
    iput p2, p0, Lcom/android/GLSurfaceView$GLThread;->mHeight:I

    .line 1888
    iget-object v0, p0, Lcom/android/GLSurfaceView$GLThread;->this$0:Lcom/android/GLSurfaceView;

    const/4 v2, 0x1

    #setter for: Lcom/android/GLSurfaceView;->mSizeChanged:Z
    invoke-static {v0, v2}, Lcom/android/GLSurfaceView;->access$802(Lcom/android/GLSurfaceView;Z)Z

    .line 1889
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/GLSurfaceView$GLThread;->mRequestRender:Z

    .line 1890
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/GLSurfaceView$GLThread;->mRenderComplete:Z

    .line 1891
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1892
    monitor-exit v1

    .line 1893
    return-void

    .line 1892
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 2
    .parameter "r"

    .prologue
    .line 1900
    if-nez p1, :cond_0

    .line 1901
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "r must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1903
    :cond_0
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    monitor-enter v1

    .line 1904
    :try_start_0
    iget-object v0, p0, Lcom/android/GLSurfaceView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1905
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1906
    monitor-exit v1

    .line 1907
    return-void

    .line 1906
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public requestRender()V
    .locals 2

    .prologue
    .line 1794
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    monitor-enter v1

    .line 1795
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/android/GLSurfaceView$GLThread;->mRequestRender:Z

    .line 1796
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1797
    monitor-exit v1

    .line 1798
    return-void

    .line 1797
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public run()V
    .locals 3

    .prologue
    .line 1312
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GLThread "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/GLSurfaceView$GLThread;->getId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/GLSurfaceView$GLThread;->setName(Ljava/lang/String;)V

    .line 1318
    :try_start_0
    invoke-direct {p0}, Lcom/android/GLSurfaceView$GLThread;->guardedRun()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1322
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/GLSurfaceView$GLThreadManager;->threadExiting(Lcom/android/GLSurfaceView$GLThread;)V

    .line 1324
    :goto_0
    return-void

    .line 1319
    :catch_0
    move-exception v0

    .line 1322
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/GLSurfaceView$GLThreadManager;->threadExiting(Lcom/android/GLSurfaceView$GLThread;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/GLSurfaceView$GLThreadManager;->threadExiting(Lcom/android/GLSurfaceView$GLThread;)V

    throw v0
.end method

.method public setRenderMode(I)V
    .locals 2
    .parameter "renderMode"

    .prologue
    .line 1778
    if-ltz p1, :cond_0

    const/4 v0, 0x1

    if-le p1, v0, :cond_1

    .line 1779
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "renderMode"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1781
    :cond_1
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    monitor-enter v1

    .line 1782
    :try_start_0
    iput p1, p0, Lcom/android/GLSurfaceView$GLThread;->mRenderMode:I

    .line 1783
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1784
    monitor-exit v1

    .line 1785
    return-void

    .line 1784
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public declared-synchronized start()V
    .locals 1

    .prologue
    .line 1307
    monitor-enter p0

    :try_start_0
    invoke-static {p0}, Lcom/android/GLSurfaceView;->nativeStart(Lcom/android/GLSurfaceView$GLThread;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1308
    monitor-exit p0

    return-void

    .line 1307
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public surfaceCreated()V
    .locals 3

    .prologue
    .line 1801
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1805
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mHasSurface:Z

    .line 1806
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1807
    :goto_0
    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mWaitingForSurface:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mExited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1809
    :try_start_1
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1810
    :catch_0
    move-exception v0

    .line 1811
    .local v0, e:Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1814
    .end local v0           #e:Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1815
    return-void
.end method

.method public surfaceDestroyed()V
    .locals 3

    .prologue
    .line 1818
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1822
    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mHasSurface:Z

    .line 1824
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1825
    :goto_0
    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mWaitingForSurface:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/android/GLSurfaceView$GLThread;->mExited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1827
    :try_start_1
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1828
    :catch_0
    move-exception v0

    .line 1829
    .local v0, e:Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1832
    .end local v0           #e:Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1833
    return-void
.end method

.method public swapBuffers()V
    .locals 5

    .prologue
    .line 1911
    invoke-static {}, Lcom/android/GLSurfaceView;->access$700()Lcom/android/GLSurfaceView$GLThreadManager;

    move-result-object v1

    monitor-enter v1

    .line 1912
    :try_start_0
    iget-object v0, p0, Lcom/android/GLSurfaceView$GLThread;->mEglHelper:Lcom/android/GLSurfaceView$EglHelper;

    invoke-virtual {v0}, Lcom/android/GLSurfaceView$EglHelper;->swap()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1914
    const-string v0, "Shared Context"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "lost context on thread"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1919
    :cond_0
    monitor-exit v1

    .line 1924
    return-void

    .line 1919
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

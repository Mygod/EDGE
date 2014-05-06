.class public Lcom/apportable/gl/VerdeRenderer;
.super Ljava/lang/Object;
.source "VerdeRenderer.java"

# interfaces
.implements Lcom/android/GLSurfaceView$Renderer;


# static fields
.field private static final NANOSECONDSPERMINISECOND:J = 0xf4240L

.field private static final NANOSECONDSPERSECOND:J = 0x3b9aca00L

.field private static TAG:Ljava/lang/String;

.field private static animationInterval:J

.field public static screenHeight:I

.field public static screenWidth:I


# instance fields
.field private last:J

.field public final mCanDispatchDraw:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mView:Lcom/android/GLSurfaceView;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 12
    const-string v0, "VerdeRenderer"

    sput-object v0, Lcom/apportable/gl/VerdeRenderer;->TAG:Ljava/lang/String;

    .line 16
    const-wide/32 v0, 0xfe502a

    sput-wide v0, Lcom/apportable/gl/VerdeRenderer;->animationInterval:J

    return-void
.end method

.method public constructor <init>(Lcom/android/GLSurfaceView;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/apportable/gl/VerdeRenderer;->mCanDispatchDraw:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 23
    iput-object p1, p0, Lcom/apportable/gl/VerdeRenderer;->mView:Lcom/android/GLSurfaceView;

    .line 24
    return-void
.end method

.method private static native nativeDeleteBackward()V
.end method

.method private static native nativeGetContentText()Ljava/lang/String;
.end method

.method private static native nativeInit(II)V
.end method

.method private static native nativeInsertText(Ljava/lang/String;)V
.end method

.method private static native nativeOnPause()V
.end method

.method private static native nativeOnResume()V
.end method

.method private static native nativeOnSurfaceChanged()V
.end method

.method private static native nativeOnWindowFocusChanged(Z)V
.end method

.method private static native nativeRender(J)V
.end method

.method public static setAnimationInterval(D)V
    .locals 2
    .parameter "interval"

    .prologue
    .line 60
    const-wide v0, 0x41cdcd6500000000L

    mul-double/2addr v0, p0

    double-to-long v0, v0

    sput-wide v0, Lcom/apportable/gl/VerdeRenderer;->animationInterval:J

    .line 61
    return-void
.end method


# virtual methods
.method public getContentText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    invoke-static {}, Lcom/apportable/gl/VerdeRenderer;->nativeGetContentText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public handleDeleteBackward()V
    .locals 0

    .prologue
    .line 78
    invoke-static {}, Lcom/apportable/gl/VerdeRenderer;->nativeDeleteBackward()V

    .line 79
    return-void
.end method

.method public handleInsertText(Ljava/lang/String;)V
    .locals 0
    .parameter "text"

    .prologue
    .line 74
    invoke-static {p1}, Lcom/apportable/gl/VerdeRenderer;->nativeInsertText(Ljava/lang/String;)V

    .line 75
    return-void
.end method

.method public handleOnPause()V
    .locals 0

    .prologue
    .line 48
    invoke-static {}, Lcom/apportable/gl/VerdeRenderer;->nativeOnPause()V

    .line 49
    return-void
.end method

.method public handleOnResume()V
    .locals 0

    .prologue
    .line 52
    invoke-static {}, Lcom/apportable/gl/VerdeRenderer;->nativeOnResume()V

    .line 53
    return-void
.end method

.method public handleOnWindowFocusChanged(Z)V
    .locals 0
    .parameter "hasWindowFocus"

    .prologue
    .line 56
    invoke-static {p1}, Lcom/apportable/gl/VerdeRenderer;->nativeOnWindowFocusChanged(Z)V

    .line 57
    return-void
.end method

.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 2
    .parameter "gl"

    .prologue
    .line 43
    iget-object v0, p0, Lcom/apportable/gl/VerdeRenderer;->mCanDispatchDraw:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 44
    sget-wide v0, Lcom/apportable/gl/VerdeRenderer;->animationInterval:J

    invoke-static {v0, v1}, Lcom/apportable/gl/VerdeRenderer;->nativeRender(J)V

    .line 45
    :cond_0
    return-void
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 0
    .parameter "gl"
    .parameter "w"
    .parameter "h"

    .prologue
    .line 37
    invoke-static {}, Lcom/apportable/gl/VerdeRenderer;->nativeOnSurfaceChanged()V

    .line 38
    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 2
    .parameter "gl"
    .parameter "config"

    .prologue
    const/4 v1, 0x0

    .line 27
    const/high16 v0, 0x3f80

    invoke-interface {p1, v1, v1, v1, v0}, Ljavax/microedition/khronos/opengles/GL10;->glClearColor(FFFF)V

    .line 28
    const/16 v0, 0x4100

    invoke-interface {p1, v0}, Ljavax/microedition/khronos/opengles/GL10;->glClear(I)V

    .line 29
    sget-object v0, Lcom/apportable/gl/VerdeRenderer;->TAG:Ljava/lang/String;

    const-string v1, "Pre-nativeInit()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    sget v0, Lcom/apportable/gl/VerdeRenderer;->screenWidth:I

    sget v1, Lcom/apportable/gl/VerdeRenderer;->screenHeight:I

    invoke-static {v0, v1}, Lcom/apportable/gl/VerdeRenderer;->nativeInit(II)V

    .line 31
    sget-object v0, Lcom/apportable/gl/VerdeRenderer;->TAG:Ljava/lang/String;

    const-string v1, "Post-nativeInit()"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/apportable/gl/VerdeRenderer;->last:J

    .line 34
    return-void
.end method

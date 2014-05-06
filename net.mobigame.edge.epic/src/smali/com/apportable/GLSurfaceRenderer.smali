.class public Lcom/apportable/GLSurfaceRenderer;
.super Ljava/lang/Object;
.source "GLSurfaceRenderer.java"

# interfaces
.implements Landroid/opengl/GLSurfaceView$Renderer;


# instance fields
.field private context:J


# direct methods
.method public constructor <init>(J)V
    .locals 0
    .parameter "context"

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-wide p1, p0, Lcom/apportable/GLSurfaceRenderer;->context:J

    .line 18
    return-void
.end method

.method private static native drawFrame(JLjavax/microedition/khronos/opengles/GL10;)V
.end method

.method private static native surfaceChanged(JLjavax/microedition/khronos/opengles/GL10;II)V
.end method

.method private static native surfaceCreated(JLjavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
.end method


# virtual methods
.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 2
    .parameter "gl"

    .prologue
    .line 21
    iget-wide v0, p0, Lcom/apportable/GLSurfaceRenderer;->context:J

    invoke-static {v0, v1, p1}, Lcom/apportable/GLSurfaceRenderer;->drawFrame(JLjavax/microedition/khronos/opengles/GL10;)V

    .line 22
    return-void
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 2
    .parameter "gl"
    .parameter "width"
    .parameter "height"

    .prologue
    .line 25
    iget-wide v0, p0, Lcom/apportable/GLSurfaceRenderer;->context:J

    invoke-static {v0, v1, p1, p2, p3}, Lcom/apportable/GLSurfaceRenderer;->surfaceChanged(JLjavax/microedition/khronos/opengles/GL10;II)V

    .line 26
    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 2
    .parameter "gl"
    .parameter "config"

    .prologue
    .line 29
    iget-wide v0, p0, Lcom/apportable/GLSurfaceRenderer;->context:J

    invoke-static {v0, v1, p1, p2}, Lcom/apportable/GLSurfaceRenderer;->surfaceCreated(JLjavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V

    .line 30
    return-void
.end method

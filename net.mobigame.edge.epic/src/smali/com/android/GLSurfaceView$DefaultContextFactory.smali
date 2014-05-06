.class Lcom/android/GLSurfaceView$DefaultContextFactory;
.super Ljava/lang/Object;
.source "GLSurfaceView.java"

# interfaces
.implements Lcom/android/GLSurfaceView$EGLContextFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/GLSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DefaultContextFactory"
.end annotation


# static fields
.field public static final EGL_CONTEXT_CLIENT_VERSION:I = 0x3098


# instance fields
.field final synthetic this$0:Lcom/android/GLSurfaceView;


# direct methods
.method private constructor <init>(Lcom/android/GLSurfaceView;)V
    .locals 0
    .parameter

    .prologue
    .line 710
    iput-object p1, p0, Lcom/android/GLSurfaceView$DefaultContextFactory;->this$0:Lcom/android/GLSurfaceView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/GLSurfaceView;Lcom/android/GLSurfaceView$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 710
    invoke-direct {p0, p1}, Lcom/android/GLSurfaceView$DefaultContextFactory;-><init>(Lcom/android/GLSurfaceView;)V

    return-void
.end method


# virtual methods
.method public createContext(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLContext;
    .locals 3
    .parameter "egl"
    .parameter "display"
    .parameter "config"

    .prologue
    .line 714
    const/4 v1, 0x3

    new-array v0, v1, [I

    const/4 v1, 0x0

    const/16 v2, 0x3098

    aput v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/android/GLSurfaceView$DefaultContextFactory;->this$0:Lcom/android/GLSurfaceView;

    #getter for: Lcom/android/GLSurfaceView;->mEGLContextClientVersion:I
    invoke-static {v2}, Lcom/android/GLSurfaceView;->access$200(Lcom/android/GLSurfaceView;)I

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x2

    const/16 v2, 0x3038

    aput v2, v0, v1

    .line 717
    .local v0, attrib_list:[I
    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    iget-object v2, p0, Lcom/android/GLSurfaceView$DefaultContextFactory;->this$0:Lcom/android/GLSurfaceView;

    #getter for: Lcom/android/GLSurfaceView;->mEGLContextClientVersion:I
    invoke-static {v2}, Lcom/android/GLSurfaceView;->access$200(Lcom/android/GLSurfaceView;)I

    move-result v2

    if-eqz v2, :cond_0

    .end local v0           #attrib_list:[I
    :goto_0
    invoke-interface {p1, p2, p3, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v1

    return-object v1

    .restart local v0       #attrib_list:[I
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public destroyContext(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)V
    .locals 2
    .parameter "egl"
    .parameter "display"
    .parameter "context"

    .prologue
    .line 723
    invoke-interface {p1, p2, p3}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 728
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "eglDestroyContext failed"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 730
    :cond_0
    return-void
.end method

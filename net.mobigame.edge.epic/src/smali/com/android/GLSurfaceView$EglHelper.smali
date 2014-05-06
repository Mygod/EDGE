.class Lcom/android/GLSurfaceView$EglHelper;
.super Ljava/lang/Object;
.source "GLSurfaceView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/GLSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EglHelper"
.end annotation


# instance fields
.field mEgl:Ljavax/microedition/khronos/egl/EGL10;

.field mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

.field mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

.field mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

.field mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

.field mHasValidConfig:Z

.field private mSharedPBufferSurfaces:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljavax/microedition/khronos/egl/EGLContext;",
            "Ljavax/microedition/khronos/egl/EGLSurface;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/android/GLSurfaceView;


# direct methods
.method public constructor <init>(Lcom/android/GLSurfaceView;)V
    .locals 1
    .parameter

    .prologue
    .line 917
    iput-object p1, p0, Lcom/android/GLSurfaceView$EglHelper;->this$0:Lcom/android/GLSurfaceView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 991
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mSharedPBufferSurfaces:Ljava/util/HashMap;

    .line 1280
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mHasValidConfig:Z

    .line 919
    return-void
.end method

.method private throwEglException(Ljava/lang/String;)V
    .locals 1
    .parameter "function"

    .prologue
    .line 1264
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/android/GLSurfaceView$EglHelper;->throwEglException(Ljava/lang/String;I)V

    .line 1265
    return-void
.end method

.method private throwEglException(Ljava/lang/String;I)V
    .locals 3
    .parameter "function"
    .parameter "error"

    .prologue
    .line 1268
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " failed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1272
    .local v0, message:Ljava/lang/String;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public clearContext()V
    .locals 6

    .prologue
    .line 974
    iget-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v2, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v5, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v1, v2, v3, v4, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 976
    iget-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {v1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v0

    .line 977
    .local v0, err:I
    const/16 v1, 0x3000

    if-eq v0, v1, :cond_0

    .line 983
    :cond_0
    return-void
.end method

.method public createSharedContext(ILjavax/microedition/khronos/egl/EGLContext;)Ljavax/microedition/khronos/egl/EGLContext;
    .locals 9
    .parameter "api"
    .parameter "ctx"

    .prologue
    const/16 v8, 0x3000

    const/4 v4, 0x0

    .line 1054
    const/4 v5, 0x3

    new-array v0, v5, [I

    const/4 v5, 0x0

    const/16 v6, 0x3098

    aput v6, v0, v5

    const/4 v5, 0x1

    iget-object v6, p0, Lcom/android/GLSurfaceView$EglHelper;->this$0:Lcom/android/GLSurfaceView;

    #getter for: Lcom/android/GLSurfaceView;->mEGLContextClientVersion:I
    invoke-static {v6}, Lcom/android/GLSurfaceView;->access$200(Lcom/android/GLSurfaceView;)I

    move-result v6

    aput v6, v0, v5

    const/4 v5, 0x2

    const/16 v6, 0x3038

    aput v6, v0, v5

    .line 1060
    .local v0, attrib_list:[I
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    move-result-object v1

    check-cast v1, Ljavax/microedition/khronos/egl/EGL10;

    .line 1062
    .local v1, egl:Ljavax/microedition/khronos/egl/EGL10;
    invoke-interface {v1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v2

    .line 1063
    .local v2, err:I
    if-eq v2, v8, :cond_1

    .line 1082
    .end local v0           #attrib_list:[I
    :cond_0
    :goto_0
    return-object v4

    .line 1070
    .restart local v0       #attrib_list:[I
    :cond_1
    iget-object v5, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v6, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    iget-object v7, p0, Lcom/android/GLSurfaceView$EglHelper;->this$0:Lcom/android/GLSurfaceView;

    #getter for: Lcom/android/GLSurfaceView;->mEGLContextClientVersion:I
    invoke-static {v7}, Lcom/android/GLSurfaceView;->access$200(Lcom/android/GLSurfaceView;)I

    move-result v7

    if-eqz v7, :cond_2

    .end local v0           #attrib_list:[I
    :goto_1
    invoke-interface {v1, v5, v6, p2, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v3

    .line 1072
    .local v3, shared:Ljavax/microedition/khronos/egl/EGLContext;
    invoke-interface {v1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v2

    .line 1073
    if-ne v2, v8, :cond_0

    move-object v4, v3

    .line 1082
    goto :goto_0

    .end local v3           #shared:Ljavax/microedition/khronos/egl/EGLContext;
    .restart local v0       #attrib_list:[I
    :cond_2
    move-object v0, v4

    .line 1070
    goto :goto_1
.end method

.method public createSurface(Landroid/view/SurfaceHolder;)Ljavax/microedition/khronos/opengles/GL;
    .locals 13
    .parameter "holder"

    .prologue
    .line 1108
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    if-nez v0, :cond_0

    .line 1109
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "egl not initialized"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1111
    :cond_0
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    if-nez v0, :cond_1

    .line 1112
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "eglDisplay not initialized"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1114
    :cond_1
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    if-nez v0, :cond_2

    .line 1115
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "mEglConfig not initialized"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1121
    :cond_2
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eq v0, v1, :cond_3

    .line 1127
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 1129
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->this$0:Lcom/android/GLSurfaceView;

    #getter for: Lcom/android/GLSurfaceView;->mEGLWindowSurfaceFactory:Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;
    invoke-static {v0}, Lcom/android/GLSurfaceView;->access$500(Lcom/android/GLSurfaceView;)Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;

    move-result-object v0

    iget-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v2, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v3, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-interface {v0, v1, v2, v3}, Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;->destroySurface(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)V

    .line 1136
    :cond_3
    iget-boolean v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mHasValidConfig:Z

    if-eqz v0, :cond_4

    .line 1141
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->this$0:Lcom/android/GLSurfaceView;

    #getter for: Lcom/android/GLSurfaceView;->mEGLWindowSurfaceFactory:Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;
    invoke-static {v0}, Lcom/android/GLSurfaceView;->access$500(Lcom/android/GLSurfaceView;)Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;

    move-result-object v0

    iget-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v2, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v3, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    invoke-interface {v0, v1, v2, v3, p1}, Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;->createWindowSurface(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v0

    iput-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 1143
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v10

    .line 1144
    .local v10, error:I
    const/16 v0, 0x3000

    if-eq v10, v0, :cond_4

    .line 1145
    const-string v0, "Apportable"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "createWindowSurface failed with "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1146
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mHasValidConfig:Z

    .line 1147
    const/16 v0, 0x300b

    if-ne v10, v0, :cond_4

    .line 1148
    const-string v0, "Apportable"

    const-string v1, "createWindowSurface returned EGL_BAD_NATIVE_WINDOW."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1154
    .end local v10           #error:I
    :cond_4
    iget-boolean v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mHasValidConfig:Z

    if-nez v0, :cond_5

    .line 1155
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v2, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    iget-object v3, p0, Lcom/android/GLSurfaceView$EglHelper;->this$0:Lcom/android/GLSurfaceView;

    #getter for: Lcom/android/GLSurfaceView;->mEGLWindowSurfaceFactory:Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;
    invoke-static {v3}, Lcom/android/GLSurfaceView;->access$500(Lcom/android/GLSurfaceView;)Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;

    move-result-object v4

    iget-object v3, p0, Lcom/android/GLSurfaceView$EglHelper;->this$0:Lcom/android/GLSurfaceView;

    #getter for: Lcom/android/GLSurfaceView;->mEGLContextFactory:Lcom/android/GLSurfaceView$EGLContextFactory;
    invoke-static {v3}, Lcom/android/GLSurfaceView;->access$400(Lcom/android/GLSurfaceView;)Lcom/android/GLSurfaceView$EGLContextFactory;

    move-result-object v5

    move-object v3, p1

    invoke-static/range {v0 .. v5}, Lcom/apportable/utils/Utils;->choosePreferredConfigOrder(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;Landroid/view/SurfaceHolder;Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;Lcom/android/GLSurfaceView$EGLContextFactory;)[Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object v8

    .line 1156
    .local v8, configurations:[Ljavax/microedition/khronos/egl/EGLConfig;
    invoke-static {}, Lcom/apportable/utils/MetaData;->getMetaData()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "apportable.surface_config_id"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v7

    .line 1157
    .local v7, chosenConfig:I
    if-ltz v7, :cond_8

    .line 1158
    const-string v0, "Apportable"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Testing config "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1159
    aget-object v0, v8, v7

    iput-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 1160
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v2, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    iget-object v3, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    iget-object v4, p0, Lcom/android/GLSurfaceView$EglHelper;->this$0:Lcom/android/GLSurfaceView;

    #getter for: Lcom/android/GLSurfaceView;->mEGLWindowSurfaceFactory:Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;
    invoke-static {v4}, Lcom/android/GLSurfaceView;->access$500(Lcom/android/GLSurfaceView;)Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;

    move-result-object v5

    iget-object v4, p0, Lcom/android/GLSurfaceView$EglHelper;->this$0:Lcom/android/GLSurfaceView;

    #getter for: Lcom/android/GLSurfaceView;->mEGLContextFactory:Lcom/android/GLSurfaceView$EGLContextFactory;
    invoke-static {v4}, Lcom/android/GLSurfaceView;->access$400(Lcom/android/GLSurfaceView;)Lcom/android/GLSurfaceView$EGLContextFactory;

    move-result-object v6

    move-object v4, p1

    invoke-static/range {v0 .. v6}, Lcom/apportable/utils/Utils;->tryEglConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;Ljavax/microedition/khronos/egl/EGLConfig;Landroid/view/SurfaceHolder;Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;Lcom/android/GLSurfaceView$EGLContextFactory;)[Ljava/lang/Object;

    move-result-object v9

    .line 1161
    .local v9, eglObjs:[Ljava/lang/Object;
    const/4 v0, 0x0

    aget-object v0, v9, v0

    check-cast v0, Ljavax/microedition/khronos/egl/EGLContext;

    iput-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 1162
    const/4 v0, 0x1

    aget-object v0, v9, v0

    check-cast v0, Ljavax/microedition/khronos/egl/EGLSurface;

    iput-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 1164
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eqz v0, :cond_5

    .line 1166
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mHasValidConfig:Z

    .line 1191
    .end local v7           #chosenConfig:I
    .end local v8           #configurations:[Ljavax/microedition/khronos/egl/EGLConfig;
    .end local v9           #eglObjs:[Ljava/lang/Object;
    :cond_5
    :goto_0
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v2, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    iget-object v3, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    iget-object v4, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 1192
    const-string v0, "eglMakeCurrent"

    invoke-direct {p0, v0}, Lcom/android/GLSurfaceView$EglHelper;->throwEglException(Ljava/lang/String;)V

    .line 1195
    :cond_6
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-virtual {v0}, Ljavax/microedition/khronos/egl/EGLContext;->getGL()Ljavax/microedition/khronos/opengles/GL;

    move-result-object v11

    .line 1196
    .local v11, gl:Ljavax/microedition/khronos/opengles/GL;
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->this$0:Lcom/android/GLSurfaceView;

    #getter for: Lcom/android/GLSurfaceView;->mGLWrapper:Lcom/android/GLSurfaceView$GLWrapper;
    invoke-static {v0}, Lcom/android/GLSurfaceView;->access$600(Lcom/android/GLSurfaceView;)Lcom/android/GLSurfaceView$GLWrapper;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 1197
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->this$0:Lcom/android/GLSurfaceView;

    #getter for: Lcom/android/GLSurfaceView;->mGLWrapper:Lcom/android/GLSurfaceView$GLWrapper;
    invoke-static {v0}, Lcom/android/GLSurfaceView;->access$600(Lcom/android/GLSurfaceView;)Lcom/android/GLSurfaceView$GLWrapper;

    move-result-object v0

    invoke-interface {v0, v11}, Lcom/android/GLSurfaceView$GLWrapper;->wrap(Ljavax/microedition/khronos/opengles/GL;)Ljavax/microedition/khronos/opengles/GL;

    move-result-object v11

    .line 1199
    :cond_7
    return-object v11

    .line 1170
    .end local v11           #gl:Ljavax/microedition/khronos/opengles/GL;
    .restart local v7       #chosenConfig:I
    .restart local v8       #configurations:[Ljavax/microedition/khronos/egl/EGLConfig;
    :cond_8
    const-string v0, "Apportable"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "About to try "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v2, v8

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " configurations"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1172
    const/4 v12, 0x0

    .local v12, i:I
    :goto_1
    array-length v0, v8

    if-ge v12, v0, :cond_5

    .line 1173
    aget-object v0, v8, v12

    iput-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 1174
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v2, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    iget-object v3, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    iget-object v4, p0, Lcom/android/GLSurfaceView$EglHelper;->this$0:Lcom/android/GLSurfaceView;

    #getter for: Lcom/android/GLSurfaceView;->mEGLWindowSurfaceFactory:Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;
    invoke-static {v4}, Lcom/android/GLSurfaceView;->access$500(Lcom/android/GLSurfaceView;)Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;

    move-result-object v5

    iget-object v4, p0, Lcom/android/GLSurfaceView$EglHelper;->this$0:Lcom/android/GLSurfaceView;

    #getter for: Lcom/android/GLSurfaceView;->mEGLContextFactory:Lcom/android/GLSurfaceView$EGLContextFactory;
    invoke-static {v4}, Lcom/android/GLSurfaceView;->access$400(Lcom/android/GLSurfaceView;)Lcom/android/GLSurfaceView$EGLContextFactory;

    move-result-object v6

    move-object v4, p1

    invoke-static/range {v0 .. v6}, Lcom/apportable/utils/Utils;->tryEglConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;Ljavax/microedition/khronos/egl/EGLConfig;Landroid/view/SurfaceHolder;Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;Lcom/android/GLSurfaceView$EGLContextFactory;)[Ljava/lang/Object;

    move-result-object v9

    .line 1175
    .restart local v9       #eglObjs:[Ljava/lang/Object;
    const/4 v0, 0x0

    aget-object v0, v9, v0

    check-cast v0, Ljavax/microedition/khronos/egl/EGLContext;

    iput-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 1176
    const/4 v0, 0x1

    aget-object v0, v9, v0

    check-cast v0, Ljavax/microedition/khronos/egl/EGLSurface;

    iput-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 1178
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eqz v0, :cond_9

    .line 1180
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mHasValidConfig:Z

    goto/16 :goto_0

    .line 1172
    :cond_9
    add-int/lit8 v12, v12, 0x1

    goto :goto_1
.end method

.method public destroyContext(Ljavax/microedition/khronos/egl/EGLContext;)Z
    .locals 5
    .parameter "ctx"

    .prologue
    const/4 v3, 0x0

    .line 1086
    iget-object v4, p0, Lcom/android/GLSurfaceView$EglHelper;->mSharedPBufferSurfaces:Ljava/util/HashMap;

    invoke-virtual {v4, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/microedition/khronos/egl/EGLSurface;

    .line 1087
    .local v1, pbufferSurface:Ljavax/microedition/khronos/egl/EGLSurface;
    if-eqz v1, :cond_1

    .line 1088
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    move-result-object v0

    check-cast v0, Ljavax/microedition/khronos/egl/EGL10;

    .line 1089
    .local v0, egl:Ljavax/microedition/khronos/egl/EGL10;
    iget-object v4, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v0, v4, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    move-result v2

    .line 1090
    .local v2, success:Z
    if-eqz v2, :cond_0

    iget-object v4, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v0, v4, p1}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v2, 0x1

    .line 1093
    .end local v0           #egl:Ljavax/microedition/khronos/egl/EGL10;
    .end local v2           #success:Z
    :goto_0
    return v2

    .restart local v0       #egl:Ljavax/microedition/khronos/egl/EGL10;
    .restart local v2       #success:Z
    :cond_0
    move v2, v3

    .line 1090
    goto :goto_0

    .end local v0           #egl:Ljavax/microedition/khronos/egl/EGL10;
    .end local v2           #success:Z
    :cond_1
    move v2, v3

    .line 1093
    goto :goto_0
.end method

.method public destroySurface()V
    .locals 5

    .prologue
    .line 1239
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eq v0, v1, :cond_0

    .line 1240
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 1243
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->this$0:Lcom/android/GLSurfaceView;

    #getter for: Lcom/android/GLSurfaceView;->mEGLWindowSurfaceFactory:Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;
    invoke-static {v0}, Lcom/android/GLSurfaceView;->access$500(Lcom/android/GLSurfaceView;)Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;

    move-result-object v0

    iget-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v2, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v3, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-interface {v0, v1, v2, v3}, Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;->destroySurface(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)V

    .line 1244
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 1246
    :cond_0
    return-void
.end method

.method public finish()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 1252
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    if-eqz v0, :cond_0

    .line 1253
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->this$0:Lcom/android/GLSurfaceView;

    #getter for: Lcom/android/GLSurfaceView;->mEGLContextFactory:Lcom/android/GLSurfaceView$EGLContextFactory;
    invoke-static {v0}, Lcom/android/GLSurfaceView;->access$400(Lcom/android/GLSurfaceView;)Lcom/android/GLSurfaceView$EGLContextFactory;

    move-result-object v0

    iget-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v2, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v3, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v0, v1, v2, v3}, Lcom/android/GLSurfaceView$EGLContextFactory;->destroyContext(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)V

    .line 1254
    iput-object v4, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 1256
    :cond_0
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    if-eqz v0, :cond_1

    .line 1257
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v0, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z

    .line 1258
    iput-object v4, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 1260
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mHasValidConfig:Z

    .line 1261
    return-void
.end method

.method public getPrimaryContext()Ljavax/microedition/khronos/egl/EGLContext;
    .locals 1

    .prologue
    .line 988
    iget-object v0, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    return-object v0
.end method

.method public makeCurrentContext(Ljavax/microedition/khronos/egl/EGLContext;)Z
    .locals 11
    .parameter "ctx"

    .prologue
    const/16 v10, 0x3000

    const/4 v5, 0x0

    .line 995
    if-nez p1, :cond_1

    .line 1049
    :cond_0
    :goto_0
    return v5

    .line 1001
    :cond_1
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    move-result-object v0

    check-cast v0, Ljavax/microedition/khronos/egl/EGL10;

    .line 1003
    .local v0, egl:Ljavax/microedition/khronos/egl/EGL10;
    iget-object v6, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    sget-object v7, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v8, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v9, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v0, v6, v7, v8, v9}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 1005
    invoke-interface {v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v1

    .line 1006
    .local v1, err:I
    if-ne v1, v10, :cond_0

    .line 1012
    const/4 v4, 0x0

    .line 1013
    .local v4, success:Z
    iget-object v6, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    if-eq p1, v6, :cond_3

    .line 1015
    iget-object v6, p0, Lcom/android/GLSurfaceView$EglHelper;->mSharedPBufferSurfaces:Ljava/util/HashMap;

    invoke-virtual {v6, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavax/microedition/khronos/egl/EGLSurface;

    .line 1016
    .local v2, pbufferSurface:Ljavax/microedition/khronos/egl/EGLSurface;
    if-nez v2, :cond_2

    .line 1018
    const/4 v6, 0x5

    new-array v3, v6, [I

    fill-array-data v3, :array_0

    .line 1026
    .local v3, pbuffer_attribs:[I
    iget-object v6, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v7, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    invoke-interface {v0, v6, v7, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglCreatePbufferSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v2

    .line 1027
    if-eqz v2, :cond_0

    .line 1033
    iget-object v6, p0, Lcom/android/GLSurfaceView$EglHelper;->mSharedPBufferSurfaces:Ljava/util/HashMap;

    invoke-virtual {v6, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1035
    .end local v3           #pbuffer_attribs:[I
    :cond_2
    iget-object v6, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v0, v6, v2, v2, p1}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v4

    .line 1042
    .end local v2           #pbufferSurface:Ljavax/microedition/khronos/egl/EGLSurface;
    :goto_1
    invoke-interface {v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v1

    .line 1043
    if-ne v1, v10, :cond_0

    .line 1049
    const/4 v5, 0x1

    goto :goto_0

    .line 1039
    :cond_3
    iget-object v6, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v7, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    iget-object v8, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-interface {v0, v6, v7, v8, p1}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v4

    goto :goto_1

    .line 1018
    :array_0
    .array-data 0x4
        0x57t 0x30t 0x0t 0x0t
        0x1t 0x0t 0x0t 0x0t
        0x56t 0x30t 0x0t 0x0t
        0x1t 0x0t 0x0t 0x0t
        0x38t 0x30t 0x0t 0x0t
    .end array-data
.end method

.method public start()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 932
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    move-result-object v1

    check-cast v1, Ljavax/microedition/khronos/egl/EGL10;

    iput-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    .line 937
    iget-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_DEFAULT_DISPLAY:Ljava/lang/Object;

    invoke-interface {v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v1

    iput-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 939
    iget-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    if-ne v1, v2, :cond_0

    .line 940
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "eglGetDisplay failed"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 946
    :cond_0
    const/4 v1, 0x2

    new-array v0, v1, [I

    .line 947
    .local v0, version:[I
    iget-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v2, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v1, v2, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    move-result v1

    if-nez v1, :cond_1

    .line 948
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "eglInitialize failed"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 950
    :cond_1
    iget-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->this$0:Lcom/android/GLSurfaceView;

    #getter for: Lcom/android/GLSurfaceView;->mEGLConfigChooser:Lcom/android/GLSurfaceView$EGLConfigChooser;
    invoke-static {v1}, Lcom/android/GLSurfaceView;->access$300(Lcom/android/GLSurfaceView;)Lcom/android/GLSurfaceView$EGLConfigChooser;

    move-result-object v1

    iget-object v2, p0, Lcom/android/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v3, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v1, v2, v3}, Lcom/android/GLSurfaceView$EGLConfigChooser;->chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object v1

    iput-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 956
    iget-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->this$0:Lcom/android/GLSurfaceView;

    #getter for: Lcom/android/GLSurfaceView;->mEGLContextFactory:Lcom/android/GLSurfaceView$EGLContextFactory;
    invoke-static {v1}, Lcom/android/GLSurfaceView;->access$400(Lcom/android/GLSurfaceView;)Lcom/android/GLSurfaceView$EGLContextFactory;

    move-result-object v1

    iget-object v2, p0, Lcom/android/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v3, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v4, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    invoke-interface {v1, v2, v3, v4}, Lcom/android/GLSurfaceView$EGLContextFactory;->createContext(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v1

    iput-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 957
    iget-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    if-ne v1, v2, :cond_3

    .line 958
    :cond_2
    iput-object v5, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 967
    :cond_3
    iput-object v5, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 970
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/GLSurfaceView$EglHelper;->mHasValidConfig:Z

    .line 971
    return-void
.end method

.method public swap()Z
    .locals 6

    .prologue
    .line 1207
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    move-result-object v1

    check-cast v1, Ljavax/microedition/khronos/egl/EGL10;

    .line 1208
    .local v1, gl:Ljavax/microedition/khronos/egl/EGL10;
    iget-object v2, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v3, p0, Lcom/android/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-interface {v1, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglSwapBuffers(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1216
    invoke-interface {v1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v0

    .line 1217
    .local v0, error:I
    packed-switch v0, :pswitch_data_0

    .line 1228
    :pswitch_0
    const-string v2, "EglHelper"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "eglSwapBuffers returned "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ". tid="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getId()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1232
    .end local v0           #error:I
    :cond_0
    :goto_0
    const/4 v2, 0x1

    :goto_1
    return v2

    .line 1219
    .restart local v0       #error:I
    :pswitch_1
    const/4 v2, 0x0

    goto :goto_1

    .line 1224
    :pswitch_2
    const-string v2, "EglHelper"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "eglSwapBuffers returned EGL_BAD_NATIVE_WINDOW. tid="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getId()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1217
    :pswitch_data_0
    .packed-switch 0x300b
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

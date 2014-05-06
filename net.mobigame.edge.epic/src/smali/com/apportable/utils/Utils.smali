.class public Lcom/apportable/utils/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static varargs Log(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 6
    .parameter "format"
    .parameter "args"

    .prologue
    .line 406
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v2

    const/4 v3, 0x3

    aget-object v0, v2, v3

    .line 407
    .local v0, caller:Ljava/lang/StackTraceElement;
    new-instance v1, Ljava/util/Formatter;

    invoke-direct {v1}, Ljava/util/Formatter;-><init>()V

    .line 408
    .local v1, formatter:Ljava/util/Formatter;
    const-string v2, "VERDE_DEBUG"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getId()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1, p0, p1}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Formatter;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 409
    return-void
.end method

.method public static LogRect(Landroid/graphics/Rect;)V
    .locals 3
    .parameter "rect"

    .prologue
    .line 399
    const-string v0, "VerdeLogging"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Top: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/graphics/Rect;->top:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", Left: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/graphics/Rect;->left:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", Right: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/graphics/Rect;->right:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", Bottom: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 400
    return-void
.end method

.method public static LogRect(Landroid/graphics/RectF;)V
    .locals 3
    .parameter "rect"

    .prologue
    .line 395
    const-string v0, "VerdeLogging"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Top: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/graphics/RectF;->top:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", Left: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/graphics/RectF;->left:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", Right: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/graphics/RectF;->right:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", Bottom: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 396
    return-void
.end method

.method public static declared-synchronized choosePreferredConfigOrder(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;Landroid/view/SurfaceHolder;Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;Lcom/android/GLSurfaceView$EGLContextFactory;)[Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 25
    .parameter "egl"
    .parameter "display"
    .parameter "context"
    .parameter "holder"
    .parameter "windowSurfaceFactory"
    .parameter "contextFactory"

    .prologue
    .line 185
    const-class v24, Lcom/apportable/utils/Utils;

    monitor-enter v24

    :try_start_0
    invoke-static/range {p0 .. p1}, Lcom/apportable/utils/Utils;->getEglConfigs(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)[Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object v16

    .line 188
    .local v16, eglConfigurations:[Ljavax/microedition/khronos/egl/EGLConfig;
    invoke-static {}, Lcom/apportable/utils/MetaData;->getMetaData()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "apportable.opengles.atc_slow_surface"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v15

    .line 189
    .local v15, atcSlowSurface:Z
    const/16 v20, 0x0

    .line 190
    .local v20, gl:Ljavax/microedition/khronos/opengles/GL10;
    const/4 v4, 0x0

    .line 191
    .local v4, surface:Ljavax/microedition/khronos/egl/EGLSurface;
    const/16 v22, 0x0

    .line 192
    .local v22, triedToCreateContext:Z
    if-eqz v15, :cond_0

    .line 194
    if-eqz p4, :cond_0

    if-eqz p5, :cond_0

    if-eqz p3, :cond_0

    .line 195
    const/16 v22, 0x1

    .line 196
    const/16 v21, 0x0

    .local v21, i:I
    :goto_0
    move-object/from16 v0, v16

    array-length v1, v0

    move/from16 v0, v21

    if-ge v0, v1, :cond_0

    .line 197
    aget-object v4, v16, v21

    .end local v4           #surface:Ljavax/microedition/khronos/egl/EGLSurface;
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    invoke-static/range {v1 .. v7}, Lcom/apportable/utils/Utils;->tryEglConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;Ljavax/microedition/khronos/egl/EGLConfig;Landroid/view/SurfaceHolder;Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;Lcom/android/GLSurfaceView$EGLContextFactory;)[Ljava/lang/Object;

    move-result-object v17

    .line 198
    .local v17, eglObjs:[Ljava/lang/Object;
    const/4 v1, 0x0

    aget-object v1, v17, v1

    move-object v0, v1

    check-cast v0, Ljavax/microedition/khronos/egl/EGLContext;

    move-object/from16 p2, v0

    .line 199
    const/4 v1, 0x1

    aget-object v4, v17, v1

    check-cast v4, Ljavax/microedition/khronos/egl/EGLSurface;

    .line 200
    .restart local v4       #surface:Ljavax/microedition/khronos/egl/EGLSurface;
    if-eqz p2, :cond_3

    .line 201
    invoke-virtual/range {p2 .. p2}, Ljavax/microedition/khronos/egl/EGLContext;->getGL()Ljavax/microedition/khronos/opengles/GL;

    move-result-object v20

    .end local v20           #gl:Ljavax/microedition/khronos/opengles/GL10;
    check-cast v20, Ljavax/microedition/khronos/opengles/GL10;

    .line 202
    .restart local v20       #gl:Ljavax/microedition/khronos/opengles/GL10;
    if-eqz v20, :cond_3

    .line 209
    .end local v17           #eglObjs:[Ljava/lang/Object;
    .end local v21           #i:I
    :cond_0
    if-eqz v15, :cond_6

    .line 210
    if-eqz v20, :cond_5

    .line 211
    const/16 v1, 0x1f03

    move-object/from16 v0, v20

    invoke-interface {v0, v1}, Ljavax/microedition/khronos/opengles/GL10;->glGetString(I)Ljava/lang/String;

    move-result-object v18

    .line 212
    .local v18, extensions:Ljava/lang/String;
    const-string v1, "GL_AMD_compressed_ATC_texture"

    move-object/from16 v0, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-ltz v1, :cond_4

    const/4 v8, 0x1

    .line 223
    .end local v18           #extensions:Ljava/lang/String;
    .local v8, isATC:Z
    :goto_1
    if-eqz v22, :cond_1

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    .line 225
    invoke-static/range {v1 .. v6}, Lcom/apportable/utils/Utils;->resetEglState(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;Ljavax/microedition/khronos/egl/EGLSurface;Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;Lcom/android/GLSurfaceView$EGLContextFactory;)V

    .line 228
    :cond_1
    invoke-static {}, Lcom/apportable/utils/MetaData;->getMetaData()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "apportable.opengles.true_color"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v23

    .line 229
    .local v23, trueColor:Z
    invoke-static {}, Lcom/apportable/utils/MetaData;->getMetaData()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "apportable.opengles.fast_color"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v19

    .line 230
    .local v19, fastColor:Z
    invoke-static {}, Lcom/apportable/utils/MetaData;->getMetaData()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "apportable.opengles.depth_buffer"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    .line 231
    .local v13, depthBuffer:Z
    invoke-static {}, Lcom/apportable/utils/MetaData;->getMetaData()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "apportable.opengles.stencil_buffer"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v14

    .line 234
    .local v14, stencilBuffer:Z
    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const-string v2, "Sony Ericsson"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    sget-object v1, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    const-string v2, "4.0.0"

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    if-ltz v1, :cond_2

    .line 236
    const-string v1, "choosePreferredConfigOrder"

    const-string v2, "force to fast_color, SE/ICS"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    const/16 v23, 0x0

    .line 238
    const/16 v19, 0x1

    .line 245
    :cond_2
    if-eqz v23, :cond_7

    .line 246
    const-string v1, "choosePreferredConfigOrder"

    const-string v2, "using true_color"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 247
    const/16 v9, 0x8

    .line 248
    .local v9, red:I
    const/16 v10, 0x8

    .line 249
    .local v10, green:I
    const/16 v11, 0x8

    .line 250
    .local v11, blue:I
    const/16 v12, 0x8

    .line 265
    .local v12, alpha:I
    :goto_2
    new-instance v5, Lcom/apportable/utils/Utils$1;

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    invoke-direct/range {v5 .. v14}, Lcom/apportable/utils/Utils$1;-><init>(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;ZIIIIZZ)V

    move-object/from16 v0, v16

    invoke-static {v0, v5}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 391
    monitor-exit v24

    return-object v16

    .line 196
    .end local v8           #isATC:Z
    .end local v9           #red:I
    .end local v10           #green:I
    .end local v11           #blue:I
    .end local v12           #alpha:I
    .end local v13           #depthBuffer:Z
    .end local v14           #stencilBuffer:Z
    .end local v19           #fastColor:Z
    .end local v23           #trueColor:Z
    .restart local v17       #eglObjs:[Ljava/lang/Object;
    .restart local v21       #i:I
    :cond_3
    add-int/lit8 v21, v21, 0x1

    goto/16 :goto_0

    .line 212
    .end local v17           #eglObjs:[Ljava/lang/Object;
    .end local v21           #i:I
    .restart local v18       #extensions:Ljava/lang/String;
    :cond_4
    const/4 v8, 0x0

    goto :goto_1

    .line 216
    .end local v18           #extensions:Ljava/lang/String;
    :cond_5
    const/4 v8, 0x0

    .restart local v8       #isATC:Z
    goto/16 :goto_1

    .line 220
    .end local v8           #isATC:Z
    :cond_6
    const/4 v8, 0x0

    .restart local v8       #isATC:Z
    goto/16 :goto_1

    .line 251
    .restart local v13       #depthBuffer:Z
    .restart local v14       #stencilBuffer:Z
    .restart local v19       #fastColor:Z
    .restart local v23       #trueColor:Z
    :cond_7
    if-eqz v19, :cond_8

    .line 252
    :try_start_1
    const-string v1, "choosePreferredConfigOrder"

    const-string v2, "using fast_color"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    const/4 v9, 0x5

    .line 254
    .restart local v9       #red:I
    const/4 v10, 0x6

    .line 255
    .restart local v10       #green:I
    const/4 v11, 0x5

    .line 256
    .restart local v11       #blue:I
    const/4 v12, 0x0

    .restart local v12       #alpha:I
    goto :goto_2

    .line 258
    .end local v9           #red:I
    .end local v10           #green:I
    .end local v11           #blue:I
    .end local v12           #alpha:I
    :cond_8
    const-string v1, "choosePreferredConfigOrder"

    const-string v2, "don\'t care about color depth"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 259
    const/4 v9, -0x1

    .line 260
    .restart local v9       #red:I
    const/4 v10, -0x1

    .line 261
    .restart local v10       #green:I
    const/4 v11, -0x1

    .line 262
    .restart local v11       #blue:I
    const/4 v12, -0x1

    .restart local v12       #alpha:I
    goto :goto_2

    .line 185
    .end local v4           #surface:Ljavax/microedition/khronos/egl/EGLSurface;
    .end local v8           #isATC:Z
    .end local v9           #red:I
    .end local v10           #green:I
    .end local v11           #blue:I
    .end local v12           #alpha:I
    .end local v13           #depthBuffer:Z
    .end local v14           #stencilBuffer:Z
    .end local v15           #atcSlowSurface:Z
    .end local v16           #eglConfigurations:[Ljavax/microedition/khronos/egl/EGLConfig;
    .end local v19           #fastColor:Z
    .end local v20           #gl:Ljavax/microedition/khronos/opengles/GL10;
    .end local v22           #triedToCreateContext:Z
    .end local v23           #trueColor:Z
    :catchall_0
    move-exception v1

    monitor-exit v24

    throw v1
.end method

.method private static getAvailMem()J
    .locals 8

    .prologue
    .line 177
    new-instance v3, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v3}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    .line 178
    .local v3, mi:Landroid/app/ActivityManager$MemoryInfo;
    invoke-static {}, Lcom/apportable/activity/VerdeActivity;->getActivity()Lcom/apportable/activity/VerdeActivity;

    move-result-object v4

    const-string v5, "activity"

    invoke-virtual {v4, v5}, Lcom/apportable/activity/VerdeActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 179
    .local v0, activityManager:Landroid/app/ActivityManager;
    invoke-virtual {v0, v3}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 180
    iget-wide v4, v3, Landroid/app/ActivityManager$MemoryInfo;->availMem:J

    const-wide/32 v6, 0x100000

    div-long v1, v4, v6

    .line 181
    .local v1, availableMegs:J
    return-wide v1
.end method

.method public static declared-synchronized getEglConfigs(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)[Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 6
    .parameter "egl"
    .parameter "display"

    .prologue
    .line 164
    const-class v4, Lcom/apportable/utils/Utils;

    monitor-enter v4

    const/4 v3, 0x1

    :try_start_0
    new-array v2, v3, [I

    .line 166
    .local v2, numConfigurations:[I
    const/4 v3, 0x0

    const/4 v5, 0x0

    invoke-interface {p0, p1, v3, v5, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigs(Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 167
    const/4 v3, 0x0

    aget v0, v2, v3

    .line 170
    .local v0, configurations:I
    new-array v1, v0, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 171
    .local v1, eglConfigurations:[Ljavax/microedition/khronos/egl/EGLConfig;
    invoke-interface {p0, p1, v1, v0, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigs(Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 173
    monitor-exit v4

    return-object v1

    .line 164
    .end local v0           #configurations:I
    .end local v1           #eglConfigurations:[Ljavax/microedition/khronos/egl/EGLConfig;
    .end local v2           #numConfigurations:[I
    :catchall_0
    move-exception v3

    monitor-exit v4

    throw v3
.end method

.method public static printEglConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 10
    .parameter "egl"
    .parameter "display"
    .parameter "conf"

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x4

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 29
    new-array v0, v6, [I

    .line 30
    .local v0, value:[I
    const-string v1, "Apportable"

    const-string v2, "conf = %s"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    const/16 v1, 0x3024

    invoke-interface {p0, p1, p2, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 33
    const-string v1, "Apportable"

    const-string v2, "EGL_RED_SIZE = %d"

    new-array v3, v6, [Ljava/lang/Object;

    aget v4, v0, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    const/16 v1, 0x3023

    invoke-interface {p0, p1, p2, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 36
    const-string v1, "Apportable"

    const-string v2, "EGL_GREEN_SIZE = %d"

    new-array v3, v6, [Ljava/lang/Object;

    aget v4, v0, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    const/16 v1, 0x3022

    invoke-interface {p0, p1, p2, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 39
    const-string v1, "Apportable"

    const-string v2, "EGL_BLUE_SIZE = %d"

    new-array v3, v6, [Ljava/lang/Object;

    aget v4, v0, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    const/16 v1, 0x3021

    invoke-interface {p0, p1, p2, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 42
    const-string v1, "Apportable"

    const-string v2, "EGL_ALPHA_SIZE = %d"

    new-array v3, v6, [Ljava/lang/Object;

    aget v4, v0, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    const/16 v1, 0x3025

    invoke-interface {p0, p1, p2, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 45
    const-string v1, "Apportable"

    const-string v2, "EGL_DEPTH_SIZE = %d"

    new-array v3, v6, [Ljava/lang/Object;

    aget v4, v0, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    const/16 v1, 0x3026

    invoke-interface {p0, p1, p2, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 48
    const-string v1, "Apportable"

    const-string v2, "EGL_STENCIL_SIZE = %d"

    new-array v3, v6, [Ljava/lang/Object;

    aget v4, v0, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    const/16 v1, 0x3020

    invoke-interface {p0, p1, p2, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 51
    const-string v1, "Apportable"

    const-string v2, "EGL_BUFFER_SIZE = %d"

    new-array v3, v6, [Ljava/lang/Object;

    aget v4, v0, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    const/16 v1, 0x3028

    invoke-interface {p0, p1, p2, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 54
    const-string v1, "Apportable"

    const-string v2, "EGL_CONFIG_ID = %d"

    new-array v3, v6, [Ljava/lang/Object;

    aget v4, v0, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    const/16 v1, 0x3029

    invoke-interface {p0, p1, p2, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 57
    const-string v1, "Apportable"

    const-string v2, "EGL_LEVEL = %d"

    new-array v3, v6, [Ljava/lang/Object;

    aget v4, v0, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    const/16 v1, 0x302c

    invoke-interface {p0, p1, p2, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 60
    const-string v1, "Apportable"

    const-string v2, "EGL_MAX_PBUFFER_WIDTH = %d"

    new-array v3, v6, [Ljava/lang/Object;

    aget v4, v0, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    const/16 v1, 0x302a

    invoke-interface {p0, p1, p2, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 63
    const-string v1, "Apportable"

    const-string v2, "EGL_MAX_PBUFFER_HEIGHT = %d"

    new-array v3, v6, [Ljava/lang/Object;

    aget v4, v0, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    const/16 v1, 0x302b

    invoke-interface {p0, p1, p2, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 66
    const-string v1, "Apportable"

    const-string v2, "EGL_MAX_PBUFFER_PIXELS = %d"

    new-array v3, v6, [Ljava/lang/Object;

    aget v4, v0, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    const/16 v1, 0x302e

    invoke-interface {p0, p1, p2, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 69
    const-string v1, "Apportable"

    const-string v2, "EGL_NATIVE_VISUAL_ID = %d"

    new-array v3, v6, [Ljava/lang/Object;

    aget v4, v0, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    const/16 v1, 0x302f

    invoke-interface {p0, p1, p2, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 72
    const-string v1, "Apportable"

    const-string v2, "EGL_NATIVE_VISUAL_TYPE = %d"

    new-array v3, v6, [Ljava/lang/Object;

    aget v4, v0, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    const/16 v1, 0x3032

    invoke-interface {p0, p1, p2, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 75
    const-string v1, "Apportable"

    const-string v2, "EGL_SAMPLE_BUFFERS = %d"

    new-array v3, v6, [Ljava/lang/Object;

    aget v4, v0, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    const/16 v1, 0x3031

    invoke-interface {p0, p1, p2, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 78
    const-string v1, "Apportable"

    const-string v2, "EGL_SAMPLES = %d"

    new-array v3, v6, [Ljava/lang/Object;

    aget v4, v0, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    const/16 v1, 0x3034

    invoke-interface {p0, p1, p2, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 81
    const-string v1, "Apportable"

    const-string v2, "EGL_TRANSPARENT_TYPE = %d"

    new-array v3, v6, [Ljava/lang/Object;

    aget v4, v0, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    const/16 v1, 0x3027

    invoke-interface {p0, p1, p2, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 84
    const-string v1, "Apportable"

    const-string v2, "EGL_CONFIG_CAVEAT = %d (%d,%d,%d)"

    new-array v3, v8, [Ljava/lang/Object;

    aget v4, v0, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    const/16 v4, 0x3038

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    const/16 v4, 0x3050

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v7

    const/16 v4, 0x3051

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v9

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    const/16 v1, 0x302d

    invoke-interface {p0, p1, p2, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 87
    const-string v1, "Apportable"

    const-string v2, "EGL_NATIVE_RENDERABLE = %d"

    new-array v3, v6, [Ljava/lang/Object;

    aget v4, v0, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    const/16 v1, 0x3033

    invoke-interface {p0, p1, p2, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 90
    const-string v1, "Apportable"

    const-string v2, "EGL_SURFACE_TYPE = %d EGL_WINDOW_BIT=%d EGL_PBUFFER_BIT=%d EGL_PIXMAP_BIT=%d"

    new-array v3, v8, [Ljava/lang/Object;

    aget v4, v0, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v9

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    return-void
.end method

.method private static resetEglState(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;Ljavax/microedition/khronos/egl/EGLSurface;Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;Lcom/android/GLSurfaceView$EGLContextFactory;)V
    .locals 3
    .parameter "egl"
    .parameter "display"
    .parameter "context"
    .parameter "surface"
    .parameter "windowSurfaceFactory"
    .parameter "contextFactory"

    .prologue
    .line 95
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    .line 97
    sget-object v0, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {p0, p1, v0, v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 99
    :cond_0
    if-eqz p0, :cond_1

    if-eqz p3, :cond_1

    .line 101
    invoke-interface {p4, p0, p1, p3}, Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;->destroySurface(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)V

    .line 102
    const/4 p3, 0x0

    .line 104
    :cond_1
    if-eqz p0, :cond_2

    if-eqz p2, :cond_2

    sget-object v0, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    if-eq p2, v0, :cond_2

    .line 106
    invoke-interface {p5, p0, p1, p2}, Lcom/android/GLSurfaceView$EGLContextFactory;->destroyContext(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)V

    .line 107
    const/4 p2, 0x0

    .line 109
    :cond_2
    return-void
.end method

.method public static declared-synchronized tryEglConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;Ljavax/microedition/khronos/egl/EGLConfig;Landroid/view/SurfaceHolder;Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;Lcom/android/GLSurfaceView$EGLContextFactory;)[Ljava/lang/Object;
    .locals 11
    .parameter "egl"
    .parameter "display"
    .parameter "context"
    .parameter "config"
    .parameter "holder"
    .parameter "windowSurfaceFactory"
    .parameter "contextFactory"

    .prologue
    .line 116
    const-class v10, Lcom/apportable/utils/Utils;

    monitor-enter v10

    :try_start_0
    invoke-interface {p0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v9

    .line 118
    .local v9, error:I
    if-eqz p3, :cond_1

    .line 122
    :try_start_1
    move-object/from16 v0, p5

    invoke-interface {v0, p0, p1, p3, p4}, Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;->createWindowSurface(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v4

    .line 124
    .local v4, surface:Ljavax/microedition/khronos/egl/EGLSurface;
    invoke-interface {p0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v9

    .line 125
    const/16 v1, 0x3000

    if-eq v9, v1, :cond_2

    .line 126
    const-string v1, "Apportable"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "createWindowSurface failed with "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    const/16 v1, 0x300b

    if-ne v9, v1, :cond_0

    .line 128
    const-string v1, "Apportable"

    const-string v2, "createWindowSurface returned EGL_BAD_NATIVE_WINDOW."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    .line 150
    invoke-static/range {v1 .. v6}, Lcom/apportable/utils/Utils;->resetEglState(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;Ljavax/microedition/khronos/egl/EGLSurface;Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;Lcom/android/GLSurfaceView$EGLContextFactory;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 159
    .end local v4           #surface:Ljavax/microedition/khronos/egl/EGLSurface;
    :cond_1
    :goto_1
    const/4 v1, 0x2

    :try_start_2
    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const/4 v3, 0x0

    aput-object v3, v1, v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_2
    monitor-exit v10

    return-object v1

    .line 132
    .restart local v4       #surface:Ljavax/microedition/khronos/egl/EGLSurface;
    :cond_2
    :try_start_3
    move-object/from16 v0, p6

    invoke-interface {v0, p0, p1, p3}, Lcom/android/GLSurfaceView$EGLContextFactory;->createContext(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object p2

    .line 133
    if-eqz p2, :cond_3

    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    if-ne p2, v1, :cond_4

    .line 134
    :cond_3
    invoke-interface {p0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v9

    .line 135
    const-string v1, "Apportable"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "createContext failed. Error code = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    const/4 p2, 0x0

    goto :goto_0

    .line 138
    :cond_4
    invoke-interface {p0, p1, v4, v4, p2}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 139
    invoke-interface {p0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v9

    .line 140
    const-string v1, "Apportable"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "createWindowSurface was unable to make the surface current. Error code = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    .line 152
    .end local v4           #surface:Ljavax/microedition/khronos/egl/EGLSurface;
    :catch_0
    move-exception v8

    .line 153
    .local v8, e2:Ljava/lang/IllegalArgumentException;
    :try_start_4
    const-string v1, "Apportable"

    const-string v2, "Chosen EGLConfig rejected, IllegalArgumentException"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 116
    .end local v8           #e2:Ljava/lang/IllegalArgumentException;
    .end local v9           #error:I
    :catchall_0
    move-exception v1

    monitor-exit v10

    throw v1

    .line 143
    .restart local v4       #surface:Ljavax/microedition/khronos/egl/EGLSurface;
    .restart local v9       #error:I
    :cond_5
    :try_start_5
    const-string v1, "Apportable"

    const-string v2, "Chosen EGLConfig accepted:"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    invoke-static {p0, p1, p3}, Lcom/apportable/utils/Utils;->printEglConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)V

    .line 145
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 v2, 0x1

    aput-object v4, v1, v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_2

    .line 155
    .end local v4           #surface:Ljavax/microedition/khronos/egl/EGLSurface;
    :catch_1
    move-exception v7

    .line 156
    .local v7, e:Ljava/lang/Exception;
    :try_start_6
    const-string v1, "Apportable"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Chosen EGLConfig rejected, Exception "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v7}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto/16 :goto_1
.end method

.class final Lcom/apportable/utils/Utils$1;
.super Ljava/lang/Object;
.source "Utils.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/utils/Utils;->choosePreferredConfigOrder(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;Landroid/view/SurfaceHolder;Lcom/android/GLSurfaceView$EGLWindowSurfaceFactory;Lcom/android/GLSurfaceView$EGLContextFactory;)[Ljavax/microedition/khronos/egl/EGLConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Ljavax/microedition/khronos/egl/EGLConfig;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$alpha:I

.field final synthetic val$blue:I

.field final synthetic val$depthBuffer:Z

.field final synthetic val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

.field final synthetic val$egl:Ljavax/microedition/khronos/egl/EGL10;

.field final synthetic val$green:I

.field final synthetic val$isATC:Z

.field final synthetic val$red:I

.field final synthetic val$stencilBuffer:Z


# direct methods
.method constructor <init>(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;ZIIIIZZ)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 265
    iput-object p1, p0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    iput-object p2, p0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    iput-boolean p3, p0, Lcom/apportable/utils/Utils$1;->val$isATC:Z

    iput p4, p0, Lcom/apportable/utils/Utils$1;->val$red:I

    iput p5, p0, Lcom/apportable/utils/Utils$1;->val$green:I

    iput p6, p0, Lcom/apportable/utils/Utils$1;->val$blue:I

    iput p7, p0, Lcom/apportable/utils/Utils$1;->val$alpha:I

    iput-boolean p8, p0, Lcom/apportable/utils/Utils$1;->val$depthBuffer:Z

    iput-boolean p9, p0, Lcom/apportable/utils/Utils$1;->val$stencilBuffer:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 265
    check-cast p1, Ljavax/microedition/khronos/egl/EGLConfig;

    .end local p1
    check-cast p2, Ljavax/microedition/khronos/egl/EGLConfig;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lcom/apportable/utils/Utils$1;->compare(Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLConfig;)I

    move-result v0

    return v0
.end method

.method public compare(Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLConfig;)I
    .locals 26
    .parameter "a"
    .parameter "b"

    .prologue
    .line 268
    const/16 v17, 0x0

    .line 269
    .local v17, result:I
    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [I

    move-object/from16 v20, v0

    .line 271
    .local v20, value:[I
    const/4 v11, 0x0

    .local v11, nonConformantA:Z
    const/16 v18, 0x0

    .local v18, slowA:Z
    const/4 v13, 0x0

    .line 272
    .local v13, nonWindowA:Z
    const/4 v12, 0x0

    .local v12, nonConformantB:Z
    const/16 v19, 0x0

    .local v19, slowB:Z
    const/4 v14, 0x0

    .line 275
    .local v14, nonWindowB:Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3027

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p1

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 276
    const/16 v23, 0x0

    aget v23, v20, v23

    const/16 v24, 0x3051

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_0

    const/4 v11, 0x1

    .line 277
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3027

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p2

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 278
    const/16 v23, 0x0

    aget v23, v20, v23

    const/16 v24, 0x3051

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_1

    const/4 v12, 0x1

    .line 279
    :cond_1
    if-eqz v11, :cond_2

    if-eqz v12, :cond_2

    const/16 v23, 0x0

    .line 381
    :goto_0
    return v23

    .line 280
    :cond_2
    if-eqz v11, :cond_3

    const/16 v23, 0x1

    goto :goto_0

    .line 281
    :cond_3
    if-eqz v12, :cond_4

    const/16 v23, -0x1

    goto :goto_0

    .line 283
    :cond_4
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/apportable/utils/Utils$1;->val$isATC:Z

    move/from16 v23, v0

    if-eqz v23, :cond_9

    .line 285
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3027

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p1

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 286
    const/16 v23, 0x0

    aget v23, v20, v23

    const/16 v24, 0x3050

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_5

    add-int/lit8 v17, v17, -0x1

    .line 287
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3027

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p2

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 288
    const/16 v23, 0x0

    aget v23, v20, v23

    const/16 v24, 0x3050

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_6

    add-int/lit8 v17, v17, 0x1

    .line 302
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3033

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p1

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 303
    const/16 v23, 0x0

    aget v23, v20, v23

    and-int/lit8 v23, v23, 0x4

    if-nez v23, :cond_7

    const/4 v13, 0x1

    .line 304
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3033

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p2

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 305
    const/16 v23, 0x0

    aget v23, v20, v23

    and-int/lit8 v23, v23, 0x4

    if-nez v23, :cond_8

    const/4 v14, 0x1

    .line 306
    :cond_8
    if-eqz v13, :cond_e

    if-eqz v14, :cond_e

    const/16 v23, 0x0

    goto/16 :goto_0

    .line 292
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3027

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p1

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 293
    const/16 v23, 0x0

    aget v23, v20, v23

    const/16 v24, 0x3050

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_a

    const/16 v18, 0x1

    .line 294
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3027

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p2

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 295
    const/16 v23, 0x0

    aget v23, v20, v23

    const/16 v24, 0x3050

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_b

    const/16 v19, 0x1

    .line 296
    :cond_b
    if-eqz v18, :cond_c

    if-eqz v19, :cond_c

    const/16 v23, 0x0

    goto/16 :goto_0

    .line 297
    :cond_c
    if-eqz v18, :cond_d

    const/16 v23, 0x1

    goto/16 :goto_0

    .line 298
    :cond_d
    if-eqz v19, :cond_6

    const/16 v23, -0x1

    goto/16 :goto_0

    .line 307
    :cond_e
    if-eqz v13, :cond_f

    const/16 v23, 0x1

    goto/16 :goto_0

    .line 308
    :cond_f
    if-eqz v14, :cond_10

    const/16 v23, -0x1

    goto/16 :goto_0

    .line 311
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3033

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p1

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 312
    const/16 v23, 0x0

    aget v23, v20, v23

    and-int/lit8 v23, v23, 0x1

    if-eqz v23, :cond_11

    add-int/lit8 v17, v17, -0x2

    .line 313
    :cond_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3033

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p2

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 314
    const/16 v23, 0x0

    aget v23, v20, v23

    and-int/lit8 v23, v23, 0x1

    if-eqz v23, :cond_12

    add-int/lit8 v17, v17, 0x2

    .line 317
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3033

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p1

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 318
    const/16 v23, 0x0

    aget v23, v20, v23

    and-int/lit8 v23, v23, 0x2

    if-nez v23, :cond_13

    add-int/lit8 v17, v17, -0x2

    .line 319
    :cond_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3033

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p2

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 320
    const/16 v23, 0x0

    aget v23, v20, v23

    and-int/lit8 v23, v23, 0x2

    if-nez v23, :cond_14

    add-int/lit8 v17, v17, 0x2

    .line 322
    :cond_14
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/apportable/utils/Utils$1;->val$isATC:Z

    move/from16 v23, v0

    if-eqz v23, :cond_1f

    .line 324
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x302d

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p1

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 325
    const/16 v23, 0x0

    aget v23, v20, v23

    if-lez v23, :cond_15

    add-int/lit8 v17, v17, -0x8

    .line 326
    :cond_15
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x302d

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p2

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 327
    const/16 v23, 0x0

    aget v23, v20, v23

    if-lez v23, :cond_16

    add-int/lit8 v17, v17, 0x8

    .line 338
    :cond_16
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3024

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p1

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 339
    const/16 v23, 0x0

    aget v15, v20, v23

    .line 340
    .local v15, redA:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3024

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p2

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 341
    const/16 v23, 0x0

    aget v16, v20, v23

    .line 343
    .local v16, redB:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3023

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p1

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 344
    const/16 v23, 0x0

    aget v9, v20, v23

    .line 345
    .local v9, greenA:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3023

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p2

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 346
    const/16 v23, 0x0

    aget v10, v20, v23

    .line 348
    .local v10, greenB:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3022

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p1

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 349
    const/16 v23, 0x0

    aget v7, v20, v23

    .line 350
    .local v7, blueA:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3022

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p2

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 351
    const/16 v23, 0x0

    aget v8, v20, v23

    .line 353
    .local v8, blueB:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3021

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p1

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 354
    const/16 v23, 0x0

    aget v5, v20, v23

    .line 355
    .local v5, alphaA:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3021

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p2

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 356
    const/16 v23, 0x0

    aget v6, v20, v23

    .line 359
    .local v6, alphaB:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/apportable/utils/Utils$1;->val$red:I

    move/from16 v23, v0

    move/from16 v0, v23

    if-ne v15, v0, :cond_17

    move-object/from16 v0, p0

    iget v0, v0, Lcom/apportable/utils/Utils$1;->val$green:I

    move/from16 v23, v0

    move/from16 v0, v23

    if-ne v9, v0, :cond_17

    move-object/from16 v0, p0

    iget v0, v0, Lcom/apportable/utils/Utils$1;->val$blue:I

    move/from16 v23, v0

    move/from16 v0, v23

    if-ne v7, v0, :cond_17

    move-object/from16 v0, p0

    iget v0, v0, Lcom/apportable/utils/Utils$1;->val$alpha:I

    move/from16 v23, v0

    move/from16 v0, v23

    if-ne v5, v0, :cond_17

    add-int/lit8 v17, v17, -0x4

    .line 360
    :cond_17
    move-object/from16 v0, p0

    iget v0, v0, Lcom/apportable/utils/Utils$1;->val$red:I

    move/from16 v23, v0

    move/from16 v0, v16

    move/from16 v1, v23

    if-ne v0, v1, :cond_18

    move-object/from16 v0, p0

    iget v0, v0, Lcom/apportable/utils/Utils$1;->val$green:I

    move/from16 v23, v0

    move/from16 v0, v23

    if-ne v10, v0, :cond_18

    move-object/from16 v0, p0

    iget v0, v0, Lcom/apportable/utils/Utils$1;->val$blue:I

    move/from16 v23, v0

    move/from16 v0, v23

    if-ne v8, v0, :cond_18

    move-object/from16 v0, p0

    iget v0, v0, Lcom/apportable/utils/Utils$1;->val$alpha:I

    move/from16 v23, v0

    move/from16 v0, v23

    if-ne v6, v0, :cond_18

    add-int/lit8 v17, v17, 0x4

    .line 363
    :cond_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3025

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p1

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 364
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/apportable/utils/Utils$1;->val$depthBuffer:Z

    move/from16 v23, v0

    if-eqz v23, :cond_19

    const/16 v23, 0x0

    aget v23, v20, v23

    if-gtz v23, :cond_19

    add-int/lit8 v17, v17, 0x1

    .line 365
    :cond_19
    const/16 v23, 0x0

    aget v21, v20, v23

    .line 366
    .local v21, valueA:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3025

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p2

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 367
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/apportable/utils/Utils$1;->val$depthBuffer:Z

    move/from16 v23, v0

    if-eqz v23, :cond_1a

    const/16 v23, 0x0

    aget v23, v20, v23

    if-gtz v23, :cond_1a

    add-int/lit8 v17, v17, -0x1

    .line 368
    :cond_1a
    const/16 v23, 0x0

    aget v22, v20, v23

    .line 369
    .local v22, valueB:I
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/apportable/utils/Utils$1;->val$depthBuffer:Z

    move/from16 v23, v0

    if-eqz v23, :cond_21

    move/from16 v0, v21

    move/from16 v1, v22

    if-ge v0, v1, :cond_21

    add-int/lit8 v17, v17, 0x1

    .line 372
    :cond_1b
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3026

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p1

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 373
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/apportable/utils/Utils$1;->val$stencilBuffer:Z

    move/from16 v23, v0

    if-eqz v23, :cond_1c

    const/16 v23, 0x0

    aget v23, v20, v23

    if-gtz v23, :cond_1c

    add-int/lit8 v17, v17, 0x1

    .line 374
    :cond_1c
    const/16 v23, 0x0

    aget v21, v20, v23

    .line 375
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x3026

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p2

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 376
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/apportable/utils/Utils$1;->val$stencilBuffer:Z

    move/from16 v23, v0

    if-eqz v23, :cond_1d

    const/16 v23, 0x0

    aget v23, v20, v23

    if-gtz v23, :cond_1d

    add-int/lit8 v17, v17, -0x1

    .line 377
    :cond_1d
    const/16 v23, 0x0

    aget v22, v20, v23

    .line 378
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/apportable/utils/Utils$1;->val$stencilBuffer:Z

    move/from16 v23, v0

    if-eqz v23, :cond_22

    move/from16 v0, v21

    move/from16 v1, v22

    if-ge v0, v1, :cond_22

    add-int/lit8 v17, v17, 0x1

    :cond_1e
    :goto_3
    move/from16 v23, v17

    .line 381
    goto/16 :goto_0

    .line 331
    .end local v5           #alphaA:I
    .end local v6           #alphaB:I
    .end local v7           #blueA:I
    .end local v8           #blueB:I
    .end local v9           #greenA:I
    .end local v10           #greenB:I
    .end local v15           #redA:I
    .end local v16           #redB:I
    .end local v21           #valueA:I
    .end local v22           #valueB:I
    :cond_1f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x302d

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p1

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 332
    const/16 v23, 0x0

    aget v23, v20, v23

    if-lez v23, :cond_20

    add-int/lit8 v17, v17, 0x40

    .line 333
    :cond_20
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$egl:Ljavax/microedition/khronos/egl/EGL10;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/utils/Utils$1;->val$display:Ljavax/microedition/khronos/egl/EGLDisplay;

    move-object/from16 v24, v0

    const/16 v25, 0x302d

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p2

    move/from16 v3, v25

    move-object/from16 v4, v20

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 334
    const/16 v23, 0x0

    aget v23, v20, v23

    if-lez v23, :cond_16

    add-int/lit8 v17, v17, -0x40

    goto/16 :goto_1

    .line 370
    .restart local v5       #alphaA:I
    .restart local v6       #alphaB:I
    .restart local v7       #blueA:I
    .restart local v8       #blueB:I
    .restart local v9       #greenA:I
    .restart local v10       #greenB:I
    .restart local v15       #redA:I
    .restart local v16       #redB:I
    .restart local v21       #valueA:I
    .restart local v22       #valueB:I
    :cond_21
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/apportable/utils/Utils$1;->val$depthBuffer:Z

    move/from16 v23, v0

    if-eqz v23, :cond_1b

    move/from16 v0, v21

    move/from16 v1, v22

    if-le v0, v1, :cond_1b

    add-int/lit8 v17, v17, -0x1

    goto/16 :goto_2

    .line 379
    :cond_22
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/apportable/utils/Utils$1;->val$stencilBuffer:Z

    move/from16 v23, v0

    if-eqz v23, :cond_1e

    move/from16 v0, v21

    move/from16 v1, v22

    if-le v0, v1, :cond_1e

    add-int/lit8 v17, v17, -0x1

    goto :goto_3
.end method

.class public Lcom/apportable/gl/VerdeSurfaceView;
.super Lcom/android/GLSurfaceView;
.source "VerdeSurfaceView.java"

# interfaces
.implements Lcom/android/GLSurfaceView$EGLConfigChooser;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;
    }
.end annotation


# static fields
.field private static final HANDLER_CLOSE_IME_KEYBOARD:I = 0x3

.field private static final HANDLER_OPEN_IME_KEYBOARD:I = 0x2

.field private static final TAG:Ljava/lang/String;

.field private static final debug:Z

.field private static handler:Landroid/os/Handler;

.field private static mainView:Lcom/apportable/gl/VerdeSurfaceView;

.field private static textInputWraper:Lcom/apportable/gl/TextInputWraper;


# instance fields
.field public mDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

.field private mRenderer:Lcom/apportable/gl/VerdeRenderer;

.field private mTextField:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 117
    const-class v0, Lcom/apportable/gl/VerdeSurfaceView;

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/apportable/gl/VerdeSurfaceView;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 203
    invoke-direct {p0, p1}, Lcom/android/GLSurfaceView;-><init>(Landroid/content/Context;)V

    .line 204
    invoke-virtual {p0}, Lcom/apportable/gl/VerdeSurfaceView;->initView()V

    .line 205
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 208
    invoke-direct {p0, p1, p2}, Lcom/android/GLSurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 209
    invoke-virtual {p0}, Lcom/apportable/gl/VerdeSurfaceView;->initView()V

    .line 210
    return-void
.end method

.method static synthetic access$000(Lcom/apportable/gl/VerdeSurfaceView;)Landroid/widget/TextView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 113
    iget-object v0, p0, Lcom/apportable/gl/VerdeSurfaceView;->mTextField:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$100()Lcom/apportable/gl/TextInputWraper;
    .locals 1

    .prologue
    .line 113
    sget-object v0, Lcom/apportable/gl/VerdeSurfaceView;->textInputWraper:Lcom/apportable/gl/TextInputWraper;

    return-object v0
.end method

.method static synthetic access$200()Lcom/apportable/gl/VerdeSurfaceView;
    .locals 1

    .prologue
    .line 113
    sget-object v0, Lcom/apportable/gl/VerdeSurfaceView;->mainView:Lcom/apportable/gl/VerdeSurfaceView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/apportable/gl/VerdeSurfaceView;)Lcom/apportable/gl/VerdeRenderer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 113
    iget-object v0, p0, Lcom/apportable/gl/VerdeSurfaceView;->mRenderer:Lcom/apportable/gl/VerdeRenderer;

    return-object v0
.end method

.method public static closeIMEKeyboard()V
    .locals 2

    .prologue
    .line 343
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 344
    .local v0, msg:Landroid/os/Message;
    const/4 v1, 0x3

    iput v1, v0, Landroid/os/Message;->what:I

    .line 345
    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 346
    return-void
.end method

.method private dumpEvent(Landroid/view/MotionEvent;)V
    .locals 9
    .parameter "event"

    .prologue
    const/4 v8, 0x6

    const/4 v7, 0x5

    .line 525
    const/16 v5, 0xa

    new-array v3, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "DOWN"

    aput-object v6, v3, v5

    const/4 v5, 0x1

    const-string v6, "UP"

    aput-object v6, v3, v5

    const/4 v5, 0x2

    const-string v6, "MOVE"

    aput-object v6, v3, v5

    const/4 v5, 0x3

    const-string v6, "CANCEL"

    aput-object v6, v3, v5

    const/4 v5, 0x4

    const-string v6, "OUTSIDE"

    aput-object v6, v3, v5

    const-string v5, "POINTER_DOWN"

    aput-object v5, v3, v7

    const-string v5, "POINTER_UP"

    aput-object v5, v3, v8

    const/4 v5, 0x7

    const-string v6, "7?"

    aput-object v6, v3, v5

    const/16 v5, 0x8

    const-string v6, "8?"

    aput-object v6, v3, v5

    const/16 v5, 0x9

    const-string v6, "9?"

    aput-object v6, v3, v5

    .line 527
    .local v3, names:[Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 528
    .local v4, sb:Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 529
    .local v0, action:I
    and-int/lit16 v1, v0, 0xff

    .line 530
    .local v1, actionCode:I
    const-string v5, "event ACTION_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v3, v1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 531
    if-eq v1, v7, :cond_0

    if-ne v1, v8, :cond_1

    .line 533
    :cond_0
    const-string v5, "(pid "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    shr-int/lit8 v6, v0, 0x8

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 535
    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 537
    :cond_1
    const-string v5, "["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 538
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v5

    if-ge v2, v5, :cond_3

    .line 539
    const-string v5, "#"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 540
    const-string v5, "(pid "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 541
    const-string v5, ")="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 542
    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 543
    add-int/lit8 v5, v2, 0x1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v6

    if-ge v5, v6, :cond_2

    .line 544
    const-string v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 538
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 546
    :cond_3
    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 547
    sget-object v5, Lcom/apportable/gl/VerdeSurfaceView;->TAG:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 548
    return-void
.end method

.method private getContentText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 339
    iget-object v0, p0, Lcom/apportable/gl/VerdeSurfaceView;->mRenderer:Lcom/apportable/gl/VerdeRenderer;

    invoke-virtual {v0}, Lcom/apportable/gl/VerdeRenderer;->getContentText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static native nativeKeyDown(IIJ)Z
.end method

.method private static native nativeKeyUp(IIJ)Z
.end method

.method private static native nativeTouchesBegin(IFFJ)V
.end method

.method private static native nativeTouchesCancel([I[F[FJ)V
.end method

.method private static native nativeTouchesEnd(IFFJ)V
.end method

.method private static native nativeTouchesMove([I[F[FJ)V
.end method

.method public static openIMEKeyboard()V
    .locals 2

    .prologue
    .line 331
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 332
    .local v0, msg:Landroid/os/Message;
    const/4 v1, 0x2

    iput v1, v0, Landroid/os/Message;->what:I

    .line 333
    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView;->mainView:Lcom/apportable/gl/VerdeSurfaceView;

    invoke-direct {v1}, Lcom/apportable/gl/VerdeSurfaceView;->getContentText()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 334
    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 336
    return-void
.end method


# virtual methods
.method public chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 2
    .parameter "egl"
    .parameter "display"

    .prologue
    .line 214
    invoke-static {p1, p2}, Lcom/apportable/utils/Utils;->getEglConfigs(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)[Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    return-object v0
.end method

.method public deleteBackward()V
    .locals 1

    .prologue
    .line 358
    new-instance v0, Lcom/apportable/gl/VerdeSurfaceView$4;

    invoke-direct {v0, p0}, Lcom/apportable/gl/VerdeSurfaceView$4;-><init>(Lcom/apportable/gl/VerdeSurfaceView;)V

    invoke-virtual {p0, v0}, Lcom/apportable/gl/VerdeSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 364
    return-void
.end method

.method public getTextField()Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 316
    iget-object v0, p0, Lcom/apportable/gl/VerdeSurfaceView;->mTextField:Landroid/widget/TextView;

    return-object v0
.end method

.method protected initView()V
    .locals 4

    .prologue
    .line 218
    new-instance v1, Lcom/apportable/gl/VerdeRenderer;

    invoke-direct {v1, p0}, Lcom/apportable/gl/VerdeRenderer;-><init>(Lcom/android/GLSurfaceView;)V

    iput-object v1, p0, Lcom/apportable/gl/VerdeSurfaceView;->mRenderer:Lcom/apportable/gl/VerdeRenderer;

    .line 219
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/apportable/gl/VerdeSurfaceView;->setFocusableInTouchMode(Z)V

    .line 221
    invoke-virtual {p0, p0}, Lcom/apportable/gl/VerdeSurfaceView;->setEGLConfigChooser(Lcom/android/GLSurfaceView$EGLConfigChooser;)V

    .line 223
    invoke-static {}, Lcom/apportable/utils/MetaData;->getMetaData()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "apportable.opengles2"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 224
    .local v0, requiresES2:Z
    if-eqz v0, :cond_0

    .line 225
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lcom/apportable/gl/VerdeSurfaceView;->setEGLContextClientVersion(I)V

    .line 228
    :cond_0
    iget-object v1, p0, Lcom/apportable/gl/VerdeSurfaceView;->mRenderer:Lcom/apportable/gl/VerdeRenderer;

    invoke-virtual {p0, v1}, Lcom/apportable/gl/VerdeSurfaceView;->setRenderer(Lcom/android/GLSurfaceView$Renderer;)V

    .line 230
    new-instance v1, Lcom/apportable/gl/TextInputWraper;

    invoke-direct {v1, p0}, Lcom/apportable/gl/TextInputWraper;-><init>(Lcom/apportable/gl/VerdeSurfaceView;)V

    sput-object v1, Lcom/apportable/gl/VerdeSurfaceView;->textInputWraper:Lcom/apportable/gl/TextInputWraper;

    .line 232
    new-instance v1, Lcom/apportable/gl/VerdeSurfaceView$1;

    invoke-direct {v1, p0}, Lcom/apportable/gl/VerdeSurfaceView$1;-><init>(Lcom/apportable/gl/VerdeSurfaceView;)V

    sput-object v1, Lcom/apportable/gl/VerdeSurfaceView;->handler:Landroid/os/Handler;

    .line 261
    sput-object p0, Lcom/apportable/gl/VerdeSurfaceView;->mainView:Lcom/apportable/gl/VerdeSurfaceView;

    .line 262
    new-instance v1, Lcom/apportable/gl/VerdeSurfaceView$2;

    invoke-direct {v1, p0}, Lcom/apportable/gl/VerdeSurfaceView$2;-><init>(Lcom/apportable/gl/VerdeSurfaceView;)V

    const-wide/16 v2, 0x3e8

    invoke-virtual {p0, v1, v2, v3}, Lcom/apportable/gl/VerdeSurfaceView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 268
    return-void
.end method

.method public insertText(Ljava/lang/String;)V
    .locals 1
    .parameter "text"

    .prologue
    .line 349
    new-instance v0, Lcom/apportable/gl/VerdeSurfaceView$3;

    invoke-direct {v0, p0, p1}, Lcom/apportable/gl/VerdeSurfaceView$3;-><init>(Lcom/apportable/gl/VerdeSurfaceView;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/apportable/gl/VerdeSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 355
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 5
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v2, 0x1

    .line 448
    move v0, p1

    .line 450
    .local v0, kc:I
    const/4 v1, 0x3

    if-eq p1, v1, :cond_0

    const/4 v1, 0x4

    if-eq p1, v1, :cond_0

    const/16 v1, 0x52

    if-eq p1, v1, :cond_0

    const/16 v1, 0x13

    if-eq p1, v1, :cond_0

    const/16 v1, 0x14

    if-eq p1, v1, :cond_0

    const/16 v1, 0x15

    if-eq p1, v1, :cond_0

    const/16 v1, 0x16

    if-eq p1, v1, :cond_0

    const/16 v1, 0x17

    if-eq p1, v1, :cond_0

    const/16 v1, 0x54

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_A:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_B:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_C:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_X:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_Y:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_Z:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_L1:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_R1:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_L2:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_R2:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_THUMBL:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_THUMBR:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_START:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_SELECT:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_MODE:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-ne p1, v1, :cond_2

    .line 475
    :cond_0
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isAltPressed()Z

    move-result v1

    if-eqz v1, :cond_1

    move v1, v2

    :goto_0
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v3

    invoke-static {p1, v1, v3, v4}, Lcom/apportable/gl/VerdeSurfaceView;->nativeKeyDown(IIJ)Z

    .line 480
    :goto_1
    return v2

    .line 475
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 480
    :cond_2
    invoke-super {p0, p1, p2}, Lcom/android/GLSurfaceView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v2

    goto :goto_1
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 5
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v2, 0x1

    .line 486
    move v0, p1

    .line 488
    .local v0, kc:I
    const/4 v1, 0x3

    if-eq p1, v1, :cond_0

    const/4 v1, 0x4

    if-eq p1, v1, :cond_0

    const/16 v1, 0x52

    if-eq p1, v1, :cond_0

    const/16 v1, 0x13

    if-eq p1, v1, :cond_0

    const/16 v1, 0x14

    if-eq p1, v1, :cond_0

    const/16 v1, 0x15

    if-eq p1, v1, :cond_0

    const/16 v1, 0x16

    if-eq p1, v1, :cond_0

    const/16 v1, 0x17

    if-eq p1, v1, :cond_0

    const/16 v1, 0x54

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_A:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_B:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_C:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_X:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_Y:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_Z:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_L1:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_R1:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_L2:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_R2:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_THUMBL:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_THUMBR:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_START:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_SELECT:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_MODE:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode()I

    move-result v1

    if-ne p1, v1, :cond_2

    .line 513
    :cond_0
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isAltPressed()Z

    move-result v1

    if-eqz v1, :cond_1

    move v1, v2

    :goto_0
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v3

    invoke-static {p1, v1, v3, v4}, Lcom/apportable/gl/VerdeSurfaceView;->nativeKeyUp(IIJ)Z

    .line 518
    :goto_1
    return v2

    .line 513
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 518
    :cond_2
    invoke-super {p0, p1, p2}, Lcom/android/GLSurfaceView;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v2

    goto :goto_1
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 271
    iget-object v0, p0, Lcom/apportable/gl/VerdeSurfaceView;->mRenderer:Lcom/apportable/gl/VerdeRenderer;

    invoke-virtual {v0}, Lcom/apportable/gl/VerdeRenderer;->handleOnPause()V

    .line 272
    const-string v0, "GLSurfaceView"

    const-string v1, "onPause"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 281
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 286
    invoke-virtual {p0}, Lcom/apportable/gl/VerdeSurfaceView;->requestFocus()Z

    .line 287
    iget-object v0, p0, Lcom/apportable/gl/VerdeSurfaceView;->mRenderer:Lcom/apportable/gl/VerdeRenderer;

    invoke-virtual {v0}, Lcom/apportable/gl/VerdeRenderer;->handleOnResume()V

    .line 294
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 21
    .parameter "event"

    .prologue
    .line 373
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v18

    move/from16 v0, v18

    and-int/lit16 v0, v0, 0xff

    move/from16 v18, v0

    packed-switch v18, :pswitch_data_0

    .line 435
    :pswitch_0
    const-string v18, "MotionEvent"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Other:"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 442
    :goto_0
    const/16 v18, 0x1

    return v18

    .line 375
    :pswitch_1
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v8

    .line 376
    .local v8, indexPointer:I
    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    .line 377
    .local v5, idPointer:I
    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Landroid/view/MotionEvent;->getX(I)F

    move-result v11

    .line 378
    .local v11, xPointer:F
    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Landroid/view/MotionEvent;->getY(I)F

    move-result v15

    .line 379
    .local v15, yPointer:F
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v18

    move-wide/from16 v0, v18

    invoke-static {v5, v11, v15, v0, v1}, Lcom/apportable/gl/VerdeSurfaceView;->nativeTouchesBegin(IFFJ)V

    goto :goto_0

    .line 384
    .end local v5           #idPointer:I
    .end local v8           #indexPointer:I
    .end local v11           #xPointer:F
    .end local v15           #yPointer:F
    :pswitch_2
    const/16 v18, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v4

    .line 385
    .local v4, idDown:I
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v10

    .line 386
    .local v10, xDown:F
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v14

    .line 387
    .local v14, yDown:F
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v18

    move-wide/from16 v0, v18

    invoke-static {v4, v10, v14, v0, v1}, Lcom/apportable/gl/VerdeSurfaceView;->nativeTouchesBegin(IFFJ)V

    goto :goto_0

    .line 391
    .end local v4           #idDown:I
    .end local v10           #xDown:F
    .end local v14           #yDown:F
    :pswitch_3
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v9

    .line 392
    .local v9, pointerNumber:I
    new-array v7, v9, [I

    .line 393
    .local v7, ids:[I
    new-array v13, v9, [F

    .line 394
    .local v13, xs:[F
    new-array v0, v9, [F

    move-object/from16 v17, v0

    .line 396
    .local v17, ys:[F
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    if-ge v3, v9, :cond_0

    .line 397
    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v18

    aput v18, v7, v3

    .line 398
    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v18

    aput v18, v13, v3

    .line 399
    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v18

    aput v18, v17, v3

    .line 396
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 401
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v18

    move-object/from16 v0, v17

    move-wide/from16 v1, v18

    invoke-static {v7, v13, v0, v1, v2}, Lcom/apportable/gl/VerdeSurfaceView;->nativeTouchesMove([I[F[FJ)V

    goto :goto_0

    .line 405
    .end local v3           #i:I
    .end local v7           #ids:[I
    .end local v9           #pointerNumber:I
    .end local v13           #xs:[F
    .end local v17           #ys:[F
    :pswitch_4
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v8

    .line 406
    .restart local v8       #indexPointer:I
    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    .line 407
    .restart local v5       #idPointer:I
    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Landroid/view/MotionEvent;->getX(I)F

    move-result v11

    .line 408
    .restart local v11       #xPointer:F
    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Landroid/view/MotionEvent;->getY(I)F

    move-result v15

    .line 409
    .restart local v15       #yPointer:F
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v18

    move-wide/from16 v0, v18

    invoke-static {v5, v11, v15, v0, v1}, Lcom/apportable/gl/VerdeSurfaceView;->nativeTouchesEnd(IFFJ)V

    goto/16 :goto_0

    .line 414
    .end local v5           #idPointer:I
    .end local v8           #indexPointer:I
    .end local v11           #xPointer:F
    .end local v15           #yPointer:F
    :pswitch_5
    const/16 v18, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    .line 415
    .local v6, idUp:I
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v12

    .line 416
    .local v12, xUp:F
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v16

    .line 417
    .local v16, yUp:F
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v18

    move/from16 v0, v16

    move-wide/from16 v1, v18

    invoke-static {v6, v12, v0, v1, v2}, Lcom/apportable/gl/VerdeSurfaceView;->nativeTouchesEnd(IFFJ)V

    goto/16 :goto_0

    .line 421
    .end local v6           #idUp:I
    .end local v12           #xUp:F
    .end local v16           #yUp:F
    :pswitch_6
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v9

    .line 422
    .restart local v9       #pointerNumber:I
    new-array v7, v9, [I

    .line 423
    .restart local v7       #ids:[I
    new-array v13, v9, [F

    .line 424
    .restart local v13       #xs:[F
    new-array v0, v9, [F

    move-object/from16 v17, v0

    .line 426
    .restart local v17       #ys:[F
    const/4 v3, 0x0

    .restart local v3       #i:I
    :goto_2
    if-ge v3, v9, :cond_1

    .line 427
    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v18

    aput v18, v7, v3

    .line 428
    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v18

    aput v18, v13, v3

    .line 429
    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v18

    aput v18, v17, v3

    .line 426
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 431
    :cond_1
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v18

    move-object/from16 v0, v17

    move-wide/from16 v1, v18

    invoke-static {v7, v13, v0, v1, v2}, Lcom/apportable/gl/VerdeSurfaceView;->nativeTouchesCancel([I[F[FJ)V

    goto/16 :goto_0

    .line 373
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_5
        :pswitch_3
        :pswitch_6
        :pswitch_0
        :pswitch_1
        :pswitch_4
    .end packed-switch
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1
    .parameter "hasWindowFocus"

    .prologue
    .line 297
    invoke-super {p0, p1}, Lcom/android/GLSurfaceView;->onWindowFocusChanged(Z)V

    .line 298
    iget-object v0, p0, Lcom/apportable/gl/VerdeSurfaceView;->mRenderer:Lcom/apportable/gl/VerdeRenderer;

    invoke-virtual {v0, p1}, Lcom/apportable/gl/VerdeRenderer;->handleOnWindowFocusChanged(Z)V

    .line 299
    return-void
.end method

.method public setTextField(Landroid/widget/TextView;)V
    .locals 3
    .parameter "view"

    .prologue
    .line 320
    iput-object p1, p0, Lcom/apportable/gl/VerdeSurfaceView;->mTextField:Landroid/widget/TextView;

    .line 321
    iget-object v1, p0, Lcom/apportable/gl/VerdeSurfaceView;->mTextField:Landroid/widget/TextView;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView;->textInputWraper:Lcom/apportable/gl/TextInputWraper;

    if-eqz v1, :cond_0

    .line 322
    iget-object v1, p0, Lcom/apportable/gl/VerdeSurfaceView;->mTextField:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 323
    .local v0, linearParams:Landroid/widget/LinearLayout$LayoutParams;
    const/4 v1, 0x0

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 324
    iget-object v1, p0, Lcom/apportable/gl/VerdeSurfaceView;->mTextField:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 325
    iget-object v1, p0, Lcom/apportable/gl/VerdeSurfaceView;->mTextField:Landroid/widget/TextView;

    sget-object v2, Lcom/apportable/gl/VerdeSurfaceView;->textInputWraper:Lcom/apportable/gl/TextInputWraper;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 326
    invoke-virtual {p0}, Lcom/apportable/gl/VerdeSurfaceView;->requestFocus()Z

    .line 328
    .end local v0           #linearParams:Landroid/widget/LinearLayout$LayoutParams;
    :cond_0
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 2
    .parameter "holder"
    .parameter "format"
    .parameter "width"
    .parameter "height"

    .prologue
    .line 302
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/GLSurfaceView;->surfaceChanged(Landroid/view/SurfaceHolder;III)V

    .line 303
    iget-object v0, p0, Lcom/apportable/gl/VerdeSurfaceView;->mRenderer:Lcom/apportable/gl/VerdeRenderer;

    iget-object v0, v0, Lcom/apportable/gl/VerdeRenderer;->mCanDispatchDraw:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 304
    return-void
.end method

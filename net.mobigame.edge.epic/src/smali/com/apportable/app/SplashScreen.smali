.class public Lcom/apportable/app/SplashScreen;
.super Ljava/lang/Object;
.source "SplashScreen.java"


# static fields
.field private static sAlreadyShown:Z

.field private static sSplashScreen:Landroid/widget/ImageView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const/4 v0, 0x0

    sput-boolean v0, Lcom/apportable/app/SplashScreen;->sAlreadyShown:Z

    .line 23
    const/4 v0, 0x0

    sput-object v0, Lcom/apportable/app/SplashScreen;->sSplashScreen:Landroid/widget/ImageView;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static hide(Landroid/widget/FrameLayout;)V
    .locals 1
    .parameter "rootOfAllEvil"

    .prologue
    .line 126
    sget-boolean v0, Lcom/apportable/app/SplashScreen;->sAlreadyShown:Z

    if-eqz v0, :cond_0

    .line 127
    sget-object v0, Lcom/apportable/app/SplashScreen;->sSplashScreen:Landroid/widget/ImageView;

    if-nez v0, :cond_1

    .line 132
    :cond_0
    :goto_0
    return-void

    .line 129
    :cond_1
    sget-object v0, Lcom/apportable/app/SplashScreen;->sSplashScreen:Landroid/widget/ImageView;

    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 130
    const/4 v0, 0x0

    sput-object v0, Lcom/apportable/app/SplashScreen;->sSplashScreen:Landroid/widget/ImageView;

    goto :goto_0
.end method

.method public static show(Landroid/widget/FrameLayout;)V
    .locals 27
    .parameter "rootOfAllEvil"

    .prologue
    .line 26
    sget-boolean v3, Lcom/apportable/app/SplashScreen;->sAlreadyShown:Z

    if-nez v3, :cond_6

    .line 28
    const/4 v3, 0x1

    :try_start_0
    sput-boolean v3, Lcom/apportable/app/SplashScreen;->sAlreadyShown:Z

    .line 29
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v9

    .line 30
    .local v9, app:Lcom/apportable/app/VerdeApplication;
    invoke-virtual {v9}, Lcom/apportable/app/VerdeApplication;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    const-string v4, "Default.png"

    invoke-virtual {v3, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v15

    .line 31
    .local v15, is:Ljava/io/InputStream;
    if-eqz v15, :cond_f

    .line 32
    invoke-static {v15}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 33
    .local v2, splashBitmap:Landroid/graphics/Bitmap;
    if-eqz v2, :cond_6

    .line 34
    invoke-static {}, Lcom/apportable/utils/MetaData;->getMetaData()Landroid/os/Bundle;

    move-result-object v16

    .line 35
    .local v16, metaData:Landroid/os/Bundle;
    const-string v25, "letterbox"

    .line 37
    .local v25, splashScreenType:Ljava/lang/String;
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v26

    .line 38
    .local v26, splashWidth:I
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v24

    .line 39
    .local v24, splashHeight:I
    const-string v17, "landscape"

    .line 40
    .local v17, orientationMode:Ljava/lang/String;
    if-eqz v16, :cond_0

    .line 41
    const-string v3, "apportable.orientation"

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 42
    :cond_0
    if-nez v17, :cond_7

    const/4 v10, 0x0

    .line 44
    .local v10, bPortraitMode:Z
    :goto_0
    invoke-virtual {v9}, Lcom/apportable/app/VerdeApplication;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Display;->getHeight()I

    move-result v3

    int-to-float v0, v3

    move/from16 v18, v0

    .line 46
    .local v18, rootHeight:F
    invoke-virtual {v9}, Lcom/apportable/app/VerdeApplication;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Display;->getWidth()I

    move-result v3

    int-to-float v0, v3

    move/from16 v19, v0

    .line 48
    .local v19, rootWidth:F
    new-instance v3, Landroid/widget/ImageView;

    invoke-direct {v3, v9}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sput-object v3, Lcom/apportable/app/SplashScreen;->sSplashScreen:Landroid/widget/ImageView;

    .line 49
    sget-object v3, Lcom/apportable/app/SplashScreen;->sSplashScreen:Landroid/widget/ImageView;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x1

    const/16 v8, 0x11

    invoke-direct {v4, v5, v6, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    new-instance v14, Landroid/graphics/Paint;

    invoke-direct {v14}, Landroid/graphics/Paint;-><init>()V

    .line 51
    .local v14, filter:Landroid/graphics/Paint;
    const/4 v3, 0x1

    invoke-virtual {v14, v3}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 52
    const/4 v3, 0x0

    invoke-virtual {v14, v3}, Landroid/graphics/Paint;->setDither(Z)V

    .line 53
    if-eqz v16, :cond_1

    .line 54
    const-string v3, "apportable.splash_screen_type"

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 55
    :cond_1
    if-eqz v25, :cond_2

    const-string v3, ""

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "letterbox"

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 56
    :cond_2
    sget-object v3, Lcom/apportable/app/SplashScreen;->sSplashScreen:Landroid/widget/ImageView;

    sget-object v4, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 57
    if-eqz v10, :cond_8

    .line 58
    move/from16 v0, v19

    float-to-int v3, v0

    move/from16 v0, v18

    float-to-int v4, v0

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v4, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v12

    .line 59
    .local v12, croppedSplash:Landroid/graphics/Bitmap;
    new-instance v11, Landroid/graphics/Canvas;

    invoke-direct {v11, v12}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 60
    .local v11, canvas:Landroid/graphics/Canvas;
    move/from16 v0, v24

    int-to-float v3, v0

    move/from16 v0, v26

    int-to-float v4, v0

    div-float v4, v19, v4

    mul-float v21, v3, v4

    .line 61
    .local v21, scaledHeight:F
    sub-float v3, v18, v21

    const/high16 v4, 0x4000

    div-float v22, v3, v4

    .line 63
    .local v22, scaledOffset:F
    const/4 v3, 0x0

    cmpl-float v3, v22, v3

    if-lez v3, :cond_3

    .line 64
    new-instance v3, Landroid/graphics/Rect;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    move/from16 v0, v26

    invoke-direct {v3, v4, v5, v0, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v4, Landroid/graphics/RectF;

    const/4 v5, 0x0

    const/4 v6, 0x0

    move/from16 v0, v19

    move/from16 v1, v22

    invoke-direct {v4, v5, v6, v0, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v11, v2, v3, v4, v14}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 65
    :cond_3
    new-instance v3, Landroid/graphics/Rect;

    const/4 v4, 0x0

    const/4 v5, 0x0

    move/from16 v0, v26

    move/from16 v1, v24

    invoke-direct {v3, v4, v5, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v4, Landroid/graphics/RectF;

    const/4 v5, 0x0

    add-float v6, v21, v22

    move/from16 v0, v22

    move/from16 v1, v19

    invoke-direct {v4, v5, v0, v1, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v11, v2, v3, v4, v14}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 67
    const/4 v3, 0x0

    cmpl-float v3, v22, v3

    if-lez v3, :cond_4

    .line 68
    new-instance v3, Landroid/graphics/Rect;

    const/4 v4, 0x0

    add-int/lit8 v5, v24, -0x1

    move/from16 v0, v26

    move/from16 v1, v24

    invoke-direct {v3, v4, v5, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v4, Landroid/graphics/RectF;

    const/4 v5, 0x0

    sub-float v6, v18, v22

    move/from16 v0, v19

    move/from16 v1, v18

    invoke-direct {v4, v5, v6, v0, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v11, v2, v3, v4, v14}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 69
    :cond_4
    sget-object v3, Lcom/apportable/app/SplashScreen;->sSplashScreen:Landroid/widget/ImageView;

    invoke-virtual {v3, v12}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 113
    .end local v11           #canvas:Landroid/graphics/Canvas;
    .end local v12           #croppedSplash:Landroid/graphics/Bitmap;
    .end local v21           #scaledHeight:F
    .end local v22           #scaledOffset:F
    :cond_5
    :goto_1
    sget-object v3, Lcom/apportable/app/SplashScreen;->sSplashScreen:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 123
    .end local v2           #splashBitmap:Landroid/graphics/Bitmap;
    .end local v9           #app:Lcom/apportable/app/VerdeApplication;
    .end local v10           #bPortraitMode:Z
    .end local v14           #filter:Landroid/graphics/Paint;
    .end local v15           #is:Ljava/io/InputStream;
    .end local v16           #metaData:Landroid/os/Bundle;
    .end local v17           #orientationMode:Ljava/lang/String;
    .end local v18           #rootHeight:F
    .end local v19           #rootWidth:F
    .end local v24           #splashHeight:I
    .end local v25           #splashScreenType:Ljava/lang/String;
    .end local v26           #splashWidth:I
    :cond_6
    :goto_2
    return-void

    .line 42
    .restart local v2       #splashBitmap:Landroid/graphics/Bitmap;
    .restart local v9       #app:Lcom/apportable/app/VerdeApplication;
    .restart local v15       #is:Ljava/io/InputStream;
    .restart local v16       #metaData:Landroid/os/Bundle;
    .restart local v17       #orientationMode:Ljava/lang/String;
    .restart local v24       #splashHeight:I
    .restart local v25       #splashScreenType:Ljava/lang/String;
    .restart local v26       #splashWidth:I
    :cond_7
    const-string v3, "portrait"

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    goto/16 :goto_0

    .line 71
    .restart local v10       #bPortraitMode:Z
    .restart local v14       #filter:Landroid/graphics/Paint;
    .restart local v18       #rootHeight:F
    .restart local v19       #rootWidth:F
    :cond_8
    move/from16 v0, v19

    float-to-int v3, v0

    move/from16 v0, v18

    float-to-int v4, v0

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v4, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v20

    .line 72
    .local v20, rotatedSplash:Landroid/graphics/Bitmap;
    new-instance v11, Landroid/graphics/Canvas;

    move-object/from16 v0, v20

    invoke-direct {v11, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 73
    .restart local v11       #canvas:Landroid/graphics/Canvas;
    const/high16 v3, -0x3d4c

    const/high16 v4, 0x4000

    div-float v4, v18, v4

    const/high16 v5, 0x4000

    div-float v5, v18, v5

    invoke-virtual {v11, v3, v4, v5}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 75
    move/from16 v0, v24

    int-to-float v3, v0

    mul-float v3, v3, v18

    move/from16 v0, v26

    int-to-float v4, v0

    div-float v23, v3, v4

    .line 76
    .local v23, scaledWidth:F
    sub-float v3, v19, v23

    const/high16 v4, 0x4000

    div-float v22, v3, v4

    .line 78
    .restart local v22       #scaledOffset:F
    const/4 v3, 0x0

    cmpl-float v3, v22, v3

    if-lez v3, :cond_9

    .line 79
    new-instance v3, Landroid/graphics/Rect;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    move/from16 v0, v26

    invoke-direct {v3, v4, v5, v0, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v4, Landroid/graphics/RectF;

    const/4 v5, 0x0

    const/4 v6, 0x0

    move/from16 v0, v18

    move/from16 v1, v22

    invoke-direct {v4, v5, v6, v0, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v11, v2, v3, v4, v14}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 80
    :cond_9
    new-instance v3, Landroid/graphics/Rect;

    const/4 v4, 0x0

    const/4 v5, 0x0

    move/from16 v0, v26

    move/from16 v1, v24

    invoke-direct {v3, v4, v5, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v4, Landroid/graphics/RectF;

    const/4 v5, 0x0

    add-float v6, v23, v22

    move/from16 v0, v22

    move/from16 v1, v18

    invoke-direct {v4, v5, v0, v1, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v11, v2, v3, v4, v14}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 82
    const/4 v3, 0x0

    cmpl-float v3, v22, v3

    if-lez v3, :cond_a

    .line 83
    new-instance v3, Landroid/graphics/Rect;

    const/4 v4, 0x0

    add-int/lit8 v5, v24, -0x1

    move/from16 v0, v26

    move/from16 v1, v24

    invoke-direct {v3, v4, v5, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v4, Landroid/graphics/RectF;

    const/4 v5, 0x0

    sub-float v6, v19, v22

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-direct {v4, v5, v6, v0, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v11, v2, v3, v4, v14}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 84
    :cond_a
    sget-object v3, Lcom/apportable/app/SplashScreen;->sSplashScreen:Landroid/widget/ImageView;

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_1

    .line 118
    .end local v2           #splashBitmap:Landroid/graphics/Bitmap;
    .end local v9           #app:Lcom/apportable/app/VerdeApplication;
    .end local v10           #bPortraitMode:Z
    .end local v11           #canvas:Landroid/graphics/Canvas;
    .end local v14           #filter:Landroid/graphics/Paint;
    .end local v15           #is:Ljava/io/InputStream;
    .end local v16           #metaData:Landroid/os/Bundle;
    .end local v17           #orientationMode:Ljava/lang/String;
    .end local v18           #rootHeight:F
    .end local v19           #rootWidth:F
    .end local v20           #rotatedSplash:Landroid/graphics/Bitmap;
    .end local v22           #scaledOffset:F
    .end local v23           #scaledWidth:F
    .end local v24           #splashHeight:I
    .end local v25           #splashScreenType:Ljava/lang/String;
    .end local v26           #splashWidth:I
    :catch_0
    move-exception v13

    .line 119
    .local v13, e:Ljava/lang/Exception;
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v13}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 120
    const-string v3, "VerdeDebug"

    const-string v4, "Exception caught while setting splash screen"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 86
    .end local v13           #e:Ljava/lang/Exception;
    .restart local v2       #splashBitmap:Landroid/graphics/Bitmap;
    .restart local v9       #app:Lcom/apportable/app/VerdeApplication;
    .restart local v10       #bPortraitMode:Z
    .restart local v14       #filter:Landroid/graphics/Paint;
    .restart local v15       #is:Ljava/io/InputStream;
    .restart local v16       #metaData:Landroid/os/Bundle;
    .restart local v17       #orientationMode:Ljava/lang/String;
    .restart local v18       #rootHeight:F
    .restart local v19       #rootWidth:F
    .restart local v24       #splashHeight:I
    .restart local v25       #splashScreenType:Ljava/lang/String;
    .restart local v26       #splashWidth:I
    :cond_b
    :try_start_1
    const-string v3, "aspect_fit"

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 87
    sget-object v3, Lcom/apportable/app/SplashScreen;->sSplashScreen:Landroid/widget/ImageView;

    sget-object v4, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 88
    move/from16 v0, v19

    float-to-int v3, v0

    move/from16 v0, v18

    float-to-int v4, v0

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v4, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v20

    .line 89
    .restart local v20       #rotatedSplash:Landroid/graphics/Bitmap;
    new-instance v11, Landroid/graphics/Canvas;

    move-object/from16 v0, v20

    invoke-direct {v11, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 90
    .restart local v11       #canvas:Landroid/graphics/Canvas;
    const/high16 v3, -0x3d4c

    const/high16 v4, 0x4000

    div-float v4, v18, v4

    const/high16 v5, 0x4000

    div-float v5, v18, v5

    invoke-virtual {v11, v3, v4, v5}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 91
    move/from16 v0, v24

    int-to-float v3, v0

    mul-float v3, v3, v18

    move/from16 v0, v26

    int-to-float v4, v0

    div-float v23, v3, v4

    .line 92
    .restart local v23       #scaledWidth:F
    sub-float v3, v19, v23

    const/high16 v4, 0x4000

    div-float v22, v3, v4

    .line 93
    .restart local v22       #scaledOffset:F
    new-instance v3, Landroid/graphics/Rect;

    const/4 v4, 0x0

    const/4 v5, 0x0

    move/from16 v0, v26

    move/from16 v1, v24

    invoke-direct {v3, v4, v5, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v4, Landroid/graphics/RectF;

    const/4 v5, 0x0

    add-float v6, v23, v22

    move/from16 v0, v22

    move/from16 v1, v18

    invoke-direct {v4, v5, v0, v1, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v11, v2, v3, v4, v14}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 94
    sget-object v3, Lcom/apportable/app/SplashScreen;->sSplashScreen:Landroid/widget/ImageView;

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_1

    .line 95
    .end local v11           #canvas:Landroid/graphics/Canvas;
    .end local v20           #rotatedSplash:Landroid/graphics/Bitmap;
    .end local v22           #scaledOffset:F
    .end local v23           #scaledWidth:F
    :cond_c
    const-string v3, "stretch"

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 96
    sget-object v3, Lcom/apportable/app/SplashScreen;->sSplashScreen:Landroid/widget/ImageView;

    sget-object v4, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 97
    new-instance v7, Landroid/graphics/Matrix;

    invoke-direct {v7}, Landroid/graphics/Matrix;-><init>()V

    .line 98
    .local v7, matrix:Landroid/graphics/Matrix;
    const/high16 v3, -0x3d4c

    invoke-virtual {v7, v3}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 99
    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    const/4 v8, 0x1

    invoke-static/range {v2 .. v8}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v20

    .line 101
    .restart local v20       #rotatedSplash:Landroid/graphics/Bitmap;
    sget-object v3, Lcom/apportable/app/SplashScreen;->sSplashScreen:Landroid/widget/ImageView;

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_1

    .line 102
    .end local v7           #matrix:Landroid/graphics/Matrix;
    .end local v20           #rotatedSplash:Landroid/graphics/Bitmap;
    :cond_d
    const-string v3, "aspect_fill"

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 103
    sget-object v3, Lcom/apportable/app/SplashScreen;->sSplashScreen:Landroid/widget/ImageView;

    sget-object v4, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 104
    new-instance v7, Landroid/graphics/Matrix;

    invoke-direct {v7}, Landroid/graphics/Matrix;-><init>()V

    .line 105
    .restart local v7       #matrix:Landroid/graphics/Matrix;
    const/high16 v3, -0x3d4c

    invoke-virtual {v7, v3}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 106
    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    const/4 v8, 0x1

    invoke-static/range {v2 .. v8}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v20

    .line 108
    .restart local v20       #rotatedSplash:Landroid/graphics/Bitmap;
    sget-object v3, Lcom/apportable/app/SplashScreen;->sSplashScreen:Landroid/widget/ImageView;

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_1

    .line 109
    .end local v7           #matrix:Landroid/graphics/Matrix;
    .end local v20           #rotatedSplash:Landroid/graphics/Bitmap;
    :cond_e
    const-string v3, "native"

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 110
    sget-object v3, Lcom/apportable/app/SplashScreen;->sSplashScreen:Landroid/widget/ImageView;

    sget-object v4, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 111
    sget-object v3, Lcom/apportable/app/SplashScreen;->sSplashScreen:Landroid/widget/ImageView;

    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_1

    .line 116
    .end local v2           #splashBitmap:Landroid/graphics/Bitmap;
    .end local v10           #bPortraitMode:Z
    .end local v14           #filter:Landroid/graphics/Paint;
    .end local v16           #metaData:Landroid/os/Bundle;
    .end local v17           #orientationMode:Ljava/lang/String;
    .end local v18           #rootHeight:F
    .end local v19           #rootWidth:F
    .end local v24           #splashHeight:I
    .end local v25           #splashScreenType:Ljava/lang/String;
    .end local v26           #splashWidth:I
    :cond_f
    const-string v3, "VerdeDebug"

    const-string v4, "Default.png not found for splash screen"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_2
.end method

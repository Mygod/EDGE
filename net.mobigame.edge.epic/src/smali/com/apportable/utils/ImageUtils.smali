.class public Lcom/apportable/utils/ImageUtils;
.super Ljava/lang/Object;
.source "ImageUtils.java"


# static fields
.field private static TAG:Ljava/lang/String;

.field private static drawableCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/ref/SoftReference",
            "<",
            "Landroid/graphics/drawable/Drawable$ConstantState;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 151
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/apportable/utils/ImageUtils;->drawableCache:Ljava/util/Map;

    .line 154
    const-string v0, "ImageUtils"

    sput-object v0, Lcom/apportable/utils/ImageUtils;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static BitmapFromBytes([BIIII)Landroid/graphics/Bitmap;
    .locals 3
    .parameter "bytes"
    .parameter "offset"
    .parameter "length"
    .parameter "imageWidth"
    .parameter "imageHeight"

    .prologue
    .line 28
    if-eqz p3, :cond_0

    if-nez p4, :cond_1

    .line 29
    :cond_0
    const/4 v0, 0x0

    .line 33
    :goto_0
    return-object v0

    .line 30
    :cond_1
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 31
    .local v1, buffer:Ljava/nio/ByteBuffer;
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p3, p4, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 32
    .local v0, bitmap:Landroid/graphics/Bitmap;
    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    goto :goto_0
.end method

.method public static Drawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 7
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 86
    sget-object v4, Lcom/apportable/utils/ImageUtils;->drawableCache:Ljava/util/Map;

    invoke-interface {v4, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/SoftReference;

    .line 87
    .local v0, cacheEntry:Ljava/lang/ref/SoftReference;,"Ljava/lang/ref/SoftReference<Landroid/graphics/drawable/Drawable$ConstantState;>;"
    if-eqz v0, :cond_0

    .line 88
    invoke-virtual {v0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/Drawable$ConstantState;

    .line 89
    .local v2, drawableState:Landroid/graphics/drawable/Drawable$ConstantState;
    if-eqz v2, :cond_0

    .line 90
    invoke-static {}, Lcom/apportable/activity/VerdeActivity;->getActivity()Lcom/apportable/activity/VerdeActivity;

    move-result-object v4

    invoke-virtual {v4}, Lcom/apportable/activity/VerdeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 111
    .end local v2           #drawableState:Landroid/graphics/drawable/Drawable$ConstantState;
    :goto_0
    return-object v1

    .line 95
    :cond_0
    invoke-static {}, Lcom/apportable/activity/VerdeActivity;->getActivity()Lcom/apportable/activity/VerdeActivity;

    move-result-object v4

    invoke-virtual {v4}, Lcom/apportable/activity/VerdeActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    invoke-virtual {v4, p0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 97
    .local v3, stream:Ljava/io/InputStream;
    :try_start_0
    invoke-static {v3, p0}, Lcom/apportable/utils/ImageUtils;->createDrawableFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 98
    .local v1, drawable:Landroid/graphics/drawable/Drawable;
    if-eqz v1, :cond_1

    .line 99
    sget-object v4, Lcom/apportable/utils/ImageUtils;->drawableCache:Ljava/util/Map;

    new-instance v5, Ljava/lang/ref/SoftReference;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v4, p0, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 106
    :cond_1
    :try_start_1
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 108
    :catch_0
    move-exception v4

    goto :goto_0

    .line 105
    .end local v1           #drawable:Landroid/graphics/drawable/Drawable;
    :catchall_0
    move-exception v4

    .line 106
    :try_start_2
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 111
    :goto_1
    throw v4

    .line 108
    :catch_1
    move-exception v5

    goto :goto_1
.end method

.method public static DrawableFromBytes([BIIII)Landroid/graphics/drawable/Drawable;
    .locals 7
    .parameter "bytes"
    .parameter "width"
    .parameter "height"
    .parameter "scaledWidth"
    .parameter "scaledHeight"

    .prologue
    .line 37
    const/4 v2, 0x0

    .line 39
    .local v2, image:Landroid/graphics/drawable/Drawable;
    const/4 v4, 0x0

    :try_start_0
    array-length v5, p0

    invoke-static {p0, v4, v5, p1, p2}, Lcom/apportable/utils/ImageUtils;->BitmapFromBytes([BIIII)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 40
    .local v0, bitmap:Landroid/graphics/Bitmap;
    if-nez v0, :cond_0

    .line 41
    const/4 v4, 0x0

    .line 48
    .end local v0           #bitmap:Landroid/graphics/Bitmap;
    :goto_0
    return-object v4

    .line 42
    .restart local v0       #bitmap:Landroid/graphics/Bitmap;
    :cond_0
    new-instance v3, Landroid/graphics/drawable/BitmapDrawable;

    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v4

    invoke-virtual {v4}, Lcom/apportable/app/VerdeApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    .end local v2           #image:Landroid/graphics/drawable/Drawable;
    .local v3, image:Landroid/graphics/drawable/Drawable;
    const/4 v4, 0x0

    const/4 v5, 0x0

    :try_start_1
    invoke-virtual {v3, v4, v5, p3, p4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v2, v3

    .end local v0           #bitmap:Landroid/graphics/Bitmap;
    .end local v3           #image:Landroid/graphics/drawable/Drawable;
    .restart local v2       #image:Landroid/graphics/drawable/Drawable;
    :goto_1
    move-object v4, v2

    .line 48
    goto :goto_0

    .line 44
    :catch_0
    move-exception v1

    .line 45
    .local v1, e:Ljava/lang/RuntimeException;
    :goto_2
    const-string v4, "VERDE_DEBUG"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "got "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    array-length v6, p0

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " but expected "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    mul-int v6, p1, p2

    mul-int/lit8 v6, v6, 0x4

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 44
    .end local v1           #e:Ljava/lang/RuntimeException;
    .end local v2           #image:Landroid/graphics/drawable/Drawable;
    .restart local v0       #bitmap:Landroid/graphics/Bitmap;
    .restart local v3       #image:Landroid/graphics/drawable/Drawable;
    :catch_1
    move-exception v1

    move-object v2, v3

    .end local v3           #image:Landroid/graphics/drawable/Drawable;
    .restart local v2       #image:Landroid/graphics/drawable/Drawable;
    goto :goto_2
.end method

.method public static DrawableWithInferredStatesFromBytes([BIIII)Landroid/graphics/drawable/Drawable;
    .locals 5
    .parameter "bytes"
    .parameter "width"
    .parameter "height"
    .parameter "scaledWidth"
    .parameter "scaledHeight"

    .prologue
    .line 75
    invoke-static {p0, p1, p2, p3, p4}, Lcom/apportable/utils/ImageUtils;->DrawableFromBytes([BIIII)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 76
    .local v0, drawable:Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_0

    .line 77
    const/4 v1, 0x0

    .line 81
    :goto_0
    return-object v1

    .line 78
    :cond_0
    new-instance v1, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 79
    .local v1, stateListDrawable:Landroid/graphics/drawable/StateListDrawable;
    const/4 v2, 0x1

    new-array v2, v2, [I

    const/4 v3, 0x0

    const v4, 0x10100a7

    aput v4, v2, v3

    invoke-static {v0}, Lcom/apportable/utils/ImageUtils;->HighlightedDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 80
    sget-object v2, Landroid/util/StateSet;->WILD_CARD:[I

    invoke-virtual {v1, v2, v0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method public static HighlightedDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 9
    .parameter "d"

    .prologue
    const/4 v8, 0x0

    .line 62
    if-nez p0, :cond_0

    .line 63
    const/4 v5, 0x0

    .line 71
    :goto_0
    return-object v5

    :cond_0
    move-object v2, p0

    .line 64
    check-cast v2, Landroid/graphics/drawable/BitmapDrawable;

    .line 65
    .local v2, drawable:Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual {v2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 66
    .local v0, bitmap:Landroid/graphics/Bitmap;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    sget-object v7, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v5, v6, v7}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 67
    .local v3, newBitmap:Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 68
    .local v1, canvas:Landroid/graphics/Canvas;
    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    .line 69
    .local v4, paint:Landroid/graphics/Paint;
    const v5, -0x55000001

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 70
    invoke-virtual {v1, v0, v8, v8, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 71
    new-instance v5, Landroid/graphics/drawable/BitmapDrawable;

    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v6

    invoke-virtual {v6}, Lcom/apportable/app/VerdeApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-direct {v5, v6, v3}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    goto :goto_0
.end method

.method public static createDrawableFromPixels([IIIII)Landroid/graphics/drawable/Drawable;
    .locals 1
    .parameter "pixels"
    .parameter "width"
    .parameter "height"
    .parameter "scaledWidth"
    .parameter "scaledHeight"

    .prologue
    .line 52
    new-instance v0, Lcom/apportable/utils/PixelsDrawable;

    invoke-direct {v0, p0, p1, p2}, Lcom/apportable/utils/PixelsDrawable;-><init>([III)V

    .line 58
    .local v0, drawable:Lcom/apportable/utils/PixelsDrawable;
    return-object v0
.end method

.method private static createDrawableFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 11
    .parameter "stream"
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 119
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 120
    .local v2, options:Landroid/graphics/BitmapFactory$Options;
    iput v8, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 122
    :goto_0
    invoke-virtual {p0}, Ljava/io/InputStream;->markSupported()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 123
    const v3, 0x7fffffff

    invoke-virtual {p0, v3}, Ljava/io/InputStream;->mark(I)V

    .line 126
    :cond_0
    const/4 v3, 0x0

    const/4 v4, 0x0

    :try_start_0
    invoke-static {v3, v4, p0, p1, v2}, Landroid/graphics/drawable/Drawable;->createFromResourceStream(Landroid/content/res/Resources;Landroid/util/TypedValue;Ljava/io/InputStream;Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 127
    .local v0, drawable:Landroid/graphics/drawable/Drawable;
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    if-eq v3, v8, :cond_1

    .line 128
    sget-object v3, Lcom/apportable/utils/ImageUtils;->TAG:Ljava/lang/String;

    const-string v4, "Image %s was loaded downscaled by a factor of %d."

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    iget v7, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .line 132
    :cond_1
    return-object v0

    .line 134
    .end local v0           #drawable:Landroid/graphics/drawable/Drawable;
    :catch_0
    move-exception v1

    .line 135
    .local v1, e:Ljava/lang/OutOfMemoryError;
    invoke-virtual {p0}, Ljava/io/InputStream;->markSupported()Z

    move-result v3

    if-nez v3, :cond_2

    .line 136
    throw v1

    .line 138
    :cond_2
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    const/4 v4, 0x4

    if-ne v3, v4, :cond_3

    .line 139
    sget-object v3, Lcom/apportable/utils/ImageUtils;->TAG:Ljava/lang/String;

    const-string v4, "Gave up loading downscaled versions of %s at factor of %d."

    new-array v5, v10, [Ljava/lang/Object;

    aput-object p1, v5, v9

    iget v6, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    throw v1

    .line 144
    :cond_3
    invoke-virtual {p0}, Ljava/io/InputStream;->reset()V

    .line 121
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    goto :goto_0
.end method

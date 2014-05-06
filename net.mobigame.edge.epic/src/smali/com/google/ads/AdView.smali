.class public Lcom/google/ads/AdView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Lcom/google/ads/Ad;


# instance fields
.field private a:Lcom/google/ads/m;

.field private b:Lcom/google/ads/internal/d;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/google/ads/AdSize;Ljava/lang/String;)V
    .locals 3
    .parameter "activity"
    .parameter "adSize"
    .parameter "adUnitId"

    .prologue
    const/4 v2, 0x0

    .line 87
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 91
    const/4 v0, 0x0

    :try_start_0
    invoke-direct {p0, p1, p2, v0}, Lcom/google/ads/AdView;->a(Landroid/content/Context;Lcom/google/ads/AdSize;Landroid/util/AttributeSet;)Z

    .line 92
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/ads/AdView;->b(Landroid/content/Context;Lcom/google/ads/AdSize;Landroid/util/AttributeSet;)Z

    .line 94
    invoke-direct {p0, p1, p2, p3}, Lcom/google/ads/AdView;->a(Landroid/app/Activity;Lcom/google/ads/AdSize;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/google/ads/internal/b; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    :goto_0
    return-void

    .line 95
    :catch_0
    move-exception v0

    .line 96
    const-string v1, "Could not initialize AdView"

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/b;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v1, p2, v2}, Lcom/google/ads/AdView;->a(Landroid/content/Context;Ljava/lang/String;Lcom/google/ads/AdSize;Landroid/util/AttributeSet;)V

    .line 98
    const-string v1, "Could not initialize AdView"

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/b;->a(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 113
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 115
    invoke-direct {p0, p1, p2}, Lcom/google/ads/AdView;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 116
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 131
    invoke-direct {p0, p1, p2}, Lcom/google/ads/AdView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 132
    return-void
.end method

.method private a(Landroid/content/Context;I)I
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 196
    const/4 v0, 0x1

    int-to-float v1, p2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-static {v0, v1, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    return v0
.end method

.method private a(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;ZZ)Ljava/lang/String;
    .locals 7
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/ads/internal/b;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 380
    const-string v0, "http://schemas.android.com/apk/lib/com.google.ads"

    invoke-interface {p3, v0, p1}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 381
    if-eqz v1, :cond_2

    .line 382
    const-string v0, "@string/"

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    if-eqz p4, :cond_2

    .line 383
    const-string v0, "@string/"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 384
    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 385
    new-instance v3, Landroid/util/TypedValue;

    invoke-direct {v3}, Landroid/util/TypedValue;-><init>()V

    .line 388
    :try_start_0
    invoke-virtual {p0}, Lcom/google/ads/AdView;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, ":string/"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v4, v0, v3, v2}, Landroid/content/res/Resources;->getValue(Ljava/lang/String;Landroid/util/TypedValue;Z)V
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 393
    iget-object v0, v3, Landroid/util/TypedValue;->string:Ljava/lang/CharSequence;

    if-eqz v0, :cond_0

    .line 394
    iget-object v0, v3, Landroid/util/TypedValue;->string:Ljava/lang/CharSequence;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 401
    :goto_0
    if-eqz p5, :cond_1

    if-nez v0, :cond_1

    .line 402
    new-instance v0, Lcom/google/ads/internal/b;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Required XML attribute \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\" missing"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, v6}, Lcom/google/ads/internal/b;-><init>(Ljava/lang/String;Z)V

    throw v0

    .line 389
    :catch_0
    move-exception v0

    .line 390
    new-instance v2, Lcom/google/ads/internal/b;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not find resource for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1, v6, v0}, Lcom/google/ads/internal/b;-><init>(Ljava/lang/String;ZLjava/lang/Throwable;)V

    throw v2

    .line 396
    :cond_0
    new-instance v0, Lcom/google/ads/internal/b;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Resource "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " was not a string: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, v6}, Lcom/google/ads/internal/b;-><init>(Ljava/lang/String;Z)V

    throw v0

    .line 405
    :cond_1
    return-object v0

    :cond_2
    move-object v0, v1

    goto :goto_0
.end method

.method private a(Landroid/app/Activity;Lcom/google/ads/AdSize;Ljava/lang/String;)V
    .locals 5
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/ads/internal/b;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v4, -0x2

    .line 441
    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 442
    invoke-virtual {v1, v3}, Landroid/widget/FrameLayout;->setFocusable(Z)V

    .line 444
    invoke-static {p0, p3, p1, v1, p2}, Lcom/google/ads/m;->a(Lcom/google/ads/Ad;Ljava/lang/String;Landroid/app/Activity;Landroid/view/ViewGroup;Lcom/google/ads/AdSize;)Lcom/google/ads/m;

    move-result-object v0

    iput-object v0, p0, Lcom/google/ads/AdView;->a:Lcom/google/ads/m;

    .line 447
    new-instance v0, Lcom/google/ads/internal/d;

    iget-object v2, p0, Lcom/google/ads/AdView;->a:Lcom/google/ads/m;

    invoke-direct {v0, v2, v3}, Lcom/google/ads/internal/d;-><init>(Lcom/google/ads/m;Z)V

    iput-object v0, p0, Lcom/google/ads/AdView;->b:Lcom/google/ads/internal/d;

    .line 450
    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Lcom/google/ads/AdView;->setGravity(I)V

    .line 453
    :try_start_0
    iget-object v0, p0, Lcom/google/ads/AdView;->b:Lcom/google/ads/internal/d;

    invoke-static {p1, v0}, Lcom/google/ads/internal/j;->a(Landroid/app/Activity;Lcom/google/ads/internal/d;)Landroid/view/ViewGroup;

    move-result-object v0

    .line 454
    if-eqz v0, :cond_0

    .line 455
    const/4 v2, -0x2

    const/4 v3, -0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 458
    const/4 v2, -0x2

    const/4 v3, -0x2

    invoke-virtual {p0, v0, v2, v3}, Lcom/google/ads/AdView;->addView(Landroid/view/View;II)V

    .line 472
    :goto_0
    return-void

    .line 462
    :cond_0
    const/4 v0, -0x2

    const/4 v2, -0x2

    invoke-virtual {p0, v1, v0, v2}, Lcom/google/ads/AdView;->addView(Landroid/view/View;II)V
    :try_end_0
    .catch Ljava/lang/VerifyError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 466
    :catch_0
    move-exception v0

    .line 467
    const-string v2, "Gestures disabled: Not supported on this version of Android."

    invoke-static {v2, v0}, Lcom/google/ads/util/b;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 468
    invoke-virtual {p0, v1, v4, v4}, Lcom/google/ads/AdView;->addView(Landroid/view/View;II)V

    goto :goto_0
.end method

.method private a(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 12
    .parameter
    .parameter

    .prologue
    const/4 v7, 0x0

    .line 300
    if-nez p2, :cond_1

    .line 375
    :cond_0
    :goto_0
    return-void

    .line 307
    :cond_1
    :try_start_0
    const-string v2, "adSize"

    const/4 v5, 0x0

    const/4 v6, 0x1

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    invoke-direct/range {v1 .. v6}, Lcom/google/ads/AdView;->a(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;ZZ)Ljava/lang/String;

    move-result-object v1

    .line 309
    const-string v2, "BANNER"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    sget-object v5, Lcom/google/ads/AdSize;->BANNER:Lcom/google/ads/AdSize;
    :try_end_0
    .catch Lcom/google/ads/internal/b; {:try_start_0 .. :try_end_0} :catch_1

    .line 317
    :goto_1
    if-nez v5, :cond_8

    .line 318
    :try_start_1
    new-instance v2, Lcom/google/ads/internal/b;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Attribute \"adSize\" invalid: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x1

    invoke-direct {v2, v1, v3}, Lcom/google/ads/internal/b;-><init>(Ljava/lang/String;Z)V

    throw v2
    :try_end_1
    .catch Lcom/google/ads/internal/b; {:try_start_1 .. :try_end_1} :catch_0

    .line 366
    :catch_0
    move-exception v1

    .line 367
    :goto_2
    const-string v2, "Could not initialize AdView"

    invoke-virtual {v1, v2}, Lcom/google/ads/internal/b;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, p1, v2, v5, p2}, Lcom/google/ads/AdView;->a(Landroid/content/Context;Ljava/lang/String;Lcom/google/ads/AdSize;Landroid/util/AttributeSet;)V

    .line 369
    const-string v2, "Could not initialize AdView"

    invoke-virtual {v1, v2}, Lcom/google/ads/internal/b;->a(Ljava/lang/String;)V

    .line 371
    invoke-virtual {p0}, Lcom/google/ads/AdView;->isInEditMode()Z

    move-result v2

    if-nez v2, :cond_0

    .line 372
    const-string v2, "Could not initialize AdView"

    invoke-virtual {v1, v2}, Lcom/google/ads/internal/b;->b(Ljava/lang/String;)V

    goto :goto_0

    .line 309
    :cond_2
    :try_start_2
    const-string v2, "SMART_BANNER"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    sget-object v5, Lcom/google/ads/AdSize;->SMART_BANNER:Lcom/google/ads/AdSize;

    goto :goto_1

    :cond_3
    const-string v2, "IAB_MRECT"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    sget-object v5, Lcom/google/ads/AdSize;->IAB_MRECT:Lcom/google/ads/AdSize;

    goto :goto_1

    :cond_4
    const-string v2, "IAB_BANNER"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    sget-object v5, Lcom/google/ads/AdSize;->IAB_BANNER:Lcom/google/ads/AdSize;

    goto :goto_1

    :cond_5
    const-string v2, "IAB_LEADERBOARD"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    sget-object v5, Lcom/google/ads/AdSize;->IAB_LEADERBOARD:Lcom/google/ads/AdSize;

    goto :goto_1

    :cond_6
    const-string v2, "IAB_WIDE_SKYSCRAPER"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    sget-object v5, Lcom/google/ads/AdSize;->IAB_WIDE_SKYSCRAPER:Lcom/google/ads/AdSize;
    :try_end_2
    .catch Lcom/google/ads/internal/b; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :cond_7
    move-object v5, v7

    goto :goto_1

    .line 322
    :cond_8
    :try_start_3
    const-string v1, "adUnitId"

    invoke-direct {p0, v1, p2}, Lcom/google/ads/AdView;->a(Ljava/lang/String;Landroid/util/AttributeSet;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 323
    new-instance v1, Lcom/google/ads/internal/b;

    const-string v2, "Required XML attribute \"adUnitId\" missing"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lcom/google/ads/internal/b;-><init>(Ljava/lang/String;Z)V

    throw v1

    .line 327
    :cond_9
    invoke-virtual {p0}, Lcom/google/ads/AdView;->isInEditMode()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 329
    const-string v3, "Ads by Google"

    const/4 v4, -0x1

    move-object v1, p0

    move-object v2, p1

    move-object v6, p2

    invoke-virtual/range {v1 .. v6}, Lcom/google/ads/AdView;->a(Landroid/content/Context;Ljava/lang/String;ILcom/google/ads/AdSize;Landroid/util/AttributeSet;)V

    goto/16 :goto_0

    .line 332
    :cond_a
    const-string v7, "adUnitId"

    const/4 v10, 0x1

    const/4 v11, 0x1

    move-object v6, p0

    move-object v8, p1

    move-object v9, p2

    invoke-direct/range {v6 .. v11}, Lcom/google/ads/AdView;->a(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;ZZ)Ljava/lang/String;

    move-result-object v2

    .line 335
    const-string v1, "http://schemas.android.com/apk/lib/com.google.ads"

    const-string v3, "loadAdOnCreate"

    const/4 v4, 0x0

    invoke-interface {p2, v1, v3, v4}, Landroid/util/AttributeSet;->getAttributeBooleanValue(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    .line 339
    instance-of v1, p1, Landroid/app/Activity;

    if-eqz v1, :cond_c

    .line 340
    move-object v0, p1

    check-cast v0, Landroid/app/Activity;

    move-object v1, v0

    .line 343
    invoke-direct {p0, v1, v5, p2}, Lcom/google/ads/AdView;->a(Landroid/content/Context;Lcom/google/ads/AdSize;Landroid/util/AttributeSet;)Z

    .line 344
    invoke-direct {p0, v1, v5, p2}, Lcom/google/ads/AdView;->b(Landroid/content/Context;Lcom/google/ads/AdSize;Landroid/util/AttributeSet;)Z

    .line 347
    invoke-direct {p0, v1, v5, v2}, Lcom/google/ads/AdView;->a(Landroid/app/Activity;Lcom/google/ads/AdSize;Ljava/lang/String;)V

    .line 349
    if-eqz v3, :cond_0

    .line 350
    const-string v7, "testDevices"

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v6, p0

    move-object v8, p1

    move-object v9, p2

    invoke-direct/range {v6 .. v11}, Lcom/google/ads/AdView;->b(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;ZZ)Ljava/util/Set;

    move-result-object v1

    .line 352
    const-string v2, "TEST_EMULATOR"

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 353
    const-string v2, "TEST_EMULATOR"

    invoke-interface {v1, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 354
    sget-object v2, Lcom/google/ads/AdRequest;->TEST_EMULATOR:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 357
    :cond_b
    new-instance v2, Lcom/google/ads/AdRequest;

    invoke-direct {v2}, Lcom/google/ads/AdRequest;-><init>()V

    invoke-virtual {v2, v1}, Lcom/google/ads/AdRequest;->setTestDevices(Ljava/util/Set;)Lcom/google/ads/AdRequest;

    move-result-object v1

    const-string v7, "keywords"

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v6, p0

    move-object v8, p1

    move-object v9, p2

    invoke-direct/range {v6 .. v11}, Lcom/google/ads/AdView;->b(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;ZZ)Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/ads/AdRequest;->setKeywords(Ljava/util/Set;)Lcom/google/ads/AdRequest;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/ads/AdView;->loadAd(Lcom/google/ads/AdRequest;)V

    goto/16 :goto_0

    .line 362
    :cond_c
    new-instance v1, Lcom/google/ads/internal/b;

    const-string v2, "AdView was initialized with a Context that wasn\'t an Activity."

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lcom/google/ads/internal/b;-><init>(Ljava/lang/String;Z)V

    throw v1
    :try_end_3
    .catch Lcom/google/ads/internal/b; {:try_start_3 .. :try_end_3} :catch_0

    .line 366
    :catch_1
    move-exception v1

    move-object v5, v7

    goto/16 :goto_2
.end method

.method private a(Landroid/content/Context;Ljava/lang/String;Lcom/google/ads/AdSize;Landroid/util/AttributeSet;)V
    .locals 6
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 283
    invoke-static {p2}, Lcom/google/ads/util/b;->b(Ljava/lang/String;)V

    .line 286
    const/high16 v3, -0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/google/ads/AdView;->a(Landroid/content/Context;Ljava/lang/String;ILcom/google/ads/AdSize;Landroid/util/AttributeSet;)V

    .line 287
    return-void
.end method

.method private a(Landroid/content/Context;Lcom/google/ads/AdSize;Landroid/util/AttributeSet;)Z
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 215
    invoke-static {p1}, Lcom/google/ads/util/AdUtil;->c(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 216
    const-string v0, "You must have AdActivity declared in AndroidManifest.xml with configChanges."

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/google/ads/AdView;->a(Landroid/content/Context;Ljava/lang/String;Lcom/google/ads/AdSize;Landroid/util/AttributeSet;)V

    .line 221
    const/4 v0, 0x0

    .line 224
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private a(Ljava/lang/String;Landroid/util/AttributeSet;)Z
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 427
    const-string v0, "http://schemas.android.com/apk/lib/com.google.ads"

    invoke-interface {p2, v0, p1}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private b(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;ZZ)Ljava/util/Set;
    .locals 6
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/content/Context;",
            "Landroid/util/AttributeSet;",
            "ZZ)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/ads/internal/b;
        }
    .end annotation

    .prologue
    .line 411
    invoke-direct/range {p0 .. p5}, Lcom/google/ads/AdView;->a(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;ZZ)Ljava/lang/String;

    move-result-object v0

    .line 412
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 413
    if-eqz v0, :cond_1

    .line 414
    const-string v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 415
    array-length v3, v2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v3, :cond_1

    aget-object v4, v2, v0

    .line 416
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 417
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_0

    .line 418
    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 415
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 423
    :cond_1
    return-object v1
.end method

.method private b(Landroid/content/Context;Lcom/google/ads/AdSize;Landroid/util/AttributeSet;)Z
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 244
    invoke-static {p1}, Lcom/google/ads/util/AdUtil;->b(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 245
    const-string v0, "You must have INTERNET and ACCESS_NETWORK_STATE permissions in AndroidManifest.xml."

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/google/ads/AdView;->a(Landroid/content/Context;Ljava/lang/String;Lcom/google/ads/AdSize;Landroid/util/AttributeSet;)V

    .line 250
    const/4 v0, 0x0

    .line 253
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method a(Landroid/content/Context;Ljava/lang/String;ILcom/google/ads/AdSize;Landroid/util/AttributeSet;)V
    .locals 7
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    const/16 v4, 0x11

    .line 151
    if-nez p4, :cond_0

    .line 152
    sget-object p4, Lcom/google/ads/AdSize;->BANNER:Lcom/google/ads/AdSize;

    .line 155
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {p4, v0}, Lcom/google/ads/AdSize;->createAdSize(Lcom/google/ads/AdSize;Landroid/content/Context;)Lcom/google/ads/AdSize;

    move-result-object v3

    .line 157
    invoke-virtual {p0}, Lcom/google/ads/AdView;->getChildCount()I

    move-result v0

    if-nez v0, :cond_1

    .line 159
    if-nez p5, :cond_2

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 161
    :goto_0
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setGravity(I)V

    .line 162
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 163
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 164
    const/high16 v1, -0x100

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 167
    if-nez p5, :cond_3

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 169
    :goto_1
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 172
    if-nez p5, :cond_4

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 174
    :goto_2
    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 175
    invoke-virtual {v2, p3}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 178
    invoke-virtual {v3}, Lcom/google/ads/AdSize;->getWidth()I

    move-result v4

    invoke-direct {p0, p1, v4}, Lcom/google/ads/AdView;->a(Landroid/content/Context;I)I

    move-result v4

    .line 179
    invoke-virtual {v3}, Lcom/google/ads/AdSize;->getHeight()I

    move-result v3

    invoke-direct {p0, p1, v3}, Lcom/google/ads/AdView;->a(Landroid/content/Context;I)I

    move-result v3

    .line 182
    add-int/lit8 v5, v4, -0x2

    add-int/lit8 v6, v3, -0x2

    invoke-virtual {v1, v0, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    .line 183
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 184
    invoke-virtual {p0, v2, v4, v3}, Lcom/google/ads/AdView;->addView(Landroid/view/View;II)V

    .line 186
    :cond_1
    return-void

    .line 159
    :cond_2
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1, p5}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_0

    .line 167
    :cond_3
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p1, p5}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_1

    .line 172
    :cond_4
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p1, p5}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_2
.end method

.method public destroy()V
    .locals 1

    .prologue
    .line 263
    iget-object v0, p0, Lcom/google/ads/AdView;->b:Lcom/google/ads/internal/d;

    invoke-virtual {v0}, Lcom/google/ads/internal/d;->b()V

    .line 264
    return-void
.end method

.method public isReady()Z
    .locals 1

    .prologue
    .line 483
    iget-object v0, p0, Lcom/google/ads/AdView;->b:Lcom/google/ads/internal/d;

    if-nez v0, :cond_0

    .line 484
    const/4 v0, 0x0

    .line 487
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/ads/AdView;->b:Lcom/google/ads/internal/d;

    invoke-virtual {v0}, Lcom/google/ads/internal/d;->q()Z

    move-result v0

    goto :goto_0
.end method

.method public isRefreshing()Z
    .locals 1

    .prologue
    .line 498
    iget-object v0, p0, Lcom/google/ads/AdView;->b:Lcom/google/ads/internal/d;

    if-nez v0, :cond_0

    .line 499
    const/4 v0, 0x0

    .line 502
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/ads/AdView;->b:Lcom/google/ads/internal/d;

    invoke-virtual {v0}, Lcom/google/ads/internal/d;->r()Z

    move-result v0

    goto :goto_0
.end method

.method public loadAd(Lcom/google/ads/AdRequest;)V
    .locals 1
    .parameter "adRequest"

    .prologue
    .line 514
    iget-object v0, p0, Lcom/google/ads/AdView;->b:Lcom/google/ads/internal/d;

    if-eqz v0, :cond_1

    .line 516
    invoke-virtual {p0}, Lcom/google/ads/AdView;->isRefreshing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 517
    iget-object v0, p0, Lcom/google/ads/AdView;->b:Lcom/google/ads/internal/d;

    invoke-virtual {v0}, Lcom/google/ads/internal/d;->e()V

    .line 521
    :cond_0
    iget-object v0, p0, Lcom/google/ads/AdView;->b:Lcom/google/ads/internal/d;

    invoke-virtual {v0, p1}, Lcom/google/ads/internal/d;->a(Lcom/google/ads/AdRequest;)V

    .line 523
    :cond_1
    return-void
.end method

.method public setAdListener(Lcom/google/ads/AdListener;)V
    .locals 1
    .parameter "adListener"

    .prologue
    .line 534
    iget-object v0, p0, Lcom/google/ads/AdView;->a:Lcom/google/ads/m;

    iget-object v0, v0, Lcom/google/ads/m;->j:Lcom/google/ads/util/i$c;

    invoke-virtual {v0, p1}, Lcom/google/ads/util/i$c;->a(Ljava/lang/Object;)V

    .line 535
    return-void
.end method

.method public stopLoading()V
    .locals 1

    .prologue
    .line 546
    iget-object v0, p0, Lcom/google/ads/AdView;->b:Lcom/google/ads/internal/d;

    if-eqz v0, :cond_0

    .line 547
    iget-object v0, p0, Lcom/google/ads/AdView;->b:Lcom/google/ads/internal/d;

    invoke-virtual {v0}, Lcom/google/ads/internal/d;->z()V

    .line 549
    :cond_0
    return-void
.end method

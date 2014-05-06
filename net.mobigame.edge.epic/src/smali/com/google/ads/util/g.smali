.class public Lcom/google/ads/util/g;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/ads/util/g$1;,
        Lcom/google/ads/util/g$a;,
        Lcom/google/ads/util/g$b;
    }
.end annotation


# direct methods
.method public static a(Landroid/view/View;)V
    .locals 2
    .parameter

    .prologue
    .line 451
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 452
    return-void
.end method

.method public static a(Landroid/view/Window;)V
    .locals 1
    .parameter

    .prologue
    const/high16 v0, 0x100

    .line 460
    invoke-virtual {p0, v0, v0}, Landroid/view/Window;->setFlags(II)V

    .line 462
    return-void
.end method

.method public static a(Landroid/webkit/WebSettings;Lcom/google/ads/m;)V
    .locals 5
    .parameter
    .parameter

    .prologue
    const/4 v4, 0x1

    .line 424
    iget-object v0, p1, Lcom/google/ads/m;->d:Lcom/google/ads/util/i$b;

    invoke-virtual {v0}, Lcom/google/ads/util/i$b;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 427
    invoke-virtual {p0, v4}, Landroid/webkit/WebSettings;->setAppCacheEnabled(Z)V

    .line 428
    const-wide/16 v1, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/webkit/WebSettings;->setAppCacheMaxSize(J)V

    .line 429
    new-instance v1, Ljava/io/File;

    invoke-virtual {v0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "admob"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/webkit/WebSettings;->setAppCachePath(Ljava/lang/String;)V

    .line 432
    invoke-virtual {p0, v4}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    .line 433
    const-string v1, "admob"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/webkit/WebSettings;->setDatabasePath(Ljava/lang/String;)V

    .line 436
    invoke-virtual {p0, v4}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 440
    invoke-virtual {p0, v4}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    .line 441
    invoke-virtual {p0, v4}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 442
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/webkit/WebSettings;->setDisplayZoomControls(Z)V

    .line 443
    return-void
.end method

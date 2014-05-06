.class public Lcom/flurry/android/AppCircle;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public acceptOffer(Landroid/content/Context;J)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 259
    invoke-static {p1, p2, p3}, Lcom/flurry/android/FlurryAgent;->a(Landroid/content/Context;J)V

    .line 260
    return-void
.end method

.method public addUserCookie(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 308
    invoke-static {p1, p2}, Lcom/flurry/android/FlurryAgent;->addUserCookie(Ljava/lang/String;Ljava/lang/String;)V

    .line 309
    return-void
.end method

.method public clearUserCookies()V
    .locals 0

    .prologue
    .line 318
    invoke-static {}, Lcom/flurry/android/FlurryAgent;->clearUserCookies()V

    .line 319
    return-void
.end method

.method public getAllOffers()Ljava/util/List;
    .locals 1

    .prologue
    .line 286
    const-string v0, ""

    invoke-static {v0}, Lcom/flurry/android/FlurryAgent;->b(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getAllOffers(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .parameter

    .prologue
    .line 230
    invoke-static {p1}, Lcom/flurry/android/FlurryAgent;->b(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getHook(Landroid/content/Context;Ljava/lang/String;I)Landroid/view/View;
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 131
    invoke-static {p1, p2, p3}, Lcom/flurry/android/FlurryAgent;->a(Landroid/content/Context;Ljava/lang/String;I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getOffer()Lcom/flurry/android/Offer;
    .locals 1

    .prologue
    .line 277
    const-string v0, ""

    invoke-virtual {p0, v0}, Lcom/flurry/android/AppCircle;->getOffer(Ljava/lang/String;)Lcom/flurry/android/Offer;

    move-result-object v0

    return-object v0
.end method

.method public getOffer(Ljava/lang/String;)Lcom/flurry/android/Offer;
    .locals 1
    .parameter

    .prologue
    .line 214
    invoke-static {p1}, Lcom/flurry/android/FlurryAgent;->a(Ljava/lang/String;)Lcom/flurry/android/Offer;

    move-result-object v0

    return-object v0
.end method

.method public hasAds()Z
    .locals 1

    .prologue
    .line 175
    invoke-static {}, Lcom/flurry/android/FlurryAgent;->d()Z

    move-result v0

    return v0
.end method

.method public isLaunchCanvasOnBannerClicked()Z
    .locals 1

    .prologue
    .line 80
    invoke-static {}, Lcom/flurry/android/FlurryAgent;->a()Z

    move-result v0

    return v0
.end method

.method public isLaunchCatalogOnBannerClicked()Z
    .locals 1

    .prologue
    .line 92
    invoke-static {}, Lcom/flurry/android/FlurryAgent;->a()Z

    move-result v0

    return v0
.end method

.method public launchCanvasOnBannerClicked(Z)V
    .locals 0
    .parameter

    .prologue
    .line 70
    invoke-static {p1}, Lcom/flurry/android/FlurryAgent;->a(Z)V

    .line 71
    return-void
.end method

.method public launchCatalogOnBannerClicked(Z)V
    .locals 0
    .parameter

    .prologue
    .line 61
    invoke-static {p1}, Lcom/flurry/android/FlurryAgent;->a(Z)V

    .line 62
    return-void
.end method

.method public openCatalog(Landroid/content/Context;)V
    .locals 1
    .parameter

    .prologue
    .line 140
    const-string v0, ""

    invoke-virtual {p0, p1, v0}, Lcom/flurry/android/AppCircle;->openCatalog(Landroid/content/Context;Ljava/lang/String;)V

    .line 141
    return-void
.end method

.method public openCatalog(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 155
    invoke-static {p1, p2}, Lcom/flurry/android/FlurryAgent;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 156
    return-void
.end method

.method public removeOffers(Ljava/util/List;)V
    .locals 0
    .parameter

    .prologue
    .line 268
    invoke-static {p1}, Lcom/flurry/android/FlurryAgent;->a(Ljava/util/List;)V

    .line 269
    return-void
.end method

.method public setAppCircleCallback(Lcom/flurry/android/AppCircleCallback;)V
    .locals 0
    .parameter

    .prologue
    .line 48
    invoke-static {p1}, Lcom/flurry/android/FlurryAgent;->a(Lcom/flurry/android/AppCircleCallback;)V

    .line 49
    return-void
.end method

.method public setDefaultNoAdsMessage(Ljava/lang/String;)V
    .locals 0
    .parameter

    .prologue
    .line 33
    invoke-static {p1}, Lcom/flurry/android/FlurryAgent;->setDefaultNoAdsMessage(Ljava/lang/String;)V

    .line 34
    return-void
.end method

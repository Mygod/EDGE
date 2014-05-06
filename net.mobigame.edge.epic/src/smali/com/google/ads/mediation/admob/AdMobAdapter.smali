.class public Lcom/google/ads/mediation/admob/AdMobAdapter;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/ads/mediation/MediationBannerAdapter;
.implements Lcom/google/ads/mediation/MediationInterstitialAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/ads/mediation/admob/AdMobAdapter$1;,
        Lcom/google/ads/mediation/admob/AdMobAdapter$b;,
        Lcom/google/ads/mediation/admob/AdMobAdapter$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/ads/mediation/MediationBannerAdapter",
        "<",
        "Lcom/google/ads/mediation/admob/AdMobAdapterExtras;",
        "Lcom/google/ads/mediation/admob/AdMobAdapterServerParameters;",
        ">;",
        "Lcom/google/ads/mediation/MediationInterstitialAdapter",
        "<",
        "Lcom/google/ads/mediation/admob/AdMobAdapterExtras;",
        "Lcom/google/ads/mediation/admob/AdMobAdapterServerParameters;",
        ">;"
    }
.end annotation


# instance fields
.field private a:Lcom/google/ads/mediation/MediationBannerListener;

.field private b:Lcom/google/ads/mediation/MediationInterstitialListener;

.field private c:Lcom/google/ads/AdView;

.field private d:Lcom/google/ads/InterstitialAd;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 302
    return-void
.end method

.method private a(Landroid/app/Activity;Lcom/google/ads/mediation/admob/AdMobAdapterServerParameters;Lcom/google/ads/mediation/MediationAdRequest;Lcom/google/ads/mediation/admob/AdMobAdapterExtras;)Lcom/google/ads/AdRequest;
    .locals 3
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 89
    new-instance v0, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;

    invoke-direct {v0, p4}, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;-><init>(Lcom/google/ads/mediation/admob/AdMobAdapterExtras;)V

    .line 91
    const-string v1, "_norefresh"

    const-string v2, "t"

    invoke-virtual {v0, v1, v2}, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->addExtra(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/ads/mediation/admob/AdMobAdapterExtras;

    .line 93
    iget-object v1, p2, Lcom/google/ads/mediation/admob/AdMobAdapterServerParameters;->allowHouseAds:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 94
    const-string v1, "mad_hac"

    iget-object v2, p2, Lcom/google/ads/mediation/admob/AdMobAdapterServerParameters;->allowHouseAds:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->addExtra(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/ads/mediation/admob/AdMobAdapterExtras;

    .line 98
    :cond_0
    new-instance v1, Lcom/google/ads/AdRequest;

    invoke-direct {v1}, Lcom/google/ads/AdRequest;-><init>()V

    invoke-virtual {p3}, Lcom/google/ads/mediation/MediationAdRequest;->getBirthday()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/ads/AdRequest;->setBirthday(Ljava/util/Date;)Lcom/google/ads/AdRequest;

    move-result-object v1

    invoke-virtual {p3}, Lcom/google/ads/mediation/MediationAdRequest;->getGender()Lcom/google/ads/AdRequest$Gender;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/ads/AdRequest;->setGender(Lcom/google/ads/AdRequest$Gender;)Lcom/google/ads/AdRequest;

    move-result-object v1

    invoke-virtual {p3}, Lcom/google/ads/mediation/MediationAdRequest;->getKeywords()Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/ads/AdRequest;->setKeywords(Ljava/util/Set;)Lcom/google/ads/AdRequest;

    move-result-object v1

    invoke-virtual {p3}, Lcom/google/ads/mediation/MediationAdRequest;->getLocation()Landroid/location/Location;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/ads/AdRequest;->setLocation(Landroid/location/Location;)Lcom/google/ads/AdRequest;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/ads/AdRequest;->setNetworkExtras(Lcom/google/ads/mediation/NetworkExtras;)Lcom/google/ads/AdRequest;

    move-result-object v0

    .line 105
    invoke-virtual {p3}, Lcom/google/ads/mediation/MediationAdRequest;->isTesting()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 111
    invoke-static {p1}, Lcom/google/ads/util/AdUtil;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/ads/AdRequest;->addTestDevice(Ljava/lang/String;)Lcom/google/ads/AdRequest;

    .line 114
    :cond_1
    return-object v0
.end method

.method static synthetic a(Lcom/google/ads/mediation/admob/AdMobAdapter;)Lcom/google/ads/mediation/MediationBannerListener;
    .locals 1
    .parameter

    .prologue
    .line 25
    iget-object v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapter;->a:Lcom/google/ads/mediation/MediationBannerListener;

    return-object v0
.end method

.method private a()V
    .locals 2

    .prologue
    .line 61
    invoke-direct {p0}, Lcom/google/ads/mediation/admob/AdMobAdapter;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Adapter has already been destroyed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 64
    :cond_0
    return-void
.end method

.method static synthetic b(Lcom/google/ads/mediation/admob/AdMobAdapter;)Lcom/google/ads/mediation/MediationInterstitialListener;
    .locals 1
    .parameter

    .prologue
    .line 25
    iget-object v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapter;->b:Lcom/google/ads/mediation/MediationInterstitialListener;

    return-object v0
.end method

.method private b()Z
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapter;->c:Lcom/google/ads/AdView;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapter;->d:Lcom/google/ads/InterstitialAd;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected a(Landroid/app/Activity;Lcom/google/ads/AdSize;Ljava/lang/String;)Lcom/google/ads/AdView;
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 124
    new-instance v0, Lcom/google/ads/AdView;

    invoke-direct {v0, p1, p2, p3}, Lcom/google/ads/AdView;-><init>(Landroid/app/Activity;Lcom/google/ads/AdSize;Ljava/lang/String;)V

    return-object v0
.end method

.method protected a(Landroid/app/Activity;Ljava/lang/String;)Lcom/google/ads/InterstitialAd;
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 128
    new-instance v0, Lcom/google/ads/InterstitialAd;

    invoke-direct {v0, p1, p2}, Lcom/google/ads/InterstitialAd;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    return-object v0
.end method

.method public destroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 218
    invoke-direct {p0}, Lcom/google/ads/mediation/admob/AdMobAdapter;->a()V

    .line 221
    iget-object v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapter;->c:Lcom/google/ads/AdView;

    if-eqz v0, :cond_0

    .line 222
    iget-object v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapter;->c:Lcom/google/ads/AdView;

    invoke-virtual {v0}, Lcom/google/ads/AdView;->stopLoading()V

    .line 223
    iget-object v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapter;->c:Lcom/google/ads/AdView;

    invoke-virtual {v0}, Lcom/google/ads/AdView;->destroy()V

    .line 224
    iput-object v1, p0, Lcom/google/ads/mediation/admob/AdMobAdapter;->c:Lcom/google/ads/AdView;

    .line 227
    :cond_0
    iget-object v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapter;->d:Lcom/google/ads/InterstitialAd;

    if-eqz v0, :cond_1

    .line 228
    iget-object v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapter;->d:Lcom/google/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/google/ads/InterstitialAd;->stopLoading()V

    .line 229
    iput-object v1, p0, Lcom/google/ads/mediation/admob/AdMobAdapter;->d:Lcom/google/ads/InterstitialAd;

    .line 231
    :cond_1
    return-void
.end method

.method public getAdditionalParametersType()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<",
            "Lcom/google/ads/mediation/admob/AdMobAdapterExtras;",
            ">;"
        }
    .end annotation

    .prologue
    .line 143
    const-class v0, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;

    return-object v0
.end method

.method public getBannerView()Landroid/view/View;
    .locals 1

    .prologue
    .line 210
    iget-object v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapter;->c:Lcom/google/ads/AdView;

    return-object v0
.end method

.method public getServerParametersType()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<",
            "Lcom/google/ads/mediation/admob/AdMobAdapterServerParameters;",
            ">;"
        }
    .end annotation

    .prologue
    .line 151
    const-class v0, Lcom/google/ads/mediation/admob/AdMobAdapterServerParameters;

    return-object v0
.end method

.method public bridge synthetic requestBannerAd(Lcom/google/ads/mediation/MediationBannerListener;Landroid/app/Activity;Lcom/google/ads/mediation/MediationServerParameters;Lcom/google/ads/AdSize;Lcom/google/ads/mediation/MediationAdRequest;Lcom/google/ads/mediation/NetworkExtras;)V
    .locals 7
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .parameter "x5"

    .prologue
    .line 25
    move-object v3, p3

    check-cast v3, Lcom/google/ads/mediation/admob/AdMobAdapterServerParameters;

    move-object v6, p6

    check-cast v6, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v6}, Lcom/google/ads/mediation/admob/AdMobAdapter;->requestBannerAd(Lcom/google/ads/mediation/MediationBannerListener;Landroid/app/Activity;Lcom/google/ads/mediation/admob/AdMobAdapterServerParameters;Lcom/google/ads/AdSize;Lcom/google/ads/mediation/MediationAdRequest;Lcom/google/ads/mediation/admob/AdMobAdapterExtras;)V

    return-void
.end method

.method public requestBannerAd(Lcom/google/ads/mediation/MediationBannerListener;Landroid/app/Activity;Lcom/google/ads/mediation/admob/AdMobAdapterServerParameters;Lcom/google/ads/AdSize;Lcom/google/ads/mediation/MediationAdRequest;Lcom/google/ads/mediation/admob/AdMobAdapterExtras;)V
    .locals 3
    .parameter "listener"
    .parameter "activity"
    .parameter "serverParameters"
    .parameter "adSize"
    .parameter "mediationAdRequest"
    .parameter "extras"

    .prologue
    .line 165
    iput-object p1, p0, Lcom/google/ads/mediation/admob/AdMobAdapter;->a:Lcom/google/ads/mediation/MediationBannerListener;

    .line 174
    invoke-virtual {p4}, Lcom/google/ads/AdSize;->isAutoHeight()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p4}, Lcom/google/ads/AdSize;->isFullWidth()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 200
    :cond_0
    iget-object v0, p3, Lcom/google/ads/mediation/admob/AdMobAdapterServerParameters;->adUnitId:Ljava/lang/String;

    invoke-virtual {p0, p2, p4, v0}, Lcom/google/ads/mediation/admob/AdMobAdapter;->a(Landroid/app/Activity;Lcom/google/ads/AdSize;Ljava/lang/String;)Lcom/google/ads/AdView;

    move-result-object v0

    iput-object v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapter;->c:Lcom/google/ads/AdView;

    .line 201
    iget-object v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapter;->c:Lcom/google/ads/AdView;

    new-instance v1, Lcom/google/ads/mediation/admob/AdMobAdapter$a;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/google/ads/mediation/admob/AdMobAdapter$a;-><init>(Lcom/google/ads/mediation/admob/AdMobAdapter;Lcom/google/ads/mediation/admob/AdMobAdapter$1;)V

    invoke-virtual {v0, v1}, Lcom/google/ads/AdView;->setAdListener(Lcom/google/ads/AdListener;)V

    .line 202
    iget-object v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapter;->c:Lcom/google/ads/AdView;

    invoke-direct {p0, p2, p3, p5, p6}, Lcom/google/ads/mediation/admob/AdMobAdapter;->a(Landroid/app/Activity;Lcom/google/ads/mediation/admob/AdMobAdapterServerParameters;Lcom/google/ads/mediation/MediationAdRequest;Lcom/google/ads/mediation/admob/AdMobAdapterExtras;)Lcom/google/ads/AdRequest;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/ads/AdView;->loadAd(Lcom/google/ads/AdRequest;)V

    .line 203
    :goto_0
    return-void

    .line 182
    :cond_1
    if-eqz p6, :cond_2

    invoke-virtual {p6}, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->getUseExactAdSize()Z

    move-result v0

    if-nez v0, :cond_0

    .line 185
    :cond_2
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/google/ads/AdSize;

    const/4 v1, 0x0

    sget-object v2, Lcom/google/ads/AdSize;->BANNER:Lcom/google/ads/AdSize;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/google/ads/AdSize;->IAB_BANNER:Lcom/google/ads/AdSize;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/google/ads/AdSize;->IAB_LEADERBOARD:Lcom/google/ads/AdSize;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/google/ads/AdSize;->IAB_MRECT:Lcom/google/ads/AdSize;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/google/ads/AdSize;->IAB_WIDE_SKYSCRAPER:Lcom/google/ads/AdSize;

    aput-object v2, v0, v1

    invoke-virtual {p4, v0}, Lcom/google/ads/AdSize;->findBestSize([Lcom/google/ads/AdSize;)Lcom/google/ads/AdSize;

    move-result-object p4

    .line 193
    if-nez p4, :cond_0

    .line 194
    sget-object v0, Lcom/google/ads/AdRequest$ErrorCode;->NO_FILL:Lcom/google/ads/AdRequest$ErrorCode;

    invoke-interface {p1, p0, v0}, Lcom/google/ads/mediation/MediationBannerListener;->onFailedToReceiveAd(Lcom/google/ads/mediation/MediationBannerAdapter;Lcom/google/ads/AdRequest$ErrorCode;)V

    goto :goto_0
.end method

.method public bridge synthetic requestInterstitialAd(Lcom/google/ads/mediation/MediationInterstitialListener;Landroid/app/Activity;Lcom/google/ads/mediation/MediationServerParameters;Lcom/google/ads/mediation/MediationAdRequest;Lcom/google/ads/mediation/NetworkExtras;)V
    .locals 6
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"

    .prologue
    .line 25
    move-object v3, p3

    check-cast v3, Lcom/google/ads/mediation/admob/AdMobAdapterServerParameters;

    move-object v5, p5

    check-cast v5, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/google/ads/mediation/admob/AdMobAdapter;->requestInterstitialAd(Lcom/google/ads/mediation/MediationInterstitialListener;Landroid/app/Activity;Lcom/google/ads/mediation/admob/AdMobAdapterServerParameters;Lcom/google/ads/mediation/MediationAdRequest;Lcom/google/ads/mediation/admob/AdMobAdapterExtras;)V

    return-void
.end method

.method public requestInterstitialAd(Lcom/google/ads/mediation/MediationInterstitialListener;Landroid/app/Activity;Lcom/google/ads/mediation/admob/AdMobAdapterServerParameters;Lcom/google/ads/mediation/MediationAdRequest;Lcom/google/ads/mediation/admob/AdMobAdapterExtras;)V
    .locals 3
    .parameter "listener"
    .parameter "activity"
    .parameter "serverParameters"
    .parameter "mediationAdRequest"
    .parameter "extras"

    .prologue
    .line 244
    iput-object p1, p0, Lcom/google/ads/mediation/admob/AdMobAdapter;->b:Lcom/google/ads/mediation/MediationInterstitialListener;

    .line 246
    iget-object v0, p3, Lcom/google/ads/mediation/admob/AdMobAdapterServerParameters;->adUnitId:Ljava/lang/String;

    invoke-virtual {p0, p2, v0}, Lcom/google/ads/mediation/admob/AdMobAdapter;->a(Landroid/app/Activity;Ljava/lang/String;)Lcom/google/ads/InterstitialAd;

    move-result-object v0

    iput-object v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapter;->d:Lcom/google/ads/InterstitialAd;

    .line 247
    iget-object v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapter;->d:Lcom/google/ads/InterstitialAd;

    new-instance v1, Lcom/google/ads/mediation/admob/AdMobAdapter$b;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/google/ads/mediation/admob/AdMobAdapter$b;-><init>(Lcom/google/ads/mediation/admob/AdMobAdapter;Lcom/google/ads/mediation/admob/AdMobAdapter$1;)V

    invoke-virtual {v0, v1}, Lcom/google/ads/InterstitialAd;->setAdListener(Lcom/google/ads/AdListener;)V

    .line 248
    iget-object v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapter;->d:Lcom/google/ads/InterstitialAd;

    invoke-direct {p0, p2, p3, p4, p5}, Lcom/google/ads/mediation/admob/AdMobAdapter;->a(Landroid/app/Activity;Lcom/google/ads/mediation/admob/AdMobAdapterServerParameters;Lcom/google/ads/mediation/MediationAdRequest;Lcom/google/ads/mediation/admob/AdMobAdapterExtras;)Lcom/google/ads/AdRequest;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/ads/InterstitialAd;->loadAd(Lcom/google/ads/AdRequest;)V

    .line 249
    return-void
.end method

.method public showInterstitial()V
    .locals 1

    .prologue
    .line 253
    iget-object v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapter;->d:Lcom/google/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/google/ads/InterstitialAd;->show()V

    .line 254
    return-void
.end method

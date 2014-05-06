.class public Lcom/google/ads/InterstitialAd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/ads/Ad;


# instance fields
.field private a:Lcom/google/ads/internal/d;

.field private b:Lcom/google/ads/m;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 1
    .parameter "activity"
    .parameter "adUnitId"

    .prologue
    .line 86
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/ads/InterstitialAd;-><init>(Landroid/app/Activity;Ljava/lang/String;Z)V

    .line 87
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;Z)V
    .locals 2
    .parameter "activity"
    .parameter "adUnitId"
    .parameter "shortTimeout"

    .prologue
    const/4 v0, 0x0

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    invoke-static {p0, p2, p1, v0, v0}, Lcom/google/ads/m;->a(Lcom/google/ads/Ad;Ljava/lang/String;Landroid/app/Activity;Landroid/view/ViewGroup;Lcom/google/ads/AdSize;)Lcom/google/ads/m;

    move-result-object v0

    iput-object v0, p0, Lcom/google/ads/InterstitialAd;->b:Lcom/google/ads/m;

    .line 103
    new-instance v0, Lcom/google/ads/internal/d;

    iget-object v1, p0, Lcom/google/ads/InterstitialAd;->b:Lcom/google/ads/m;

    invoke-direct {v0, v1, p3}, Lcom/google/ads/internal/d;-><init>(Lcom/google/ads/m;Z)V

    iput-object v0, p0, Lcom/google/ads/InterstitialAd;->a:Lcom/google/ads/internal/d;

    .line 105
    return-void
.end method


# virtual methods
.method public isReady()Z
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lcom/google/ads/InterstitialAd;->a:Lcom/google/ads/internal/d;

    invoke-virtual {v0}, Lcom/google/ads/internal/d;->q()Z

    move-result v0

    return v0
.end method

.method public loadAd(Lcom/google/ads/AdRequest;)V
    .locals 1
    .parameter "adRequest"

    .prologue
    .line 126
    iget-object v0, p0, Lcom/google/ads/InterstitialAd;->a:Lcom/google/ads/internal/d;

    invoke-virtual {v0, p1}, Lcom/google/ads/internal/d;->a(Lcom/google/ads/AdRequest;)V

    .line 127
    return-void
.end method

.method public setAdListener(Lcom/google/ads/AdListener;)V
    .locals 1
    .parameter "adListener"

    .prologue
    .line 148
    iget-object v0, p0, Lcom/google/ads/InterstitialAd;->b:Lcom/google/ads/m;

    iget-object v0, v0, Lcom/google/ads/m;->j:Lcom/google/ads/util/i$c;

    invoke-virtual {v0, p1}, Lcom/google/ads/util/i$c;->a(Ljava/lang/Object;)V

    .line 149
    return-void
.end method

.method public show()V
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/google/ads/InterstitialAd;->a:Lcom/google/ads/internal/d;

    invoke-virtual {v0}, Lcom/google/ads/internal/d;->y()V

    .line 137
    return-void
.end method

.method public stopLoading()V
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lcom/google/ads/InterstitialAd;->a:Lcom/google/ads/internal/d;

    invoke-virtual {v0}, Lcom/google/ads/internal/d;->z()V

    .line 159
    return-void
.end method

.class public final Lcom/google/ads/mediation/admob/AdMobAdapterServerParameters;
.super Lcom/google/ads/mediation/MediationServerParameters;
.source "SourceFile"


# instance fields
.field public adUnitId:Ljava/lang/String;
    .annotation runtime Lcom/google/ads/mediation/MediationServerParameters$Parameter;
        name = "pubid"
    .end annotation
.end field

.field public allowHouseAds:Ljava/lang/String;
    .annotation runtime Lcom/google/ads/mediation/MediationServerParameters$Parameter;
        name = "mad_hac"
        required = false
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 10
    invoke-direct {p0}, Lcom/google/ads/mediation/MediationServerParameters;-><init>()V

    .line 20
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapterServerParameters;->allowHouseAds:Ljava/lang/String;

    return-void
.end method

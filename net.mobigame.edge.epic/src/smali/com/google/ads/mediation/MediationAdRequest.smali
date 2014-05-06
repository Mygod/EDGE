.class public Lcom/google/ads/mediation/MediationAdRequest;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Lcom/google/ads/AdRequest;

.field private b:Z

.field private c:Z


# direct methods
.method public constructor <init>(Lcom/google/ads/AdRequest;Landroid/content/Context;Z)V
    .locals 1
    .parameter "request"
    .parameter "context"
    .parameter "shareLocation"

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/google/ads/mediation/MediationAdRequest;->a:Lcom/google/ads/AdRequest;

    .line 40
    iput-boolean p3, p0, Lcom/google/ads/mediation/MediationAdRequest;->c:Z

    .line 42
    if-nez p2, :cond_0

    .line 43
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/ads/mediation/MediationAdRequest;->b:Z

    .line 47
    :goto_0
    return-void

    .line 45
    :cond_0
    invoke-virtual {p1, p2}, Lcom/google/ads/AdRequest;->isTestDevice(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/ads/mediation/MediationAdRequest;->b:Z

    goto :goto_0
.end method


# virtual methods
.method public getAgeInYears()Ljava/lang/Integer;
    .locals 5

    .prologue
    const/4 v4, 0x6

    const/4 v3, 0x1

    .line 68
    iget-object v0, p0, Lcom/google/ads/mediation/MediationAdRequest;->a:Lcom/google/ads/AdRequest;

    invoke-virtual {v0}, Lcom/google/ads/AdRequest;->getBirthday()Ljava/util/Date;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 69
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 70
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    .line 71
    iget-object v0, p0, Lcom/google/ads/mediation/MediationAdRequest;->a:Lcom/google/ads/AdRequest;

    invoke-virtual {v0}, Lcom/google/ads/AdRequest;->getBirthday()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 73
    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I

    move-result v0

    invoke-virtual {v1, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    sub-int/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 74
    invoke-virtual {v2, v4}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v1

    if-ge v2, v1, :cond_0

    .line 76
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 82
    :cond_0
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getBirthday()Ljava/util/Date;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/google/ads/mediation/MediationAdRequest;->a:Lcom/google/ads/AdRequest;

    invoke-virtual {v0}, Lcom/google/ads/AdRequest;->getBirthday()Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getGender()Lcom/google/ads/AdRequest$Gender;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/google/ads/mediation/MediationAdRequest;->a:Lcom/google/ads/AdRequest;

    invoke-virtual {v0}, Lcom/google/ads/AdRequest;->getGender()Lcom/google/ads/AdRequest$Gender;

    move-result-object v0

    return-object v0
.end method

.method public getKeywords()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 89
    iget-object v0, p0, Lcom/google/ads/mediation/MediationAdRequest;->a:Lcom/google/ads/AdRequest;

    invoke-virtual {v0}, Lcom/google/ads/AdRequest;->getKeywords()Ljava/util/Set;

    move-result-object v0

    if-nez v0, :cond_0

    .line 90
    const/4 v0, 0x0

    .line 93
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/ads/mediation/MediationAdRequest;->a:Lcom/google/ads/AdRequest;

    invoke-virtual {v0}, Lcom/google/ads/AdRequest;->getKeywords()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    goto :goto_0
.end method

.method public getLocation()Landroid/location/Location;
    .locals 2

    .prologue
    .line 101
    iget-object v0, p0, Lcom/google/ads/mediation/MediationAdRequest;->a:Lcom/google/ads/AdRequest;

    invoke-virtual {v0}, Lcom/google/ads/AdRequest;->getLocation()Landroid/location/Location;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/google/ads/mediation/MediationAdRequest;->c:Z

    if-nez v0, :cond_1

    .line 102
    :cond_0
    const/4 v0, 0x0

    .line 105
    :goto_0
    return-object v0

    :cond_1
    new-instance v0, Landroid/location/Location;

    iget-object v1, p0, Lcom/google/ads/mediation/MediationAdRequest;->a:Lcom/google/ads/AdRequest;

    invoke-virtual {v1}, Lcom/google/ads/AdRequest;->getLocation()Landroid/location/Location;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/location/Location;-><init>(Landroid/location/Location;)V

    goto :goto_0
.end method

.method public isTesting()Z
    .locals 1

    .prologue
    .line 115
    iget-boolean v0, p0, Lcom/google/ads/mediation/MediationAdRequest;->b:Z

    return v0
.end method

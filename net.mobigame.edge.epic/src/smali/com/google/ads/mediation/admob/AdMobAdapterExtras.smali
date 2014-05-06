.class public Lcom/google/ads/mediation/admob/AdMobAdapterExtras;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/ads/mediation/NetworkExtras;


# instance fields
.field private a:Z

.field private b:Z

.field private c:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-boolean v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->a:Z

    .line 65
    iput-boolean v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->b:Z

    .line 20
    invoke-virtual {p0}, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->clearExtras()Lcom/google/ads/mediation/admob/AdMobAdapterExtras;

    .line 21
    return-void
.end method

.method public constructor <init>(Lcom/google/ads/mediation/admob/AdMobAdapterExtras;)V
    .locals 2
    .parameter "original"

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;-><init>()V

    .line 31
    if-eqz p1, :cond_0

    .line 32
    iget-boolean v0, p1, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->a:Z

    iput-boolean v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->a:Z

    .line 33
    iget-boolean v0, p1, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->b:Z

    iput-boolean v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->b:Z

    .line 34
    iget-object v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->c:Ljava/util/Map;

    iget-object v1, p1, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->c:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 36
    :cond_0
    return-void
.end method


# virtual methods
.method public addExtra(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/ads/mediation/admob/AdMobAdapterExtras;
    .locals 1
    .parameter "key"
    .parameter "value"

    .prologue
    .line 145
    iget-object v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->c:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    return-object p0
.end method

.method public clearExtras()Lcom/google/ads/mediation/admob/AdMobAdapterExtras;
    .locals 1

    .prologue
    .line 130
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->c:Ljava/util/Map;

    .line 131
    return-object p0
.end method

.method public getExtras()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 102
    iget-object v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->c:Ljava/util/Map;

    return-object v0
.end method

.method public getPlusOneOptOut()Z
    .locals 1

    .prologue
    .line 59
    iget-boolean v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->a:Z

    return v0
.end method

.method public getUseExactAdSize()Z
    .locals 1

    .prologue
    .line 89
    iget-boolean v0, p0, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->b:Z

    return v0
.end method

.method public setExtras(Ljava/util/Map;)Lcom/google/ads/mediation/admob/AdMobAdapterExtras;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/google/ads/mediation/admob/AdMobAdapterExtras;"
        }
    .end annotation

    .prologue
    .line 115
    .local p1, extras:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    if-nez p1, :cond_0

    .line 116
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument \'extras\' may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 118
    :cond_0
    iput-object p1, p0, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->c:Ljava/util/Map;

    .line 119
    return-object p0
.end method

.method public setPlusOneOptOut(Z)Lcom/google/ads/mediation/admob/AdMobAdapterExtras;
    .locals 0
    .parameter "plusOneOptOut"

    .prologue
    .line 49
    iput-boolean p1, p0, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->a:Z

    .line 50
    return-object p0
.end method

.method public setUseExactAdSize(Z)Lcom/google/ads/mediation/admob/AdMobAdapterExtras;
    .locals 0
    .parameter "useExactAdSize"

    .prologue
    .line 78
    iput-boolean p1, p0, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->b:Z

    .line 79
    return-object p0
.end method

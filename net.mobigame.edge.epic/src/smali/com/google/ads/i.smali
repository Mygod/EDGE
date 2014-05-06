.class Lcom/google/ads/i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/ads/i$a;
    }
.end annotation


# instance fields
.field private final a:Lcom/google/ads/h;

.field private final b:Ljava/lang/String;

.field private final c:Lcom/google/ads/AdRequest;

.field private final d:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final e:Z

.field private final f:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/ads/h;Landroid/app/Activity;Ljava/lang/String;Lcom/google/ads/AdRequest;Ljava/util/HashMap;)V
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/h;",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Lcom/google/ads/AdRequest;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    iput-object p1, p0, Lcom/google/ads/i;->a:Lcom/google/ads/h;

    .line 97
    iput-object p3, p0, Lcom/google/ads/i;->b:Ljava/lang/String;

    .line 98
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/ads/i;->f:Ljava/lang/ref/WeakReference;

    .line 99
    iput-object p4, p0, Lcom/google/ads/i;->c:Lcom/google/ads/AdRequest;

    .line 102
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p5}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lcom/google/ads/i;->d:Ljava/util/HashMap;

    .line 103
    iget-object v0, p0, Lcom/google/ads/i;->d:Ljava/util/HashMap;

    invoke-static {v0}, Lcom/google/ads/i;->a(Ljava/util/Map;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/ads/i;->e:Z

    .line 104
    return-void
.end method

.method private a(Lcom/google/ads/mediation/MediationAdapter;)V
    .locals 13
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/google/ads/mediation/NetworkExtras;",
            "U:",
            "Lcom/google/ads/mediation/MediationServerParameters;",
            ">(",
            "Lcom/google/ads/mediation/MediationAdapter",
            "<TT;TU;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/ads/mediation/MediationServerParameters$MappingException;,
            Lcom/google/ads/i$a;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 142
    iget-object v0, p0, Lcom/google/ads/i;->f:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    .line 143
    if-nez v2, :cond_0

    .line 144
    new-instance v0, Lcom/google/ads/i$a;

    const-string v1, "Activity became null while trying to instantiate adapter."

    invoke-direct {v0, v1}, Lcom/google/ads/i$a;-><init>(Ljava/lang/String;)V

    throw v0

    .line 147
    :cond_0
    iget-object v0, p0, Lcom/google/ads/i;->a:Lcom/google/ads/h;

    invoke-virtual {v0, p1}, Lcom/google/ads/h;->a(Lcom/google/ads/mediation/MediationAdapter;)V

    .line 152
    invoke-interface {p1}, Lcom/google/ads/mediation/MediationAdapter;->getServerParametersType()Ljava/lang/Class;

    move-result-object v0

    .line 154
    if-eqz v0, :cond_5

    .line 155
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/ads/mediation/MediationServerParameters;

    .line 156
    iget-object v3, p0, Lcom/google/ads/i;->d:Ljava/util/HashMap;

    invoke-virtual {v0, v3}, Lcom/google/ads/mediation/MediationServerParameters;->load(Ljava/util/Map;)V

    move-object v3, v0

    .line 162
    :goto_0
    invoke-interface {p1}, Lcom/google/ads/mediation/MediationAdapter;->getAdditionalParametersType()Ljava/lang/Class;

    move-result-object v0

    .line 164
    if-eqz v0, :cond_4

    .line 165
    iget-object v1, p0, Lcom/google/ads/i;->c:Lcom/google/ads/AdRequest;

    invoke-virtual {v1, v0}, Lcom/google/ads/AdRequest;->getNetworkExtras(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/ads/mediation/NetworkExtras;

    move-object v5, v0

    .line 170
    :goto_1
    new-instance v4, Lcom/google/ads/mediation/MediationAdRequest;

    iget-object v0, p0, Lcom/google/ads/i;->c:Lcom/google/ads/AdRequest;

    iget-boolean v1, p0, Lcom/google/ads/i;->e:Z

    invoke-direct {v4, v0, v2, v1}, Lcom/google/ads/mediation/MediationAdRequest;-><init>(Lcom/google/ads/AdRequest;Landroid/content/Context;Z)V

    .line 174
    iget-object v0, p0, Lcom/google/ads/i;->a:Lcom/google/ads/h;

    iget-object v0, v0, Lcom/google/ads/h;->a:Lcom/google/ads/internal/h;

    invoke-virtual {v0}, Lcom/google/ads/internal/h;->a()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 175
    instance-of v0, p1, Lcom/google/ads/mediation/MediationInterstitialAdapter;

    if-nez v0, :cond_1

    .line 176
    new-instance v0, Lcom/google/ads/i$a;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Adapter "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/ads/i;->b:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " doesn\'t support the MediationInterstitialAdapter"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " interface."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/ads/i$a;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    move-object v0, p1

    .line 180
    check-cast v0, Lcom/google/ads/mediation/MediationInterstitialAdapter;

    .line 182
    new-instance v1, Lcom/google/ads/k;

    iget-object v6, p0, Lcom/google/ads/i;->a:Lcom/google/ads/h;

    invoke-direct {v1, v6}, Lcom/google/ads/k;-><init>(Lcom/google/ads/h;)V

    invoke-interface/range {v0 .. v5}, Lcom/google/ads/mediation/MediationInterstitialAdapter;->requestInterstitialAd(Lcom/google/ads/mediation/MediationInterstitialListener;Landroid/app/Activity;Lcom/google/ads/mediation/MediationServerParameters;Lcom/google/ads/mediation/MediationAdRequest;Lcom/google/ads/mediation/NetworkExtras;)V

    .line 202
    :goto_2
    iget-object v0, p0, Lcom/google/ads/i;->a:Lcom/google/ads/h;

    invoke-virtual {v0}, Lcom/google/ads/h;->j()V

    .line 203
    return-void

    .line 189
    :cond_2
    instance-of v0, p1, Lcom/google/ads/mediation/MediationBannerAdapter;

    if-nez v0, :cond_3

    .line 190
    new-instance v0, Lcom/google/ads/i$a;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Adapter "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/ads/i;->b:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " doesn\'t support the MediationBannerAdapter interface"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/ads/i$a;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    move-object v6, p1

    .line 193
    check-cast v6, Lcom/google/ads/mediation/MediationBannerAdapter;

    .line 195
    new-instance v7, Lcom/google/ads/j;

    iget-object v0, p0, Lcom/google/ads/i;->a:Lcom/google/ads/h;

    invoke-direct {v7, v0}, Lcom/google/ads/j;-><init>(Lcom/google/ads/h;)V

    iget-object v0, p0, Lcom/google/ads/i;->a:Lcom/google/ads/h;

    iget-object v0, v0, Lcom/google/ads/h;->a:Lcom/google/ads/internal/h;

    invoke-virtual {v0}, Lcom/google/ads/internal/h;->b()Lcom/google/ads/AdSize;

    move-result-object v10

    move-object v8, v2

    move-object v9, v3

    move-object v11, v4

    move-object v12, v5

    invoke-interface/range {v6 .. v12}, Lcom/google/ads/mediation/MediationBannerAdapter;->requestBannerAd(Lcom/google/ads/mediation/MediationBannerListener;Landroid/app/Activity;Lcom/google/ads/mediation/MediationServerParameters;Lcom/google/ads/AdSize;Lcom/google/ads/mediation/MediationAdRequest;Lcom/google/ads/mediation/NetworkExtras;)V

    goto :goto_2

    :cond_4
    move-object v5, v1

    goto/16 :goto_1

    :cond_5
    move-object v3, v1

    goto/16 :goto_0
.end method

.method private a(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 132
    invoke-static {p1, p2}, Lcom/google/ads/util/b;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 133
    iget-object v0, p0, Lcom/google/ads/i;->a:Lcom/google/ads/h;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/ads/h;->a(Z)V

    .line 134
    return-void
.end method

.method private static a(Ljava/util/Map;)Z
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 67
    const-string v0, "gwhirl_share_location"

    invoke-interface {p0, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 68
    const-string v1, "1"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 69
    const/4 v0, 0x1

    .line 79
    :goto_0
    return v0

    .line 73
    :cond_0
    if-eqz v0, :cond_1

    const-string v1, "0"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 74
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Received an illegal value, \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\', for the special share location parameter from mediation server"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " (expected \'0\' or \'1\'). Will not share the location."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->b(Ljava/lang/String;)V

    .line 79
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 113
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Trying to instantiate: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/ads/i;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    .line 116
    iget-object v0, p0, Lcom/google/ads/i;->b:Ljava/lang/String;

    const-class v1, Lcom/google/ads/mediation/MediationAdapter;

    invoke-static {v0, v1}, Lcom/google/ads/g;->a(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/ads/mediation/MediationAdapter;

    .line 119
    invoke-direct {p0, v0}, Lcom/google/ads/i;->a(Lcom/google/ads/mediation/MediationAdapter;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 129
    :goto_0
    return-void

    .line 120
    :catch_0
    move-exception v0

    .line 121
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot find adapter class \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/ads/i;->b:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'. Did you link the ad network\'s mediation adapter? Skipping ad network."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/google/ads/i;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 124
    :catch_1
    move-exception v0

    .line 126
    const-string v1, "Error while creating adapter and loading ad from ad network. Skipping ad network."

    invoke-direct {p0, v1, v0}, Lcom/google/ads/i;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

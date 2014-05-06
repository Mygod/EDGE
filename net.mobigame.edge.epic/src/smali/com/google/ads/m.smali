.class public Lcom/google/ads/m;
.super Lcom/google/ads/util/i;
.source "SourceFile"


# instance fields
.field public final a:Lcom/google/ads/util/i$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/ads/util/i$b",
            "<",
            "Lcom/google/ads/l;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Lcom/google/ads/util/i$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/ads/util/i$b",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Lcom/google/ads/util/i$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/ads/util/i$d",
            "<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Lcom/google/ads/util/i$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/ads/util/i$b",
            "<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Lcom/google/ads/util/i$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/ads/util/i$b",
            "<",
            "Landroid/view/ViewGroup;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Lcom/google/ads/util/i$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/ads/util/i$b",
            "<",
            "Lcom/google/ads/Ad;",
            ">;"
        }
    .end annotation
.end field

.field public final g:Lcom/google/ads/util/i$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/ads/util/i$b",
            "<",
            "Lcom/google/ads/AdView;",
            ">;"
        }
    .end annotation
.end field

.field public final h:Lcom/google/ads/util/i$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/ads/util/i$b",
            "<",
            "Lcom/google/ads/InterstitialAd;",
            ">;"
        }
    .end annotation
.end field

.field public final i:Lcom/google/ads/util/i$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/ads/util/i$b",
            "<",
            "Lcom/google/ads/internal/h;",
            ">;"
        }
    .end annotation
.end field

.field public final j:Lcom/google/ads/util/i$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/ads/util/i$c",
            "<",
            "Lcom/google/ads/AdListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/ads/l;Lcom/google/ads/Ad;Lcom/google/ads/AdView;Lcom/google/ads/InterstitialAd;Ljava/lang/String;Landroid/app/Activity;Landroid/content/Context;Landroid/view/ViewGroup;Lcom/google/ads/internal/h;)V
    .locals 2
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 81
    invoke-direct {p0}, Lcom/google/ads/util/i;-><init>()V

    .line 63
    new-instance v0, Lcom/google/ads/util/i$c;

    const-string v1, "adListener"

    invoke-direct {v0, p0, v1}, Lcom/google/ads/util/i$c;-><init>(Lcom/google/ads/util/i;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/ads/m;->j:Lcom/google/ads/util/i$c;

    .line 82
    new-instance v0, Lcom/google/ads/util/i$b;

    const-string v1, "appState"

    invoke-direct {v0, p0, v1, p1}, Lcom/google/ads/util/i$b;-><init>(Lcom/google/ads/util/i;Ljava/lang/String;Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/ads/m;->a:Lcom/google/ads/util/i$b;

    .line 83
    new-instance v0, Lcom/google/ads/util/i$b;

    const-string v1, "ad"

    invoke-direct {v0, p0, v1, p2}, Lcom/google/ads/util/i$b;-><init>(Lcom/google/ads/util/i;Ljava/lang/String;Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/ads/m;->f:Lcom/google/ads/util/i$b;

    .line 84
    new-instance v0, Lcom/google/ads/util/i$b;

    const-string v1, "adView"

    invoke-direct {v0, p0, v1, p3}, Lcom/google/ads/util/i$b;-><init>(Lcom/google/ads/util/i;Ljava/lang/String;Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/ads/m;->g:Lcom/google/ads/util/i$b;

    .line 85
    new-instance v0, Lcom/google/ads/util/i$b;

    const-string v1, "adType"

    invoke-direct {v0, p0, v1, p9}, Lcom/google/ads/util/i$b;-><init>(Lcom/google/ads/util/i;Ljava/lang/String;Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/ads/m;->i:Lcom/google/ads/util/i$b;

    .line 86
    new-instance v0, Lcom/google/ads/util/i$b;

    const-string v1, "adUnitId"

    invoke-direct {v0, p0, v1, p5}, Lcom/google/ads/util/i$b;-><init>(Lcom/google/ads/util/i;Ljava/lang/String;Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/ads/m;->b:Lcom/google/ads/util/i$b;

    .line 87
    new-instance v0, Lcom/google/ads/util/i$d;

    const-string v1, "activity"

    invoke-direct {v0, p0, v1, p6}, Lcom/google/ads/util/i$d;-><init>(Lcom/google/ads/util/i;Ljava/lang/String;Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/ads/m;->c:Lcom/google/ads/util/i$d;

    .line 88
    new-instance v0, Lcom/google/ads/util/i$b;

    const-string v1, "interstitialAd"

    invoke-direct {v0, p0, v1, p4}, Lcom/google/ads/util/i$b;-><init>(Lcom/google/ads/util/i;Ljava/lang/String;Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/ads/m;->h:Lcom/google/ads/util/i$b;

    .line 89
    new-instance v0, Lcom/google/ads/util/i$b;

    const-string v1, "bannerContainer"

    invoke-direct {v0, p0, v1, p8}, Lcom/google/ads/util/i$b;-><init>(Lcom/google/ads/util/i;Ljava/lang/String;Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/ads/m;->e:Lcom/google/ads/util/i$b;

    .line 90
    new-instance v0, Lcom/google/ads/util/i$b;

    const-string v1, "applicationContext"

    invoke-direct {v0, p0, v1, p7}, Lcom/google/ads/util/i$b;-><init>(Lcom/google/ads/util/i;Ljava/lang/String;Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/ads/m;->d:Lcom/google/ads/util/i$b;

    .line 92
    return-void
.end method

.method public static a(Lcom/google/ads/Ad;Ljava/lang/String;Landroid/app/Activity;Landroid/view/ViewGroup;Lcom/google/ads/AdSize;)Lcom/google/ads/m;
    .locals 10
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v4, 0x0

    .line 96
    new-instance v0, Lcom/google/ads/m;

    invoke-static {}, Lcom/google/ads/l;->a()Lcom/google/ads/l;

    move-result-object v1

    instance-of v2, p0, Lcom/google/ads/AdView;

    if-eqz v2, :cond_1

    move-object v2, p0

    check-cast v2, Lcom/google/ads/AdView;

    move-object v3, v2

    :goto_0
    instance-of v2, p0, Lcom/google/ads/InterstitialAd;

    if-eqz v2, :cond_0

    move-object v2, p0

    check-cast v2, Lcom/google/ads/InterstitialAd;

    move-object v4, v2

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    if-nez p4, :cond_2

    sget-object v9, Lcom/google/ads/internal/h;->a:Lcom/google/ads/internal/h;

    :goto_1
    move-object v2, p0

    move-object v6, p2

    move-object v8, p3

    invoke-direct/range {v0 .. v9}, Lcom/google/ads/m;-><init>(Lcom/google/ads/l;Lcom/google/ads/Ad;Lcom/google/ads/AdView;Lcom/google/ads/InterstitialAd;Ljava/lang/String;Landroid/app/Activity;Landroid/content/Context;Landroid/view/ViewGroup;Lcom/google/ads/internal/h;)V

    return-object v0

    :cond_1
    move-object v3, v4

    goto :goto_0

    :cond_2
    invoke-virtual {p2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {p4, v2}, Lcom/google/ads/internal/h;->a(Lcom/google/ads/AdSize;Landroid/content/Context;)Lcom/google/ads/internal/h;

    move-result-object v9

    goto :goto_1
.end method


# virtual methods
.method public a()Z
    .locals 1

    .prologue
    .line 69
    invoke-virtual {p0}, Lcom/google/ads/m;->b()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public b()Z
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/google/ads/m;->i:Lcom/google/ads/util/i$b;

    invoke-virtual {v0}, Lcom/google/ads/util/i$b;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/ads/internal/h;

    invoke-virtual {v0}, Lcom/google/ads/internal/h;->a()Z

    move-result v0

    return v0
.end method

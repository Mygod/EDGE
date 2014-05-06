.class public Lcom/google/ads/v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/ads/n;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private a(Ljava/util/HashMap;Ljava/lang/String;Lcom/google/ads/util/i$c;)V
    .locals 2
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/google/ads/util/i$c",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 48
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 49
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 50
    invoke-virtual {p3, v0}, Lcom/google/ads/util/i$c;->a(Ljava/lang/Object;)V

    .line 52
    :cond_0
    return-void
.end method

.method private b(Ljava/util/HashMap;Ljava/lang/String;Lcom/google/ads/util/i$c;)V
    .locals 2
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/google/ads/util/i$c",
            "<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 58
    :try_start_0
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 59
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 60
    new-instance v1, Ljava/lang/Long;

    invoke-direct {v1, v0}, Ljava/lang/Long;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, v1}, Lcom/google/ads/util/i$c;->a(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    :cond_0
    :goto_0
    return-void

    .line 62
    :catch_0
    move-exception v0

    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Could not parse \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\" constant."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public a(Lcom/google/ads/internal/d;Ljava/util/HashMap;Landroid/webkit/WebView;)V
    .locals 3
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/internal/d;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Landroid/webkit/WebView;",
            ")V"
        }
    .end annotation

    .prologue
    .line 29
    invoke-virtual {p1}, Lcom/google/ads/internal/d;->g()Lcom/google/ads/m;

    move-result-object v0

    iget-object v0, v0, Lcom/google/ads/m;->a:Lcom/google/ads/util/i$b;

    invoke-virtual {v0}, Lcom/google/ads/util/i$b;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/ads/l;

    iget-object v0, v0, Lcom/google/ads/l;->a:Lcom/google/ads/util/i$b;

    invoke-virtual {v0}, Lcom/google/ads/util/i$b;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/ads/l$a;

    .line 32
    const-string v1, "mraid_banner_path"

    iget-object v2, v0, Lcom/google/ads/l$a;->a:Lcom/google/ads/util/i$c;

    invoke-direct {p0, p2, v1, v2}, Lcom/google/ads/v;->a(Ljava/util/HashMap;Ljava/lang/String;Lcom/google/ads/util/i$c;)V

    .line 33
    const-string v1, "mraid_expanded_banner_path"

    iget-object v2, v0, Lcom/google/ads/l$a;->b:Lcom/google/ads/util/i$c;

    invoke-direct {p0, p2, v1, v2}, Lcom/google/ads/v;->a(Ljava/util/HashMap;Ljava/lang/String;Lcom/google/ads/util/i$c;)V

    .line 34
    const-string v1, "mraid_interstitial_path"

    iget-object v2, v0, Lcom/google/ads/l$a;->c:Lcom/google/ads/util/i$c;

    invoke-direct {p0, p2, v1, v2}, Lcom/google/ads/v;->a(Ljava/util/HashMap;Ljava/lang/String;Lcom/google/ads/util/i$c;)V

    .line 35
    const-string v1, "ac_padding"

    iget-object v2, v0, Lcom/google/ads/l$a;->d:Lcom/google/ads/util/i$c;

    invoke-direct {p0, p2, v1, v2}, Lcom/google/ads/v;->b(Ljava/util/HashMap;Ljava/lang/String;Lcom/google/ads/util/i$c;)V

    .line 36
    const-string v1, "ac_total_quota"

    iget-object v2, v0, Lcom/google/ads/l$a;->e:Lcom/google/ads/util/i$c;

    invoke-direct {p0, p2, v1, v2}, Lcom/google/ads/v;->b(Ljava/util/HashMap;Ljava/lang/String;Lcom/google/ads/util/i$c;)V

    .line 37
    const-string v1, "db_total_quota"

    iget-object v2, v0, Lcom/google/ads/l$a;->f:Lcom/google/ads/util/i$c;

    invoke-direct {p0, p2, v1, v2}, Lcom/google/ads/v;->b(Ljava/util/HashMap;Ljava/lang/String;Lcom/google/ads/util/i$c;)V

    .line 38
    const-string v1, "db_quota_per_origin"

    iget-object v2, v0, Lcom/google/ads/l$a;->g:Lcom/google/ads/util/i$c;

    invoke-direct {p0, p2, v1, v2}, Lcom/google/ads/v;->b(Ljava/util/HashMap;Ljava/lang/String;Lcom/google/ads/util/i$c;)V

    .line 39
    const-string v1, "db_quota_step_size"

    iget-object v2, v0, Lcom/google/ads/l$a;->h:Lcom/google/ads/util/i$c;

    invoke-direct {p0, p2, v1, v2}, Lcom/google/ads/v;->b(Ljava/util/HashMap;Ljava/lang/String;Lcom/google/ads/util/i$c;)V

    .line 42
    iget-object v0, v0, Lcom/google/ads/l$a;->i:Lcom/google/ads/util/i$c;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/ads/util/i$c;->a(Ljava/lang/Object;)V

    .line 43
    return-void
.end method

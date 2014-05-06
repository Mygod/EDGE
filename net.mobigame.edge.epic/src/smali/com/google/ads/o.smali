.class public Lcom/google/ads/o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/ads/n;


# static fields
.field private static final a:Lcom/google/ads/internal/a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lcom/google/ads/internal/a;->a:Lcom/google/ads/util/f;

    invoke-interface {v0}, Lcom/google/ads/util/f;->b()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/ads/internal/a;

    sput-object v0, Lcom/google/ads/o;->a:Lcom/google/ads/internal/a;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/google/ads/internal/d;Ljava/util/HashMap;Landroid/webkit/WebView;)V
    .locals 12
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
    const/4 v11, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 37
    const-string v0, "urls"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 38
    if-nez v0, :cond_0

    .line 39
    const-string v0, "Could not get the urls param from canOpenURLs gmsg."

    invoke-static {v0}, Lcom/google/ads/util/b;->e(Ljava/lang/String;)V

    .line 65
    :goto_0
    return-void

    .line 42
    :cond_0
    const-string v3, ","

    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 45
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 46
    invoke-virtual {p3}, Landroid/webkit/WebView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    .line 47
    array-length v7, v4

    move v3, v2

    :goto_1
    if-ge v3, v7, :cond_3

    aget-object v8, v4, v3

    .line 49
    const-string v0, ";"

    invoke-virtual {v8, v0, v11}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    .line 50
    aget-object v9, v0, v2

    .line 51
    array-length v10, v0

    if-lt v10, v11, :cond_1

    aget-object v0, v0, v1

    .line 55
    :goto_2
    invoke-static {v9}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    .line 56
    new-instance v10, Landroid/content/Intent;

    invoke-direct {v10, v0, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 57
    const/high16 v0, 0x1

    invoke-virtual {v6, v10, v0}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    .line 59
    if-eqz v0, :cond_2

    move v0, v1

    .line 60
    :goto_3
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v5, v8, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_1

    .line 51
    :cond_1
    const-string v0, "android.intent.action.VIEW"

    goto :goto_2

    :cond_2
    move v0, v2

    .line 59
    goto :goto_3

    .line 64
    :cond_3
    sget-object v0, Lcom/google/ads/o;->a:Lcom/google/ads/internal/a;

    invoke-virtual {v0, p3, v5}, Lcom/google/ads/internal/a;->a(Landroid/webkit/WebView;Ljava/util/Map;)V

    goto :goto_0
.end method

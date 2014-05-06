.class public final Lcom/google/ads/ae;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/ads/ae$c;,
        Lcom/google/ads/ae$b;,
        Lcom/google/ads/ae$a;
    }
.end annotation


# static fields
.field private static final a:Lcom/google/ads/internal/a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lcom/google/ads/internal/a;->a:Lcom/google/ads/util/f;

    invoke-interface {v0}, Lcom/google/ads/util/f;->b()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/ads/internal/a;

    sput-object v0, Lcom/google/ads/ae;->a:Lcom/google/ads/internal/a;

    return-void
.end method

.method public static a(Landroid/app/Activity;)V
    .locals 2
    .parameter

    .prologue
    .line 308
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/google/ads/ae$a;

    invoke-direct {v1, p0}, Lcom/google/ads/ae$a;-><init>(Landroid/app/Activity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 309
    return-void
.end method

.method public static a(Landroid/app/Activity;Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2
    .parameter
    .parameter
    .parameter

    .prologue
    .line 262
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/google/ads/ae$b;

    invoke-direct {v1, p0, p1, p2}, Lcom/google/ads/ae$b;-><init>(Landroid/app/Activity;Landroid/webkit/WebView;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 263
    return-void
.end method

.method public static a(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 4
    .parameter
    .parameter

    .prologue
    .line 245
    sget-object v0, Lcom/google/ads/ae;->a:Lcom/google/ads/internal/a;

    const-string v1, "(G_resizeIframe(%s))"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Lcom/google/ads/internal/a;->a(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 246
    return-void
.end method

.method public static a(Landroid/webkit/WebView;Z)V
    .locals 5
    .parameter
    .parameter

    .prologue
    .line 223
    sget-object v0, Lcom/google/ads/ae;->a:Lcom/google/ads/internal/a;

    const-string v1, "(G_updatePlusOne(%b))"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Lcom/google/ads/internal/a;->a(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 225
    return-void
.end method

.method public static a(Landroid/content/Context;J)Z
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 281
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 283
    invoke-static {p0, p1, p2, v0}, Lcom/google/ads/ae;->a(Landroid/content/Context;JLandroid/content/SharedPreferences;)Z

    move-result v0

    return v0
.end method

.method static a(Landroid/content/Context;JLandroid/content/SharedPreferences;)Z
    .locals 4
    .parameter
    .parameter
    .parameter

    .prologue
    .line 290
    invoke-static {p0}, Lcom/google/ads/af;->a(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "drt"

    invoke-interface {p3, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "drt_ts"

    invoke-interface {p3, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "drt_ts"

    const-wide/16 v1, 0x0

    invoke-interface {p3, v0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    sub-long/2addr v2, p1

    cmp-long v0, v0, v2

    if-gez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

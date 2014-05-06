.class public Lcom/google/ads/util/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/ads/util/a$a;
    }
.end annotation


# static fields
.field private static a:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 33
    const-string v0, "GoogleAdsAssertion"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Lcom/google/ads/util/a;->a:Z

    return-void
.end method

.method public static a(Ljava/lang/Object;)V
    .locals 2
    .parameter

    .prologue
    .line 53
    if-nez p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    const-string v1, "Assertion that an object is null failed."

    invoke-static {v0, v1}, Lcom/google/ads/util/a;->c(ZLjava/lang/String;)V

    .line 55
    return-void

    .line 53
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static a(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 71
    if-ne p0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Assertion that \'a\' and \'b\' refer to the same object failed.a: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", b: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/ads/util/a;->c(ZLjava/lang/String;)V

    .line 74
    return-void

    .line 71
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static a(Ljava/lang/String;)V
    .locals 3
    .parameter

    .prologue
    .line 91
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Expected a non empty string, got: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/ads/util/a;->c(ZLjava/lang/String;)V

    .line 93
    return-void

    .line 91
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static a(Z)V
    .locals 1
    .parameter

    .prologue
    .line 37
    const-string v0, "Assertion failed."

    invoke-static {p0, v0}, Lcom/google/ads/util/a;->c(ZLjava/lang/String;)V

    .line 38
    return-void
.end method

.method public static a(ZLjava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 41
    invoke-static {p0, p1}, Lcom/google/ads/util/a;->c(ZLjava/lang/String;)V

    .line 42
    return-void
.end method

.method public static b(Ljava/lang/Object;)V
    .locals 2
    .parameter

    .prologue
    .line 62
    if-eqz p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    const-string v1, "Assertion that an object is not null failed."

    invoke-static {v0, v1}, Lcom/google/ads/util/a;->c(ZLjava/lang/String;)V

    .line 64
    return-void

    .line 62
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static b(Z)V
    .locals 2
    .parameter

    .prologue
    .line 45
    if-nez p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    const-string v1, "Assertion failed."

    invoke-static {v0, v1}, Lcom/google/ads/util/a;->c(ZLjava/lang/String;)V

    .line 46
    return-void

    .line 45
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static b(ZLjava/lang/String;)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 49
    if-nez p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0, p1}, Lcom/google/ads/util/a;->c(ZLjava/lang/String;)V

    .line 50
    return-void

    .line 49
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static c(ZLjava/lang/String;)V
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 107
    const-string v0, "GoogleAdsAssertion"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/google/ads/util/a;->a:Z

    if-nez v0, :cond_1

    .line 116
    :cond_0
    return-void

    .line 111
    :cond_1
    if-nez p0, :cond_0

    .line 112
    new-instance v0, Lcom/google/ads/util/a$a;

    invoke-direct {v0, p1}, Lcom/google/ads/util/a$a;-><init>(Ljava/lang/String;)V

    .line 113
    const-string v1, "GoogleAdsAssertion"

    invoke-static {v1, p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 114
    throw v0
.end method

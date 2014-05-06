.class final Lcom/google/ads/internal/a$3;
.super Ljava/util/HashMap;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/ads/internal/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap",
        "<",
        "Ljava/lang/String;",
        "Lcom/google/ads/n;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    .line 83
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 84
    const-string v0, "/invalidRequest"

    new-instance v1, Lcom/google/ads/t;

    invoke-direct {v1}, Lcom/google/ads/t;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/google/ads/internal/a$3;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    const-string v0, "/loadAdURL"

    new-instance v1, Lcom/google/ads/u;

    invoke-direct {v1}, Lcom/google/ads/u;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/google/ads/internal/a$3;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    const-string v0, "/loadSdkConstants"

    new-instance v1, Lcom/google/ads/v;

    invoke-direct {v1}, Lcom/google/ads/v;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/google/ads/internal/a$3;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    return-void
.end method

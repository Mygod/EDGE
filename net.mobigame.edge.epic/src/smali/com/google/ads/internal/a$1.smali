.class final Lcom/google/ads/internal/a$1;
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
    .line 93
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 95
    const-string v0, "/open"

    new-instance v1, Lcom/google/ads/x;

    invoke-direct {v1}, Lcom/google/ads/x;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/google/ads/internal/a$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    const-string v0, "/canOpenURLs"

    new-instance v1, Lcom/google/ads/o;

    invoke-direct {v1}, Lcom/google/ads/o;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/google/ads/internal/a$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    const-string v0, "/close"

    new-instance v1, Lcom/google/ads/q;

    invoke-direct {v1}, Lcom/google/ads/q;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/google/ads/internal/a$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    const-string v0, "/evalInOpener"

    new-instance v1, Lcom/google/ads/r;

    invoke-direct {v1}, Lcom/google/ads/r;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/google/ads/internal/a$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    const-string v0, "/log"

    new-instance v1, Lcom/google/ads/w;

    invoke-direct {v1}, Lcom/google/ads/w;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/google/ads/internal/a$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    const-string v0, "/click"

    new-instance v1, Lcom/google/ads/p;

    invoke-direct {v1}, Lcom/google/ads/p;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/google/ads/internal/a$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    const-string v0, "/httpTrack"

    new-instance v1, Lcom/google/ads/s;

    invoke-direct {v1}, Lcom/google/ads/s;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/google/ads/internal/a$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    const-string v0, "/touch"

    new-instance v1, Lcom/google/ads/y;

    invoke-direct {v1}, Lcom/google/ads/y;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/google/ads/internal/a$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    const-string v0, "/video"

    new-instance v1, Lcom/google/ads/z;

    invoke-direct {v1}, Lcom/google/ads/z;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/google/ads/internal/a$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    const-string v0, "/plusOne"

    new-instance v1, Lcom/google/ads/ag;

    invoke-direct {v1}, Lcom/google/ads/ag;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/google/ads/internal/a$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    return-void
.end method

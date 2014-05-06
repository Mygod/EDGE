.class public Lcom/google/ads/l;
.super Lcom/google/ads/util/i;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/ads/l$a;
    }
.end annotation


# static fields
.field private static final b:Lcom/google/ads/l;


# instance fields
.field public final a:Lcom/google/ads/util/i$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/ads/util/i$b",
            "<",
            "Lcom/google/ads/l$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 62
    new-instance v0, Lcom/google/ads/l;

    invoke-direct {v0}, Lcom/google/ads/l;-><init>()V

    sput-object v0, Lcom/google/ads/l;->b:Lcom/google/ads/l;

    return-void
.end method

.method private constructor <init>()V
    .locals 3

    .prologue
    .line 74
    invoke-direct {p0}, Lcom/google/ads/util/i;-><init>()V

    .line 68
    new-instance v0, Lcom/google/ads/util/i$b;

    const-string v1, "constants"

    new-instance v2, Lcom/google/ads/l$a;

    invoke-direct {v2}, Lcom/google/ads/l$a;-><init>()V

    invoke-direct {v0, p0, v1, v2}, Lcom/google/ads/util/i$b;-><init>(Lcom/google/ads/util/i;Ljava/lang/String;Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/ads/l;->a:Lcom/google/ads/util/i$b;

    .line 76
    return-void
.end method

.method public static a()Lcom/google/ads/l;
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lcom/google/ads/l;->b:Lcom/google/ads/l;

    return-object v0
.end method

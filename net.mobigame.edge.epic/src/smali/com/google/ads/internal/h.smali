.class public Lcom/google/ads/internal/h;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lcom/google/ads/internal/h;


# instance fields
.field private final b:Lcom/google/ads/AdSize;

.field private final c:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 24
    new-instance v0, Lcom/google/ads/internal/h;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/google/ads/internal/h;-><init>(Lcom/google/ads/AdSize;Z)V

    sput-object v0, Lcom/google/ads/internal/h;->a:Lcom/google/ads/internal/h;

    return-void
.end method

.method private constructor <init>(Lcom/google/ads/AdSize;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/google/ads/internal/h;->b:Lcom/google/ads/AdSize;

    .line 28
    iput-boolean p2, p0, Lcom/google/ads/internal/h;->c:Z

    .line 29
    return-void
.end method

.method public static a(Lcom/google/ads/AdSize;)Lcom/google/ads/internal/h;
    .locals 1
    .parameter

    .prologue
    .line 54
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/google/ads/internal/h;->a(Lcom/google/ads/AdSize;Landroid/content/Context;)Lcom/google/ads/internal/h;

    move-result-object v0

    return-object v0
.end method

.method public static a(Lcom/google/ads/AdSize;Landroid/content/Context;)Lcom/google/ads/internal/h;
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 41
    new-instance v0, Lcom/google/ads/internal/h;

    invoke-static {p0, p1}, Lcom/google/ads/AdSize;->createAdSize(Lcom/google/ads/AdSize;Landroid/content/Context;)Lcom/google/ads/AdSize;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/ads/internal/h;-><init>(Lcom/google/ads/AdSize;Z)V

    return-object v0
.end method


# virtual methods
.method public a()Z
    .locals 1

    .prologue
    .line 58
    iget-boolean v0, p0, Lcom/google/ads/internal/h;->c:Z

    return v0
.end method

.method public b()Lcom/google/ads/AdSize;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/google/ads/internal/h;->b:Lcom/google/ads/AdSize;

    return-object v0
.end method

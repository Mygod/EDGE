.class Lcom/google/ads/util/d;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static final d:Lcom/google/ads/util/d;

.field static final e:Lcom/google/ads/util/d;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 31
    new-instance v0, Lcom/google/ads/util/d;

    invoke-direct {v0}, Lcom/google/ads/util/d;-><init>()V

    sput-object v0, Lcom/google/ads/util/d;->d:Lcom/google/ads/util/d;

    .line 36
    new-instance v0, Lcom/google/ads/util/d;

    const-string v1, "unknown"

    const-string v2, "generic"

    const-string v3, "generic"

    invoke-direct {v0, v1, v2, v3}, Lcom/google/ads/util/d;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/google/ads/util/d;->e:Lcom/google/ads/util/d;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    sget-object v0, Landroid/os/Build;->BOARD:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/ads/util/d;->a:Ljava/lang/String;

    .line 44
    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/ads/util/d;->b:Ljava/lang/String;

    .line 45
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/ads/util/d;->c:Ljava/lang/String;

    .line 46
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lcom/google/ads/util/d;->a:Ljava/lang/String;

    .line 53
    iput-object p2, p0, Lcom/google/ads/util/d;->b:Ljava/lang/String;

    .line 54
    iput-object p3, p0, Lcom/google/ads/util/d;->c:Ljava/lang/String;

    .line 55
    return-void
.end method

.method private static a(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 76
    if-eqz p0, :cond_0

    .line 77
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 79
    :goto_0
    return v0

    :cond_0
    if-ne p0, p1, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .parameter "o"

    .prologue
    const/4 v0, 0x0

    .line 62
    instance-of v1, p1, Lcom/google/ads/util/d;

    if-nez v1, :cond_1

    .line 66
    .end local p1
    :cond_0
    :goto_0
    return v0

    .line 65
    .restart local p1
    :cond_1
    check-cast p1, Lcom/google/ads/util/d;

    .line 66
    .end local p1
    iget-object v1, p0, Lcom/google/ads/util/d;->a:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/ads/util/d;->a:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/ads/util/d;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/ads/util/d;->b:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/ads/util/d;->b:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/ads/util/d;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/ads/util/d;->c:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/ads/util/d;->c:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/ads/util/d;->a(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 88
    const/4 v0, 0x0

    .line 89
    iget-object v1, p0, Lcom/google/ads/util/d;->a:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 90
    iget-object v1, p0, Lcom/google/ads/util/d;->a:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 92
    :cond_0
    iget-object v1, p0, Lcom/google/ads/util/d;->b:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 93
    iget-object v1, p0, Lcom/google/ads/util/d;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 95
    :cond_1
    iget-object v1, p0, Lcom/google/ads/util/d;->c:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 96
    iget-object v1, p0, Lcom/google/ads/util/d;->c:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 98
    :cond_2
    return v0
.end method

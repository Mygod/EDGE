.class public final enum Lcom/google/ads/util/b$a;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/ads/util/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/google/ads/util/b$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum a:Lcom/google/ads/util/b$a;

.field public static final enum b:Lcom/google/ads/util/b$a;

.field public static final enum c:Lcom/google/ads/util/b$a;

.field public static final enum d:Lcom/google/ads/util/b$a;

.field public static final enum e:Lcom/google/ads/util/b$a;

.field private static final synthetic g:[Lcom/google/ads/util/b$a;


# instance fields
.field public final f:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    const/4 v5, 0x4

    const/4 v4, 0x3

    const/4 v3, 0x2

    .line 41
    new-instance v0, Lcom/google/ads/util/b$a;

    const-string v1, "VERBOSE"

    invoke-direct {v0, v1, v6, v3}, Lcom/google/ads/util/b$a;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/ads/util/b$a;->a:Lcom/google/ads/util/b$a;

    .line 42
    new-instance v0, Lcom/google/ads/util/b$a;

    const-string v1, "DEBUG"

    invoke-direct {v0, v1, v7, v4}, Lcom/google/ads/util/b$a;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/ads/util/b$a;->b:Lcom/google/ads/util/b$a;

    .line 43
    new-instance v0, Lcom/google/ads/util/b$a;

    const-string v1, "INFO"

    invoke-direct {v0, v1, v3, v5}, Lcom/google/ads/util/b$a;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/ads/util/b$a;->c:Lcom/google/ads/util/b$a;

    .line 44
    new-instance v0, Lcom/google/ads/util/b$a;

    const-string v1, "WARN"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v4, v2}, Lcom/google/ads/util/b$a;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/ads/util/b$a;->d:Lcom/google/ads/util/b$a;

    .line 45
    new-instance v0, Lcom/google/ads/util/b$a;

    const-string v1, "ERROR"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v5, v2}, Lcom/google/ads/util/b$a;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/ads/util/b$a;->e:Lcom/google/ads/util/b$a;

    .line 39
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/google/ads/util/b$a;

    sget-object v1, Lcom/google/ads/util/b$a;->a:Lcom/google/ads/util/b$a;

    aput-object v1, v0, v6

    sget-object v1, Lcom/google/ads/util/b$a;->b:Lcom/google/ads/util/b$a;

    aput-object v1, v0, v7

    sget-object v1, Lcom/google/ads/util/b$a;->c:Lcom/google/ads/util/b$a;

    aput-object v1, v0, v3

    sget-object v1, Lcom/google/ads/util/b$a;->d:Lcom/google/ads/util/b$a;

    aput-object v1, v0, v4

    sget-object v1, Lcom/google/ads/util/b$a;->e:Lcom/google/ads/util/b$a;

    aput-object v1, v0, v5

    sput-object v0, Lcom/google/ads/util/b$a;->g:[Lcom/google/ads/util/b$a;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 49
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 50
    iput p3, p0, Lcom/google/ads/util/b$a;->f:I

    .line 51
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/ads/util/b$a;
    .locals 1
    .parameter "name"

    .prologue
    .line 39
    const-class v0, Lcom/google/ads/util/b$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/google/ads/util/b$a;

    return-object v0
.end method

.method public static values()[Lcom/google/ads/util/b$a;
    .locals 1

    .prologue
    .line 39
    sget-object v0, Lcom/google/ads/util/b$a;->g:[Lcom/google/ads/util/b$a;

    invoke-virtual {v0}, [Lcom/google/ads/util/b$a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/ads/util/b$a;

    return-object v0
.end method

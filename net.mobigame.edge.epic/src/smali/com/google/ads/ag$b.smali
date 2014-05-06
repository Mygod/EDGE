.class public final enum Lcom/google/ads/ag$b;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/ads/ag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/google/ads/ag$b;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum a:Lcom/google/ads/ag$b;

.field public static final enum b:Lcom/google/ads/ag$b;

.field private static final synthetic d:[Lcom/google/ads/ag$b;


# instance fields
.field public c:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 35
    new-instance v0, Lcom/google/ads/ag$b;

    const-string v1, "AD"

    const-string v2, "ad"

    invoke-direct {v0, v1, v3, v2}, Lcom/google/ads/ag$b;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/google/ads/ag$b;->a:Lcom/google/ads/ag$b;

    .line 38
    new-instance v0, Lcom/google/ads/ag$b;

    const-string v1, "APP"

    const-string v2, "app"

    invoke-direct {v0, v1, v4, v2}, Lcom/google/ads/ag$b;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/google/ads/ag$b;->b:Lcom/google/ads/ag$b;

    .line 33
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/google/ads/ag$b;

    sget-object v1, Lcom/google/ads/ag$b;->a:Lcom/google/ads/ag$b;

    aput-object v1, v0, v3

    sget-object v1, Lcom/google/ads/ag$b;->b:Lcom/google/ads/ag$b;

    aput-object v1, v0, v4

    sput-object v0, Lcom/google/ads/ag$b;->d:[Lcom/google/ads/ag$b;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 48
    iput-object p3, p0, Lcom/google/ads/ag$b;->c:Ljava/lang/String;

    .line 49
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/ads/ag$b;
    .locals 1
    .parameter "name"

    .prologue
    .line 33
    const-class v0, Lcom/google/ads/ag$b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/google/ads/ag$b;

    return-object v0
.end method

.method public static values()[Lcom/google/ads/ag$b;
    .locals 1

    .prologue
    .line 33
    sget-object v0, Lcom/google/ads/ag$b;->d:[Lcom/google/ads/ag$b;

    invoke-virtual {v0}, [Lcom/google/ads/ag$b;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/ads/ag$b;

    return-object v0
.end method

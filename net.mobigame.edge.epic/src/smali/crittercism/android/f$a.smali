.class public final enum Lcrittercism/android/f$a;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcrittercism/android/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation


# static fields
.field public static final enum a:Lcrittercism/android/f$a;

.field public static final enum b:Lcrittercism/android/f$a;

.field public static final enum c:Lcrittercism/android/f$a;

.field public static final enum d:Lcrittercism/android/f$a;

.field public static final enum e:Lcrittercism/android/f$a;

.field private static final synthetic f:[Lcrittercism/android/f$a;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcrittercism/android/f$a;

    const-string v1, "NO_INTERNET"

    invoke-direct {v0, v1, v2}, Lcrittercism/android/f$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcrittercism/android/f$a;->a:Lcrittercism/android/f$a;

    new-instance v0, Lcrittercism/android/f$a;

    const-string v1, "CONN_TIMEOUT"

    invoke-direct {v0, v1, v3}, Lcrittercism/android/f$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcrittercism/android/f$a;->b:Lcrittercism/android/f$a;

    new-instance v0, Lcrittercism/android/f$a;

    const-string v1, "UNKNOWN_HOST"

    invoke-direct {v0, v1, v4}, Lcrittercism/android/f$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcrittercism/android/f$a;->c:Lcrittercism/android/f$a;

    new-instance v0, Lcrittercism/android/f$a;

    const-string v1, "WTF"

    invoke-direct {v0, v1, v5}, Lcrittercism/android/f$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcrittercism/android/f$a;->d:Lcrittercism/android/f$a;

    new-instance v0, Lcrittercism/android/f$a;

    const-string v1, "FILE_NOT_FOUND"

    invoke-direct {v0, v1, v6}, Lcrittercism/android/f$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcrittercism/android/f$a;->e:Lcrittercism/android/f$a;

    const/4 v0, 0x5

    new-array v0, v0, [Lcrittercism/android/f$a;

    sget-object v1, Lcrittercism/android/f$a;->a:Lcrittercism/android/f$a;

    aput-object v1, v0, v2

    sget-object v1, Lcrittercism/android/f$a;->b:Lcrittercism/android/f$a;

    aput-object v1, v0, v3

    sget-object v1, Lcrittercism/android/f$a;->c:Lcrittercism/android/f$a;

    aput-object v1, v0, v4

    sget-object v1, Lcrittercism/android/f$a;->d:Lcrittercism/android/f$a;

    aput-object v1, v0, v5

    sget-object v1, Lcrittercism/android/f$a;->e:Lcrittercism/android/f$a;

    aput-object v1, v0, v6

    sput-object v0, Lcrittercism/android/f$a;->f:[Lcrittercism/android/f$a;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcrittercism/android/f$a;
    .locals 1

    const-class v0, Lcrittercism/android/f$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcrittercism/android/f$a;

    return-object v0
.end method

.method public static values()[Lcrittercism/android/f$a;
    .locals 1

    sget-object v0, Lcrittercism/android/f$a;->f:[Lcrittercism/android/f$a;

    invoke-virtual {v0}, [Lcrittercism/android/f$a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcrittercism/android/f$a;

    return-object v0
.end method

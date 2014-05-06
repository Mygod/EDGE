.class public final enum Lcom/android/vending/licensing/Policy$LicenseResponse;
.super Ljava/lang/Enum;
.source "Policy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/vending/licensing/Policy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LicenseResponse"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/android/vending/licensing/Policy$LicenseResponse;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/vending/licensing/Policy$LicenseResponse;

.field public static final enum LICENSED:Lcom/android/vending/licensing/Policy$LicenseResponse;

.field public static final enum NOT_LICENSED:Lcom/android/vending/licensing/Policy$LicenseResponse;

.field public static final enum RETRY:Lcom/android/vending/licensing/Policy$LicenseResponse;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 32
    new-instance v0, Lcom/android/vending/licensing/Policy$LicenseResponse;

    const-string v1, "LICENSED"

    invoke-direct {v0, v1, v2}, Lcom/android/vending/licensing/Policy$LicenseResponse;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/vending/licensing/Policy$LicenseResponse;->LICENSED:Lcom/android/vending/licensing/Policy$LicenseResponse;

    .line 36
    new-instance v0, Lcom/android/vending/licensing/Policy$LicenseResponse;

    const-string v1, "NOT_LICENSED"

    invoke-direct {v0, v1, v3}, Lcom/android/vending/licensing/Policy$LicenseResponse;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/vending/licensing/Policy$LicenseResponse;->NOT_LICENSED:Lcom/android/vending/licensing/Policy$LicenseResponse;

    .line 41
    new-instance v0, Lcom/android/vending/licensing/Policy$LicenseResponse;

    const-string v1, "RETRY"

    invoke-direct {v0, v1, v4}, Lcom/android/vending/licensing/Policy$LicenseResponse;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/vending/licensing/Policy$LicenseResponse;->RETRY:Lcom/android/vending/licensing/Policy$LicenseResponse;

    .line 28
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/android/vending/licensing/Policy$LicenseResponse;

    sget-object v1, Lcom/android/vending/licensing/Policy$LicenseResponse;->LICENSED:Lcom/android/vending/licensing/Policy$LicenseResponse;

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/vending/licensing/Policy$LicenseResponse;->NOT_LICENSED:Lcom/android/vending/licensing/Policy$LicenseResponse;

    aput-object v1, v0, v3

    sget-object v1, Lcom/android/vending/licensing/Policy$LicenseResponse;->RETRY:Lcom/android/vending/licensing/Policy$LicenseResponse;

    aput-object v1, v0, v4

    sput-object v0, Lcom/android/vending/licensing/Policy$LicenseResponse;->$VALUES:[Lcom/android/vending/licensing/Policy$LicenseResponse;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/vending/licensing/Policy$LicenseResponse;
    .locals 1
    .parameter "name"

    .prologue
    .line 28
    const-class v0, Lcom/android/vending/licensing/Policy$LicenseResponse;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/android/vending/licensing/Policy$LicenseResponse;

    return-object v0
.end method

.method public static values()[Lcom/android/vending/licensing/Policy$LicenseResponse;
    .locals 1

    .prologue
    .line 28
    sget-object v0, Lcom/android/vending/licensing/Policy$LicenseResponse;->$VALUES:[Lcom/android/vending/licensing/Policy$LicenseResponse;

    invoke-virtual {v0}, [Lcom/android/vending/licensing/Policy$LicenseResponse;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/vending/licensing/Policy$LicenseResponse;

    return-object v0
.end method

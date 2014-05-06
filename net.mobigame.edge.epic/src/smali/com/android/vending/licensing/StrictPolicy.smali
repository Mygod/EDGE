.class public Lcom/android/vending/licensing/StrictPolicy;
.super Ljava/lang/Object;
.source "StrictPolicy.java"

# interfaces
.implements Lcom/android/vending/licensing/Policy;


# static fields
.field private static final TAG:Ljava/lang/String; = "StrictPolicy"


# instance fields
.field private mLastResponse:Lcom/android/vending/licensing/Policy$LicenseResponse;

.field private mPreferences:Lcom/android/vending/licensing/PreferenceObfuscator;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    sget-object v0, Lcom/android/vending/licensing/Policy$LicenseResponse;->RETRY:Lcom/android/vending/licensing/Policy$LicenseResponse;

    iput-object v0, p0, Lcom/android/vending/licensing/StrictPolicy;->mLastResponse:Lcom/android/vending/licensing/Policy$LicenseResponse;

    .line 44
    return-void
.end method


# virtual methods
.method public allowAccess()Z
    .locals 2

    .prologue
    .line 65
    iget-object v0, p0, Lcom/android/vending/licensing/StrictPolicy;->mLastResponse:Lcom/android/vending/licensing/Policy$LicenseResponse;

    sget-object v1, Lcom/android/vending/licensing/Policy$LicenseResponse;->LICENSED:Lcom/android/vending/licensing/Policy$LicenseResponse;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public processServerResponse(Lcom/android/vending/licensing/Policy$LicenseResponse;Lcom/android/vending/licensing/ResponseData;)V
    .locals 0
    .parameter "response"
    .parameter "rawData"

    .prologue
    .line 55
    iput-object p1, p0, Lcom/android/vending/licensing/StrictPolicy;->mLastResponse:Lcom/android/vending/licensing/Policy$LicenseResponse;

    .line 56
    return-void
.end method

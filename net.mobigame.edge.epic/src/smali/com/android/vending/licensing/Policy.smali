.class public interface abstract Lcom/android/vending/licensing/Policy;
.super Ljava/lang/Object;
.source "Policy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/vending/licensing/Policy$LicenseResponse;
    }
.end annotation


# virtual methods
.method public abstract allowAccess()Z
.end method

.method public abstract processServerResponse(Lcom/android/vending/licensing/Policy$LicenseResponse;Lcom/android/vending/licensing/ResponseData;)V
.end method

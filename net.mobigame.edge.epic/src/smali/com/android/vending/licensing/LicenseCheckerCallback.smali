.class public interface abstract Lcom/android/vending/licensing/LicenseCheckerCallback;
.super Ljava/lang/Object;
.source "LicenseCheckerCallback.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/vending/licensing/LicenseCheckerCallback$ApplicationErrorCode;
    }
.end annotation


# virtual methods
.method public abstract allow()V
.end method

.method public abstract applicationError(Lcom/android/vending/licensing/LicenseCheckerCallback$ApplicationErrorCode;)V
.end method

.method public abstract dontAllow()V
.end method

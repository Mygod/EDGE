.class Lcom/android/vending/licensing/LicenseValidator;
.super Ljava/lang/Object;
.source "LicenseValidator.java"


# static fields
.field private static final ERROR_CONTACTING_SERVER:I = 0x101

.field private static final ERROR_INVALID_PACKAGE_NAME:I = 0x102

.field private static final ERROR_NON_MATCHING_UID:I = 0x103

.field private static final ERROR_NOT_MARKET_MANAGED:I = 0x3

.field private static final ERROR_OVER_QUOTA:I = 0x5

.field private static final ERROR_SERVER_FAILURE:I = 0x4

.field private static final LICENSED:I = 0x0

.field private static final LICENSED_OLD_KEY:I = 0x2

.field private static final NOT_LICENSED:I = 0x1

.field private static final SIGNATURE_ALGORITHM:Ljava/lang/String; = "SHA1withRSA"

.field private static final TAG:Ljava/lang/String; = "LicenseValidator"


# instance fields
.field private final mCallback:Lcom/android/vending/licensing/LicenseCheckerCallback;

.field private final mDeviceLimiter:Lcom/android/vending/licensing/DeviceLimiter;

.field private final mNonce:I

.field private final mPackageName:Ljava/lang/String;

.field private final mPolicy:Lcom/android/vending/licensing/Policy;

.field private final mVersionCode:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/android/vending/licensing/Policy;Lcom/android/vending/licensing/DeviceLimiter;Lcom/android/vending/licensing/LicenseCheckerCallback;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "policy"
    .parameter "deviceLimiter"
    .parameter "callback"
    .parameter "nonce"
    .parameter "packageName"
    .parameter "versionCode"

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p1, p0, Lcom/android/vending/licensing/LicenseValidator;->mPolicy:Lcom/android/vending/licensing/Policy;

    .line 62
    iput-object p2, p0, Lcom/android/vending/licensing/LicenseValidator;->mDeviceLimiter:Lcom/android/vending/licensing/DeviceLimiter;

    .line 63
    iput-object p3, p0, Lcom/android/vending/licensing/LicenseValidator;->mCallback:Lcom/android/vending/licensing/LicenseCheckerCallback;

    .line 64
    iput p4, p0, Lcom/android/vending/licensing/LicenseValidator;->mNonce:I

    .line 65
    iput-object p5, p0, Lcom/android/vending/licensing/LicenseValidator;->mPackageName:Ljava/lang/String;

    .line 66
    iput-object p6, p0, Lcom/android/vending/licensing/LicenseValidator;->mVersionCode:Ljava/lang/String;

    .line 67
    return-void
.end method

.method private handleApplicationError(Lcom/android/vending/licensing/LicenseCheckerCallback$ApplicationErrorCode;)V
    .locals 1
    .parameter "code"

    .prologue
    .line 220
    iget-object v0, p0, Lcom/android/vending/licensing/LicenseValidator;->mCallback:Lcom/android/vending/licensing/LicenseCheckerCallback;

    invoke-interface {v0, p1}, Lcom/android/vending/licensing/LicenseCheckerCallback;->applicationError(Lcom/android/vending/licensing/LicenseCheckerCallback$ApplicationErrorCode;)V

    .line 221
    return-void
.end method

.method private handleInvalidResponse()V
    .locals 1

    .prologue
    .line 224
    iget-object v0, p0, Lcom/android/vending/licensing/LicenseValidator;->mCallback:Lcom/android/vending/licensing/LicenseCheckerCallback;

    invoke-interface {v0}, Lcom/android/vending/licensing/LicenseCheckerCallback;->dontAllow()V

    .line 225
    return-void
.end method

.method private handleResponse(Lcom/android/vending/licensing/Policy$LicenseResponse;Lcom/android/vending/licensing/ResponseData;)V
    .locals 1
    .parameter "response"
    .parameter "rawData"

    .prologue
    .line 208
    iget-object v0, p0, Lcom/android/vending/licensing/LicenseValidator;->mPolicy:Lcom/android/vending/licensing/Policy;

    invoke-interface {v0, p1, p2}, Lcom/android/vending/licensing/Policy;->processServerResponse(Lcom/android/vending/licensing/Policy$LicenseResponse;Lcom/android/vending/licensing/ResponseData;)V

    .line 212
    iget-object v0, p0, Lcom/android/vending/licensing/LicenseValidator;->mPolicy:Lcom/android/vending/licensing/Policy;

    invoke-interface {v0}, Lcom/android/vending/licensing/Policy;->allowAccess()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 213
    iget-object v0, p0, Lcom/android/vending/licensing/LicenseValidator;->mCallback:Lcom/android/vending/licensing/LicenseCheckerCallback;

    invoke-interface {v0}, Lcom/android/vending/licensing/LicenseCheckerCallback;->allow()V

    .line 217
    :goto_0
    return-void

    .line 215
    :cond_0
    iget-object v0, p0, Lcom/android/vending/licensing/LicenseValidator;->mCallback:Lcom/android/vending/licensing/LicenseCheckerCallback;

    invoke-interface {v0}, Lcom/android/vending/licensing/LicenseCheckerCallback;->dontAllow()V

    goto :goto_0
.end method


# virtual methods
.method public getCallback()Lcom/android/vending/licensing/LicenseCheckerCallback;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/android/vending/licensing/LicenseValidator;->mCallback:Lcom/android/vending/licensing/LicenseCheckerCallback;

    return-object v0
.end method

.method public getNonce()I
    .locals 1

    .prologue
    .line 74
    iget v0, p0, Lcom/android/vending/licensing/LicenseValidator;->mNonce:I

    return v0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/android/vending/licensing/LicenseValidator;->mPackageName:Ljava/lang/String;

    return-object v0
.end method

.method public verify(Ljava/security/PublicKey;ILjava/lang/String;Ljava/lang/String;)V
    .locals 7
    .parameter "publicKey"
    .parameter "responseCode"
    .parameter "signedData"
    .parameter "signature"

    .prologue
    .line 92
    const/4 v4, 0x0

    .line 94
    .local v4, userId:Ljava/lang/String;
    const/4 v0, 0x0

    .line 95
    .local v0, data:Lcom/android/vending/licensing/ResponseData;
    if-eqz p2, :cond_0

    const/4 v5, 0x1

    if-eq p2, v5, :cond_0

    const/4 v5, 0x2

    if-ne p2, v5, :cond_6

    .line 99
    :cond_0
    :try_start_0
    const-string v5, "SHA1withRSA"

    invoke-static {v5}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v3

    .line 100
    .local v3, sig:Ljava/security/Signature;
    invoke-virtual {v3, p1}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V

    .line 101
    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/security/Signature;->update([B)V

    .line 103
    invoke-static {p4}, Lcom/android/vending/licensing/util/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/security/Signature;->verify([B)Z

    move-result v5

    if-nez v5, :cond_1

    .line 104
    const-string v5, "LicenseValidator"

    const-string v6, "Signature verification failed."

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    invoke-direct {p0}, Lcom/android/vending/licensing/LicenseValidator;->handleInvalidResponse()V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/SignatureException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/android/vending/licensing/util/Base64DecoderException; {:try_start_0 .. :try_end_0} :catch_3

    .line 198
    .end local v3           #sig:Ljava/security/Signature;
    :goto_0
    return-void

    .line 108
    :catch_0
    move-exception v1

    .line 110
    .local v1, e:Ljava/security/NoSuchAlgorithmException;
    new-instance v5, Ljava/lang/RuntimeException;

    invoke-direct {v5, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 111
    .end local v1           #e:Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v1

    .line 112
    .local v1, e:Ljava/security/InvalidKeyException;
    sget-object v5, Lcom/android/vending/licensing/LicenseCheckerCallback$ApplicationErrorCode;->INVALID_PUBLIC_KEY:Lcom/android/vending/licensing/LicenseCheckerCallback$ApplicationErrorCode;

    invoke-direct {p0, v5}, Lcom/android/vending/licensing/LicenseValidator;->handleApplicationError(Lcom/android/vending/licensing/LicenseCheckerCallback$ApplicationErrorCode;)V

    goto :goto_0

    .line 114
    .end local v1           #e:Ljava/security/InvalidKeyException;
    :catch_2
    move-exception v1

    .line 115
    .local v1, e:Ljava/security/SignatureException;
    new-instance v5, Ljava/lang/RuntimeException;

    invoke-direct {v5, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 116
    .end local v1           #e:Ljava/security/SignatureException;
    :catch_3
    move-exception v1

    .line 117
    .local v1, e:Lcom/android/vending/licensing/util/Base64DecoderException;
    const-string v5, "LicenseValidator"

    const-string v6, "Could not Base64-decode signature."

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    invoke-direct {p0}, Lcom/android/vending/licensing/LicenseValidator;->handleInvalidResponse()V

    goto :goto_0

    .line 124
    .end local v1           #e:Lcom/android/vending/licensing/util/Base64DecoderException;
    .restart local v3       #sig:Ljava/security/Signature;
    :cond_1
    :try_start_1
    invoke-static {p3}, Lcom/android/vending/licensing/ResponseData;->parse(Ljava/lang/String;)Lcom/android/vending/licensing/ResponseData;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_4

    move-result-object v0

    .line 131
    iget v5, v0, Lcom/android/vending/licensing/ResponseData;->responseCode:I

    if-eq v5, p2, :cond_2

    .line 132
    const-string v5, "LicenseValidator"

    const-string v6, "Response codes don\'t match."

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    invoke-direct {p0}, Lcom/android/vending/licensing/LicenseValidator;->handleInvalidResponse()V

    goto :goto_0

    .line 125
    :catch_4
    move-exception v1

    .line 126
    .local v1, e:Ljava/lang/IllegalArgumentException;
    const-string v5, "LicenseValidator"

    const-string v6, "Could not parse response."

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    invoke-direct {p0}, Lcom/android/vending/licensing/LicenseValidator;->handleInvalidResponse()V

    goto :goto_0

    .line 137
    .end local v1           #e:Ljava/lang/IllegalArgumentException;
    :cond_2
    iget v5, v0, Lcom/android/vending/licensing/ResponseData;->nonce:I

    iget v6, p0, Lcom/android/vending/licensing/LicenseValidator;->mNonce:I

    if-eq v5, v6, :cond_3

    .line 138
    const-string v5, "LicenseValidator"

    const-string v6, "Nonce doesn\'t match."

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    invoke-direct {p0}, Lcom/android/vending/licensing/LicenseValidator;->handleInvalidResponse()V

    goto :goto_0

    .line 143
    :cond_3
    iget-object v5, v0, Lcom/android/vending/licensing/ResponseData;->packageName:Ljava/lang/String;

    iget-object v6, p0, Lcom/android/vending/licensing/LicenseValidator;->mPackageName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 144
    const-string v5, "LicenseValidator"

    const-string v6, "Package name doesn\'t match."

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    invoke-direct {p0}, Lcom/android/vending/licensing/LicenseValidator;->handleInvalidResponse()V

    goto :goto_0

    .line 149
    :cond_4
    iget-object v5, v0, Lcom/android/vending/licensing/ResponseData;->versionCode:Ljava/lang/String;

    iget-object v6, p0, Lcom/android/vending/licensing/LicenseValidator;->mVersionCode:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 150
    const-string v5, "LicenseValidator"

    const-string v6, "Version codes don\'t match."

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    invoke-direct {p0}, Lcom/android/vending/licensing/LicenseValidator;->handleInvalidResponse()V

    goto :goto_0

    .line 156
    :cond_5
    iget-object v4, v0, Lcom/android/vending/licensing/ResponseData;->userId:Ljava/lang/String;

    .line 157
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 158
    const-string v5, "LicenseValidator"

    const-string v6, "User identifier is empty."

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    invoke-direct {p0}, Lcom/android/vending/licensing/LicenseValidator;->handleInvalidResponse()V

    goto/16 :goto_0

    .line 164
    .end local v3           #sig:Ljava/security/Signature;
    :cond_6
    sparse-switch p2, :sswitch_data_0

    .line 195
    const-string v5, "LicenseValidator"

    const-string v6, "Unknown response code for license check."

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    invoke-direct {p0}, Lcom/android/vending/licensing/LicenseValidator;->handleInvalidResponse()V

    goto/16 :goto_0

    .line 167
    :sswitch_0
    iget-object v5, p0, Lcom/android/vending/licensing/LicenseValidator;->mDeviceLimiter:Lcom/android/vending/licensing/DeviceLimiter;

    invoke-interface {v5, v4}, Lcom/android/vending/licensing/DeviceLimiter;->isDeviceAllowed(Ljava/lang/String;)Lcom/android/vending/licensing/Policy$LicenseResponse;

    move-result-object v2

    .line 168
    .local v2, limiterResponse:Lcom/android/vending/licensing/Policy$LicenseResponse;
    invoke-direct {p0, v2, v0}, Lcom/android/vending/licensing/LicenseValidator;->handleResponse(Lcom/android/vending/licensing/Policy$LicenseResponse;Lcom/android/vending/licensing/ResponseData;)V

    goto/16 :goto_0

    .line 171
    .end local v2           #limiterResponse:Lcom/android/vending/licensing/Policy$LicenseResponse;
    :sswitch_1
    sget-object v5, Lcom/android/vending/licensing/Policy$LicenseResponse;->NOT_LICENSED:Lcom/android/vending/licensing/Policy$LicenseResponse;

    invoke-direct {p0, v5, v0}, Lcom/android/vending/licensing/LicenseValidator;->handleResponse(Lcom/android/vending/licensing/Policy$LicenseResponse;Lcom/android/vending/licensing/ResponseData;)V

    goto/16 :goto_0

    .line 174
    :sswitch_2
    const-string v5, "LicenseValidator"

    const-string v6, "Error contacting licensing server."

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    sget-object v5, Lcom/android/vending/licensing/Policy$LicenseResponse;->RETRY:Lcom/android/vending/licensing/Policy$LicenseResponse;

    invoke-direct {p0, v5, v0}, Lcom/android/vending/licensing/LicenseValidator;->handleResponse(Lcom/android/vending/licensing/Policy$LicenseResponse;Lcom/android/vending/licensing/ResponseData;)V

    goto/16 :goto_0

    .line 178
    :sswitch_3
    const-string v5, "LicenseValidator"

    const-string v6, "An error has occurred on the licensing server."

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    sget-object v5, Lcom/android/vending/licensing/Policy$LicenseResponse;->RETRY:Lcom/android/vending/licensing/Policy$LicenseResponse;

    invoke-direct {p0, v5, v0}, Lcom/android/vending/licensing/LicenseValidator;->handleResponse(Lcom/android/vending/licensing/Policy$LicenseResponse;Lcom/android/vending/licensing/ResponseData;)V

    goto/16 :goto_0

    .line 182
    :sswitch_4
    const-string v5, "LicenseValidator"

    const-string v6, "Licensing server is refusing to talk to this device, over quota."

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    sget-object v5, Lcom/android/vending/licensing/Policy$LicenseResponse;->RETRY:Lcom/android/vending/licensing/Policy$LicenseResponse;

    invoke-direct {p0, v5, v0}, Lcom/android/vending/licensing/LicenseValidator;->handleResponse(Lcom/android/vending/licensing/Policy$LicenseResponse;Lcom/android/vending/licensing/ResponseData;)V

    goto/16 :goto_0

    .line 186
    :sswitch_5
    sget-object v5, Lcom/android/vending/licensing/LicenseCheckerCallback$ApplicationErrorCode;->INVALID_PACKAGE_NAME:Lcom/android/vending/licensing/LicenseCheckerCallback$ApplicationErrorCode;

    invoke-direct {p0, v5}, Lcom/android/vending/licensing/LicenseValidator;->handleApplicationError(Lcom/android/vending/licensing/LicenseCheckerCallback$ApplicationErrorCode;)V

    goto/16 :goto_0

    .line 189
    :sswitch_6
    sget-object v5, Lcom/android/vending/licensing/LicenseCheckerCallback$ApplicationErrorCode;->NON_MATCHING_UID:Lcom/android/vending/licensing/LicenseCheckerCallback$ApplicationErrorCode;

    invoke-direct {p0, v5}, Lcom/android/vending/licensing/LicenseValidator;->handleApplicationError(Lcom/android/vending/licensing/LicenseCheckerCallback$ApplicationErrorCode;)V

    goto/16 :goto_0

    .line 192
    :sswitch_7
    sget-object v5, Lcom/android/vending/licensing/LicenseCheckerCallback$ApplicationErrorCode;->NOT_MARKET_MANAGED:Lcom/android/vending/licensing/LicenseCheckerCallback$ApplicationErrorCode;

    invoke-direct {p0, v5}, Lcom/android/vending/licensing/LicenseValidator;->handleApplicationError(Lcom/android/vending/licensing/LicenseCheckerCallback$ApplicationErrorCode;)V

    goto/16 :goto_0

    .line 164
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0x2 -> :sswitch_0
        0x3 -> :sswitch_7
        0x4 -> :sswitch_3
        0x5 -> :sswitch_4
        0x101 -> :sswitch_2
        0x102 -> :sswitch_5
        0x103 -> :sswitch_6
    .end sparse-switch
.end method

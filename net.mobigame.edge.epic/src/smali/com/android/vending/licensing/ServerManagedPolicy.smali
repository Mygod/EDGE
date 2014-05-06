.class public Lcom/android/vending/licensing/ServerManagedPolicy;
.super Ljava/lang/Object;
.source "ServerManagedPolicy.java"

# interfaces
.implements Lcom/android/vending/licensing/Policy;


# static fields
.field private static final DEFAULT_MAX_RETRIES:Ljava/lang/String; = "0"

.field private static final DEFAULT_RETRY_COUNT:Ljava/lang/String; = "0"

.field private static final DEFAULT_RETRY_UNTIL:Ljava/lang/String; = "0"

.field private static final DEFAULT_VALIDITY_TIMESTAMP:Ljava/lang/String; = "0"

.field private static final MILLIS_PER_MINUTE:J = 0xea60L

.field private static final PREFS_FILE:Ljava/lang/String; = "com.android.vending.licensing.ServerManagedPolicy"

.field private static final PREF_LAST_RESPONSE:Ljava/lang/String; = "lastResponse"

.field private static final PREF_MAX_RETRIES:Ljava/lang/String; = "maxRetries"

.field private static final PREF_RETRY_COUNT:Ljava/lang/String; = "retryCount"

.field private static final PREF_RETRY_UNTIL:Ljava/lang/String; = "retryUntil"

.field private static final PREF_VALIDITY_TIMESTAMP:Ljava/lang/String; = "validityTimestamp"

.field private static final TAG:Ljava/lang/String; = "ServerManagedPolicy"


# instance fields
.field private mLastResponse:Lcom/android/vending/licensing/Policy$LicenseResponse;

.field private mLastResponseTime:J

.field private mMaxRetries:J

.field private mPreferences:Lcom/android/vending/licensing/PreferenceObfuscator;

.field private mRetryCount:J

.field private mRetryUntil:J

.field private mValidityTimestamp:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/vending/licensing/Obfuscator;)V
    .locals 4
    .parameter "context"
    .parameter "obfuscator"

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mLastResponseTime:J

    .line 76
    const-string v1, "com.android.vending.licensing.ServerManagedPolicy"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 77
    .local v0, sp:Landroid/content/SharedPreferences;
    new-instance v1, Lcom/android/vending/licensing/PreferenceObfuscator;

    invoke-direct {v1, v0, p2}, Lcom/android/vending/licensing/PreferenceObfuscator;-><init>(Landroid/content/SharedPreferences;Lcom/android/vending/licensing/Obfuscator;)V

    iput-object v1, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mPreferences:Lcom/android/vending/licensing/PreferenceObfuscator;

    .line 78
    iget-object v1, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mPreferences:Lcom/android/vending/licensing/PreferenceObfuscator;

    const-string v2, "lastResponse"

    sget-object v3, Lcom/android/vending/licensing/Policy$LicenseResponse;->RETRY:Lcom/android/vending/licensing/Policy$LicenseResponse;

    invoke-virtual {v3}, Lcom/android/vending/licensing/Policy$LicenseResponse;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/android/vending/licensing/PreferenceObfuscator;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/android/vending/licensing/Policy$LicenseResponse;->valueOf(Ljava/lang/String;)Lcom/android/vending/licensing/Policy$LicenseResponse;

    move-result-object v1

    iput-object v1, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mLastResponse:Lcom/android/vending/licensing/Policy$LicenseResponse;

    .line 80
    iget-object v1, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mPreferences:Lcom/android/vending/licensing/PreferenceObfuscator;

    const-string v2, "validityTimestamp"

    const-string v3, "0"

    invoke-virtual {v1, v2, v3}, Lcom/android/vending/licensing/PreferenceObfuscator;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mValidityTimestamp:J

    .line 82
    iget-object v1, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mPreferences:Lcom/android/vending/licensing/PreferenceObfuscator;

    const-string v2, "retryUntil"

    const-string v3, "0"

    invoke-virtual {v1, v2, v3}, Lcom/android/vending/licensing/PreferenceObfuscator;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mRetryUntil:J

    .line 83
    iget-object v1, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mPreferences:Lcom/android/vending/licensing/PreferenceObfuscator;

    const-string v2, "maxRetries"

    const-string v3, "0"

    invoke-virtual {v1, v2, v3}, Lcom/android/vending/licensing/PreferenceObfuscator;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mMaxRetries:J

    .line 84
    iget-object v1, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mPreferences:Lcom/android/vending/licensing/PreferenceObfuscator;

    const-string v2, "retryCount"

    const-string v3, "0"

    invoke-virtual {v1, v2, v3}, Lcom/android/vending/licensing/PreferenceObfuscator;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mRetryCount:J

    .line 85
    return-void
.end method

.method private decodeExtras(Ljava/lang/String;)Ljava/util/Map;
    .locals 8
    .parameter "extras"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 263
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 265
    .local v5, results:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    new-instance v4, Ljava/net/URI;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "?"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 266
    .local v4, rawExtras:Ljava/net/URI;
    const-string v6, "UTF-8"

    invoke-static {v4, v6}, Lorg/apache/http/client/utils/URLEncodedUtils;->parse(Ljava/net/URI;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 267
    .local v1, extraList:Ljava/util/List;,"Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/http/NameValuePair;

    .line 268
    .local v3, item:Lorg/apache/http/NameValuePair;
    invoke-interface {v3}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 270
    .end local v1           #extraList:Ljava/util/List;,"Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v3           #item:Lorg/apache/http/NameValuePair;
    .end local v4           #rawExtras:Ljava/net/URI;
    :catch_0
    move-exception v0

    .line 271
    .local v0, e:Ljava/net/URISyntaxException;
    const-string v6, "ServerManagedPolicy"

    const-string v7, "Invalid syntax error while decoding extras data from server."

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    .end local v0           #e:Ljava/net/URISyntaxException;
    :cond_0
    return-object v5
.end method

.method private setLastResponse(Lcom/android/vending/licensing/Policy$LicenseResponse;)V
    .locals 3
    .parameter "l"

    .prologue
    .line 137
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mLastResponseTime:J

    .line 138
    iput-object p1, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mLastResponse:Lcom/android/vending/licensing/Policy$LicenseResponse;

    .line 139
    iget-object v0, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mPreferences:Lcom/android/vending/licensing/PreferenceObfuscator;

    const-string v1, "lastResponse"

    invoke-virtual {p1}, Lcom/android/vending/licensing/Policy$LicenseResponse;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/android/vending/licensing/PreferenceObfuscator;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    return-void
.end method

.method private setMaxRetries(Ljava/lang/String;)V
    .locals 4
    .parameter "maxRetries"

    .prologue
    .line 219
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 227
    .local v1, lMaxRetries:Ljava/lang/Long;
    :goto_0
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mMaxRetries:J

    .line 228
    iget-object v2, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mPreferences:Lcom/android/vending/licensing/PreferenceObfuscator;

    const-string v3, "maxRetries"

    invoke-virtual {v2, v3, p1}, Lcom/android/vending/licensing/PreferenceObfuscator;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    return-void

    .line 220
    .end local v1           #lMaxRetries:Ljava/lang/Long;
    :catch_0
    move-exception v0

    .line 222
    .local v0, e:Ljava/lang/NumberFormatException;
    const-string v2, "ServerManagedPolicy"

    const-string v3, "Licence retry count (GR) missing, grace period disabled"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 223
    const-string p1, "0"

    .line 224
    const-wide/16 v2, 0x0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .restart local v1       #lMaxRetries:Ljava/lang/Long;
    goto :goto_0
.end method

.method private setRetryCount(J)V
    .locals 3
    .parameter "c"

    .prologue
    .line 149
    iput-wide p1, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mRetryCount:J

    .line 150
    iget-object v0, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mPreferences:Lcom/android/vending/licensing/PreferenceObfuscator;

    const-string v1, "retryCount"

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/android/vending/licensing/PreferenceObfuscator;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    return-void
.end method

.method private setRetryUntil(Ljava/lang/String;)V
    .locals 4
    .parameter "retryUntil"

    .prologue
    .line 193
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 201
    .local v1, lRetryUntil:Ljava/lang/Long;
    :goto_0
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mRetryUntil:J

    .line 202
    iget-object v2, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mPreferences:Lcom/android/vending/licensing/PreferenceObfuscator;

    const-string v3, "retryUntil"

    invoke-virtual {v2, v3, p1}, Lcom/android/vending/licensing/PreferenceObfuscator;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    return-void

    .line 194
    .end local v1           #lRetryUntil:Ljava/lang/Long;
    :catch_0
    move-exception v0

    .line 196
    .local v0, e:Ljava/lang/NumberFormatException;
    const-string v2, "ServerManagedPolicy"

    const-string v3, "License retry timestamp (GT) missing, grace period disabled"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    const-string p1, "0"

    .line 198
    const-wide/16 v2, 0x0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .restart local v1       #lRetryUntil:Ljava/lang/Long;
    goto :goto_0
.end method

.method private setValidityTimestamp(Ljava/lang/String;)V
    .locals 6
    .parameter "validityTimestamp"

    .prologue
    .line 167
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 175
    .local v1, lValidityTimestamp:Ljava/lang/Long;
    :goto_0
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mValidityTimestamp:J

    .line 176
    iget-object v2, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mPreferences:Lcom/android/vending/licensing/PreferenceObfuscator;

    const-string v3, "validityTimestamp"

    invoke-virtual {v2, v3, p1}, Lcom/android/vending/licensing/PreferenceObfuscator;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    return-void

    .line 168
    .end local v1           #lValidityTimestamp:Ljava/lang/Long;
    :catch_0
    move-exception v0

    .line 170
    .local v0, e:Ljava/lang/NumberFormatException;
    const-string v2, "ServerManagedPolicy"

    const-string v3, "License validity timestamp (VT) missing, caching for a minute"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/32 v4, 0xea60

    add-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 172
    .restart local v1       #lValidityTimestamp:Ljava/lang/Long;
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method


# virtual methods
.method public allowAccess()Z
    .locals 8

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 246
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 247
    .local v0, ts:J
    iget-object v4, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mLastResponse:Lcom/android/vending/licensing/Policy$LicenseResponse;

    sget-object v5, Lcom/android/vending/licensing/Policy$LicenseResponse;->LICENSED:Lcom/android/vending/licensing/Policy$LicenseResponse;

    if-ne v4, v5, :cond_1

    .line 249
    iget-wide v4, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mValidityTimestamp:J

    cmp-long v4, v0, v4

    if-gtz v4, :cond_0

    move v2, v3

    .line 259
    :cond_0
    :goto_0
    return v2

    .line 253
    :cond_1
    iget-object v4, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mLastResponse:Lcom/android/vending/licensing/Policy$LicenseResponse;

    sget-object v5, Lcom/android/vending/licensing/Policy$LicenseResponse;->RETRY:Lcom/android/vending/licensing/Policy$LicenseResponse;

    if-ne v4, v5, :cond_0

    iget-wide v4, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mLastResponseTime:J

    const-wide/32 v6, 0xea60

    add-long/2addr v4, v6

    cmp-long v4, v0, v4

    if-gez v4, :cond_0

    .line 257
    iget-wide v4, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mRetryUntil:J

    cmp-long v4, v0, v4

    if-lez v4, :cond_2

    iget-wide v4, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mRetryCount:J

    iget-wide v6, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mMaxRetries:J

    cmp-long v4, v4, v6

    if-gtz v4, :cond_0

    :cond_2
    move v2, v3

    goto :goto_0
.end method

.method public getMaxRetries()J
    .locals 2

    .prologue
    .line 232
    iget-wide v0, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mMaxRetries:J

    return-wide v0
.end method

.method public getRetryCount()J
    .locals 2

    .prologue
    .line 154
    iget-wide v0, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mRetryCount:J

    return-wide v0
.end method

.method public getRetryUntil()J
    .locals 2

    .prologue
    .line 206
    iget-wide v0, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mRetryUntil:J

    return-wide v0
.end method

.method public getValidityTimestamp()J
    .locals 2

    .prologue
    .line 180
    iget-wide v0, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mValidityTimestamp:J

    return-wide v0
.end method

.method public processServerResponse(Lcom/android/vending/licensing/Policy$LicenseResponse;Lcom/android/vending/licensing/ResponseData;)V
    .locals 5
    .parameter "response"
    .parameter "rawData"

    .prologue
    .line 105
    sget-object v1, Lcom/android/vending/licensing/Policy$LicenseResponse;->RETRY:Lcom/android/vending/licensing/Policy$LicenseResponse;

    if-eq p1, v1, :cond_1

    .line 106
    const-wide/16 v1, 0x0

    invoke-direct {p0, v1, v2}, Lcom/android/vending/licensing/ServerManagedPolicy;->setRetryCount(J)V

    .line 111
    :goto_0
    sget-object v1, Lcom/android/vending/licensing/Policy$LicenseResponse;->LICENSED:Lcom/android/vending/licensing/Policy$LicenseResponse;

    if-ne p1, v1, :cond_2

    .line 113
    iget-object v1, p2, Lcom/android/vending/licensing/ResponseData;->extra:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/android/vending/licensing/ServerManagedPolicy;->decodeExtras(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    .line 114
    .local v0, extras:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mLastResponse:Lcom/android/vending/licensing/Policy$LicenseResponse;

    .line 115
    const-string v1, "VT"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/android/vending/licensing/ServerManagedPolicy;->setValidityTimestamp(Ljava/lang/String;)V

    .line 116
    const-string v1, "GT"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/android/vending/licensing/ServerManagedPolicy;->setRetryUntil(Ljava/lang/String;)V

    .line 117
    const-string v1, "GR"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/android/vending/licensing/ServerManagedPolicy;->setMaxRetries(Ljava/lang/String;)V

    .line 125
    .end local v0           #extras:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    :goto_1
    invoke-direct {p0, p1}, Lcom/android/vending/licensing/ServerManagedPolicy;->setLastResponse(Lcom/android/vending/licensing/Policy$LicenseResponse;)V

    .line 126
    iget-object v1, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mPreferences:Lcom/android/vending/licensing/PreferenceObfuscator;

    invoke-virtual {v1}, Lcom/android/vending/licensing/PreferenceObfuscator;->commit()V

    .line 127
    return-void

    .line 108
    :cond_1
    iget-wide v1, p0, Lcom/android/vending/licensing/ServerManagedPolicy;->mRetryCount:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    invoke-direct {p0, v1, v2}, Lcom/android/vending/licensing/ServerManagedPolicy;->setRetryCount(J)V

    goto :goto_0

    .line 118
    :cond_2
    sget-object v1, Lcom/android/vending/licensing/Policy$LicenseResponse;->NOT_LICENSED:Lcom/android/vending/licensing/Policy$LicenseResponse;

    if-ne p1, v1, :cond_0

    .line 120
    const-string v1, "0"

    invoke-direct {p0, v1}, Lcom/android/vending/licensing/ServerManagedPolicy;->setValidityTimestamp(Ljava/lang/String;)V

    .line 121
    const-string v1, "0"

    invoke-direct {p0, v1}, Lcom/android/vending/licensing/ServerManagedPolicy;->setRetryUntil(Ljava/lang/String;)V

    .line 122
    const-string v1, "0"

    invoke-direct {p0, v1}, Lcom/android/vending/licensing/ServerManagedPolicy;->setMaxRetries(Ljava/lang/String;)V

    goto :goto_1
.end method

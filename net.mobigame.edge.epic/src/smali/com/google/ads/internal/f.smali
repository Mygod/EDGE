.class public final Lcom/google/ads/internal/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/ads/internal/f$a;
    }
.end annotation


# instance fields
.field private final a:Lcom/google/ads/internal/c;

.field private final b:Lcom/google/ads/internal/d;

.field private final c:Lcom/google/ads/internal/f$a;

.field private volatile d:Z

.field private e:Z

.field private f:Ljava/lang/String;

.field private g:Ljava/lang/Thread;


# direct methods
.method constructor <init>(Lcom/google/ads/internal/c;Lcom/google/ads/internal/d;)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 122
    new-instance v0, Lcom/google/ads/internal/f$1;

    invoke-direct {v0}, Lcom/google/ads/internal/f$1;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lcom/google/ads/internal/f;-><init>(Lcom/google/ads/internal/c;Lcom/google/ads/internal/d;Lcom/google/ads/internal/f$a;)V

    .line 128
    return-void
.end method

.method constructor <init>(Lcom/google/ads/internal/c;Lcom/google/ads/internal/d;Lcom/google/ads/internal/f$a;)V
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 141
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/ads/internal/f;->g:Ljava/lang/Thread;

    .line 142
    iput-object p1, p0, Lcom/google/ads/internal/f;->a:Lcom/google/ads/internal/c;

    .line 143
    iput-object p2, p0, Lcom/google/ads/internal/f;->b:Lcom/google/ads/internal/d;

    .line 144
    iput-object p3, p0, Lcom/google/ads/internal/f;->c:Lcom/google/ads/internal/f$a;

    .line 145
    return-void
.end method

.method private a(Landroid/content/Context;Ljava/net/HttpURLConnection;)V
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 443
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 444
    const-string v1, "drt"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 445
    iget-boolean v1, p0, Lcom/google/ads/internal/f;->e:Z

    if-eqz v1, :cond_0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 446
    sget v1, Lcom/google/ads/util/AdUtil;->a:I

    const/16 v2, 0x8

    if-ne v1, v2, :cond_1

    .line 450
    const-string v1, "X-Afma-drt-Cookie"

    invoke-virtual {p2, v1, v0}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 455
    :cond_0
    :goto_0
    return-void

    .line 452
    :cond_1
    const-string v1, "Cookie"

    invoke-virtual {p2, v1, v0}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private a(Ljava/net/HttpURLConnection;)V
    .locals 0
    .parameter

    .prologue
    .line 161
    invoke-direct {p0, p1}, Lcom/google/ads/internal/f;->b(Ljava/net/HttpURLConnection;)V

    .line 162
    invoke-direct {p0, p1}, Lcom/google/ads/internal/f;->f(Ljava/net/HttpURLConnection;)V

    .line 163
    invoke-direct {p0, p1}, Lcom/google/ads/internal/f;->g(Ljava/net/HttpURLConnection;)V

    .line 164
    invoke-direct {p0, p1}, Lcom/google/ads/internal/f;->h(Ljava/net/HttpURLConnection;)V

    .line 165
    invoke-direct {p0, p1}, Lcom/google/ads/internal/f;->e(Ljava/net/HttpURLConnection;)V

    .line 166
    invoke-direct {p0, p1}, Lcom/google/ads/internal/f;->i(Ljava/net/HttpURLConnection;)V

    .line 167
    invoke-direct {p0, p1}, Lcom/google/ads/internal/f;->j(Ljava/net/HttpURLConnection;)V

    .line 168
    invoke-direct {p0, p1}, Lcom/google/ads/internal/f;->k(Ljava/net/HttpURLConnection;)V

    .line 169
    invoke-direct {p0, p1}, Lcom/google/ads/internal/f;->d(Ljava/net/HttpURLConnection;)V

    .line 170
    invoke-direct {p0, p1}, Lcom/google/ads/internal/f;->c(Ljava/net/HttpURLConnection;)V

    .line 171
    return-void
.end method

.method private a(Ljava/net/HttpURLConnection;I)V
    .locals 3
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v1, 0x190

    .line 352
    const/16 v0, 0x12c

    if-gt v0, p2, :cond_1

    if-ge p2, v1, :cond_1

    .line 354
    const-string v0, "Location"

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 355
    if-nez v0, :cond_0

    .line 356
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Could not get redirect location from a "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " redirect."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->c(Ljava/lang/String;)V

    .line 357
    iget-object v0, p0, Lcom/google/ads/internal/f;->a:Lcom/google/ads/internal/c;

    sget-object v1, Lcom/google/ads/AdRequest$ErrorCode;->INTERNAL_ERROR:Lcom/google/ads/AdRequest$ErrorCode;

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/c;->a(Lcom/google/ads/AdRequest$ErrorCode;)V

    .line 358
    invoke-virtual {p0}, Lcom/google/ads/internal/f;->a()V

    .line 393
    :goto_0
    return-void

    .line 362
    :cond_0
    invoke-direct {p0, p1}, Lcom/google/ads/internal/f;->a(Ljava/net/HttpURLConnection;)V

    .line 365
    iput-object v0, p0, Lcom/google/ads/internal/f;->f:Ljava/lang/String;

    goto :goto_0

    .line 366
    :cond_1
    const/16 v0, 0xc8

    if-ne p2, v0, :cond_3

    .line 368
    invoke-direct {p0, p1}, Lcom/google/ads/internal/f;->a(Ljava/net/HttpURLConnection;)V

    .line 369
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-static {v0}, Lcom/google/ads/util/AdUtil;->a(Ljava/lang/Readable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 373
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Response content is: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    .line 374
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 375
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Response message is null or zero length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    .line 376
    iget-object v0, p0, Lcom/google/ads/internal/f;->a:Lcom/google/ads/internal/c;

    sget-object v1, Lcom/google/ads/AdRequest$ErrorCode;->NO_FILL:Lcom/google/ads/AdRequest$ErrorCode;

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/c;->a(Lcom/google/ads/AdRequest$ErrorCode;)V

    .line 377
    invoke-virtual {p0}, Lcom/google/ads/internal/f;->a()V

    goto :goto_0

    .line 382
    :cond_2
    iget-object v1, p0, Lcom/google/ads/internal/f;->a:Lcom/google/ads/internal/c;

    iget-object v2, p0, Lcom/google/ads/internal/f;->f:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Lcom/google/ads/internal/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 383
    invoke-virtual {p0}, Lcom/google/ads/internal/f;->a()V

    goto :goto_0

    .line 384
    :cond_3
    if-ne p2, v1, :cond_4

    .line 385
    const-string v0, "Bad request"

    invoke-static {v0}, Lcom/google/ads/util/b;->c(Ljava/lang/String;)V

    .line 386
    iget-object v0, p0, Lcom/google/ads/internal/f;->a:Lcom/google/ads/internal/c;

    sget-object v1, Lcom/google/ads/AdRequest$ErrorCode;->INVALID_REQUEST:Lcom/google/ads/AdRequest$ErrorCode;

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/c;->a(Lcom/google/ads/AdRequest$ErrorCode;)V

    .line 387
    invoke-virtual {p0}, Lcom/google/ads/internal/f;->a()V

    goto :goto_0

    .line 389
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid response code: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->c(Ljava/lang/String;)V

    .line 390
    iget-object v0, p0, Lcom/google/ads/internal/f;->a:Lcom/google/ads/internal/c;

    sget-object v1, Lcom/google/ads/AdRequest$ErrorCode;->INTERNAL_ERROR:Lcom/google/ads/AdRequest$ErrorCode;

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/c;->a(Lcom/google/ads/AdRequest$ErrorCode;)V

    .line 391
    invoke-virtual {p0}, Lcom/google/ads/internal/f;->a()V

    goto/16 :goto_0
.end method

.method private b()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 420
    :goto_0
    iget-boolean v0, p0, Lcom/google/ads/internal/f;->d:Z

    if-nez v0, :cond_0

    .line 421
    new-instance v0, Ljava/net/URL;

    iget-object v1, p0, Lcom/google/ads/internal/f;->f:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 422
    iget-object v1, p0, Lcom/google/ads/internal/f;->c:Lcom/google/ads/internal/f$a;

    invoke-interface {v1, v0}, Lcom/google/ads/internal/f$a;->a(Ljava/net/URL;)Ljava/net/HttpURLConnection;

    move-result-object v1

    .line 425
    :try_start_0
    iget-object v0, p0, Lcom/google/ads/internal/f;->b:Lcom/google/ads/internal/d;

    invoke-virtual {v0}, Lcom/google/ads/internal/d;->g()Lcom/google/ads/m;

    move-result-object v0

    iget-object v0, v0, Lcom/google/ads/m;->d:Lcom/google/ads/util/i$b;

    invoke-virtual {v0}, Lcom/google/ads/util/i$b;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-direct {p0, v0, v1}, Lcom/google/ads/internal/f;->a(Landroid/content/Context;Ljava/net/HttpURLConnection;)V

    .line 426
    iget-object v0, p0, Lcom/google/ads/internal/f;->b:Lcom/google/ads/internal/d;

    invoke-virtual {v0}, Lcom/google/ads/internal/d;->g()Lcom/google/ads/m;

    move-result-object v0

    iget-object v0, v0, Lcom/google/ads/m;->d:Lcom/google/ads/util/i$b;

    invoke-virtual {v0}, Lcom/google/ads/util/i$b;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/google/ads/util/AdUtil;->a(Ljava/net/HttpURLConnection;Landroid/content/Context;)V

    .line 427
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 428
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->connect()V

    .line 429
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    .line 430
    invoke-direct {p0, v1, v0}, Lcom/google/ads/internal/f;->a(Ljava/net/HttpURLConnection;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 432
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v0

    .line 435
    :cond_0
    return-void
.end method

.method private b(Ljava/net/HttpURLConnection;)V
    .locals 2
    .parameter

    .prologue
    .line 177
    const-string v0, "X-Afma-Debug-Dialog"

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 178
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 179
    iget-object v1, p0, Lcom/google/ads/internal/f;->a:Lcom/google/ads/internal/c;

    invoke-virtual {v1, v0}, Lcom/google/ads/internal/c;->e(Ljava/lang/String;)V

    .line 181
    :cond_0
    return-void
.end method

.method private c(Ljava/net/HttpURLConnection;)V
    .locals 2
    .parameter

    .prologue
    .line 188
    const-string v0, "Content-Type"

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 189
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 190
    iget-object v1, p0, Lcom/google/ads/internal/f;->a:Lcom/google/ads/internal/c;

    invoke-virtual {v1, v0}, Lcom/google/ads/internal/c;->b(Ljava/lang/String;)V

    .line 192
    :cond_0
    return-void
.end method

.method private d(Ljava/net/HttpURLConnection;)V
    .locals 2
    .parameter

    .prologue
    .line 200
    const-string v0, "X-Afma-Mediation"

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 201
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 202
    iget-object v1, p0, Lcom/google/ads/internal/f;->a:Lcom/google/ads/internal/c;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {v1, v0}, Lcom/google/ads/internal/c;->a(Z)V

    .line 204
    :cond_0
    return-void
.end method

.method private e(Ljava/net/HttpURLConnection;)V
    .locals 5
    .parameter

    .prologue
    .line 210
    const-string v0, "X-Afma-Interstitial-Timeout"

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 211
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 213
    :try_start_0
    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    .line 214
    iget-object v2, p0, Lcom/google/ads/internal/f;->b:Lcom/google/ads/internal/d;

    const/high16 v3, 0x447a

    mul-float/2addr v0, v3

    float-to-long v3, v0

    invoke-virtual {v2, v3, v4}, Lcom/google/ads/internal/d;->a(J)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 220
    :cond_0
    :goto_0
    return-void

    .line 216
    :catch_0
    move-exception v0

    .line 217
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not get timeout value: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/google/ads/util/b;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private f(Ljava/net/HttpURLConnection;)V
    .locals 5
    .parameter

    .prologue
    .line 227
    const-string v0, "X-Afma-Tracking-Urls"

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 228
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 229
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, "\\s+"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 230
    array-length v2, v1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v2, :cond_0

    aget-object v3, v1, v0

    .line 231
    iget-object v4, p0, Lcom/google/ads/internal/f;->b:Lcom/google/ads/internal/d;

    invoke-virtual {v4, v3}, Lcom/google/ads/internal/d;->b(Ljava/lang/String;)V

    .line 230
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 234
    :cond_0
    return-void
.end method

.method private g(Ljava/net/HttpURLConnection;)V
    .locals 5
    .parameter

    .prologue
    .line 240
    const-string v0, "X-Afma-Click-Tracking-Urls"

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 241
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 242
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, "\\s+"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 243
    array-length v2, v1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v2, :cond_0

    aget-object v3, v1, v0

    .line 244
    iget-object v4, p0, Lcom/google/ads/internal/f;->a:Lcom/google/ads/internal/c;

    invoke-virtual {v4, v3}, Lcom/google/ads/internal/c;->a(Ljava/lang/String;)V

    .line 243
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 247
    :cond_0
    return-void
.end method

.method private h(Ljava/net/HttpURLConnection;)V
    .locals 4
    .parameter

    .prologue
    .line 254
    const-string v0, "X-Afma-Refresh-Rate"

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 255
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 258
    :try_start_0
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 263
    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-lez v1, :cond_1

    .line 264
    iget-object v1, p0, Lcom/google/ads/internal/f;->b:Lcom/google/ads/internal/d;

    invoke-virtual {v1, v0}, Lcom/google/ads/internal/d;->a(F)V

    .line 265
    iget-object v0, p0, Lcom/google/ads/internal/f;->b:Lcom/google/ads/internal/d;

    invoke-virtual {v0}, Lcom/google/ads/internal/d;->r()Z

    move-result v0

    if-nez v0, :cond_0

    .line 266
    iget-object v0, p0, Lcom/google/ads/internal/f;->b:Lcom/google/ads/internal/d;

    invoke-virtual {v0}, Lcom/google/ads/internal/d;->f()V

    .line 272
    :cond_0
    :goto_0
    return-void

    .line 259
    :catch_0
    move-exception v1

    .line 260
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not get refresh value: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/google/ads/util/b;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 268
    :cond_1
    iget-object v0, p0, Lcom/google/ads/internal/f;->b:Lcom/google/ads/internal/d;

    invoke-virtual {v0}, Lcom/google/ads/internal/d;->r()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 269
    iget-object v0, p0, Lcom/google/ads/internal/f;->b:Lcom/google/ads/internal/d;

    invoke-virtual {v0}, Lcom/google/ads/internal/d;->e()V

    goto :goto_0
.end method

.method private i(Ljava/net/HttpURLConnection;)V
    .locals 2
    .parameter

    .prologue
    .line 279
    const-string v0, "X-Afma-Orientation"

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 280
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 281
    const-string v1, "portrait"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 282
    iget-object v0, p0, Lcom/google/ads/internal/f;->a:Lcom/google/ads/internal/c;

    invoke-static {}, Lcom/google/ads/util/AdUtil;->b()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/c;->a(I)V

    .line 287
    :cond_0
    :goto_0
    return-void

    .line 283
    :cond_1
    const-string v1, "landscape"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 284
    iget-object v0, p0, Lcom/google/ads/internal/f;->a:Lcom/google/ads/internal/c;

    invoke-static {}, Lcom/google/ads/util/AdUtil;->a()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/c;->a(I)V

    goto :goto_0
.end method

.method private j(Ljava/net/HttpURLConnection;)V
    .locals 3
    .parameter

    .prologue
    .line 294
    const-string v0, "X-Afma-Doritos-Cache-Life"

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 296
    :try_start_0
    const-string v0, "X-Afma-Doritos-Cache-Life"

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    .line 298
    iget-object v2, p0, Lcom/google/ads/internal/f;->b:Lcom/google/ads/internal/d;

    invoke-virtual {v2, v0, v1}, Lcom/google/ads/internal/d;->b(J)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 305
    :cond_0
    :goto_0
    return-void

    .line 299
    :catch_0
    move-exception v0

    .line 300
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Got bad value of Doritos cookie cache life from header: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "X-Afma-Doritos-Cache-Life"

    invoke-virtual {p1, v1}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ". Using default value instead."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->e(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private k(Ljava/net/HttpURLConnection;)V
    .locals 2
    .parameter

    .prologue
    .line 322
    const-string v0, "Cache-Control"

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 323
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 326
    iget-object v1, p0, Lcom/google/ads/internal/f;->a:Lcom/google/ads/internal/c;

    invoke-virtual {v1, v0}, Lcom/google/ads/internal/c;->c(Ljava/lang/String;)V

    .line 328
    :cond_0
    return-void
.end method


# virtual methods
.method a()V
    .locals 1

    .prologue
    .line 153
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/ads/internal/f;->d:Z

    .line 154
    return-void
.end method

.method declared-synchronized a(Ljava/lang/String;)V
    .locals 1
    .parameter

    .prologue
    .line 335
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/ads/internal/f;->g:Ljava/lang/Thread;

    if-nez v0, :cond_0

    .line 336
    iput-object p1, p0, Lcom/google/ads/internal/f;->f:Ljava/lang/String;

    .line 337
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/ads/internal/f;->d:Z

    .line 338
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/google/ads/internal/f;->g:Ljava/lang/Thread;

    .line 339
    iget-object v0, p0, Lcom/google/ads/internal/f;->g:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 341
    :cond_0
    monitor-exit p0

    return-void

    .line 335
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public a(Z)V
    .locals 0
    .parameter

    .prologue
    .line 314
    iput-boolean p1, p0, Lcom/google/ads/internal/f;->e:Z

    .line 315
    return-void
.end method

.method public run()V
    .locals 2

    .prologue
    .line 399
    :try_start_0
    invoke-direct {p0}, Lcom/google/ads/internal/f;->b()V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2

    .line 413
    :goto_0
    return-void

    .line 400
    :catch_0
    move-exception v0

    .line 402
    const-string v1, "Received malformed ad url from javascript."

    invoke-static {v1, v0}, Lcom/google/ads/util/b;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 403
    iget-object v0, p0, Lcom/google/ads/internal/f;->a:Lcom/google/ads/internal/c;

    sget-object v1, Lcom/google/ads/AdRequest$ErrorCode;->INTERNAL_ERROR:Lcom/google/ads/AdRequest$ErrorCode;

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/c;->a(Lcom/google/ads/AdRequest$ErrorCode;)V

    goto :goto_0

    .line 404
    :catch_1
    move-exception v0

    .line 406
    const-string v1, "IOException connecting to ad url."

    invoke-static {v1, v0}, Lcom/google/ads/util/b;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 407
    iget-object v0, p0, Lcom/google/ads/internal/f;->a:Lcom/google/ads/internal/c;

    sget-object v1, Lcom/google/ads/AdRequest$ErrorCode;->NETWORK_ERROR:Lcom/google/ads/AdRequest$ErrorCode;

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/c;->a(Lcom/google/ads/AdRequest$ErrorCode;)V

    goto :goto_0

    .line 408
    :catch_2
    move-exception v0

    .line 410
    const-string v1, "An unknown error occurred in AdResponseLoader."

    invoke-static {v1, v0}, Lcom/google/ads/util/b;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 411
    iget-object v0, p0, Lcom/google/ads/internal/f;->a:Lcom/google/ads/internal/c;

    sget-object v1, Lcom/google/ads/AdRequest$ErrorCode;->INTERNAL_ERROR:Lcom/google/ads/AdRequest$ErrorCode;

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/c;->a(Lcom/google/ads/AdRequest$ErrorCode;)V

    goto :goto_0
.end method

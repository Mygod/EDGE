.class public final Lcom/google/ads/util/AdUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/ads/util/AdUtil$UserActivityReceiver;,
        Lcom/google/ads/util/AdUtil$a;
    }
.end annotation


# static fields
.field public static final a:I

.field private static b:Ljava/lang/Boolean;

.field private static c:Ljava/lang/String;

.field private static d:Ljava/lang/String;

.field private static e:Ljava/lang/String;

.field private static f:Landroid/media/AudioManager;

.field private static g:Z

.field private static h:Z

.field private static i:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 64
    sget-object v0, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/ads/util/AdUtil;->a(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/ads/util/AdUtil;->a:I

    .line 91
    sput-object v1, Lcom/google/ads/util/AdUtil;->b:Ljava/lang/Boolean;

    .line 94
    sput-object v1, Lcom/google/ads/util/AdUtil;->c:Ljava/lang/String;

    .line 100
    sput-object v1, Lcom/google/ads/util/AdUtil;->e:Ljava/lang/String;

    .line 106
    const/4 v0, 0x1

    sput-boolean v0, Lcom/google/ads/util/AdUtil;->g:Z

    .line 724
    const/4 v0, 0x0

    sput-boolean v0, Lcom/google/ads/util/AdUtil;->h:Z

    .line 764
    sput-object v1, Lcom/google/ads/util/AdUtil;->i:Ljava/lang/String;

    return-void
.end method

.method public static a()I
    .locals 2

    .prologue
    .line 221
    sget v0, Lcom/google/ads/util/AdUtil;->a:I

    const/16 v1, 0x9

    if-lt v0, v1, :cond_0

    .line 222
    const/4 v0, 0x6

    .line 224
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static a(Landroid/content/Context;Landroid/util/DisplayMetrics;)I
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 252
    sget v0, Lcom/google/ads/util/AdUtil;->a:I

    const/4 v1, 0x4

    if-lt v0, v1, :cond_0

    .line 253
    invoke-static {p0, p1}, Lcom/google/ads/util/e;->a(Landroid/content/Context;Landroid/util/DisplayMetrics;)I

    move-result v0

    .line 255
    :goto_0
    return v0

    :cond_0
    iget v0, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    goto :goto_0
.end method

.method public static a(Ljava/lang/String;)I
    .locals 2
    .parameter

    .prologue
    .line 174
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 181
    :goto_0
    return v0

    .line 175
    :catch_0
    move-exception v0

    .line 176
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "The Android SDK version couldn\'t be parsed to an int: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->e(Ljava/lang/String;)V

    .line 178
    const-string v0, "Defaulting to Android SDK version 3."

    invoke-static {v0}, Lcom/google/ads/util/b;->e(Ljava/lang/String;)V

    .line 179
    const/4 v0, 0x3

    goto :goto_0
.end method

.method public static a(Landroid/app/Activity;)Landroid/util/DisplayMetrics;
    .locals 2
    .parameter

    .prologue
    .line 628
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    if-nez v0, :cond_0

    .line 629
    const/4 v0, 0x0

    .line 634
    :goto_0
    return-object v0

    .line 632
    :cond_0
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 633
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    goto :goto_0
.end method

.method public static a(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .parameter

    .prologue
    .line 192
    sget-object v0, Lcom/google/ads/util/AdUtil;->c:Ljava/lang/String;

    if-nez v0, :cond_3

    .line 193
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "android_id"

    invoke-static {v0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 197
    if-eqz v0, :cond_0

    invoke-static {}, Lcom/google/ads/util/AdUtil;->c()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 198
    :cond_0
    const-string v0, "emulator"

    invoke-static {v0}, Lcom/google/ads/util/AdUtil;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 203
    :goto_0
    if-nez v0, :cond_2

    .line 204
    const/4 v0, 0x0

    .line 210
    :goto_1
    return-object v0

    .line 200
    :cond_1
    invoke-static {v0}, Lcom/google/ads/util/AdUtil;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 207
    :cond_2
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/ads/util/AdUtil;->c:Ljava/lang/String;

    .line 210
    :cond_3
    sget-object v0, Lcom/google/ads/util/AdUtil;->c:Ljava/lang/String;

    goto :goto_1
.end method

.method public static a(Landroid/location/Location;)Ljava/lang/String;
    .locals 3
    .parameter

    .prologue
    .line 642
    if-nez p0, :cond_0

    .line 643
    const/4 v0, 0x0

    .line 648
    :goto_0
    return-object v0

    .line 646
    :cond_0
    invoke-static {p0}, Lcom/google/ads/util/AdUtil;->b(Landroid/location/Location;)Ljava/lang/String;

    move-result-object v0

    .line 647
    invoke-static {v0}, Lcom/google/ads/util/AdUtil;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 648
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "e1+"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static a(Ljava/lang/Readable;)Ljava/lang/String;
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 158
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 159
    const/16 v1, 0x800

    invoke-static {v1}, Ljava/nio/CharBuffer;->allocate(I)Ljava/nio/CharBuffer;

    move-result-object v1

    .line 161
    :goto_0
    invoke-interface {p0, v1}, Ljava/lang/Readable;->read(Ljava/nio/CharBuffer;)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 162
    invoke-virtual {v1}, Ljava/nio/CharBuffer;->flip()Ljava/nio/Buffer;

    .line 163
    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 165
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(Ljava/util/Map;)Ljava/lang/String;
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 840
    .line 841
    const/4 v0, 0x0

    .line 843
    :try_start_0
    invoke-static {p0}, Lcom/google/ads/util/AdUtil;->b(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object v1

    .line 844
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 849
    :goto_0
    return-object v0

    .line 845
    :catch_0
    move-exception v1

    .line 846
    const-string v2, "JsonException in serialization: "

    invoke-static {v2, v1}, Lcom/google/ads/util/b;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static a(Ljava/util/Set;)Lorg/json/JSONArray;
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Lorg/json/JSONArray;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 892
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 894
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    move-object v0, v1

    .line 924
    :goto_0
    return-object v0

    .line 898
    :cond_1
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 899
    instance-of v3, v0, Ljava/lang/String;

    if-nez v3, :cond_2

    instance-of v3, v0, Ljava/lang/Integer;

    if-nez v3, :cond_2

    instance-of v3, v0, Ljava/lang/Double;

    if-nez v3, :cond_2

    instance-of v3, v0, Ljava/lang/Long;

    if-nez v3, :cond_2

    instance-of v3, v0, Ljava/lang/Float;

    if-eqz v3, :cond_3

    .line 904
    :cond_2
    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1

    .line 905
    :cond_3
    instance-of v3, v0, Ljava/util/Map;

    if-eqz v3, :cond_4

    .line 907
    :try_start_0
    check-cast v0, Ljava/util/Map;

    .line 908
    invoke-static {v0}, Lcom/google/ads/util/AdUtil;->b(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 909
    :catch_0
    move-exception v0

    .line 910
    const-string v3, "Unknown map type in json serialization: "

    invoke-static {v3, v0}, Lcom/google/ads/util/b;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 912
    :cond_4
    instance-of v3, v0, Ljava/util/Set;

    if-eqz v3, :cond_5

    .line 914
    :try_start_1
    check-cast v0, Ljava/util/Set;

    .line 915
    invoke-static {v0}, Lcom/google/ads/util/AdUtil;->a(Ljava/util/Set;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_1
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 916
    :catch_1
    move-exception v0

    .line 917
    const-string v3, "Unknown map type in json serialization: "

    invoke-static {v3, v0}, Lcom/google/ads/util/b;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 920
    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown value in json serialization: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->e(Ljava/lang/String;)V

    goto :goto_1

    :cond_6
    move-object v0, v1

    .line 924
    goto :goto_0
.end method

.method public static a(Landroid/webkit/WebView;)V
    .locals 2
    .parameter

    .prologue
    .line 825
    invoke-virtual {p0}, Landroid/webkit/WebView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/AdUtil;->i(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 827
    invoke-virtual {p0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    .line 828
    return-void
.end method

.method public static a(Ljava/net/HttpURLConnection;Landroid/content/Context;)V
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 836
    const-string v0, "User-Agent"

    invoke-static {p1}, Lcom/google/ads/util/AdUtil;->i(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 837
    return-void
.end method

.method public static a(Z)V
    .locals 0
    .parameter

    .prologue
    .line 721
    sput-boolean p0, Lcom/google/ads/util/AdUtil;->g:Z

    .line 722
    return-void
.end method

.method public static a(IILjava/lang/String;)Z
    .locals 2
    .parameter
    .parameter
    .parameter

    .prologue
    .line 310
    and-int v0, p0, p1

    if-nez v0, :cond_0

    .line 311
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "The android:configChanges value of the com.google.ads.AdActivity must include "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->b(Ljava/lang/String;)V

    .line 313
    const/4 v0, 0x0

    .line 316
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static a(Landroid/content/Intent;Landroid/content/Context;)Z
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 146
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/high16 v1, 0x1

    invoke-virtual {v0, p0, v1}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    .line 148
    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static a(Landroid/net/Uri;)Z
    .locals 3
    .parameter

    .prologue
    const/4 v0, 0x0

    .line 429
    if-nez p0, :cond_1

    .line 433
    :cond_0
    :goto_0
    return v0

    .line 432
    :cond_1
    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    .line 433
    const-string v2, "http"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "https"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method static a(Lcom/google/ads/util/d;)Z
    .locals 1
    .parameter

    .prologue
    .line 415
    if-nez p0, :cond_0

    .line 416
    sget-object p0, Lcom/google/ads/util/d;->d:Lcom/google/ads/util/d;

    .line 418
    :cond_0
    sget-object v0, Lcom/google/ads/util/d;->e:Lcom/google/ads/util/d;

    invoke-virtual {p0, v0}, Lcom/google/ads/util/d;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static b()I
    .locals 2

    .prologue
    .line 236
    sget v0, Lcom/google/ads/util/AdUtil;->a:I

    const/16 v1, 0x9

    if-lt v0, v1, :cond_0

    .line 237
    const/4 v0, 0x7

    .line 239
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static b(Landroid/content/Context;Landroid/util/DisplayMetrics;)I
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 268
    sget v0, Lcom/google/ads/util/AdUtil;->a:I

    const/4 v1, 0x4

    if-lt v0, v1, :cond_0

    .line 269
    invoke-static {p0, p1}, Lcom/google/ads/util/e;->b(Landroid/content/Context;Landroid/util/DisplayMetrics;)I

    move-result v0

    .line 271
    :goto_0
    return v0

    :cond_0
    iget v0, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    goto :goto_0
.end method

.method private static b(Landroid/location/Location;)Ljava/lang/String;
    .locals 9
    .parameter

    .prologue
    const-wide v7, 0x416312d000000000L

    .line 652
    const-string v0, "role: 6 producer: 24 historical_role: 1 historical_producer: 12 timestamp: %d latlng < latitude_e7: %d longitude_e7: %d> radius: %d"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Landroid/location/Location;->getTime()J

    move-result-wide v3

    const-wide/16 v5, 0x3e8

    mul-long/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v3

    mul-double/2addr v3, v7

    double-to-long v3, v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-virtual {p0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v3

    mul-double/2addr v3, v7

    double-to-long v3, v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    invoke-virtual {p0}, Landroid/location/Location;->getAccuracy()F

    move-result v3

    const/high16 v4, 0x447a

    mul-float/2addr v3, v4

    float-to-long v3, v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static b(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .parameter

    .prologue
    const/4 v6, 0x0

    .line 445
    const/4 v0, 0x0

    .line 447
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 449
    :try_start_0
    const-string v0, "MD5"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 450
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Ljava/security/MessageDigest;->update([BII)V

    .line 451
    const-string v1, "%032X"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    new-instance v4, Ljava/math/BigInteger;

    const/4 v5, 0x1

    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    invoke-direct {v4, v5, v0}, Ljava/math/BigInteger;-><init>(I[B)V

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 457
    :cond_0
    :goto_0
    return-object v0

    .line 452
    :catch_0
    move-exception v0

    .line 453
    const/16 v0, 0x20

    invoke-virtual {p0, v6, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static b(Landroid/net/Uri;)Ljava/util/HashMap;
    .locals 10
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    const/4 v3, 0x0

    .line 688
    if-nez p0, :cond_0

    .line 707
    :goto_0
    return-object v0

    .line 692
    :cond_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 693
    invoke-virtual {p0}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    move-result-object v2

    .line 695
    if-eqz v2, :cond_2

    .line 696
    const-string v4, "&"

    invoke-virtual {v2, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    array-length v5, v4

    move v2, v3

    :goto_1
    if-ge v2, v5, :cond_2

    aget-object v6, v4, v2

    .line 697
    const-string v7, "="

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    .line 698
    if-gez v7, :cond_1

    .line 699
    invoke-static {v6}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 696
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 701
    :cond_1
    invoke-virtual {v6, v3, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 702
    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {v6, v7, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v8, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_2
    move-object v0, v1

    .line 707
    goto :goto_0
.end method

.method public static b(Ljava/util/Map;)Lorg/json/JSONObject;
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 854
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 856
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    move-object v0, v2

    .line 887
    :goto_0
    return-object v0

    .line 860
    :cond_1
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 861
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 862
    instance-of v4, v1, Ljava/lang/String;

    if-nez v4, :cond_2

    instance-of v4, v1, Ljava/lang/Integer;

    if-nez v4, :cond_2

    instance-of v4, v1, Ljava/lang/Double;

    if-nez v4, :cond_2

    instance-of v4, v1, Ljava/lang/Long;

    if-nez v4, :cond_2

    instance-of v4, v1, Ljava/lang/Float;

    if-eqz v4, :cond_3

    .line 867
    :cond_2
    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    .line 868
    :cond_3
    instance-of v4, v1, Ljava/util/Map;

    if-eqz v4, :cond_4

    .line 870
    :try_start_0
    check-cast v1, Ljava/util/Map;

    .line 871
    invoke-static {v1}, Lcom/google/ads/util/AdUtil;->b(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 872
    :catch_0
    move-exception v0

    .line 873
    const-string v1, "Unknown map type in json serialization: "

    invoke-static {v1, v0}, Lcom/google/ads/util/b;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 875
    :cond_4
    instance-of v4, v1, Ljava/util/Set;

    if-eqz v4, :cond_5

    .line 877
    :try_start_1
    check-cast v1, Ljava/util/Set;

    .line 878
    invoke-static {v1}, Lcom/google/ads/util/AdUtil;->a(Ljava/util/Set;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 879
    :catch_1
    move-exception v0

    .line 880
    const-string v1, "Unknown map type in json serialization: "

    invoke-static {v1, v0}, Lcom/google/ads/util/b;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 883
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown value in json serialization: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->e(Ljava/lang/String;)V

    goto :goto_1

    :cond_6
    move-object v0, v2

    .line 887
    goto :goto_0
.end method

.method public static b(Landroid/content/Context;)Z
    .locals 5
    .parameter

    .prologue
    const/4 v0, 0x0

    const/4 v4, -0x1

    .line 284
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 285
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 286
    const-string v3, "android.permission.INTERNET"

    invoke-virtual {v1, v3, v2}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    if-ne v3, v4, :cond_0

    .line 288
    const-string v1, "INTERNET permissions must be enabled in AndroidManifest.xml."

    invoke-static {v1}, Lcom/google/ads/util/b;->b(Ljava/lang/String;)V

    .line 296
    :goto_0
    return v0

    .line 290
    :cond_0
    const-string v3, "android.permission.ACCESS_NETWORK_STATE"

    invoke-virtual {v1, v3, v2}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-ne v1, v4, :cond_1

    .line 292
    const-string v1, "ACCESS_NETWORK_STATE permissions must be enabled in AndroidManifest.xml."

    invoke-static {v1}, Lcom/google/ads/util/b;->b(Ljava/lang/String;)V

    goto :goto_0

    .line 296
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private static c(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .parameter

    .prologue
    .line 661
    :try_start_0
    const-string v0, "AES/CBC/PKCS5Padding"

    invoke-static {v0}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 662
    const/4 v1, 0x1

    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;

    const/16 v3, 0x10

    new-array v3, v3, [B

    fill-array-data v3, :array_0

    const-string v4, "AES"

    invoke-direct {v2, v3, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 665
    invoke-virtual {v0}, Ljavax/crypto/Cipher;->getIV()[B

    move-result-object v1

    .line 666
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {v0, v2}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v0

    .line 667
    array-length v2, v1

    array-length v3, v0

    add-int/2addr v2, v3

    new-array v2, v2, [B

    .line 668
    const/4 v3, 0x0

    const/4 v4, 0x0

    array-length v5, v1

    invoke-static {v1, v3, v2, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 669
    const/4 v3, 0x0

    array-length v1, v1

    array-length v4, v0

    invoke-static {v0, v3, v2, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 670
    const/16 v0, 0xb

    invoke-static {v2, v0}, Lcom/google/ads/util/c;->b([BI)Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 672
    :goto_0
    return-object v0

    .line 671
    :catch_0
    move-exception v0

    .line 672
    const/4 v0, 0x0

    goto :goto_0

    .line 662
    nop

    :array_0
    .array-data 0x1
        0xat
        0x37t
        0x90t
        0xd1t
        0xfat
        0x7t
        0xbt
        0x4bt
        0xf9t
        0x87t
        0x79t
        0x45t
        0x50t
        0xc3t
        0xft
        0x5t
    .end array-data
.end method

.method public static c()Z
    .locals 1

    .prologue
    .line 406
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/google/ads/util/AdUtil;->a(Lcom/google/ads/util/d;)Z

    move-result v0

    return v0
.end method

.method public static c(Landroid/content/Context;)Z
    .locals 5
    .parameter

    .prologue
    const/4 v4, 0x0

    .line 330
    sget-object v0, Lcom/google/ads/util/AdUtil;->b:Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    .line 331
    sget-object v0, Lcom/google/ads/util/AdUtil;->b:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 397
    :goto_0
    return v0

    .line 335
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 336
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/google/ads/AdActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 337
    const/high16 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    .line 341
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    sput-object v1, Lcom/google/ads/util/AdUtil;->b:Ljava/lang/Boolean;

    .line 342
    if-eqz v0, :cond_1

    iget-object v1, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-nez v1, :cond_3

    .line 343
    :cond_1
    const-string v0, "Could not find com.google.ads.AdActivity, please make sure it is registered in AndroidManifest.xml."

    invoke-static {v0}, Lcom/google/ads/util/b;->b(Ljava/lang/String;)V

    .line 345
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/google/ads/util/AdUtil;->b:Ljava/lang/Boolean;

    .line 397
    :cond_2
    :goto_1
    sget-object v0, Lcom/google/ads/util/AdUtil;->b:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_0

    .line 349
    :cond_3
    iget-object v1, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget v1, v1, Landroid/content/pm/ActivityInfo;->configChanges:I

    const/16 v2, 0x10

    const-string v3, "keyboard"

    invoke-static {v1, v2, v3}, Lcom/google/ads/util/AdUtil;->a(IILjava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 352
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    sput-object v1, Lcom/google/ads/util/AdUtil;->b:Ljava/lang/Boolean;

    .line 356
    :cond_4
    iget-object v1, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget v1, v1, Landroid/content/pm/ActivityInfo;->configChanges:I

    const/16 v2, 0x20

    const-string v3, "keyboardHidden"

    invoke-static {v1, v2, v3}, Lcom/google/ads/util/AdUtil;->a(IILjava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 359
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    sput-object v1, Lcom/google/ads/util/AdUtil;->b:Ljava/lang/Boolean;

    .line 363
    :cond_5
    iget-object v1, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget v1, v1, Landroid/content/pm/ActivityInfo;->configChanges:I

    const/16 v2, 0x80

    const-string v3, "orientation"

    invoke-static {v1, v2, v3}, Lcom/google/ads/util/AdUtil;->a(IILjava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 366
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    sput-object v1, Lcom/google/ads/util/AdUtil;->b:Ljava/lang/Boolean;

    .line 370
    :cond_6
    iget-object v1, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget v1, v1, Landroid/content/pm/ActivityInfo;->configChanges:I

    const/16 v2, 0x100

    const-string v3, "screenLayout"

    invoke-static {v1, v2, v3}, Lcom/google/ads/util/AdUtil;->a(IILjava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 373
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    sput-object v1, Lcom/google/ads/util/AdUtil;->b:Ljava/lang/Boolean;

    .line 377
    :cond_7
    iget-object v1, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget v1, v1, Landroid/content/pm/ActivityInfo;->configChanges:I

    const/16 v2, 0x200

    const-string v3, "uiMode"

    invoke-static {v1, v2, v3}, Lcom/google/ads/util/AdUtil;->a(IILjava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 380
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    sput-object v1, Lcom/google/ads/util/AdUtil;->b:Ljava/lang/Boolean;

    .line 384
    :cond_8
    iget-object v1, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget v1, v1, Landroid/content/pm/ActivityInfo;->configChanges:I

    const/16 v2, 0x400

    const-string v3, "screenSize"

    invoke-static {v1, v2, v3}, Lcom/google/ads/util/AdUtil;->a(IILjava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 387
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    sput-object v1, Lcom/google/ads/util/AdUtil;->b:Ljava/lang/Boolean;

    .line 390
    :cond_9
    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget v0, v0, Landroid/content/pm/ActivityInfo;->configChanges:I

    const/16 v1, 0x800

    const-string v2, "smallestScreenSize"

    invoke-static {v0, v1, v2}, Lcom/google/ads/util/AdUtil;->a(IILjava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 393
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/google/ads/util/AdUtil;->b:Ljava/lang/Boolean;

    goto/16 :goto_1
.end method

.method public static d(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 471
    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 473
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 474
    if-nez v0, :cond_0

    .line 475
    const/4 v0, 0x0

    .line 491
    :goto_0
    return-object v0

    .line 479
    :cond_0
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 487
    const-string v0, "unknown"

    goto :goto_0

    .line 481
    :pswitch_0
    const-string v0, "ed"

    goto :goto_0

    .line 484
    :pswitch_1
    const-string v0, "wi"

    goto :goto_0

    .line 479
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static d()Z
    .locals 1

    .prologue
    .line 714
    sget-boolean v0, Lcom/google/ads/util/AdUtil;->g:Z

    return v0
.end method

.method public static e(Landroid/content/Context;)Ljava/lang/String;
    .locals 6
    .parameter

    .prologue
    const/high16 v5, 0x1

    .line 505
    sget-object v0, Lcom/google/ads/util/AdUtil;->d:Ljava/lang/String;

    if-nez v0, :cond_8

    .line 506
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 508
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 510
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    const-string v4, "geo:0,0?q=donuts"

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v1, v2, v5}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v2

    .line 513
    if-eqz v2, :cond_0

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_1

    .line 514
    :cond_0
    const-string v2, "m"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 517
    :cond_1
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    const-string v4, "market://search?q=pname:com.google"

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v1, v2, v5}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v2

    .line 520
    if-eqz v2, :cond_2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_4

    .line 521
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_3

    .line 522
    const-string v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 524
    :cond_3
    const-string v2, "a"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 527
    :cond_4
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    const-string v4, "tel://6509313940"

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v1, v2, v5}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    .line 530
    if-eqz v1, :cond_5

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_7

    .line 531
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_6

    .line 532
    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 534
    :cond_6
    const-string v1, "t"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 537
    :cond_7
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/ads/util/AdUtil;->d:Ljava/lang/String;

    .line 540
    :cond_8
    sget-object v0, Lcom/google/ads/util/AdUtil;->d:Ljava/lang/String;

    return-object v0
.end method

.method public static f(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .parameter

    .prologue
    const/4 v0, 0x0

    .line 551
    sget-object v1, Lcom/google/ads/util/AdUtil;->e:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 552
    sget-object v0, Lcom/google/ads/util/AdUtil;->e:Ljava/lang/String;

    .line 581
    :cond_0
    :goto_0
    return-object v0

    .line 556
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 557
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    const-string v4, "market://details?id=com.google.ads"

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 560
    const/high16 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v2

    .line 562
    if-eqz v2, :cond_0

    .line 566
    iget-object v2, v2, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    .line 567
    if-eqz v2, :cond_0

    .line 571
    iget-object v3, v2, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 572
    if-eqz v1, :cond_0

    .line 577
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "."

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/google/ads/util/AdUtil;->e:Ljava/lang/String;

    .line 579
    sget-object v0, Lcom/google/ads/util/AdUtil;->e:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 580
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static g(Landroid/content/Context;)Lcom/google/ads/util/AdUtil$a;
    .locals 3
    .parameter

    .prologue
    const/4 v2, 0x1

    .line 593
    sget-object v0, Lcom/google/ads/util/AdUtil;->f:Landroid/media/AudioManager;

    if-nez v0, :cond_0

    .line 594
    const-string v0, "audio"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    sput-object v0, Lcom/google/ads/util/AdUtil;->f:Landroid/media/AudioManager;

    .line 598
    :cond_0
    sget-object v0, Lcom/google/ads/util/AdUtil$a;->f:Lcom/google/ads/util/AdUtil$a;

    .line 600
    sget-object v0, Lcom/google/ads/util/AdUtil;->f:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->getMode()I

    move-result v0

    .line 601
    invoke-static {}, Lcom/google/ads/util/AdUtil;->c()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 602
    sget-object v0, Lcom/google/ads/util/AdUtil$a;->e:Lcom/google/ads/util/AdUtil$a;

    .line 618
    :goto_0
    return-object v0

    .line 603
    :cond_1
    sget-object v1, Lcom/google/ads/util/AdUtil;->f:Landroid/media/AudioManager;

    invoke-virtual {v1}, Landroid/media/AudioManager;->isMusicActive()Z

    move-result v1

    if-nez v1, :cond_2

    sget-object v1, Lcom/google/ads/util/AdUtil;->f:Landroid/media/AudioManager;

    invoke-virtual {v1}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    move-result v1

    if-nez v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    if-ne v0, v2, :cond_3

    .line 607
    :cond_2
    sget-object v0, Lcom/google/ads/util/AdUtil$a;->d:Lcom/google/ads/util/AdUtil$a;

    goto :goto_0

    .line 609
    :cond_3
    sget-object v0, Lcom/google/ads/util/AdUtil;->f:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v0

    .line 611
    if-eqz v0, :cond_4

    if-ne v0, v2, :cond_5

    .line 613
    :cond_4
    sget-object v0, Lcom/google/ads/util/AdUtil$a;->d:Lcom/google/ads/util/AdUtil$a;

    goto :goto_0

    .line 615
    :cond_5
    sget-object v0, Lcom/google/ads/util/AdUtil$a;->b:Lcom/google/ads/util/AdUtil$a;

    goto :goto_0
.end method

.method public static h(Landroid/content/Context;)V
    .locals 2
    .parameter

    .prologue
    .line 731
    sget-boolean v0, Lcom/google/ads/util/AdUtil;->h:Z

    if-eqz v0, :cond_0

    .line 743
    :goto_0
    return-void

    .line 736
    :cond_0
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 737
    const-string v1, "android.intent.action.USER_PRESENT"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 738
    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 740
    new-instance v1, Lcom/google/ads/util/AdUtil$UserActivityReceiver;

    invoke-direct {v1}, Lcom/google/ads/util/AdUtil$UserActivityReceiver;-><init>()V

    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 742
    const/4 v0, 0x1

    sput-boolean v0, Lcom/google/ads/util/AdUtil;->h:Z

    goto :goto_0
.end method

.method public static i(Landroid/content/Context;)Ljava/lang/String;
    .locals 6
    .parameter

    .prologue
    .line 780
    sget-object v0, Lcom/google/ads/util/AdUtil;->i:Ljava/lang/String;

    if-nez v0, :cond_4

    .line 782
    new-instance v0, Landroid/webkit/WebView;

    invoke-direct {v0, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 783
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    move-result-object v0

    .line 785
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "Java0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 790
    :cond_0
    const-string v0, "os.name"

    const-string v1, "Linux"

    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 791
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Android "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 792
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    .line 793
    invoke-virtual {v3}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 794
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_1

    .line 796
    const-string v0, "en"

    .line 798
    :cond_1
    invoke-virtual {v3}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    .line 800
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_2

    .line 801
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "-"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 803
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Build/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Landroid/os/Build;->ID:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 805
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Mozilla/5.0 ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "; U; "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") AppleWebKit/0.0 (KHTML, like "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "Gecko) Version/0.0 Mobile Safari/0.0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 813
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " (Mobile; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "afma-sdk-a-v"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "6.0.0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/ads/util/AdUtil;->i:Ljava/lang/String;

    .line 817
    :cond_4
    sget-object v0, Lcom/google/ads/util/AdUtil;->i:Ljava/lang/String;

    return-object v0
.end method

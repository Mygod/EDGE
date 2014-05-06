.class public Lcom/apportable/CrashReporter;
.super Ljava/lang/Object;
.source "CrashReporter.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "CrashReporter"

.field private static sCrashdumpsEnabled:Z

.field private static sCrittercismRunning:Z

.field private static sMPMetrics:Lcom/mixpanel/android/mpmetrics/MPMetrics;

.field private static sNameTag:Ljava/lang/String;

.field private static sTrackingEnabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x1

    .line 45
    sput-boolean v0, Lcom/apportable/CrashReporter;->sCrashdumpsEnabled:Z

    .line 46
    sput-boolean v0, Lcom/apportable/CrashReporter;->sTrackingEnabled:Z

    .line 47
    const/4 v0, 0x0

    sput-boolean v0, Lcom/apportable/CrashReporter;->sCrittercismRunning:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 39
    invoke-static {}, Lcom/apportable/CrashReporter;->getTrackingProperties()Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method private static final copyInputStream(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 3
    .parameter "in"
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 142
    const/16 v2, 0x400

    new-array v0, v2, [B

    .line 144
    .local v0, buffer:[B
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, len:I
    if-ltz v1, :cond_0

    .line 145
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 146
    :cond_0
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 147
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V

    .line 148
    return-void
.end method

.method public static flushMetrics()V
    .locals 1

    .prologue
    .line 357
    sget-boolean v0, Lcom/apportable/CrashReporter;->sTrackingEnabled:Z

    if-nez v0, :cond_1

    .line 362
    :cond_0
    :goto_0
    return-void

    .line 359
    :cond_1
    sget-object v0, Lcom/apportable/CrashReporter;->sMPMetrics:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    if-eqz v0, :cond_0

    .line 360
    sget-object v0, Lcom/apportable/CrashReporter;->sMPMetrics:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    invoke-virtual {v0}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->flushAll()V

    goto :goto_0
.end method

.method private static getTrackingProperties()Lorg/json/JSONObject;
    .locals 22

    .prologue
    .line 50
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v4

    .line 51
    .local v4, app:Lcom/apportable/app/VerdeApplication;
    invoke-virtual {v4}, Lcom/apportable/app/VerdeApplication;->getPackageName()Ljava/lang/String;

    move-result-object v12

    .line 52
    .local v12, packageName:Ljava/lang/String;
    invoke-static {v4}, Lcom/apportable/Installation;->id(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    .line 53
    .local v8, distinctID:Ljava/lang/String;
    invoke-static {v4}, Lcom/apportable/Installation;->isNewInstall(Landroid/content/Context;)Z

    move-result v10

    .line 54
    .local v10, isNewInstall:Z
    new-instance v17, Lorg/json/JSONObject;

    invoke-direct/range {v17 .. v17}, Lorg/json/JSONObject;-><init>()V

    .line 56
    .local v17, superProperties:Lorg/json/JSONObject;
    const-string v20, "CrashReporter"

    if-eqz v10, :cond_0

    const-string v19, "New install"

    :goto_0
    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "User "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const/16 v20, 0x0

    const/16 v21, 0x8

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v8, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " ("

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    sget-object v20, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ")"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    sput-object v19, Lcom/apportable/CrashReporter;->sNameTag:Ljava/lang/String;

    .line 61
    :try_start_0
    invoke-static {}, Lcom/apportable/utils/MetaData;->getMetaData()Landroid/os/Bundle;

    move-result-object v11

    .line 62
    .local v11, metaData:Landroid/os/Bundle;
    const-string v19, "apportable.app_name"

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 63
    .local v5, app_name:Ljava/lang/String;
    invoke-virtual {v4}, Lcom/apportable/app/VerdeApplication;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v14

    .line 64
    .local v14, pm:Landroid/content/pm/PackageManager;
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v14, v12, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v13

    .line 65
    .local v13, pi:Landroid/content/pm/PackageInfo;
    new-instance v7, Landroid/util/DisplayMetrics;

    invoke-direct {v7}, Landroid/util/DisplayMetrics;-><init>()V

    .line 66
    .local v7, displaymetrics:Landroid/util/DisplayMetrics;
    const-string v19, "window"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Lcom/apportable/app/VerdeApplication;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Landroid/view/WindowManager;

    .line 68
    .local v18, wm:Landroid/view/WindowManager;
    const-string v19, "distinct_id"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 69
    const-string v19, "installation"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 70
    const-string v19, "installer"

    invoke-virtual {v4}, Lcom/apportable/app/VerdeApplication;->getPackageName()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 71
    const-string v19, "mp_name_tag"

    sget-object v20, Lcom/apportable/CrashReporter;->sNameTag:Ljava/lang/String;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 72
    const-string v19, "package_name"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 73
    const-string v19, "app_name"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 74
    const-string v19, "app_version_code"

    iget v0, v13, Landroid/content/pm/PackageInfo;->versionCode:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 75
    const-string v19, "app_version_name"

    iget-object v0, v13, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 76
    const-string v19, "hardware"

    sget-object v20, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 77
    const-string v19, "cpu_abi"

    sget-object v20, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 78
    const-string v19, "cpu_abi2"

    sget-object v20, Landroid/os/Build;->CPU_ABI2:Ljava/lang/String;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 79
    const-string v19, "manufacturer"

    sget-object v20, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 80
    const-string v19, "product"

    sget-object v20, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 81
    const-string v19, "model"

    sget-object v20, Landroid/os/Build;->MODEL:Ljava/lang/String;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 82
    const-string v19, "carrier"

    sget-object v20, Landroid/os/Build;->BRAND:Ljava/lang/String;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 83
    const-string v19, "android_version"

    sget-object v20, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 84
    const-string v19, "locale"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/util/Locale;->getISO3Language()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 86
    const-string v19, "apportable.humbleBundle"

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    const-string v19, "apportable.humbleBundle"

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 87
    const-string v19, "CrashReporter"

    const-string v20, "Thanks for buying the Humble Bundle!"

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    const-string v19, "humblebundle"

    const/16 v20, 0x1

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 93
    :goto_1
    invoke-interface/range {v18 .. v18}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v7}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 94
    const-string v19, "screen_resolution"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    iget v0, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "x"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    iget v0, v7, Landroid/util/DisplayMetrics;->heightPixels:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 95
    invoke-virtual {v4}, Lcom/apportable/app/VerdeApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v19

    move-object/from16 v0, v19

    iget v0, v0, Landroid/content/res/Configuration;->screenLayout:I

    move/from16 v19, v0

    and-int/lit8 v16, v19, 0xf

    .line 96
    .local v16, screenLayoutField:I
    const-string v15, "unknown"

    .line 97
    .local v15, screenLayout:Ljava/lang/String;
    packed-switch v16, :pswitch_data_0

    .line 111
    :goto_2
    const-string v19, "screen_layout"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 112
    const-string v19, "activity"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Lcom/apportable/app/VerdeApplication;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/ActivityManager;

    .line 113
    .local v3, am:Landroid/app/ActivityManager;
    const-string v19, "memory_class"

    invoke-virtual {v3}, Landroid/app/ActivityManager;->getMemoryClass()I

    move-result v20

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 114
    invoke-virtual {v3}, Landroid/app/ActivityManager;->getDeviceConfigurationInfo()Landroid/content/pm/ConfigurationInfo;

    move-result-object v6

    .line 115
    .local v6, ci:Landroid/content/pm/ConfigurationInfo;
    const-string v20, "gles2"

    iget v0, v6, Landroid/content/pm/ConfigurationInfo;->reqGlEsVersion:I

    move/from16 v19, v0

    const/high16 v21, 0x2

    move/from16 v0, v19

    move/from16 v1, v21

    if-lt v0, v1, :cond_2

    const/16 v19, 0x1

    :goto_3
    move-object/from16 v0, v17

    move-object/from16 v1, v20

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .line 121
    .end local v3           #am:Landroid/app/ActivityManager;
    .end local v5           #app_name:Ljava/lang/String;
    .end local v6           #ci:Landroid/content/pm/ConfigurationInfo;
    .end local v7           #displaymetrics:Landroid/util/DisplayMetrics;
    .end local v11           #metaData:Landroid/os/Bundle;
    .end local v13           #pi:Landroid/content/pm/PackageInfo;
    .end local v14           #pm:Landroid/content/pm/PackageManager;
    .end local v15           #screenLayout:Ljava/lang/String;
    .end local v16           #screenLayoutField:I
    .end local v18           #wm:Landroid/view/WindowManager;
    :goto_4
    return-object v17

    .line 56
    :cond_0
    const-string v19, "Existing install"

    goto/16 :goto_0

    .line 90
    .restart local v5       #app_name:Ljava/lang/String;
    .restart local v7       #displaymetrics:Landroid/util/DisplayMetrics;
    .restart local v11       #metaData:Landroid/os/Bundle;
    .restart local v13       #pi:Landroid/content/pm/PackageInfo;
    .restart local v14       #pm:Landroid/content/pm/PackageManager;
    .restart local v18       #wm:Landroid/view/WindowManager;
    :cond_1
    :try_start_1
    const-string v19, "humblebundle"

    const/16 v20, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_1

    .line 116
    .end local v5           #app_name:Ljava/lang/String;
    .end local v7           #displaymetrics:Landroid/util/DisplayMetrics;
    .end local v11           #metaData:Landroid/os/Bundle;
    .end local v13           #pi:Landroid/content/pm/PackageInfo;
    .end local v14           #pm:Landroid/content/pm/PackageManager;
    .end local v18           #wm:Landroid/view/WindowManager;
    :catch_0
    move-exception v9

    .line 117
    .local v9, e:Lorg/json/JSONException;
    const-string v19, "CrashReporter"

    const-string v20, "Could not create super properties"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-static {v0, v1, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4

    .line 99
    .end local v9           #e:Lorg/json/JSONException;
    .restart local v5       #app_name:Ljava/lang/String;
    .restart local v7       #displaymetrics:Landroid/util/DisplayMetrics;
    .restart local v11       #metaData:Landroid/os/Bundle;
    .restart local v13       #pi:Landroid/content/pm/PackageInfo;
    .restart local v14       #pm:Landroid/content/pm/PackageManager;
    .restart local v15       #screenLayout:Ljava/lang/String;
    .restart local v16       #screenLayoutField:I
    .restart local v18       #wm:Landroid/view/WindowManager;
    :pswitch_0
    :try_start_2
    const-string v15, "small"

    .line 100
    goto :goto_2

    .line 102
    :pswitch_1
    const-string v15, "normal"

    .line 103
    goto :goto_2

    .line 105
    :pswitch_2
    const-string v15, "large"

    .line 106
    goto :goto_2

    .line 108
    :pswitch_3
    const-string v15, "xlarge"
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .line 115
    .restart local v3       #am:Landroid/app/ActivityManager;
    .restart local v6       #ci:Landroid/content/pm/ConfigurationInfo;
    :cond_2
    const/16 v19, 0x0

    goto :goto_3

    .line 118
    .end local v3           #am:Landroid/app/ActivityManager;
    .end local v5           #app_name:Ljava/lang/String;
    .end local v6           #ci:Landroid/content/pm/ConfigurationInfo;
    .end local v7           #displaymetrics:Landroid/util/DisplayMetrics;
    .end local v11           #metaData:Landroid/os/Bundle;
    .end local v13           #pi:Landroid/content/pm/PackageInfo;
    .end local v14           #pm:Landroid/content/pm/PackageManager;
    .end local v15           #screenLayout:Ljava/lang/String;
    .end local v16           #screenLayoutField:I
    .end local v18           #wm:Landroid/view/WindowManager;
    :catch_1
    move-exception v9

    .line 119
    .local v9, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v19, "CrashReporter"

    const-string v20, "Could not find the package info"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-static {v0, v1, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4

    .line 97
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public static initTracking()V
    .locals 6

    .prologue
    .line 125
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v0

    .line 126
    .local v0, app:Lcom/apportable/app/VerdeApplication;
    invoke-static {v0}, Lcom/apportable/Installation;->isNewInstall(Landroid/content/Context;)Z

    move-result v1

    .line 127
    .local v1, isNewInstall:Z
    const-string v5, "CrashReporter"

    if-eqz v1, :cond_1

    const-string v4, "New install"

    :goto_0
    invoke-static {v5, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    invoke-static {}, Lcom/apportable/CrashReporter;->getTrackingProperties()Lorg/json/JSONObject;

    move-result-object v3

    .line 129
    .local v3, superProperties:Lorg/json/JSONObject;
    invoke-static {}, Lcom/apportable/utils/MetaData;->getMetaData()Landroid/os/Bundle;

    move-result-object v2

    .line 131
    .local v2, metaData:Landroid/os/Bundle;
    const-string v4, "apportable.mpmetrics.api_key"

    invoke-virtual {v2, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 132
    const-wide/32 v4, 0x927c0

    sput-wide v4, Lcom/mixpanel/android/mpmetrics/MPConfig;->FLUSH_RATE:J

    .line 133
    const-string v4, "apportable.mpmetrics.api_key"

    invoke-virtual {v2, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->getInstance(Landroid/content/Context;Ljava/lang/String;)Lcom/mixpanel/android/mpmetrics/MPMetrics;

    move-result-object v4

    sput-object v4, Lcom/apportable/CrashReporter;->sMPMetrics:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    .line 134
    sget-object v4, Lcom/apportable/CrashReporter;->sMPMetrics:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    invoke-virtual {v4, v3}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->registerSuperProperties(Lorg/json/JSONObject;)V

    .line 137
    :cond_0
    return-void

    .line 127
    .end local v2           #metaData:Landroid/os/Bundle;
    .end local v3           #superProperties:Lorg/json/JSONObject;
    :cond_1
    const-string v4, "Existing install"

    goto :goto_0
.end method

.method public static onDestroy()V
    .locals 1

    .prologue
    .line 377
    sget-object v0, Lcom/apportable/CrashReporter;->sMPMetrics:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/apportable/CrashReporter;->sTrackingEnabled:Z

    if-eqz v0, :cond_0

    .line 378
    sget-object v0, Lcom/apportable/CrashReporter;->sMPMetrics:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    invoke-virtual {v0}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->flushAll()V

    .line 380
    :cond_0
    return-void
.end method

.method public static onStart()V
    .locals 5

    .prologue
    .line 365
    sget-object v2, Lcom/apportable/CrashReporter;->sMPMetrics:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    if-eqz v2, :cond_0

    sget-boolean v2, Lcom/apportable/CrashReporter;->sTrackingEnabled:Z

    if-eqz v2, :cond_0

    .line 367
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 368
    .local v1, properties:Lorg/json/JSONObject;
    const-string v2, "mp_note"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/apportable/CrashReporter;->sNameTag:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " launched app."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 369
    sget-object v2, Lcom/apportable/CrashReporter;->sMPMetrics:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    const-string v3, "launch"

    invoke-virtual {v2, v3, v1}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->track(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 374
    :cond_0
    :goto_0
    return-void

    .line 370
    :catch_0
    move-exception v0

    .line 371
    .local v0, e:Ljava/lang/Exception;
    const-string v2, "CrashReporter"

    const-string v3, "Could not send metrics"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static sendCrashReports()V
    .locals 19

    .prologue
    .line 151
    invoke-static {}, Lcom/apportable/utils/MetaData;->getMetaData()Landroid/os/Bundle;

    move-result-object v11

    .line 152
    .local v11, metaData:Landroid/os/Bundle;
    const/4 v3, 0x0

    .line 153
    .local v3, checkForCrashReports:Z
    sget-boolean v14, Lcom/apportable/CrashReporter;->sCrashdumpsEnabled:Z

    if-nez v14, :cond_1

    .line 154
    const-string v14, "CrashReporter"

    const-string v15, "Not reporting crash due to user setting."

    invoke-static {v14, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    :cond_0
    :goto_0
    return-void

    .line 158
    :cond_1
    const-string v14, "apportable.crittercism.install_ndk"

    const/4 v15, 0x0

    invoke-virtual {v11, v14, v15}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    .line 159
    .local v13, usingCrittercismNdkSupport:Z
    new-instance v5, Ljava/io/File;

    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v14

    invoke-virtual {v14}, Lcom/apportable/app/VerdeApplication;->getFilesDir()Ljava/io/File;

    move-result-object v14

    const-string v15, "crash_reports"

    invoke-direct {v5, v14, v15}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 160
    .local v5, crashReportDir:Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v14

    if-nez v14, :cond_2

    .line 161
    invoke-virtual {v5}, Ljava/io/File;->mkdir()Z

    .line 164
    :cond_2
    new-instance v6, Ljava/io/File;

    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v14

    invoke-virtual {v14}, Lcom/apportable/app/VerdeApplication;->getFilesDir()Ljava/io/File;

    move-result-object v14

    const-string v15, "com.crittercism/dumps"

    invoke-direct {v6, v14, v15}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 165
    .local v6, crittercismCrashReportDir:Ljava/io/File;
    if-eqz v13, :cond_4

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v14

    if-eqz v14, :cond_4

    .line 167
    const-string v14, "([0-9a-f&&[^\\-]]*)-([0-9a-f&&[^\\-]]*)-([0-9a-f&&[^\\-]]*)-([0-9a-f&&[^\\-]]*)-([0-9a-f&&[^\\-]]*)(\\.dmp)"

    invoke-static {v14}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v12

    .line 168
    .local v12, pattern:Ljava/util/regex/Pattern;
    invoke-virtual {v6}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .local v2, arr$:[Ljava/io/File;
    array-length v9, v2

    .local v9, len$:I
    const/4 v8, 0x0

    .local v8, i$:I
    :goto_1
    if-ge v8, v9, :cond_5

    aget-object v4, v2, v8

    .line 169
    .local v4, crashReport:Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v10

    .line 170
    .local v10, matcher:Ljava/util/regex/Matcher;
    invoke-virtual {v10}, Ljava/util/regex/Matcher;->find()Z

    move-result v14

    if-nez v14, :cond_3

    .line 168
    :goto_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 176
    :cond_3
    :try_start_0
    new-instance v14, Ljava/io/FileInputStream;

    invoke-direct {v14, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    new-instance v15, Ljava/io/BufferedOutputStream;

    new-instance v16, Ljava/io/FileOutputStream;

    new-instance v17, Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v5, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct/range {v16 .. v17}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct/range {v15 .. v16}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-static {v14, v15}, Lcom/apportable/CrashReporter;->copyInputStream(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 183
    const/4 v3, 0x1

    .line 184
    goto :goto_2

    .line 178
    :catch_0
    move-exception v7

    .line 179
    .local v7, e:Ljava/io/FileNotFoundException;
    :try_start_1
    const-string v14, "CrashReporter"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Could save crash report: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 183
    const/4 v3, 0x1

    .line 184
    goto :goto_2

    .line 180
    .end local v7           #e:Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v7

    .line 181
    .local v7, e:Ljava/io/IOException;
    const-string v14, "CrashReporter"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Could save crash report: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 183
    const/4 v3, 0x1

    .line 184
    goto :goto_2

    .line 183
    .end local v7           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v14

    const/4 v3, 0x1

    throw v14

    .line 187
    .end local v2           #arr$:[Ljava/io/File;
    .end local v4           #crashReport:Ljava/io/File;
    .end local v8           #i$:I
    .end local v9           #len$:I
    .end local v10           #matcher:Ljava/util/regex/Matcher;
    .end local v12           #pattern:Ljava/util/regex/Pattern;
    :cond_4
    const/4 v3, 0x1

    .line 190
    :cond_5
    if-eqz v3, :cond_0

    .line 191
    new-instance v14, Ljava/lang/Thread;

    new-instance v15, Lcom/apportable/CrashReporter$1;

    invoke-direct {v15, v5}, Lcom/apportable/CrashReporter$1;-><init>(Ljava/io/File;)V

    invoke-direct {v14, v15}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v14}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0
.end method

.method public static setCrashDumpsEnabled(Z)V
    .locals 0
    .parameter "enabled"

    .prologue
    .line 336
    sput-boolean p0, Lcom/apportable/CrashReporter;->sCrashdumpsEnabled:Z

    .line 337
    return-void
.end method

.method public static setTrackingEnabled(Z)V
    .locals 7
    .parameter "enabled"

    .prologue
    .line 297
    sget-boolean v4, Lcom/apportable/CrashReporter;->sTrackingEnabled:Z

    if-nez v4, :cond_0

    if-eqz p0, :cond_0

    .line 298
    invoke-static {}, Lcom/apportable/CrashReporter;->initTracking()V

    .line 300
    :cond_0
    sput-boolean p0, Lcom/apportable/CrashReporter;->sTrackingEnabled:Z

    .line 302
    :try_start_0
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v0

    .line 303
    .local v0, app:Lcom/apportable/app/VerdeApplication;
    new-instance v3, Ljava/io/File;

    invoke-virtual {v0}, Lcom/apportable/app/VerdeApplication;->getFilesDir()Ljava/io/File;

    move-result-object v4

    const-string v5, "OPT_OUT_TRACKING"

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 304
    .local v3, trackOpOutFile:Ljava/io/File;
    sget-boolean v4, Lcom/apportable/CrashReporter;->sTrackingEnabled:Z

    if-eqz v4, :cond_3

    .line 305
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 306
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    move-result v1

    .line 307
    .local v1, deleted:Z
    if-nez v1, :cond_1

    .line 308
    const-string v4, "CrashReporter"

    const-string v5, "Could not delete statistics OptOut file"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 310
    :cond_1
    invoke-static {}, Lcom/apportable/CrashReporter;->initTracking()V

    .line 333
    .end local v0           #app:Lcom/apportable/app/VerdeApplication;
    .end local v1           #deleted:Z
    .end local v3           #trackOpOutFile:Ljava/io/File;
    :cond_2
    :goto_0
    return-void

    .line 313
    .restart local v0       #app:Lcom/apportable/app/VerdeApplication;
    .restart local v3       #trackOpOutFile:Ljava/io/File;
    :cond_3
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_2

    .line 314
    const-string v4, "CrashReporter"

    const-string v5, "setTrackingEnabled: optout does not exists, create"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 315
    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z

    .line 316
    sget-object v4, Lcom/apportable/CrashReporter;->sMPMetrics:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    if-eqz v4, :cond_4

    .line 317
    const/4 v4, 0x0

    sput-object v4, Lcom/apportable/CrashReporter;->sMPMetrics:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    .line 319
    :cond_4
    sget-boolean v4, Lcom/apportable/CrashReporter;->sCrittercismRunning:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v4, :cond_2

    .line 322
    const/4 v4, 0x1

    :try_start_1
    invoke-static {v4}, Lcom/crittercism/app/Crittercism;->setOptOutStatus(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 325
    const/4 v4, 0x0

    :try_start_2
    sput-boolean v4, Lcom/apportable/CrashReporter;->sCrittercismRunning:Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 330
    .end local v0           #app:Lcom/apportable/app/VerdeApplication;
    .end local v3           #trackOpOutFile:Ljava/io/File;
    :catch_0
    move-exception v2

    .line 331
    .local v2, e:Ljava/lang/Exception;
    const-string v4, "CrashReporter"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "setTrackingEnabled exception:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 323
    .end local v2           #e:Ljava/lang/Exception;
    .restart local v0       #app:Lcom/apportable/app/VerdeApplication;
    .restart local v3       #trackOpOutFile:Ljava/io/File;
    :catch_1
    move-exception v4

    .line 325
    const/4 v4, 0x0

    :try_start_3
    sput-boolean v4, Lcom/apportable/CrashReporter;->sCrittercismRunning:Z

    goto :goto_0

    :catchall_0
    move-exception v4

    const/4 v5, 0x0

    sput-boolean v5, Lcom/apportable/CrashReporter;->sCrittercismRunning:Z

    throw v4
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
.end method

.method public static setupTracking()V
    .locals 16

    .prologue
    const/4 v15, 0x1

    const/4 v14, 0x0

    .line 248
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v0

    .line 249
    .local v0, app:Lcom/apportable/app/VerdeApplication;
    new-instance v9, Ljava/io/File;

    invoke-virtual {v0}, Lcom/apportable/app/VerdeApplication;->getFilesDir()Ljava/io/File;

    move-result-object v11

    const-string v12, "OPT_OUT_TRACKING"

    invoke-direct {v9, v11, v12}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 250
    .local v9, trackOpOutFile:Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v11

    if-eqz v11, :cond_0

    .line 251
    sput-boolean v14, Lcom/apportable/CrashReporter;->sTrackingEnabled:Z

    .line 253
    :cond_0
    new-instance v2, Ljava/io/File;

    invoke-virtual {v0}, Lcom/apportable/app/VerdeApplication;->getFilesDir()Ljava/io/File;

    move-result-object v11

    const-string v12, "OPT_OUT_CRASHDUMP"

    invoke-direct {v2, v11, v12}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 254
    .local v2, crashdumpOpOutFile:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v11

    if-eqz v11, :cond_1

    .line 255
    sput-boolean v14, Lcom/apportable/CrashReporter;->sCrashdumpsEnabled:Z

    .line 258
    :cond_1
    sget-boolean v11, Lcom/apportable/CrashReporter;->sTrackingEnabled:Z

    if-eqz v11, :cond_3

    .line 259
    invoke-static {}, Lcom/apportable/CrashReporter;->initTracking()V

    .line 260
    invoke-static {}, Lcom/apportable/CrashReporter;->getTrackingProperties()Lorg/json/JSONObject;

    move-result-object v8

    .line 261
    .local v8, superProperties:Lorg/json/JSONObject;
    invoke-static {}, Lcom/apportable/utils/MetaData;->getMetaData()Landroid/os/Bundle;

    move-result-object v6

    .line 263
    .local v6, metaData:Landroid/os/Bundle;
    invoke-static {v0}, Lcom/apportable/Installation;->isNewInstall(Landroid/content/Context;)Z

    move-result v5

    .line 265
    .local v5, isNewInstall:Z
    sget-object v11, Lcom/apportable/CrashReporter;->sMPMetrics:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    if-eqz v11, :cond_2

    if-eqz v5, :cond_2

    .line 266
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 268
    .local v7, properties:Lorg/json/JSONObject;
    :try_start_0
    const-string v11, "apportable.app_name"

    invoke-virtual {v6, v11}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 269
    .local v1, app_name:Ljava/lang/String;
    const-string v11, "mp_note"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v13, Lcom/apportable/CrashReporter;->sNameTag:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " installed "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v7, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 273
    .end local v1           #app_name:Ljava/lang/String;
    :goto_0
    sget-object v11, Lcom/apportable/CrashReporter;->sMPMetrics:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    const-string v12, "install"

    invoke-virtual {v11, v12, v7}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->track(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 277
    .end local v7           #properties:Lorg/json/JSONObject;
    :cond_2
    invoke-static {}, Lcom/apportable/CrashReporter;->sendCrashReports()V

    .line 279
    const-string v11, "apportable.crittercism.app_id"

    invoke-virtual {v6, v11}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 280
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 281
    .local v3, crittercismConfiguration:Lorg/json/JSONObject;
    const-string v11, "apportable.crittercism.install_ndk"

    invoke-virtual {v6, v11, v14}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v10

    .line 282
    .local v10, usingCrittercismNdkSupport:Z
    const-string v11, "CrashReporter"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "crittercism installNdk:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    :try_start_1
    const-string v11, "installNdk"

    invoke-virtual {v3, v11, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 288
    :goto_1
    const-string v11, "apportable.crittercism.app_id"

    invoke-virtual {v6, v11}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    new-array v12, v15, [Lorg/json/JSONObject;

    aput-object v3, v12, v14

    invoke-static {v0, v11, v12}, Lcom/crittercism/app/Crittercism;->init(Landroid/content/Context;Ljava/lang/String;[Lorg/json/JSONObject;)Z

    .line 289
    invoke-static {v8}, Lcom/crittercism/app/Crittercism;->setMetadata(Lorg/json/JSONObject;)V

    .line 290
    sget-object v11, Lcom/apportable/CrashReporter;->sNameTag:Ljava/lang/String;

    invoke-static {v11}, Lcom/crittercism/app/Crittercism;->setUsername(Ljava/lang/String;)V

    .line 291
    sput-boolean v15, Lcom/apportable/CrashReporter;->sCrittercismRunning:Z

    .line 294
    .end local v3           #crittercismConfiguration:Lorg/json/JSONObject;
    .end local v5           #isNewInstall:Z
    .end local v6           #metaData:Landroid/os/Bundle;
    .end local v8           #superProperties:Lorg/json/JSONObject;
    .end local v10           #usingCrittercismNdkSupport:Z
    :cond_3
    return-void

    .line 270
    .restart local v5       #isNewInstall:Z
    .restart local v6       #metaData:Landroid/os/Bundle;
    .restart local v7       #properties:Lorg/json/JSONObject;
    .restart local v8       #superProperties:Lorg/json/JSONObject;
    :catch_0
    move-exception v4

    .line 271
    .local v4, e:Lorg/json/JSONException;
    const-string v11, "CrashReporter"

    const-string v12, "Could not send metrics"

    invoke-static {v11, v12, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 285
    .end local v4           #e:Lorg/json/JSONException;
    .end local v7           #properties:Lorg/json/JSONObject;
    .restart local v3       #crittercismConfiguration:Lorg/json/JSONObject;
    .restart local v10       #usingCrittercismNdkSupport:Z
    :catch_1
    move-exception v4

    .line 286
    .restart local v4       #e:Lorg/json/JSONException;
    const-string v11, "CrashReporter"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "crittercism config exception:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public static trackEvent(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 7
    .parameter "event"
    .parameter "propertiesBundle"

    .prologue
    .line 341
    :try_start_0
    sget-object v5, Lcom/apportable/CrashReporter;->sMPMetrics:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    if-eqz v5, :cond_0

    sget-boolean v5, Lcom/apportable/CrashReporter;->sTrackingEnabled:Z

    if-eqz v5, :cond_0

    .line 342
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 343
    .local v4, propertiesJSON:Lorg/json/JSONObject;
    invoke-virtual {p1}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 344
    .local v2, keys:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 345
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 346
    .local v1, key:Ljava/lang/String;
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 347
    .local v3, obj:Ljava/lang/Object;
    invoke-virtual {v4, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 351
    .end local v1           #key:Ljava/lang/String;
    .end local v2           #keys:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v3           #obj:Ljava/lang/Object;
    .end local v4           #propertiesJSON:Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 352
    .local v0, ex:Ljava/lang/Exception;
    const-string v5, "CrashReporter"

    const-string v6, "Could not track event"

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 354
    .end local v0           #ex:Ljava/lang/Exception;
    :cond_0
    :goto_1
    return-void

    .line 349
    .restart local v2       #keys:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    .restart local v4       #propertiesJSON:Lorg/json/JSONObject;
    :cond_1
    :try_start_1
    sget-object v5, Lcom/apportable/CrashReporter;->sMPMetrics:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    invoke-virtual {v5, p0, v4}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->track(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

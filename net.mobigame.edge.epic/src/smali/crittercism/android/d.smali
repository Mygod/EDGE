.class public final Lcrittercism/android/d;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcrittercism/android/d$1;,
        Lcrittercism/android/d$a;
    }
.end annotation


# static fields
.field public static final a:Lcrittercism/android/d$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcrittercism/android/d$a;->i:Lcrittercism/android/d$a;

    sput-object v0, Lcrittercism/android/d;->a:Lcrittercism/android/d$a;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a()Ljava/lang/String;
    .locals 2

    sget-object v0, Lcrittercism/android/d$1;->a:[I

    sget-object v1, Lcrittercism/android/d;->a:Lcrittercism/android/d$a;

    invoke-virtual {v1}, Lcrittercism/android/d$a;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    const-string v0, "https://api.crittercism.com"

    :goto_0
    return-object v0

    :pswitch_0
    const-string v0, "http://10.0.2.2:6013"

    goto :goto_0

    :pswitch_1
    const-string v0, "http://192.168.2.1:6013"

    goto :goto_0

    :pswitch_2
    const-string v0, "http://192.168.1.110:6013"

    goto :goto_0

    :pswitch_3
    const-string v0, "http://192.168.1.250:6013"

    goto :goto_0

    :pswitch_4
    const-string v0, "http://10.0.1.5:6013"

    goto :goto_0

    :pswitch_5
    const-string v0, "http://10.1.10.27:6013"

    goto :goto_0

    :pswitch_6
    const-string v0, "http://192.168.1.100:6013"

    goto :goto_0

    :pswitch_7
    const-string v0, "https://www.appcred.com"

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    const/4 v0, 0x0

    :try_start_0
    const-string v1, "com.crittercism.prefs"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v2, 0x0

    invoke-interface {v1, p1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :cond_0
    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    :try_start_0
    const-string v0, "com.crittercism.prefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    goto :goto_0
.end method

.method public static b()Ljava/lang/String;
    .locals 1

    const-string v0, "3.0.2"

    return-object v0
.end method

.class public Lcom/apportable/utils/MetaData;
.super Ljava/lang/Object;
.source "MetaData.java"


# static fields
.field static sMetaData:Landroid/os/Bundle;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    const/4 v0, 0x0

    sput-object v0, Lcom/apportable/utils/MetaData;->sMetaData:Landroid/os/Bundle;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getMetaData()Landroid/os/Bundle;
    .locals 6

    .prologue
    .line 15
    sget-object v4, Lcom/apportable/utils/MetaData;->sMetaData:Landroid/os/Bundle;

    if-nez v4, :cond_0

    .line 16
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v1

    .line 17
    .local v1, app:Lcom/apportable/app/VerdeApplication;
    invoke-virtual {v1}, Lcom/apportable/app/VerdeApplication;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 18
    .local v3, pm:Landroid/content/pm/PackageManager;
    const/4 v0, 0x0

    .line 20
    .local v0, ai:Landroid/content/pm/ApplicationInfo;
    :try_start_0
    invoke-virtual {v1}, Lcom/apportable/app/VerdeApplication;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x80

    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 24
    :goto_0
    if-eqz v0, :cond_1

    .line 25
    iget-object v4, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    sput-object v4, Lcom/apportable/utils/MetaData;->sMetaData:Landroid/os/Bundle;

    .line 31
    :cond_0
    :goto_1
    sget-object v4, Lcom/apportable/utils/MetaData;->sMetaData:Landroid/os/Bundle;

    return-object v4

    .line 21
    :catch_0
    move-exception v2

    .line 22
    .local v2, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v4, "MetaData"

    const-string v5, "Unable to fetch application info for com.apportable.app.VerdeApplication"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 27
    .end local v2           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_1
    const-string v4, "MetaData"

    const-string v5, "Unable to aquire metadata for application"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    sput-object v4, Lcom/apportable/utils/MetaData;->sMetaData:Landroid/os/Bundle;

    goto :goto_1
.end method

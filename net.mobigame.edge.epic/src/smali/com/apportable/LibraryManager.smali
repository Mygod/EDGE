.class public Lcom/apportable/LibraryManager;
.super Ljava/lang/Object;
.source "LibraryManager.java"


# static fields
.field private static final APPORTABLE_LIB_ARMv5:Ljava/lang/String; = "apportable-lib-armeabi"

.field private static final TAG:Ljava/lang/String; = "LibraryManager"

.field private static sLibrariesLoaded:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const/4 v0, 0x0

    sput-boolean v0, Lcom/apportable/LibraryManager;->sLibrariesLoaded:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
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
    .line 143
    const/16 v2, 0x400

    new-array v0, v2, [B

    .line 145
    .local v0, buffer:[B
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, len:I
    if-ltz v1, :cond_0

    .line 146
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 147
    :cond_0
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 148
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V

    .line 149
    return-void
.end method

.method private static extractAPKFile(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 8
    .parameter "libFileName"
    .parameter "destFileName"

    .prologue
    .line 167
    const/4 v3, 0x0

    .line 169
    .local v3, success:Z
    :try_start_0
    new-instance v4, Ljava/util/zip/ZipFile;

    invoke-static {}, Lcom/apportable/LibraryManager;->getAPKFileName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V

    .line 170
    .local v4, zipFile:Ljava/util/zip/ZipFile;
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v0

    .line 171
    .local v0, entries:Ljava/util/Enumeration;
    :cond_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 172
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/zip/ZipEntry;

    .line 173
    .local v1, entry:Ljava/util/zip/ZipEntry;
    const-string v5, "LibraryManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "extractAPKFile found:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 176
    invoke-virtual {v4, v1}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v5

    new-instance v6, Ljava/io/BufferedOutputStream;

    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v6, v7}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-static {v5, v6}, Lcom/apportable/LibraryManager;->copyInputStream(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 178
    const/4 v3, 0x1

    .line 182
    .end local v1           #entry:Ljava/util/zip/ZipEntry;
    :cond_1
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move v5, v3

    .line 188
    .end local v0           #entries:Ljava/util/Enumeration;
    .end local v4           #zipFile:Ljava/util/zip/ZipFile;
    :goto_0
    return v5

    .line 183
    :catch_0
    move-exception v2

    .line 184
    .local v2, ioe:Ljava/io/IOException;
    const-string v5, "LibraryManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Could not upack file from APK: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 185
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 186
    const/4 v5, 0x0

    goto :goto_0
.end method

.method public static forceARMv5()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 55
    sget-object v1, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    .line 56
    .local v1, mainABI:Ljava/lang/String;
    const-string v3, "armeabi-v7"

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_1

    .line 57
    const-string v3, "LibraryManager"

    const-string v4, "no ARMv7 support"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    :cond_0
    :goto_0
    return v2

    .line 60
    :cond_1
    invoke-static {}, Lcom/apportable/LibraryManager;->getCPUInfo()Ljava/lang/String;

    move-result-object v0

    .line 62
    .local v0, cpuinfo:Ljava/lang/String;
    const-string v3, "neon"

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-gez v3, :cond_0

    .line 68
    const/4 v2, 0x1

    goto :goto_0
.end method

.method private static getAPKFileName()Ljava/lang/String;
    .locals 6

    .prologue
    .line 152
    const/4 v1, 0x0

    .line 153
    .local v1, appInfo:Landroid/content/pm/ApplicationInfo;
    invoke-static {}, Lcom/apportable/activity/VerdeActivity;->getActivity()Lcom/apportable/activity/VerdeActivity;

    move-result-object v0

    .line 154
    .local v0, activity:Lcom/apportable/activity/VerdeActivity;
    invoke-virtual {v0}, Lcom/apportable/activity/VerdeActivity;->getApplication()Landroid/app/Application;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v3

    .line 156
    .local v3, packageName:Ljava/lang/String;
    :try_start_0
    invoke-virtual {v0}, Lcom/apportable/activity/VerdeActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v3, v5}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 161
    iget-object v4, v1, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    return-object v4

    .line 157
    :catch_0
    move-exception v2

    .line 158
    .local v2, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v2}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 159
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "Unable to get appinfo"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public static getCPUInfo()Ljava/lang/String;
    .locals 7

    .prologue
    .line 38
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    const-string v5, "/proc/cpuinfo"

    invoke-direct {v2, v5}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 39
    .local v2, fis:Ljava/io/FileInputStream;
    const/16 v5, 0x1000

    new-array v0, v5, [B

    .line 40
    .local v0, buffer:[B
    const/4 v4, 0x0

    .line 42
    .local v4, totalBytes:I
    :goto_0
    rsub-int v5, v4, 0x1000

    invoke-virtual {v2, v0, v4, v5}, Ljava/io/FileInputStream;->read([BII)I

    move-result v3

    .local v3, rc:I
    if-lez v3, :cond_0

    .line 43
    add-int/2addr v4, v3

    goto :goto_0

    .line 45
    :cond_0
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    .line 46
    new-instance v5, Ljava/lang/String;

    const/4 v6, 0x0

    invoke-direct {v5, v0, v6, v4}, Ljava/lang/String;-><init>([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .end local v0           #buffer:[B
    .end local v3           #rc:I
    .end local v4           #totalBytes:I
    :goto_1
    return-object v5

    .line 47
    :catch_0
    move-exception v1

    .line 48
    .local v1, e:Ljava/lang/Exception;
    const-string v5, "LibraryManager"

    const-string v6, "Could not read cpu info:"

    invoke-static {v5, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 51
    const/4 v5, 0x0

    goto :goto_1
.end method

.method private static getExtraLibsString()Ljava/lang/String;
    .locals 6

    .prologue
    .line 73
    :try_start_0
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v4

    invoke-virtual {v4}, Lcom/apportable/app/VerdeApplication;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    const-string v5, "third_party.libs"

    invoke-virtual {v4, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 74
    .local v3, stream:Ljava/io/InputStream;
    new-instance v1, Ljava/io/InputStreamReader;

    invoke-direct {v1, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 75
    .local v1, inputStream:Ljava/io/InputStreamReader;
    new-instance v2, Ljava/io/BufferedReader;

    invoke-direct {v2, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 76
    .local v2, reader:Ljava/io/BufferedReader;
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 77
    .local v0, extraLibs:Ljava/lang/String;
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 78
    invoke-virtual {v1}, Ljava/io/InputStreamReader;->close()V

    .line 79
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    .end local v0           #extraLibs:Ljava/lang/String;
    .end local v1           #inputStream:Ljava/io/InputStreamReader;
    .end local v2           #reader:Ljava/io/BufferedReader;
    :goto_0
    return-object v0

    .line 83
    :catch_0
    move-exception v4

    .line 85
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isDebuggable()Z
    .locals 7

    .prologue
    const/4 v4, 0x0

    .line 123
    const/4 v1, 0x0

    .line 124
    .local v1, appInfo:Landroid/content/pm/ApplicationInfo;
    invoke-static {}, Lcom/apportable/activity/VerdeActivity;->getActivity()Lcom/apportable/activity/VerdeActivity;

    move-result-object v0

    .line 125
    .local v0, activity:Lcom/apportable/activity/VerdeActivity;
    invoke-virtual {v0}, Lcom/apportable/activity/VerdeActivity;->getApplication()Landroid/app/Application;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v3

    .line 127
    .local v3, packageName:Ljava/lang/String;
    :try_start_0
    invoke-virtual {v0}, Lcom/apportable/activity/VerdeActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v3, v6}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 131
    :goto_0
    if-eqz v1, :cond_0

    iget v5, v1, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v5, v5, 0x2

    if-eqz v5, :cond_0

    const/4 v4, 0x1

    :cond_0
    return v4

    .line 128
    :catch_0
    move-exception v2

    .line 129
    .local v2, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v5, "LibraryManager"

    const-string v6, "Unable to get appinfo"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static loadDebugLibrary(Ljava/lang/String;)Z
    .locals 15
    .parameter "fileName"

    .prologue
    const/4 v11, 0x0

    .line 227
    const-string v12, "LibraryManager"

    const-string v13, ">loadDebugLibrary"

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v12

    invoke-virtual {v12}, Lcom/apportable/app/VerdeApplication;->getFilesDir()Ljava/io/File;

    move-result-object v8

    .line 229
    .local v8, path:Ljava/io/File;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    sget-object v13, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 230
    .local v0, appFilesPath:Ljava/lang/String;
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v12

    invoke-virtual {v12}, Lcom/apportable/app/VerdeApplication;->getPackageName()Ljava/lang/String;

    move-result-object v7

    .line 231
    .local v7, packageName:Ljava/lang/String;
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v9

    .line 232
    .local v9, sdCardRoot:Ljava/io/File;
    new-instance v3, Ljava/io/File;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "libs/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const/16 v13, 0x2f

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v3, v9, v12}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 234
    .local v3, file:Ljava/io/File;
    const-string v12, "LibraryManager"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "searching for "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v12

    if-eqz v12, :cond_0

    .line 236
    const-string v12, "LibraryManager"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Copying file:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    :try_start_0
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 240
    .local v10, sdcardFileName:Ljava/lang/String;
    new-instance v4, Ljava/io/FileInputStream;

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v4, v12}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 241
    .local v4, fis:Ljava/io/FileInputStream;
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 242
    .local v5, fos:Ljava/io/FileOutputStream;
    const/16 v12, 0x800

    new-array v1, v12, [B

    .line 244
    .local v1, buf:[B
    :goto_0
    invoke-virtual {v4, v1}, Ljava/io/FileInputStream;->read([B)I

    move-result v6

    .local v6, n:I
    if-lez v6, :cond_1

    .line 245
    const/4 v12, 0x0

    invoke-virtual {v5, v1, v12, v6}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 257
    .end local v1           #buf:[B
    .end local v4           #fis:Ljava/io/FileInputStream;
    .end local v5           #fos:Ljava/io/FileOutputStream;
    .end local v6           #n:I
    .end local v10           #sdcardFileName:Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 258
    .local v2, e:Ljava/lang/Exception;
    const-string v12, "LibraryManager"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Could not copy library: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 261
    .end local v2           #e:Ljava/lang/Exception;
    :cond_0
    :goto_1
    return v11

    .line 246
    .restart local v1       #buf:[B
    .restart local v4       #fis:Ljava/io/FileInputStream;
    .restart local v5       #fos:Ljava/io/FileOutputStream;
    .restart local v6       #n:I
    .restart local v10       #sdcardFileName:Ljava/lang/String;
    :cond_1
    :try_start_1
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V

    .line 247
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 250
    :try_start_2
    invoke-static {v10}, Ljava/lang/System;->load(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 256
    const/4 v11, 0x1

    goto :goto_1

    .line 251
    :catch_1
    move-exception v2

    .line 252
    .local v2, e:Ljava/lang/UnsatisfiedLinkError;
    :try_start_3
    const-string v12, "LibraryManager"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "WARNING:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " could not be loaded from sd card"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    const-string v12, "LibraryManager"

    const-string v13, "Libary failed to load: "

    invoke-static {v12, v13, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_1
.end method

.method public static loadLibraries()V
    .locals 2

    .prologue
    .line 101
    sget-boolean v1, Lcom/apportable/LibraryManager;->sLibrariesLoaded:Z

    if-nez v1, :cond_0

    .line 102
    const/4 v1, 0x1

    sput-boolean v1, Lcom/apportable/LibraryManager;->sLibrariesLoaded:Z

    .line 104
    invoke-static {}, Lcom/apportable/LibraryManager;->loadThirdPartyLibraries()V

    .line 105
    const-string v1, "gnustl_shared"

    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 107
    invoke-static {}, Lcom/apportable/LibraryManager;->forceARMv5()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 108
    const-string v1, "objc"

    invoke-static {v1}, Lcom/apportable/LibraryManager;->loadLibraryARMv5(Ljava/lang/String;)V

    .line 109
    const-string v1, "foundation"

    invoke-static {v1}, Lcom/apportable/LibraryManager;->loadLibraryARMv5(Ljava/lang/String;)V

    .line 110
    const-string v1, "openal"

    invoke-static {v1}, Lcom/apportable/LibraryManager;->loadLibraryARMv5(Ljava/lang/String;)V

    .line 111
    const-string v1, "verde"

    invoke-static {v1}, Lcom/apportable/LibraryManager;->loadLibraryARMv5(Ljava/lang/String;)V

    .line 120
    .local v0, debuggable:Z
    :cond_0
    :goto_0
    return-void

    .line 114
    .end local v0           #debuggable:Z
    :cond_1
    invoke-static {}, Lcom/apportable/LibraryManager;->isDebuggable()Z

    move-result v0

    .line 115
    .restart local v0       #debuggable:Z
    const-string v1, "objc"

    invoke-static {v1, v0}, Lcom/apportable/LibraryManager;->loadLibrary(Ljava/lang/String;Z)V

    .line 116
    const-string v1, "foundation"

    invoke-static {v1, v0}, Lcom/apportable/LibraryManager;->loadLibrary(Ljava/lang/String;Z)V

    .line 117
    const-string v1, "openal"

    invoke-static {v1, v0}, Lcom/apportable/LibraryManager;->loadLibrary(Ljava/lang/String;Z)V

    .line 118
    const-string v1, "verde"

    invoke-static {v1, v0}, Lcom/apportable/LibraryManager;->loadLibrary(Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method private static loadLibrary(Ljava/lang/String;Z)V
    .locals 2
    .parameter "lib"
    .parameter "debuggable"

    .prologue
    .line 135
    if-eqz p1, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "lib"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".so"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/apportable/LibraryManager;->loadDebugLibrary(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 136
    :cond_0
    invoke-static {p0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 138
    :cond_1
    return-void
.end method

.method public static loadLibraryARMv5(Ljava/lang/String;)V
    .locals 7
    .parameter "libName"

    .prologue
    .line 192
    const-string v4, "LibraryManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ">loadLibrariesARMv5:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v4

    invoke-virtual {v4}, Lcom/apportable/app/VerdeApplication;->getCacheDir()Ljava/io/File;

    move-result-object v3

    .line 195
    .local v3, path:Ljava/io/File;
    new-instance v1, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "apportable-lib-armeabi"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 196
    .local v1, libDir:Ljava/io/File;
    const-string v4, "LibraryManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ARMv5 lib path:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 199
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v4

    if-nez v4, :cond_0

    .line 200
    const-string v4, "LibraryManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Could not create directory: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 206
    new-instance v2, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "lib"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".so"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 208
    .local v2, libFile:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_1

    .line 210
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "lib/armeabi/lib"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".so"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 212
    .local v0, fileNameInAPK:Ljava/lang/String;
    const-string v4, "LibraryManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Copying file:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/apportable/LibraryManager;->extractAPKFile(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 214
    const-string v4, "LibraryManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Could not unpack ARMv5 lib: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    const-string v4, "LibraryManager"

    const-string v5, "<loadLibrariesARMv5"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    .end local v0           #fileNameInAPK:Ljava/lang/String;
    .end local v2           #libFile:Ljava/io/File;
    :goto_0
    return-void

    .line 219
    .restart local v2       #libFile:Ljava/io/File;
    :cond_1
    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/System;->load(Ljava/lang/String;)V

    .line 223
    .end local v2           #libFile:Ljava/io/File;
    :goto_1
    const-string v4, "LibraryManager"

    const-string v5, "<loadLibrariesARMv5"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 221
    :cond_2
    const-string v4, "LibraryManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Could not create or find directory for ARMv5 libs:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private static loadThirdPartyLibraries()V
    .locals 5

    .prologue
    .line 89
    invoke-static {}, Lcom/apportable/LibraryManager;->getExtraLibsString()Ljava/lang/String;

    move-result-object v1

    .line 90
    .local v1, extraLibs:Ljava/lang/String;
    if-eqz v1, :cond_0

    const-string v4, ""

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 98
    :cond_0
    return-void

    .line 93
    :cond_1
    const-string v4, " "

    invoke-virtual {v1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 94
    .local v3, libs:[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    array-length v4, v3

    if-ge v2, v4, :cond_0

    .line 95
    aget-object v0, v3, v2

    .line 96
    .local v0, currentLib:Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 94
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

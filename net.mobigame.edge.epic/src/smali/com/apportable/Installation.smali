.class public Lcom/apportable/Installation;
.super Ljava/lang/Object;
.source "Installation.java"


# static fields
.field private static final INSTALLATION:Ljava/lang/String; = "INSTALLATION"

.field private static final INSTALLATION_NEW:I = 0x1

.field private static final INSTALLATION_NOT_NEW:I = 0x2

.field private static final INSTALLATION_UNKNOWN:I

.field private static newInstallState:I

.field private static sID:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    const/4 v0, 0x0

    sput-object v0, Lcom/apportable/Installation;->sID:Ljava/lang/String;

    .line 19
    const/4 v0, 0x0

    sput v0, Lcom/apportable/Installation;->newInstallState:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized id(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .parameter "context"

    .prologue
    .line 22
    const-class v3, Lcom/apportable/Installation;

    monitor-enter v3

    :try_start_0
    sget-object v2, Lcom/apportable/Installation;->sID:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 23
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v4, "INSTALLATION"

    invoke-direct {v1, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .local v1, installation:Ljava/io/File;
    :try_start_1
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 26
    const/4 v2, 0x2

    sput v2, Lcom/apportable/Installation;->newInstallState:I

    .line 31
    :goto_0
    invoke-static {v1}, Lcom/apportable/Installation;->readInstallationFile(Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/apportable/Installation;->sID:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 36
    .end local v1           #installation:Ljava/io/File;
    :cond_0
    :try_start_2
    sget-object v2, Lcom/apportable/Installation;->sID:Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit v3

    return-object v2

    .line 28
    .restart local v1       #installation:Ljava/io/File;
    :cond_1
    const/4 v2, 0x1

    :try_start_3
    sput v2, Lcom/apportable/Installation;->newInstallState:I

    .line 29
    invoke-static {v1}, Lcom/apportable/Installation;->writeInstallationFile(Ljava/io/File;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 32
    :catch_0
    move-exception v0

    .line 33
    .local v0, e:Ljava/lang/Exception;
    :try_start_4
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 22
    .end local v0           #e:Ljava/lang/Exception;
    .end local v1           #installation:Ljava/io/File;
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2
.end method

.method public static isNewInstall(Landroid/content/Context;)Z
    .locals 5
    .parameter "context"

    .prologue
    const/4 v2, 0x1

    .line 40
    sget v3, Lcom/apportable/Installation;->newInstallState:I

    if-nez v3, :cond_1

    .line 41
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    const-string v4, "INSTALLATION"

    invoke-direct {v1, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 43
    .local v1, installation:Ljava/io/File;
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 44
    const/4 v3, 0x2

    sput v3, Lcom/apportable/Installation;->newInstallState:I

    .line 46
    :cond_0
    const/4 v3, 0x1

    sput v3, Lcom/apportable/Installation;->newInstallState:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .end local v1           #installation:Ljava/io/File;
    :cond_1
    sget v3, Lcom/apportable/Installation;->newInstallState:I

    if-ne v3, v2, :cond_2

    .line 54
    :goto_0
    return v2

    .line 47
    .restart local v1       #installation:Ljava/io/File;
    :catch_0
    move-exception v0

    .line 48
    .local v0, e:Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 54
    .end local v0           #e:Ljava/lang/Exception;
    .end local v1           #installation:Ljava/io/File;
    :cond_2
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private static readInstallationFile(Ljava/io/File;)Ljava/lang/String;
    .locals 4
    .parameter "installation"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 58
    new-instance v1, Ljava/io/RandomAccessFile;

    const-string v2, "r"

    invoke-direct {v1, p0, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 59
    .local v1, f:Ljava/io/RandomAccessFile;
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v2

    long-to-int v2, v2

    new-array v0, v2, [B

    .line 60
    .local v0, bytes:[B
    invoke-virtual {v1, v0}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 61
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V

    .line 62
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([B)V

    return-object v2
.end method

.method private static writeInstallationFile(Ljava/io/File;)V
    .locals 3
    .parameter "installation"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 67
    .local v1, out:Ljava/io/FileOutputStream;
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    .line 68
    .local v0, id:Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/FileOutputStream;->write([B)V

    .line 69
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 70
    return-void
.end method

.class public Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;
.super Ljava/lang/Object;
.source "DownloadsDB.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB$DownloadColumns;,
        Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB$MetadataColumns;,
        Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB$DownloadsContentDBHelper;
    }
.end annotation


# static fields
.field private static final CONTROL_IDX:I = 0x7

.field private static final CURRENTBYTES_IDX:I = 0x4

.field private static final DATABASE_NAME:Ljava/lang/String; = "DownloadsDB"

.field private static final DATABASE_VERSION:I = 0x7

.field private static final DC_PROJECTION:[Ljava/lang/String; = null

.field private static final ETAG_IDX:I = 0x2

.field private static final FILENAME_IDX:I = 0x0

.field private static final INDEX_IDX:I = 0xb

.field private static final LASTMOD_IDX:I = 0x5

.field public static final LOG_TAG:Ljava/lang/String; = null

.field private static final NUM_FAILED_IDX:I = 0x8

.field private static final REDIRECT_COUNT_IDX:I = 0xa

.field private static final RETRY_AFTER_IDX:I = 0x9

.field private static final STATUS_IDX:I = 0x6

.field private static final TOTALBYTES_IDX:I = 0x3

.field private static final URI_IDX:I = 0x1

.field private static mDownloadsDB:Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;


# instance fields
.field mFlags:I

.field mGetDownloadByIndex:Landroid/database/sqlite/SQLiteStatement;

.field final mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

.field mMetadataRowID:J

.field mStatus:I

.field mUpdateCurrentBytes:Landroid/database/sqlite/SQLiteStatement;

.field mVersionCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 32
    const-class v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->LOG_TAG:Ljava/lang/String;

    .line 296
    const/16 v0, 0xc

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "FN"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "URI"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "ETAG"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "TOTALBYTES"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "CURRENTBYTES"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "LASTMOD"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "STATUS"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "CONTROL"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "FAILCOUNT"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "RETRYAFTER"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "REDIRECTCOUNT"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "FILEIDX"

    aput-object v2, v0, v1

    sput-object v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->DC_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 5
    .parameter "paramContext"

    .prologue
    const/4 v4, -0x1

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mMetadataRowID:J

    .line 38
    iput v4, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mVersionCode:I

    .line 39
    iput v4, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mStatus:I

    .line 70
    new-instance v2, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB$DownloadsContentDBHelper;

    invoke-direct {v2, p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB$DownloadsContentDBHelper;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    .line 71
    iget-object v2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 74
    .local v1, sqldb:Landroid/database/sqlite/SQLiteDatabase;
    const-string v2, "SELECT APKVERSION,_id,DOWNLOADSTATUS,DOWNLOADFLAGS FROM MetadataColumns LIMIT 1"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 81
    .local v0, cur:Landroid/database/Cursor;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 82
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    iput v2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mVersionCode:I

    .line 83
    const/4 v2, 0x1

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mMetadataRowID:J

    .line 84
    const/4 v2, 0x2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    iput v2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mStatus:I

    .line 85
    const/4 v2, 0x3

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    iput v2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mFlags:I

    .line 86
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 88
    :cond_0
    sput-object p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mDownloadsDB:Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;

    .line 89
    return-void
.end method

.method public static declared-synchronized getDB(Landroid/content/Context;)Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;
    .locals 2
    .parameter "paramContext"

    .prologue
    .line 43
    const-class v1, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mDownloadsDB:Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;

    if-nez v0, :cond_0

    .line 44
    new-instance v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;

    invoke-direct {v0, p0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;-><init>(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    :goto_0
    monitor-exit v1

    return-object v0

    :cond_0
    :try_start_1
    sget-object v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mDownloadsDB:Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 43
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private getDownloadByIndexStatement()Landroid/database/sqlite/SQLiteStatement;
    .locals 2

    .prologue
    .line 50
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mGetDownloadByIndex:Landroid/database/sqlite/SQLiteStatement;

    if-nez v0, :cond_0

    .line 51
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "SELECT _id FROM DownloadColumns WHERE FILEIDX = ?"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mGetDownloadByIndex:Landroid/database/sqlite/SQLiteStatement;

    .line 56
    :cond_0
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mGetDownloadByIndex:Landroid/database/sqlite/SQLiteStatement;

    return-object v0
.end method

.method private getUpdateCurrentBytesStatement()Landroid/database/sqlite/SQLiteStatement;
    .locals 2

    .prologue
    .line 60
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mUpdateCurrentBytes:Landroid/database/sqlite/SQLiteStatement;

    if-nez v0, :cond_0

    .line 61
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    const-string v1, "UPDATE DownloadColumns SET CURRENTBYTES = ? WHERE FILEIDX = ?"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mUpdateCurrentBytes:Landroid/database/sqlite/SQLiteStatement;

    .line 66
    :cond_0
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mUpdateCurrentBytes:Landroid/database/sqlite/SQLiteStatement;

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->close()V

    .line 135
    return-void
.end method

.method protected getDownloadInfoByFileName(Ljava/lang/String;)Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    .locals 10
    .parameter "fileName"

    .prologue
    const/4 v9, 0x0

    .line 92
    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 93
    .local v0, sqldb:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v8, 0x0

    .line 95
    .local v8, itemcur:Landroid/database/Cursor;
    :try_start_0
    const-string v1, "DownloadColumns"

    sget-object v2, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->DC_PROJECTION:[Ljava/lang/String;

    const-string v3, "FN = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 100
    if-eqz v8, :cond_1

    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 101
    invoke-virtual {p0, v8}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->getDownloadInfoFromCursor(Landroid/database/Cursor;)Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 104
    if-eqz v8, :cond_0

    .line 105
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 107
    :cond_0
    :goto_0
    return-object v1

    .line 104
    :cond_1
    if-eqz v8, :cond_2

    .line 105
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_2
    move-object v1, v9

    .line 107
    goto :goto_0

    .line 104
    :catchall_0
    move-exception v1

    if-eqz v8, :cond_3

    .line 105
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v1
.end method

.method public getDownloadInfoFromCursor(Landroid/database/Cursor;)Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    .locals 4
    .parameter "cur"

    .prologue
    .line 480
    new-instance v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    const/16 v1, 0xb

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    const/4 v2, 0x0

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 483
    .local v0, di:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    invoke-virtual {p0, v0, p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->setDownloadInfoFromCursor(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;Landroid/database/Cursor;)V

    .line 484
    return-object v0
.end method

.method public getDownloads()[Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    .locals 13

    .prologue
    const/4 v12, 0x0

    .line 488
    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 489
    .local v0, sqldb:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v8, 0x0

    .line 491
    .local v8, cur:Landroid/database/Cursor;
    :try_start_0
    const-string v1, "DownloadColumns"

    sget-object v2, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->DC_PROJECTION:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 493
    if-eqz v8, :cond_1

    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 494
    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v1

    new-array v12, v1, [Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    .line 495
    .local v12, retInfos:[Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    const/4 v10, 0x0

    .local v10, idx:I
    move v11, v10

    .line 497
    .end local v10           #idx:I
    .local v11, idx:I
    :goto_0
    invoke-virtual {p0, v8}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->getDownloadInfoFromCursor(Landroid/database/Cursor;)Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    move-result-object v9

    .line 498
    .local v9, di:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    add-int/lit8 v10, v11, 0x1

    .end local v11           #idx:I
    .restart local v10       #idx:I
    aput-object v9, v12, v11

    .line 499
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-nez v1, :cond_3

    .line 504
    if-eqz v8, :cond_0

    .line 505
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .end local v9           #di:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    .end local v10           #idx:I
    .end local v12           #retInfos:[Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    :cond_0
    :goto_1
    return-object v12

    .line 504
    :cond_1
    if-eqz v8, :cond_0

    .line 505
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 504
    :catchall_0
    move-exception v1

    if-eqz v8, :cond_2

    .line 505
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v1

    .restart local v9       #di:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    .restart local v10       #idx:I
    .restart local v12       #retInfos:[Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    :cond_3
    move v11, v10

    .end local v10           #idx:I
    .restart local v11       #idx:I
    goto :goto_0
.end method

.method public getFlags()I
    .locals 1

    .prologue
    .line 382
    iget v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mFlags:I

    return v0
.end method

.method public getIDByIndex(I)J
    .locals 5
    .parameter "index"

    .prologue
    .line 115
    invoke-direct {p0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->getDownloadByIndexStatement()Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 116
    .local v0, downloadByIndex:Landroid/database/sqlite/SQLiteStatement;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->clearBindings()V

    .line 117
    const/4 v2, 0x1

    int-to-long v3, p1

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 119
    :try_start_0
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->simpleQueryForLong()J
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteDoneException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    .line 121
    :goto_0
    return-wide v2

    .line 120
    :catch_0
    move-exception v1

    .line 121
    .local v1, e:Landroid/database/sqlite/SQLiteDoneException;
    const-wide/16 v2, -0x1

    goto :goto_0
.end method

.method public getIDForDownloadInfo(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;)J
    .locals 2
    .parameter "di"

    .prologue
    .line 111
    iget v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mIndex:I

    invoke-virtual {p0, v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->getIDByIndex(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getLastCheckedVersionCode()I
    .locals 1

    .prologue
    .line 362
    iget v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mVersionCode:I

    return v0
.end method

.method public isDownloadRequired()Z
    .locals 6

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 366
    iget-object v4, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 367
    .local v1, sqldb:Landroid/database/sqlite/SQLiteDatabase;
    const-string v4, "SELECT Count(*) FROM DownloadColumns WHERE STATUS <> 0"

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 371
    .local v0, cur:Landroid/database/Cursor;
    if-eqz v0, :cond_2

    :try_start_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 372
    const/4 v4, 0x0

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-nez v4, :cond_1

    .line 375
    :goto_0
    if-eqz v0, :cond_0

    .line 376
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 378
    :cond_0
    :goto_1
    return v2

    :cond_1
    move v2, v3

    .line 372
    goto :goto_0

    .line 375
    :cond_2
    if-eqz v0, :cond_0

    .line 376
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 375
    :catchall_0
    move-exception v2

    if-eqz v0, :cond_3

    .line 376
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v2
.end method

.method public setDownloadInfoFromCursor(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;Landroid/database/Cursor;)V
    .locals 2
    .parameter "di"
    .parameter "cur"

    .prologue
    .line 467
    const/4 v0, 0x1

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mUri:Ljava/lang/String;

    .line 468
    const/4 v0, 0x2

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mETag:Ljava/lang/String;

    .line 469
    const/4 v0, 0x3

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mTotalBytes:J

    .line 470
    const/4 v0, 0x4

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mCurrentBytes:J

    .line 471
    const/4 v0, 0x5

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mLastMod:J

    .line 472
    const/4 v0, 0x6

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mStatus:I

    .line 473
    const/4 v0, 0x7

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mControl:I

    .line 474
    const/16 v0, 0x8

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mNumFailed:I

    .line 475
    const/16 v0, 0x9

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mRetryAfter:I

    .line 476
    const/16 v0, 0xa

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mRedirectCount:I

    .line 477
    return-void
.end method

.method public updateDownload(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;)Z
    .locals 4
    .parameter "di"

    .prologue
    .line 326
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 327
    .local v0, cv:Landroid/content/ContentValues;
    const-string v1, "FILEIDX"

    iget v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mIndex:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 328
    const-string v1, "FN"

    iget-object v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mFileName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 329
    const-string v1, "URI"

    iget-object v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mUri:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 330
    const-string v1, "ETAG"

    iget-object v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mETag:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 331
    const-string v1, "TOTALBYTES"

    iget-wide v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mTotalBytes:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 332
    const-string v1, "CURRENTBYTES"

    iget-wide v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mCurrentBytes:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 333
    const-string v1, "LASTMOD"

    iget-wide v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mLastMod:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 334
    const-string v1, "STATUS"

    iget v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mStatus:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 335
    const-string v1, "CONTROL"

    iget v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mControl:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 336
    const-string v1, "FAILCOUNT"

    iget v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mNumFailed:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 337
    const-string v1, "RETRYAFTER"

    iget v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mRetryAfter:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 338
    const-string v1, "REDIRECTCOUNT"

    iget v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mRedirectCount:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 339
    invoke-virtual {p0, p1, v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->updateDownload(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;Landroid/content/ContentValues;)Z

    move-result v1

    return v1
.end method

.method public updateDownload(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;Landroid/content/ContentValues;)Z
    .locals 10
    .parameter "di"
    .parameter "cv"

    .prologue
    const/4 v6, 0x1

    const-wide/16 v4, -0x1

    const/4 v7, 0x0

    .line 343
    if-nez p1, :cond_1

    move-wide v1, v4

    .line 345
    .local v1, id:J
    :goto_0
    :try_start_0
    iget-object v8, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 346
    .local v3, sqldb:Landroid/database/sqlite/SQLiteDatabase;
    cmp-long v8, v1, v4

    if-eqz v8, :cond_2

    .line 347
    const-string v4, "DownloadColumns"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "DownloadColumns._id = "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v8, 0x0

    invoke-virtual {v3, v4, p2, v5, v8}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    if-eq v6, v4, :cond_0

    .line 358
    .end local v3           #sqldb:Landroid/database/sqlite/SQLiteDatabase;
    :cond_0
    :goto_1
    return v7

    .line 343
    .end local v1           #id:J
    :cond_1
    invoke-virtual {p0, p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->getIDForDownloadInfo(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;)J

    move-result-wide v1

    goto :goto_0

    .line 352
    .restart local v1       #id:J
    .restart local v3       #sqldb:Landroid/database/sqlite/SQLiteDatabase;
    :cond_2
    :try_start_1
    const-string v8, "DownloadColumns"

    const-string v9, "URI"

    invoke-virtual {v3, v8, v9, p2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-wide v8

    cmp-long v4, v4, v8

    if-eqz v4, :cond_3

    move v4, v6

    :goto_2
    move v7, v4

    goto :goto_1

    :cond_3
    move v4, v7

    goto :goto_2

    .line 355
    .end local v3           #sqldb:Landroid/database/sqlite/SQLiteDatabase;
    :catch_0
    move-exception v0

    .line 356
    .local v0, ex:Landroid/database/sqlite/SQLiteException;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    goto :goto_1
.end method

.method public updateDownloadCurrentBytes(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;)V
    .locals 4
    .parameter "di"

    .prologue
    .line 126
    invoke-direct {p0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->getUpdateCurrentBytesStatement()Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 127
    .local v0, downloadCurrentBytes:Landroid/database/sqlite/SQLiteStatement;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->clearBindings()V

    .line 128
    const/4 v1, 0x1

    iget-wide v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mCurrentBytes:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 129
    const/4 v1, 0x2

    iget v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mIndex:I

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 130
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    .line 131
    return-void
.end method

.method public updateFlags(I)Z
    .locals 4
    .parameter "flags"

    .prologue
    const/4 v1, 0x1

    .line 386
    iget v2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mFlags:I

    if-eq v2, p1, :cond_0

    .line 387
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 388
    .local v0, cv:Landroid/content/ContentValues;
    const-string v2, "DOWNLOADFLAGS"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 389
    invoke-virtual {p0, v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->updateMetadata(Landroid/content/ContentValues;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 390
    iput p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mFlags:I

    .line 396
    .end local v0           #cv:Landroid/content/ContentValues;
    :cond_0
    :goto_0
    return v1

    .line 393
    .restart local v0       #cv:Landroid/content/ContentValues;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public updateFromDb(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;)Z
    .locals 11
    .parameter "di"

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 446
    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 447
    .local v0, sqldb:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v8, 0x0

    .line 449
    .local v8, cur:Landroid/database/Cursor;
    :try_start_0
    const-string v1, "DownloadColumns"

    sget-object v2, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->DC_PROJECTION:[Ljava/lang/String;

    const-string v3, "FN= ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    iget-object v6, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mFileName:Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 454
    if-eqz v8, :cond_1

    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 455
    invoke-virtual {p0, p1, v8}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->setDownloadInfoFromCursor(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;Landroid/database/Cursor;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 460
    if-eqz v8, :cond_0

    .line 461
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_0
    move v1, v9

    :goto_0
    return v1

    .line 460
    :cond_1
    if-eqz v8, :cond_2

    .line 461
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_2
    move v1, v10

    goto :goto_0

    .line 460
    :catchall_0
    move-exception v1

    if-eqz v8, :cond_3

    .line 461
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v1
.end method

.method public updateMetadata(II)Z
    .locals 3
    .parameter "apkVersion"
    .parameter "downloadStatus"

    .prologue
    .line 433
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 434
    .local v0, cv:Landroid/content/ContentValues;
    const-string v1, "APKVERSION"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 435
    const-string v1, "DOWNLOADSTATUS"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 436
    invoke-virtual {p0, v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->updateMetadata(Landroid/content/ContentValues;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 437
    iput p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mVersionCode:I

    .line 438
    iput p2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mStatus:I

    .line 439
    const/4 v1, 0x1

    .line 441
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public updateMetadata(Landroid/content/ContentValues;)Z
    .locals 8
    .parameter "cv"

    .prologue
    const-wide/16 v6, -0x1

    const/4 v3, 0x0

    .line 417
    iget-object v4, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 418
    .local v2, sqldb:Landroid/database/sqlite/SQLiteDatabase;
    iget-wide v4, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mMetadataRowID:J

    cmp-long v4, v6, v4

    if-nez v4, :cond_2

    .line 419
    const-string v4, "MetadataColumns"

    const-string v5, "APKVERSION"

    invoke-virtual {v2, v4, v5, p1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    .line 421
    .local v0, newID:J
    cmp-long v4, v6, v0

    if-nez v4, :cond_0

    .line 429
    .end local v0           #newID:J
    :goto_0
    return v3

    .line 423
    .restart local v0       #newID:J
    :cond_0
    iput-wide v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mMetadataRowID:J

    .line 429
    .end local v0           #newID:J
    :cond_1
    const/4 v3, 0x1

    goto :goto_0

    .line 425
    :cond_2
    const-string v4, "MetadataColumns"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "_id = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-wide v6, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mMetadataRowID:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v2, v4, p1, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_1

    goto :goto_0
.end method

.method public updateStatus(I)Z
    .locals 4
    .parameter "status"

    .prologue
    const/4 v1, 0x1

    .line 401
    iget v2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mStatus:I

    if-eq v2, p1, :cond_0

    .line 402
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 403
    .local v0, cv:Landroid/content/ContentValues;
    const-string v2, "DOWNLOADSTATUS"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 404
    invoke-virtual {p0, v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->updateMetadata(Landroid/content/ContentValues;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 405
    iput p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->mStatus:I

    .line 411
    .end local v0           #cv:Landroid/content/ContentValues;
    :cond_0
    :goto_0
    return v1

    .line 408
    .restart local v0       #cv:Landroid/content/ContentValues;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

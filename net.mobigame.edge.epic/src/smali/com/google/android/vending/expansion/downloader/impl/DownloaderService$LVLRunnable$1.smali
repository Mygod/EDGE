.class Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable$1;
.super Ljava/lang/Object;
.source "DownloaderService.java"

# interfaces
.implements Lcom/google/android/vending/licensing/LicenseCheckerCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;

.field final synthetic val$aep:Lcom/google/android/vending/licensing/APKExpansionPolicy;


# direct methods
.method constructor <init>(Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;Lcom/google/android/vending/licensing/APKExpansionPolicy;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 763
    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable$1;->this$1:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;

    iput-object p2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable$1;->val$aep:Lcom/google/android/vending/licensing/APKExpansionPolicy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public allow(I)V
    .locals 15
    .parameter "reason"

    .prologue
    .line 768
    :try_start_0
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable$1;->val$aep:Lcom/google/android/vending/licensing/APKExpansionPolicy;

    invoke-virtual {v0}, Lcom/google/android/vending/licensing/APKExpansionPolicy;->getExpansionURLCount()I

    move-result v6

    .line 769
    .local v6, count:I
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable$1;->this$1:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;

    iget-object v0, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->getDB(Landroid/content/Context;)Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;

    move-result-object v1

    .line 770
    .local v1, db:Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;
    const/4 v12, 0x0

    .line 771
    .local v12, status:I
    if-eqz v6, :cond_3

    .line 772
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v6, :cond_3

    .line 773
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable$1;->val$aep:Lcom/google/android/vending/licensing/APKExpansionPolicy;

    invoke-virtual {v0, v2}, Lcom/google/android/vending/licensing/APKExpansionPolicy;->getExpansionFileName(I)Ljava/lang/String;

    move-result-object v3

    .line 775
    .local v3, currentFileName:Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 776
    new-instance v8, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable$1;->this$1:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;

    iget-object v0, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v8, v2, v3, v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 779
    .local v8, di:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable$1;->val$aep:Lcom/google/android/vending/licensing/APKExpansionPolicy;

    invoke-virtual {v0, v2}, Lcom/google/android/vending/licensing/APKExpansionPolicy;->getExpansionFileSize(I)J

    move-result-wide v4

    .line 780
    .local v4, fileSize:J
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable$1;->this$1:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;

    iget-object v0, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;->this$0:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->handleFileUpdated(Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;ILjava/lang/String;J)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 782
    or-int/lit8 v12, v12, -0x1

    .line 783
    invoke-virtual {v8}, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->resetDownload()V

    .line 784
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable$1;->val$aep:Lcom/google/android/vending/licensing/APKExpansionPolicy;

    invoke-virtual {v0, v2}, Lcom/google/android/vending/licensing/APKExpansionPolicy;->getExpansionURL(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v8, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mUri:Ljava/lang/String;

    .line 785
    iput-wide v4, v8, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mTotalBytes:J

    .line 786
    iput v12, v8, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mStatus:I

    .line 787
    invoke-virtual {v1, v8}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->updateDownload(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;)Z

    .line 772
    .end local v4           #fileSize:J
    .end local v8           #di:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 793
    .restart local v4       #fileSize:J
    .restart local v8       #di:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    :cond_1
    iget-object v0, v8, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mFileName:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->getDownloadInfoByFileName(Ljava/lang/String;)Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    move-result-object v7

    .line 795
    .local v7, dbdi:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    if-nez v7, :cond_2

    .line 802
    const-string v0, "LVLDL"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "file "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, v8, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mFileName:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " found. Not downloading."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v0, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 804
    const/16 v0, 0xc8

    iput v0, v8, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mStatus:I

    .line 805
    iput-wide v4, v8, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mTotalBytes:J

    .line 806
    iput-wide v4, v8, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mCurrentBytes:J

    .line 807
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable$1;->val$aep:Lcom/google/android/vending/licensing/APKExpansionPolicy;

    invoke-virtual {v0, v2}, Lcom/google/android/vending/licensing/APKExpansionPolicy;->getExpansionURL(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v8, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mUri:Ljava/lang/String;

    .line 808
    invoke-virtual {v1, v8}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->updateDownload(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 855
    .end local v1           #db:Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;
    .end local v2           #i:I
    .end local v3           #currentFileName:Ljava/lang/String;
    .end local v4           #fileSize:J
    .end local v6           #count:I
    .end local v7           #dbdi:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    .end local v8           #di:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    .end local v12           #status:I
    :catchall_0
    move-exception v0

    const/4 v13, 0x0

    #calls: Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->setServiceRunning(Z)V
    invoke-static {v13}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->access$100(Z)V

    throw v0

    .line 809
    .restart local v1       #db:Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;
    .restart local v2       #i:I
    .restart local v3       #currentFileName:Ljava/lang/String;
    .restart local v4       #fileSize:J
    .restart local v6       #count:I
    .restart local v7       #dbdi:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    .restart local v8       #di:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    .restart local v12       #status:I
    :cond_2
    :try_start_1
    iget v0, v7, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mStatus:I

    const/16 v13, 0xc8

    if-eq v0, v13, :cond_0

    .line 811
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable$1;->val$aep:Lcom/google/android/vending/licensing/APKExpansionPolicy;

    invoke-virtual {v0, v2}, Lcom/google/android/vending/licensing/APKExpansionPolicy;->getExpansionURL(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v7, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mUri:Ljava/lang/String;

    .line 812
    invoke-virtual {v1, v7}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->updateDownload(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 813
    or-int/lit8 v12, v12, -0x1

    goto :goto_1

    .line 824
    .end local v2           #i:I
    .end local v3           #currentFileName:Ljava/lang/String;
    .end local v4           #fileSize:J
    .end local v7           #dbdi:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    .end local v8           #di:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;
    :cond_3
    :try_start_2
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable$1;->this$1:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;

    iget-object v0, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v13, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable$1;->this$1:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;

    iget-object v13, v13, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;->mContext:Landroid/content/Context;

    invoke-virtual {v13}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual {v0, v13, v14}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v10

    .line 826
    .local v10, pi:Landroid/content/pm/PackageInfo;
    iget v0, v10, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v1, v0, v12}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->updateMetadata(II)Z

    .line 827
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable$1;->this$1:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;

    iget-object v0, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;->this$0:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    .line 828
    .local v11, serviceClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable$1;->this$1:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;

    iget-object v0, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;->mContext:Landroid/content/Context;

    iget-object v13, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable$1;->this$1:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;

    iget-object v13, v13, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;->this$0:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;

    #getter for: Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->mPendingIntent:Landroid/app/PendingIntent;
    invoke-static {v13}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->access$000(Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;)Landroid/app/PendingIntent;

    move-result-object v13

    invoke-static {v0, v13, v11}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->startDownloadServiceIfRequired(Landroid/content/Context;Landroid/app/PendingIntent;Ljava/lang/Class;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_0

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 855
    :goto_2
    const/4 v0, 0x0

    #calls: Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->setServiceRunning(Z)V
    invoke-static {v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->access$100(Z)V

    .line 857
    return-void

    .line 831
    :pswitch_0
    :try_start_3
    const-string v0, "LVLDL"

    const-string v13, "No download required"

    invoke-static {v0, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 832
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable$1;->this$1:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;

    iget-object v0, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;->this$0:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;

    #getter for: Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->mNotification:Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;
    invoke-static {v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->access$200(Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;)Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;

    move-result-object v0

    const/4 v13, 0x5

    invoke-virtual {v0, v13}, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->onDownloadStateChanged(I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_2

    .line 849
    .end local v10           #pi:Landroid/content/pm/PackageInfo;
    .end local v11           #serviceClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :catch_0
    move-exception v9

    .line 850
    .local v9, e1:Landroid/content/pm/PackageManager$NameNotFoundException;
    :try_start_4
    invoke-virtual {v9}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 851
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v13, "Error with getting information from package name"

    invoke-direct {v0, v13}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 837
    .end local v9           #e1:Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v10       #pi:Landroid/content/pm/PackageInfo;
    .restart local v11       #serviceClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :pswitch_1
    :try_start_5
    const-string v0, "LVLDL"

    const-string v13, "In LVL checking loop!"

    invoke-static {v0, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 838
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable$1;->this$1:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;

    iget-object v0, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;->this$0:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;

    #getter for: Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->mNotification:Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;
    invoke-static {v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->access$200(Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;)Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;

    move-result-object v0

    const/16 v13, 0xd

    invoke-virtual {v0, v13}, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->onDownloadStateChanged(I)V

    .line 840
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v13, "Error with LVL checking and database integrity"

    invoke-direct {v0, v13}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 843
    :pswitch_2
    const-string v0, "LVLDL"

    const-string v13, "Download required"

    invoke-static {v0, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_2

    .line 828
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public applicationError(I)V
    .locals 3
    .parameter "errorCode"

    .prologue
    const/4 v2, 0x0

    .line 882
    :try_start_0
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable$1;->this$1:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;

    iget-object v0, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;->this$0:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;

    #getter for: Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->mNotification:Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;
    invoke-static {v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->access$200(Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;)Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;

    move-result-object v0

    const/16 v1, 0xe

    invoke-virtual {v0, v1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->onDownloadStateChanged(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 885
    #calls: Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->setServiceRunning(Z)V
    invoke-static {v2}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->access$100(Z)V

    .line 887
    return-void

    .line 885
    :catchall_0
    move-exception v0

    #calls: Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->setServiceRunning(Z)V
    invoke-static {v2}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->access$100(Z)V

    throw v0
.end method

.method public dontAllow(I)V
    .locals 3
    .parameter "reason"

    .prologue
    const/4 v2, 0x0

    .line 863
    sparse-switch p1, :sswitch_data_0

    .line 874
    :goto_0
    #calls: Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->setServiceRunning(Z)V
    invoke-static {v2}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->access$100(Z)V

    .line 877
    return-void

    .line 865
    :sswitch_0
    :try_start_0
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable$1;->this$1:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;

    iget-object v0, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;->this$0:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;

    #getter for: Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->mNotification:Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;
    invoke-static {v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->access$200(Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;)Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;

    move-result-object v0

    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->onDownloadStateChanged(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 874
    :catchall_0
    move-exception v0

    #calls: Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->setServiceRunning(Z)V
    invoke-static {v2}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->access$100(Z)V

    throw v0

    .line 869
    :sswitch_1
    :try_start_1
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable$1;->this$1:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;

    iget-object v0, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$LVLRunnable;->this$0:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;

    #getter for: Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->mNotification:Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;
    invoke-static {v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->access$200(Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;)Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;

    move-result-object v0

    const/16 v1, 0xe

    invoke-virtual {v0, v1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->onDownloadStateChanged(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 863
    nop

    :sswitch_data_0
    .sparse-switch
        0x123 -> :sswitch_1
        0x231 -> :sswitch_0
    .end sparse-switch
.end method

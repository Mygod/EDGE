.class public Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;
.super Ljava/lang/Object;
.source "V11CustomNotification.java"

# interfaces
.implements Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification$ICustomNotification;


# instance fields
.field mCurrentKB:J

.field mIcon:I

.field mPausedText:Ljava/lang/CharSequence;

.field mPendingIntent:Landroid/app/PendingIntent;

.field mTicker:Ljava/lang/CharSequence;

.field mTimeRemaining:J

.field mTitle:Ljava/lang/CharSequence;

.field mTotalKB:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const-wide/16 v0, -0x1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-wide v0, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mTotalKB:J

    .line 31
    iput-wide v0, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mCurrentKB:J

    return-void
.end method


# virtual methods
.method public setCurrentBytes(J)V
    .locals 0
    .parameter "currentBytes"

    .prologue
    .line 57
    iput-wide p1, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mCurrentKB:J

    .line 58
    return-void
.end method

.method public setIcon(I)V
    .locals 0
    .parameter "icon"

    .prologue
    .line 37
    iput p1, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mIcon:I

    .line 38
    return-void
.end method

.method public setPausedText(Ljava/lang/CharSequence;)V
    .locals 0
    .parameter "pausedText"

    .prologue
    .line 47
    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mPausedText:Ljava/lang/CharSequence;

    .line 48
    return-void
.end method

.method public setPendingIntent(Landroid/app/PendingIntent;)V
    .locals 0
    .parameter "contentIntent"

    .prologue
    .line 96
    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mPendingIntent:Landroid/app/PendingIntent;

    .line 97
    return-void
.end method

.method public setTicker(Ljava/lang/CharSequence;)V
    .locals 0
    .parameter "ticker"

    .prologue
    .line 101
    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mTicker:Ljava/lang/CharSequence;

    .line 102
    return-void
.end method

.method public setTimeRemaining(J)V
    .locals 0
    .parameter "timeRemaining"

    .prologue
    .line 106
    iput-wide p1, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mTimeRemaining:J

    .line 107
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 0
    .parameter "title"

    .prologue
    .line 42
    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mTitle:Ljava/lang/CharSequence;

    .line 43
    return-void
.end method

.method public setTotalBytes(J)V
    .locals 0
    .parameter "totalBytes"

    .prologue
    .line 52
    iput-wide p1, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mTotalKB:J

    .line 53
    return-void
.end method

.method public updateNotification(Landroid/content/Context;)Landroid/app/Notification;
    .locals 10
    .parameter "c"

    .prologue
    const/16 v9, 0x8

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 62
    new-instance v0, Landroid/app/Notification$Builder;

    invoke-direct {v0, p1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 63
    .local v0, builder:Landroid/app/Notification$Builder;
    iget-object v5, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mPausedText:Ljava/lang/CharSequence;

    if-eqz v5, :cond_0

    move v1, v3

    .line 64
    .local v1, hasPausedText:Z
    :goto_0
    if-eqz v1, :cond_1

    .line 65
    iget-object v4, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mPausedText:Ljava/lang/CharSequence;

    invoke-virtual {v0, v4}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 66
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 67
    const-string v4, ""

    invoke-virtual {v0, v4}, Landroid/app/Notification$Builder;->setContentInfo(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 78
    :goto_1
    iget v4, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mIcon:I

    if-eqz v4, :cond_3

    .line 79
    iget v4, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mIcon:I

    invoke-virtual {v0, v4}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    .line 87
    :goto_2
    invoke-virtual {v0, v3}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    .line 88
    iget-object v3, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mTicker:Ljava/lang/CharSequence;

    invoke-virtual {v0, v3}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 89
    iget-object v3, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mPendingIntent:Landroid/app/PendingIntent;

    invoke-virtual {v0, v3}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 91
    invoke-virtual {v0}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v3

    return-object v3

    .end local v1           #hasPausedText:Z
    :cond_0
    move v1, v4

    .line 63
    goto :goto_0

    .line 69
    .restart local v1       #hasPausedText:Z
    :cond_1
    iget-object v5, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {v0, v5}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 70
    iget-wide v5, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mTotalKB:J

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-lez v5, :cond_2

    const-wide/16 v5, -0x1

    iget-wide v7, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mCurrentKB:J

    cmp-long v5, v5, v7

    if-eqz v5, :cond_2

    .line 71
    iget-wide v5, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mTotalKB:J

    shr-long/2addr v5, v9

    long-to-int v5, v5

    iget-wide v6, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mCurrentKB:J

    shr-long/2addr v6, v9

    long-to-int v6, v6

    invoke-virtual {v0, v5, v6, v4}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    .line 75
    :goto_3
    iget-wide v5, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mCurrentKB:J

    iget-wide v7, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mTotalKB:J

    invoke-static {v5, v6, v7, v8}, Lcom/google/android/vending/expansion/downloader/Helpers;->getDownloadProgressString(JJ)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 76
    sget v5, Lcom/android/vending/expansion/downloader/R$string;->time_remaining_notification:I

    new-array v6, v3, [Ljava/lang/Object;

    iget-wide v7, p0, Lcom/google/android/vending/expansion/downloader/impl/V11CustomNotification;->mTimeRemaining:J

    invoke-static {v7, v8}, Lcom/google/android/vending/expansion/downloader/Helpers;->getTimeRemaining(J)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v4

    invoke-virtual {p1, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/app/Notification$Builder;->setContentInfo(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    goto :goto_1

    .line 73
    :cond_2
    invoke-virtual {v0, v4, v4, v3}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    goto :goto_3

    .line 81
    :cond_3
    const v2, 0x1080081

    .line 82
    .local v2, iconResource:I
    if-eqz v1, :cond_4

    .line 83
    const v2, 0x108008a

    .line 85
    :cond_4
    invoke-virtual {v0, v2}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    goto :goto_2
.end method

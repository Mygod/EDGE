.class public Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;
.super Ljava/lang/Object;
.source "V3CustomNotification.java"

# interfaces
.implements Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification$ICustomNotification;


# instance fields
.field mCurrentBytes:J

.field mIcon:I

.field mNotification:Landroid/app/Notification;

.field mPausedText:Ljava/lang/CharSequence;

.field mPendingIntent:Landroid/app/PendingIntent;

.field mTicker:Ljava/lang/CharSequence;

.field mTimeRemaining:J

.field mTitle:Ljava/lang/CharSequence;

.field mTotalBytes:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const-wide/16 v0, -0x1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-wide v0, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mTotalBytes:J

    .line 33
    iput-wide v0, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mCurrentBytes:J

    .line 36
    new-instance v0, Landroid/app/Notification;

    invoke-direct {v0}, Landroid/app/Notification;-><init>()V

    iput-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mNotification:Landroid/app/Notification;

    return-void
.end method


# virtual methods
.method public setCurrentBytes(J)V
    .locals 0
    .parameter "currentBytes"

    .prologue
    .line 62
    iput-wide p1, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mCurrentBytes:J

    .line 63
    return-void
.end method

.method public setIcon(I)V
    .locals 0
    .parameter "icon"

    .prologue
    .line 42
    iput p1, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mIcon:I

    .line 43
    return-void
.end method

.method public setPausedText(Ljava/lang/CharSequence;)V
    .locals 0
    .parameter "pausedText"

    .prologue
    .line 52
    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mPausedText:Ljava/lang/CharSequence;

    .line 53
    return-void
.end method

.method public setPendingIntent(Landroid/app/PendingIntent;)V
    .locals 0
    .parameter "contentIntent"

    .prologue
    .line 109
    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mPendingIntent:Landroid/app/PendingIntent;

    .line 110
    return-void
.end method

.method public setTicker(Ljava/lang/CharSequence;)V
    .locals 0
    .parameter "ticker"

    .prologue
    .line 114
    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mTicker:Ljava/lang/CharSequence;

    .line 115
    return-void
.end method

.method public setTimeRemaining(J)V
    .locals 0
    .parameter "timeRemaining"

    .prologue
    .line 119
    iput-wide p1, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mTimeRemaining:J

    .line 120
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 0
    .parameter "title"

    .prologue
    .line 47
    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mTitle:Ljava/lang/CharSequence;

    .line 48
    return-void
.end method

.method public setTotalBytes(J)V
    .locals 0
    .parameter "totalBytes"

    .prologue
    .line 57
    iput-wide p1, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mTotalBytes:J

    .line 58
    return-void
.end method

.method public updateNotification(Landroid/content/Context;)Landroid/app/Notification;
    .locals 13
    .parameter "c"

    .prologue
    const/4 v3, 0x1

    const/16 v10, 0x8

    const/4 v4, 0x0

    .line 67
    iget-object v2, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mNotification:Landroid/app/Notification;

    .line 69
    .local v2, n:Landroid/app/Notification;
    iget-object v5, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mPausedText:Ljava/lang/CharSequence;

    if-eqz v5, :cond_0

    move v1, v3

    .line 70
    .local v1, hasPausedText:Z
    :goto_0
    iget v5, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mIcon:I

    iput v5, v2, Landroid/app/Notification;->icon:I

    .line 72
    iget v5, v2, Landroid/app/Notification;->flags:I

    or-int/lit8 v5, v5, 0x2

    iput v5, v2, Landroid/app/Notification;->flags:I

    .line 75
    new-instance v0, Landroid/widget/RemoteViews;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    sget v6, Lcom/android/vending/expansion/downloader/R$layout;->status_bar_ongoing_event_progress_bar:I

    invoke-direct {v0, v5, v6}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 80
    .local v0, expandedView:Landroid/widget/RemoteViews;
    if-eqz v1, :cond_1

    .line 81
    sget v3, Lcom/android/vending/expansion/downloader/R$id;->progress_bar_frame:I

    invoke-virtual {v0, v3, v10}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 82
    sget v3, Lcom/android/vending/expansion/downloader/R$id;->description:I

    invoke-virtual {v0, v3, v10}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 83
    sget v3, Lcom/android/vending/expansion/downloader/R$id;->paused_text:I

    iget-object v4, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mPausedText:Ljava/lang/CharSequence;

    invoke-virtual {v0, v3, v4}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 84
    sget v3, Lcom/android/vending/expansion/downloader/R$id;->time_remaining:I

    invoke-virtual {v0, v3, v10}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 99
    :goto_1
    sget v3, Lcom/android/vending/expansion/downloader/R$id;->progress_text:I

    iget-wide v4, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mCurrentBytes:J

    iget-wide v6, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mTotalBytes:J

    invoke-static {v4, v5, v6, v7}, Lcom/google/android/vending/expansion/downloader/Helpers;->getDownloadProgressPercent(JJ)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 101
    sget v3, Lcom/android/vending/expansion/downloader/R$id;->appIcon:I

    iget v4, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mIcon:I

    invoke-virtual {v0, v3, v4}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 102
    iput-object v0, v2, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    .line 103
    iget-object v3, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mPendingIntent:Landroid/app/PendingIntent;

    iput-object v3, v2, Landroid/app/Notification;->contentIntent:Landroid/app/PendingIntent;

    .line 104
    return-object v2

    .end local v0           #expandedView:Landroid/widget/RemoteViews;
    .end local v1           #hasPausedText:Z
    :cond_0
    move v1, v4

    .line 69
    goto :goto_0

    .line 86
    .restart local v0       #expandedView:Landroid/widget/RemoteViews;
    .restart local v1       #hasPausedText:Z
    :cond_1
    sget v5, Lcom/android/vending/expansion/downloader/R$id;->title:I

    iget-object v6, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {v0, v5, v6}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 88
    sget v5, Lcom/android/vending/expansion/downloader/R$id;->description:I

    invoke-virtual {v0, v5, v4}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 89
    sget v5, Lcom/android/vending/expansion/downloader/R$id;->description:I

    iget-wide v6, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mCurrentBytes:J

    iget-wide v8, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mTotalBytes:J

    invoke-static {v6, v7, v8, v9}, Lcom/google/android/vending/expansion/downloader/Helpers;->getDownloadProgressString(JJ)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 90
    sget v5, Lcom/android/vending/expansion/downloader/R$id;->progress_bar_frame:I

    invoke-virtual {v0, v5, v4}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 91
    sget v5, Lcom/android/vending/expansion/downloader/R$id;->paused_text:I

    invoke-virtual {v0, v5, v10}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 92
    sget v6, Lcom/android/vending/expansion/downloader/R$id;->progress_bar:I

    iget-wide v7, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mTotalBytes:J

    shr-long/2addr v7, v10

    long-to-int v7, v7

    iget-wide v8, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mCurrentBytes:J

    shr-long/2addr v8, v10

    long-to-int v8, v8

    iget-wide v9, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mTotalBytes:J

    const-wide/16 v11, 0x0

    cmp-long v5, v9, v11

    if-gtz v5, :cond_2

    move v5, v3

    :goto_2
    invoke-virtual {v0, v6, v7, v8, v5}, Landroid/widget/RemoteViews;->setProgressBar(IIIZ)V

    .line 96
    sget v5, Lcom/android/vending/expansion/downloader/R$id;->time_remaining:I

    invoke-virtual {v0, v5, v4}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 97
    sget v5, Lcom/android/vending/expansion/downloader/R$id;->time_remaining:I

    sget v6, Lcom/android/vending/expansion/downloader/R$string;->time_remaining_notification:I

    new-array v3, v3, [Ljava/lang/Object;

    iget-wide v7, p0, Lcom/google/android/vending/expansion/downloader/impl/V3CustomNotification;->mTimeRemaining:J

    invoke-static {v7, v8}, Lcom/google/android/vending/expansion/downloader/Helpers;->getTimeRemaining(J)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v4

    invoke-virtual {p1, v6, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v5, v3}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    goto :goto_1

    :cond_2
    move v5, v4

    .line 92
    goto :goto_2
.end method

.class public Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;
.super Ljava/lang/Object;
.source "DownloadNotification.java"

# interfaces
.implements Lcom/google/android/vending/expansion/downloader/IDownloaderClient;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification$ICustomNotification;
    }
.end annotation


# static fields
.field static final LOGTAG:Ljava/lang/String; = "DownloadNotification"

.field static final NOTIFICATION_ID:I


# instance fields
.field private mClientProxy:Lcom/google/android/vending/expansion/downloader/IDownloaderClient;

.field private mContentIntent:Landroid/app/PendingIntent;

.field private final mContext:Landroid/content/Context;

.field private mCurrentNotification:Landroid/app/Notification;

.field private mCurrentText:Ljava/lang/String;

.field private mCurrentTitle:Ljava/lang/String;

.field final mCustomNotification:Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification$ICustomNotification;

.field private mLabel:Ljava/lang/CharSequence;

.field private mNotification:Landroid/app/Notification;

.field private final mNotificationManager:Landroid/app/NotificationManager;

.field private mProgressInfo:Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;

.field private mState:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 57
    const-string v0, "DownloadNotification"

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    sput v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->NOTIFICATION_ID:I

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Ljava/lang/CharSequence;)V
    .locals 2
    .parameter "ctx"
    .parameter "applicationLabel"

    .prologue
    .line 214
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 215
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mState:I

    .line 216
    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mContext:Landroid/content/Context;

    .line 217
    iput-object p2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mLabel:Ljava/lang/CharSequence;

    .line 218
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mContext:Landroid/content/Context;

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mNotificationManager:Landroid/app/NotificationManager;

    .line 220
    invoke-static {}, Lcom/google/android/vending/expansion/downloader/impl/CustomNotificationFactory;->createCustomNotification()Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification$ICustomNotification;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCustomNotification:Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification$ICustomNotification;

    .line 222
    new-instance v0, Landroid/app/Notification;

    invoke-direct {v0}, Landroid/app/Notification;-><init>()V

    iput-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mNotification:Landroid/app/Notification;

    .line 223
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mNotification:Landroid/app/Notification;

    iput-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentNotification:Landroid/app/Notification;

    .line 225
    return-void
.end method


# virtual methods
.method public getClientIntent()Landroid/app/PendingIntent;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mContentIntent:Landroid/app/PendingIntent;

    return-object v0
.end method

.method public onDownloadProgress(Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;)V
    .locals 5
    .parameter "progress"

    .prologue
    const v4, 0x1080081

    .line 149
    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mProgressInfo:Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;

    .line 150
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mClientProxy:Lcom/google/android/vending/expansion/downloader/IDownloaderClient;

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mClientProxy:Lcom/google/android/vending/expansion/downloader/IDownloaderClient;

    invoke-interface {v0, p1}, Lcom/google/android/vending/expansion/downloader/IDownloaderClient;->onDownloadProgress(Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;)V

    .line 153
    :cond_0
    iget-wide v0, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mOverallTotal:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_1

    .line 155
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mNotification:Landroid/app/Notification;

    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentTitle:Ljava/lang/String;

    iput-object v1, v0, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 156
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mNotification:Landroid/app/Notification;

    iput v4, v0, Landroid/app/Notification;->icon:I

    .line 157
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mNotification:Landroid/app/Notification;

    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mLabel:Ljava/lang/CharSequence;

    iget-object v3, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentText:Ljava/lang/String;

    iget-object v4, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mContentIntent:Landroid/app/PendingIntent;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 158
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mNotification:Landroid/app/Notification;

    iput-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentNotification:Landroid/app/Notification;

    .line 169
    :goto_0
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mNotificationManager:Landroid/app/NotificationManager;

    sget v1, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->NOTIFICATION_ID:I

    iget-object v2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentNotification:Landroid/app/Notification;

    invoke-virtual {v0, v1, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 170
    return-void

    .line 160
    :cond_1
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCustomNotification:Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification$ICustomNotification;

    iget-wide v1, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mOverallProgress:J

    invoke-interface {v0, v1, v2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification$ICustomNotification;->setCurrentBytes(J)V

    .line 161
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCustomNotification:Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification$ICustomNotification;

    iget-wide v1, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mOverallTotal:J

    invoke-interface {v0, v1, v2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification$ICustomNotification;->setTotalBytes(J)V

    .line 162
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCustomNotification:Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification$ICustomNotification;

    invoke-interface {v0, v4}, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification$ICustomNotification;->setIcon(I)V

    .line 163
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCustomNotification:Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification$ICustomNotification;

    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mContentIntent:Landroid/app/PendingIntent;

    invoke-interface {v0, v1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification$ICustomNotification;->setPendingIntent(Landroid/app/PendingIntent;)V

    .line 164
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCustomNotification:Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification$ICustomNotification;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mLabel:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentText:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification$ICustomNotification;->setTicker(Ljava/lang/CharSequence;)V

    .line 165
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCustomNotification:Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification$ICustomNotification;

    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mLabel:Ljava/lang/CharSequence;

    invoke-interface {v0, v1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification$ICustomNotification;->setTitle(Ljava/lang/CharSequence;)V

    .line 166
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCustomNotification:Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification$ICustomNotification;

    iget-wide v1, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mTimeRemaining:J

    invoke-interface {v0, v1, v2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification$ICustomNotification;->setTimeRemaining(J)V

    .line 167
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCustomNotification:Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification$ICustomNotification;

    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-interface {v0, v1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification$ICustomNotification;->updateNotification(Landroid/content/Context;)Landroid/app/Notification;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentNotification:Landroid/app/Notification;

    goto :goto_0
.end method

.method public onDownloadStateChanged(I)V
    .locals 8
    .parameter "newState"

    .prologue
    .line 75
    iget-object v3, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mClientProxy:Lcom/google/android/vending/expansion/downloader/IDownloaderClient;

    if-eqz v3, :cond_0

    .line 76
    iget-object v3, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mClientProxy:Lcom/google/android/vending/expansion/downloader/IDownloaderClient;

    invoke-interface {v3, p1}, Lcom/google/android/vending/expansion/downloader/IDownloaderClient;->onDownloadStateChanged(I)V

    .line 78
    :cond_0
    iget v3, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mState:I

    if-eq p1, v3, :cond_1

    .line 79
    iput p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mState:I

    .line 80
    const/4 v3, 0x1

    if-eq p1, v3, :cond_1

    iget-object v3, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mContentIntent:Landroid/app/PendingIntent;

    if-nez v3, :cond_2

    .line 145
    :cond_1
    :goto_0
    return-void

    .line 88
    :cond_2
    packed-switch p1, :pswitch_data_0

    .line 126
    :pswitch_0
    const v0, 0x108008a

    .line 127
    .local v0, iconResource:I
    invoke-static {p1}, Lcom/google/android/vending/expansion/downloader/Helpers;->getDownloaderStringResourceIDFromState(I)I

    move-result v2

    .line 128
    .local v2, stringDownloadID:I
    const/4 v1, 0x1

    .line 131
    .local v1, ongoingEvent:Z
    :goto_1
    iget-object v3, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentText:Ljava/lang/String;

    .line 132
    iget-object v3, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mLabel:Ljava/lang/CharSequence;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentTitle:Ljava/lang/String;

    .line 133
    iget-object v3, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentNotification:Landroid/app/Notification;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mLabel:Ljava/lang/CharSequence;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentText:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 134
    iget-object v3, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentNotification:Landroid/app/Notification;

    iput v0, v3, Landroid/app/Notification;->icon:I

    .line 135
    iget-object v3, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentNotification:Landroid/app/Notification;

    iget-object v4, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentTitle:Ljava/lang/String;

    iget-object v6, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentText:Ljava/lang/String;

    iget-object v7, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mContentIntent:Landroid/app/PendingIntent;

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 137
    if-eqz v1, :cond_3

    .line 138
    iget-object v3, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentNotification:Landroid/app/Notification;

    iget v4, v3, Landroid/app/Notification;->flags:I

    or-int/lit8 v4, v4, 0x2

    iput v4, v3, Landroid/app/Notification;->flags:I

    .line 143
    :goto_2
    iget-object v3, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mNotificationManager:Landroid/app/NotificationManager;

    sget v4, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->NOTIFICATION_ID:I

    iget-object v5, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentNotification:Landroid/app/Notification;

    invoke-virtual {v3, v4, v5}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto :goto_0

    .line 90
    .end local v0           #iconResource:I
    .end local v1           #ongoingEvent:Z
    .end local v2           #stringDownloadID:I
    :pswitch_1
    const v0, 0x108008a

    .line 91
    .restart local v0       #iconResource:I
    sget v2, Lcom/android/vending/expansion/downloader/R$string;->state_unknown:I

    .line 92
    .restart local v2       #stringDownloadID:I
    const/4 v1, 0x0

    .line 93
    .restart local v1       #ongoingEvent:Z
    goto :goto_1

    .line 96
    .end local v0           #iconResource:I
    .end local v1           #ongoingEvent:Z
    .end local v2           #stringDownloadID:I
    :pswitch_2
    const v0, 0x1080081

    .line 97
    .restart local v0       #iconResource:I
    invoke-static {p1}, Lcom/google/android/vending/expansion/downloader/Helpers;->getDownloaderStringResourceIDFromState(I)I

    move-result v2

    .line 98
    .restart local v2       #stringDownloadID:I
    const/4 v1, 0x1

    .line 99
    .restart local v1       #ongoingEvent:Z
    goto :goto_1

    .line 103
    .end local v0           #iconResource:I
    .end local v1           #ongoingEvent:Z
    .end local v2           #stringDownloadID:I
    :pswitch_3
    const v0, 0x1080082

    .line 104
    .restart local v0       #iconResource:I
    invoke-static {p1}, Lcom/google/android/vending/expansion/downloader/Helpers;->getDownloaderStringResourceIDFromState(I)I

    move-result v2

    .line 105
    .restart local v2       #stringDownloadID:I
    const/4 v1, 0x1

    .line 106
    .restart local v1       #ongoingEvent:Z
    goto :goto_1

    .line 110
    .end local v0           #iconResource:I
    .end local v1           #ongoingEvent:Z
    .end local v2           #stringDownloadID:I
    :pswitch_4
    const v0, 0x1080082

    .line 111
    .restart local v0       #iconResource:I
    invoke-static {p1}, Lcom/google/android/vending/expansion/downloader/Helpers;->getDownloaderStringResourceIDFromState(I)I

    move-result v2

    .line 112
    .restart local v2       #stringDownloadID:I
    const/4 v1, 0x0

    .line 113
    .restart local v1       #ongoingEvent:Z
    goto :goto_1

    .line 120
    .end local v0           #iconResource:I
    .end local v1           #ongoingEvent:Z
    .end local v2           #stringDownloadID:I
    :pswitch_5
    const v0, 0x108008a

    .line 121
    .restart local v0       #iconResource:I
    invoke-static {p1}, Lcom/google/android/vending/expansion/downloader/Helpers;->getDownloaderStringResourceIDFromState(I)I

    move-result v2

    .line 122
    .restart local v2       #stringDownloadID:I
    const/4 v1, 0x0

    .line 123
    .restart local v1       #ongoingEvent:Z
    goto :goto_1

    .line 140
    :cond_3
    iget-object v3, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentNotification:Landroid/app/Notification;

    iget v4, v3, Landroid/app/Notification;->flags:I

    and-int/lit8 v4, v4, -0x3

    iput v4, v3, Landroid/app/Notification;->flags:I

    .line 141
    iget-object v3, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mCurrentNotification:Landroid/app/Notification;

    iget v4, v3, Landroid/app/Notification;->flags:I

    or-int/lit8 v4, v4, 0x10

    iput v4, v3, Landroid/app/Notification;->flags:I

    goto :goto_2

    .line 88
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_4
        :pswitch_0
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
    .end packed-switch
.end method

.method public onServiceConnected(Landroid/os/Messenger;)V
    .locals 0
    .parameter "m"

    .prologue
    .line 229
    return-void
.end method

.method public resendState()V
    .locals 2

    .prologue
    .line 68
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mClientProxy:Lcom/google/android/vending/expansion/downloader/IDownloaderClient;

    if-eqz v0, :cond_0

    .line 69
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mClientProxy:Lcom/google/android/vending/expansion/downloader/IDownloaderClient;

    iget v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mState:I

    invoke-interface {v0, v1}, Lcom/google/android/vending/expansion/downloader/IDownloaderClient;->onDownloadStateChanged(I)V

    .line 71
    :cond_0
    return-void
.end method

.method public setClientIntent(Landroid/app/PendingIntent;)V
    .locals 0
    .parameter "mClientIntent"

    .prologue
    .line 64
    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mContentIntent:Landroid/app/PendingIntent;

    .line 65
    return-void
.end method

.method public setMessenger(Landroid/os/Messenger;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 199
    invoke-static {p1}, Lcom/google/android/vending/expansion/downloader/DownloaderClientMarshaller;->CreateProxy(Landroid/os/Messenger;)Lcom/google/android/vending/expansion/downloader/IDownloaderClient;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mClientProxy:Lcom/google/android/vending/expansion/downloader/IDownloaderClient;

    .line 200
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mProgressInfo:Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;

    if-eqz v0, :cond_0

    .line 201
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mClientProxy:Lcom/google/android/vending/expansion/downloader/IDownloaderClient;

    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mProgressInfo:Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;

    invoke-interface {v0, v1}, Lcom/google/android/vending/expansion/downloader/IDownloaderClient;->onDownloadProgress(Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;)V

    .line 203
    :cond_0
    iget v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mState:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 204
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mClientProxy:Lcom/google/android/vending/expansion/downloader/IDownloaderClient;

    iget v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->mState:I

    invoke-interface {v0, v1}, Lcom/google/android/vending/expansion/downloader/IDownloaderClient;->onDownloadStateChanged(I)V

    .line 206
    :cond_1
    return-void
.end method

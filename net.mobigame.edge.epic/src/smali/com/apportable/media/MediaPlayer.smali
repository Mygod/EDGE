.class public Lcom/apportable/media/MediaPlayer;
.super Ljava/lang/Object;
.source "MediaPlayer.java"


# static fields
.field private static TAG:Ljava/lang/String;


# instance fields
.field MAX_SOURCES:I

.field private mSources:[Lcom/apportable/media/MediaPlayerItem;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 52
    const-string v0, "MediaPlayer"

    sput-object v0, Lcom/apportable/media/MediaPlayer;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 67
    const/16 v0, 0x14

    invoke-direct {p0, v0}, Lcom/apportable/media/MediaPlayer;-><init>(I)V

    .line 68
    return-void
.end method

.method public constructor <init>(I)V
    .locals 3
    .parameter "max"

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput p1, p0, Lcom/apportable/media/MediaPlayer;->MAX_SOURCES:I

    .line 58
    sget-object v1, Lcom/apportable/media/MediaPlayer;->TAG:Ljava/lang/String;

    const-string v2, "Verde MediaPlayer init:"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    iget v1, p0, Lcom/apportable/media/MediaPlayer;->MAX_SOURCES:I

    new-array v1, v1, [Lcom/apportable/media/MediaPlayerItem;

    iput-object v1, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    .line 61
    const/4 v0, 0x0

    .local v0, audioID:I
    :goto_0
    iget v1, p0, Lcom/apportable/media/MediaPlayer;->MAX_SOURCES:I

    if-ge v0, v1, :cond_0

    .line 62
    iget-object v1, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    const/4 v2, 0x0

    aput-object v2, v1, v0

    .line 61
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 64
    :cond_0
    return-void
.end method


# virtual methods
.method public isAudioPlaying(I)Z
    .locals 1
    .parameter "audioID"

    .prologue
    .line 172
    iget-object v0, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v0, v0, p1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/apportable/media/MediaPlayerItem;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 173
    iget-object v0, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/apportable/media/MediaPlayerItem;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    .line 175
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public lifecycleResume()V
    .locals 3

    .prologue
    .line 192
    sget-object v1, Lcom/apportable/media/MediaPlayer;->TAG:Ljava/lang/String;

    const-string v2, "lifecycleResumeAudio:"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    const/4 v0, 0x0

    .local v0, audioID:I
    :goto_0
    iget v1, p0, Lcom/apportable/media/MediaPlayer;->MAX_SOURCES:I

    if-ge v0, v1, :cond_1

    .line 194
    iget-object v1, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v1, v1, v0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v1, v1, v0

    iget-object v1, v1, Lcom/apportable/media/MediaPlayerItem;->player:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    .line 195
    iget-object v1, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v1, v1, v0

    iget-boolean v1, v1, Lcom/apportable/media/MediaPlayerItem;->suspended:Z

    if-eqz v1, :cond_0

    .line 196
    iget-object v1, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v1, v1, v0

    iget-object v1, v1, Lcom/apportable/media/MediaPlayerItem;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 197
    iget-object v1, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v1, v1, v0

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/apportable/media/MediaPlayerItem;->suspended:Z

    .line 193
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 201
    :cond_1
    return-void
.end method

.method public lifecycleSuspend()V
    .locals 3

    .prologue
    .line 180
    sget-object v1, Lcom/apportable/media/MediaPlayer;->TAG:Ljava/lang/String;

    const-string v2, "lifecycleSuspendAudio:"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    const/4 v0, 0x0

    .local v0, audioID:I
    :goto_0
    iget v1, p0, Lcom/apportable/media/MediaPlayer;->MAX_SOURCES:I

    if-ge v0, v1, :cond_1

    .line 182
    iget-object v1, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v1, v1, v0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v1, v1, v0

    iget-object v1, v1, Lcom/apportable/media/MediaPlayerItem;->player:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    .line 183
    iget-object v1, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v1, v1, v0

    iget-object v1, v1, Lcom/apportable/media/MediaPlayerItem;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 184
    iget-object v1, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v1, v1, v0

    iget-object v1, v1, Lcom/apportable/media/MediaPlayerItem;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->pause()V

    .line 185
    iget-object v1, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v1, v1, v0

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/apportable/media/MediaPlayerItem;->suspended:Z

    .line 181
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 189
    :cond_1
    return-void
.end method

.method public pauseAudio(I)V
    .locals 3
    .parameter "audioID"

    .prologue
    .line 150
    sget-object v0, Lcom/apportable/media/MediaPlayer;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pauseAudio: id:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    iget-object v0, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v0, v0, p1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/apportable/media/MediaPlayerItem;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 152
    iget-object v0, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/apportable/media/MediaPlayerItem;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 154
    :cond_0
    return-void
.end method

.method public playAudio(Ljava/lang/String;II)I
    .locals 12
    .parameter "path"
    .parameter "loop"
    .parameter "delegate"

    .prologue
    const/4 v11, -0x1

    .line 71
    sget-object v1, Lcom/apportable/media/MediaPlayer;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "playAudio: filename:\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' loop:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    const/4 v7, 0x0

    .local v7, audioID:I
    :goto_0
    iget v1, p0, Lcom/apportable/media/MediaPlayer;->MAX_SOURCES:I

    if-ge v7, v1, :cond_0

    .line 75
    iget-object v1, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v1, v1, v7

    if-nez v1, :cond_1

    .line 80
    :cond_0
    iget v1, p0, Lcom/apportable/media/MediaPlayer;->MAX_SOURCES:I

    if-lt v7, v1, :cond_2

    move v7, v11

    .line 137
    .end local v7           #audioID:I
    :goto_1
    return v7

    .line 74
    .restart local v7       #audioID:I
    :cond_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 84
    :cond_2
    sget-object v1, Lcom/apportable/media/MediaPlayer;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "playAudio: using id "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " for filename:\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    .line 86
    .local v0, mMediaPlayer:Landroid/media/MediaPlayer;
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    .line 88
    const/4 v6, 0x0

    .line 91
    .local v6, assetFd:Landroid/content/res/AssetFileDescriptor;
    :try_start_0
    invoke-static {}, Lcom/apportable/activity/VerdeActivity;->getActivity()Lcom/apportable/activity/VerdeActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/apportable/activity/VerdeActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v6

    .line 92
    sget-object v1, Lcom/apportable/media/MediaPlayer;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "playAudio: asset path:\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' desc:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    :try_start_1
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/FileDescriptor;->valid()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 101
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 116
    if-eqz v6, :cond_3

    .line 118
    :try_start_2
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    .line 125
    :cond_3
    :goto_2
    if-ne p2, v11, :cond_4

    .line 126
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 130
    :cond_4
    :try_start_3
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4

    .line 135
    iget-object v1, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    new-instance v2, Lcom/apportable/media/MediaPlayerItem;

    invoke-direct {v2, v7, v0, p2, p3}, Lcom/apportable/media/MediaPlayerItem;-><init>(ILandroid/media/MediaPlayer;II)V

    aput-object v2, v1, v7

    .line 136
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    goto/16 :goto_1

    .line 93
    :catch_0
    move-exception v9

    .line 94
    .local v9, e2:Ljava/io/IOException;
    sget-object v1, Lcom/apportable/media/MediaPlayer;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "playAudio: could not openFd with asset path:\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    sget-object v1, Lcom/apportable/media/MediaPlayer;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "playAudio: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v9}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v9}, Ljava/io/IOException;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    move v7, v11

    .line 96
    goto/16 :goto_1

    .line 103
    .end local v9           #e2:Ljava/io/IOException;
    :cond_5
    :try_start_4
    new-instance v1, Ljava/lang/Exception;

    const-string v2, "Asset FD not valid"

    invoke-direct {v1, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 104
    :catch_1
    move-exception v9

    .line 105
    .local v9, e2:Ljava/lang/Exception;
    sget-object v1, Lcom/apportable/media/MediaPlayer;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "playAudio: could not setDataSource with asset path:\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    sget-object v1, Lcom/apportable/media/MediaPlayer;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "playAudio: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v9}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v9}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    if-eqz v6, :cond_6

    .line 109
    :try_start_5
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    :cond_6
    :goto_3
    move v7, v11

    .line 114
    goto/16 :goto_1

    .line 110
    :catch_2
    move-exception v10

    .line 111
    .local v10, e3:Ljava/lang/Exception;
    sget-object v1, Lcom/apportable/media/MediaPlayer;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "playAudio: could not close asset path:\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 119
    .end local v9           #e2:Ljava/lang/Exception;
    .end local v10           #e3:Ljava/lang/Exception;
    :catch_3
    move-exception v10

    .line 120
    .restart local v10       #e3:Ljava/lang/Exception;
    sget-object v1, Lcom/apportable/media/MediaPlayer;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "playAudio: could not close asset path:\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 131
    .end local v10           #e3:Ljava/lang/Exception;
    :catch_4
    move-exception v8

    .line 132
    .local v8, e:Ljava/io/IOException;
    sget-object v1, Lcom/apportable/media/MediaPlayer;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "playAudio: could not prepare with path:\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    move v7, v11

    .line 133
    goto/16 :goto_1
.end method

.method public resumeAudio(I)V
    .locals 3
    .parameter "audioID"

    .prologue
    .line 157
    sget-object v0, Lcom/apportable/media/MediaPlayer;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "resumeAudio: id:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    iget-object v0, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v0, v0, p1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/apportable/media/MediaPlayerItem;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 159
    iget-object v0, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/apportable/media/MediaPlayerItem;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 161
    :cond_0
    return-void
.end method

.method public setVolume(IF)V
    .locals 1
    .parameter "audioID"
    .parameter "volume"

    .prologue
    .line 164
    iget-object v0, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v0, v0, p1

    if-eqz v0, :cond_0

    .line 165
    iget-object v0, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/apportable/media/MediaPlayerItem;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 166
    iget-object v0, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/apportable/media/MediaPlayerItem;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p2, p2}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 169
    :cond_0
    return-void
.end method

.method public stopAudio(I)V
    .locals 3
    .parameter "audioID"

    .prologue
    .line 141
    sget-object v0, Lcom/apportable/media/MediaPlayer;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "stopAudio: id:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    iget-object v0, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v0, v0, p1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/apportable/media/MediaPlayerItem;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 143
    iget-object v0, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/apportable/media/MediaPlayerItem;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 144
    iget-object v0, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    aget-object v0, v0, p1

    iget-object v0, v0, Lcom/apportable/media/MediaPlayerItem;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 145
    iget-object v0, p0, Lcom/apportable/media/MediaPlayer;->mSources:[Lcom/apportable/media/MediaPlayerItem;

    const/4 v1, 0x0

    aput-object v1, v0, p1

    .line 147
    :cond_0
    return-void
.end method

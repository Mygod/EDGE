.class Lcom/apportable/media/MediaPlayerItem;
.super Ljava/lang/Object;
.source "MediaPlayer.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# static fields
.field private static TAG:Ljava/lang/String;


# instance fields
.field delegate:I

.field id:I

.field loops:I

.field player:Landroid/media/MediaPlayer;

.field suspended:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    const-string v0, "MediaPlayerItem"

    sput-object v0, Lcom/apportable/media/MediaPlayerItem;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(ILandroid/media/MediaPlayer;II)V
    .locals 1
    .parameter "audioID"
    .parameter "player"
    .parameter "loops"
    .parameter "delegate"

    .prologue
    const/4 v0, 0x0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput v0, p0, Lcom/apportable/media/MediaPlayerItem;->delegate:I

    .line 21
    iput-boolean v0, p0, Lcom/apportable/media/MediaPlayerItem;->suspended:Z

    .line 22
    iput-object p2, p0, Lcom/apportable/media/MediaPlayerItem;->player:Landroid/media/MediaPlayer;

    .line 23
    iput p3, p0, Lcom/apportable/media/MediaPlayerItem;->loops:I

    .line 24
    iput p1, p0, Lcom/apportable/media/MediaPlayerItem;->id:I

    .line 25
    iput p4, p0, Lcom/apportable/media/MediaPlayerItem;->delegate:I

    .line 27
    invoke-virtual {p2, p0}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 28
    return-void
.end method


# virtual methods
.method public native nativeOnComplete(I)V
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 3
    .parameter "mp"

    .prologue
    .line 31
    sget-object v0, Lcom/apportable/media/MediaPlayerItem;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Verde MediaPlayerItem got onCompletion for id:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/apportable/media/MediaPlayerItem;->id:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " loop:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/apportable/media/MediaPlayerItem;->loops:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    iget v0, p0, Lcom/apportable/media/MediaPlayerItem;->delegate:I

    if-eqz v0, :cond_0

    .line 33
    new-instance v0, Lcom/apportable/media/MediaPlayerItem$1;

    invoke-direct {v0, p0}, Lcom/apportable/media/MediaPlayerItem$1;-><init>(Lcom/apportable/media/MediaPlayerItem;)V

    invoke-static {v0}, Lcom/apportable/utils/ThreadUtils;->runOnGlThread(Ljava/lang/Runnable;)V

    .line 40
    :cond_0
    iget v0, p0, Lcom/apportable/media/MediaPlayerItem;->loops:I

    if-lez v0, :cond_1

    .line 41
    sget-object v0, Lcom/apportable/media/MediaPlayerItem;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Looping id:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/apportable/media/MediaPlayerItem;->id:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " back to start."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    iget v0, p0, Lcom/apportable/media/MediaPlayerItem;->loops:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/apportable/media/MediaPlayerItem;->loops:I

    .line 43
    iget-object v0, p0, Lcom/apportable/media/MediaPlayerItem;->player:Landroid/media/MediaPlayer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 44
    iget-object v0, p0, Lcom/apportable/media/MediaPlayerItem;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 46
    :cond_1
    return-void
.end method

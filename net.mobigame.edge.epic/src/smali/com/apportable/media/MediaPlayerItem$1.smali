.class Lcom/apportable/media/MediaPlayerItem$1;
.super Ljava/lang/Object;
.source "MediaPlayer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/media/MediaPlayerItem;->onCompletion(Landroid/media/MediaPlayer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/media/MediaPlayerItem;


# direct methods
.method constructor <init>(Lcom/apportable/media/MediaPlayerItem;)V
    .locals 0
    .parameter

    .prologue
    .line 33
    iput-object p1, p0, Lcom/apportable/media/MediaPlayerItem$1;->this$0:Lcom/apportable/media/MediaPlayerItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 36
    iget-object v0, p0, Lcom/apportable/media/MediaPlayerItem$1;->this$0:Lcom/apportable/media/MediaPlayerItem;

    iget-object v1, p0, Lcom/apportable/media/MediaPlayerItem$1;->this$0:Lcom/apportable/media/MediaPlayerItem;

    iget v1, v1, Lcom/apportable/media/MediaPlayerItem;->delegate:I

    invoke-virtual {v0, v1}, Lcom/apportable/media/MediaPlayerItem;->nativeOnComplete(I)V

    .line 37
    return-void
.end method

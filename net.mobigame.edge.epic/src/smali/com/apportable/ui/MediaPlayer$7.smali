.class Lcom/apportable/ui/MediaPlayer$7;
.super Ljava/lang/Object;
.source "MediaPlayer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/MediaPlayer;->onCompletion(Landroid/media/MediaPlayer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/MediaPlayer;


# direct methods
.method constructor <init>(Lcom/apportable/ui/MediaPlayer;)V
    .locals 0
    .parameter

    .prologue
    .line 141
    iput-object p1, p0, Lcom/apportable/ui/MediaPlayer$7;->this$0:Lcom/apportable/ui/MediaPlayer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 144
    iget-object v0, p0, Lcom/apportable/ui/MediaPlayer$7;->this$0:Lcom/apportable/ui/MediaPlayer;

    iget-object v1, p0, Lcom/apportable/ui/MediaPlayer$7;->this$0:Lcom/apportable/ui/MediaPlayer;

    iget v1, v1, Lcom/apportable/ui/MediaPlayer;->mObject:I

    #calls: Lcom/apportable/ui/MediaPlayer;->playbackCompleted(I)V
    invoke-static {v0, v1}, Lcom/apportable/ui/MediaPlayer;->access$200(Lcom/apportable/ui/MediaPlayer;I)V

    .line 145
    return-void
.end method

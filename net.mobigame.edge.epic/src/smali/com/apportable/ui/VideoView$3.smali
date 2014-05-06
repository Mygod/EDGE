.class Lcom/apportable/ui/VideoView$3;
.super Ljava/lang/Object;
.source "VideoView.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/apportable/ui/VideoView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/VideoView;


# direct methods
.method constructor <init>(Lcom/apportable/ui/VideoView;)V
    .locals 0
    .parameter

    .prologue
    .line 337
    iput-object p1, p0, Lcom/apportable/ui/VideoView$3;->this$0:Lcom/apportable/ui/VideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 2
    .parameter "mp"

    .prologue
    const/4 v1, 0x5

    .line 339
    iget-object v0, p0, Lcom/apportable/ui/VideoView$3;->this$0:Lcom/apportable/ui/VideoView;

    #setter for: Lcom/apportable/ui/VideoView;->mCurrentState:I
    invoke-static {v0, v1}, Lcom/apportable/ui/VideoView;->access$202(Lcom/apportable/ui/VideoView;I)I

    .line 340
    iget-object v0, p0, Lcom/apportable/ui/VideoView$3;->this$0:Lcom/apportable/ui/VideoView;

    #setter for: Lcom/apportable/ui/VideoView;->mTargetState:I
    invoke-static {v0, v1}, Lcom/apportable/ui/VideoView;->access$1502(Lcom/apportable/ui/VideoView;I)I

    .line 341
    iget-object v0, p0, Lcom/apportable/ui/VideoView$3;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v0}, Lcom/apportable/ui/VideoView;->access$1100(Lcom/apportable/ui/VideoView;)Landroid/widget/MediaController;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 342
    iget-object v0, p0, Lcom/apportable/ui/VideoView$3;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v0}, Lcom/apportable/ui/VideoView;->access$1100(Lcom/apportable/ui/VideoView;)Landroid/widget/MediaController;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    .line 344
    :cond_0
    iget-object v0, p0, Lcom/apportable/ui/VideoView$3;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;
    invoke-static {v0}, Lcom/apportable/ui/VideoView;->access$1600(Lcom/apportable/ui/VideoView;)Landroid/media/MediaPlayer$OnCompletionListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 345
    iget-object v0, p0, Lcom/apportable/ui/VideoView$3;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;
    invoke-static {v0}, Lcom/apportable/ui/VideoView;->access$1600(Lcom/apportable/ui/VideoView;)Landroid/media/MediaPlayer$OnCompletionListener;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/VideoView$3;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1}, Lcom/apportable/ui/VideoView;->access$1000(Lcom/apportable/ui/VideoView;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/media/MediaPlayer$OnCompletionListener;->onCompletion(Landroid/media/MediaPlayer;)V

    .line 347
    :cond_1
    return-void
.end method

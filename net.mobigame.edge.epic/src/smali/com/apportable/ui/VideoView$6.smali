.class Lcom/apportable/ui/VideoView$6;
.super Ljava/lang/Object;
.source "VideoView.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


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
    .line 414
    iput-object p1, p0, Lcom/apportable/ui/VideoView$6;->this$0:Lcom/apportable/ui/VideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 6
    .parameter "holder"
    .parameter "format"
    .parameter "w"
    .parameter "h"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 418
    iget-object v4, p0, Lcom/apportable/ui/VideoView$6;->this$0:Lcom/apportable/ui/VideoView;

    #setter for: Lcom/apportable/ui/VideoView;->mSurfaceWidth:I
    invoke-static {v4, p3}, Lcom/apportable/ui/VideoView;->access$1302(Lcom/apportable/ui/VideoView;I)I

    .line 419
    iget-object v4, p0, Lcom/apportable/ui/VideoView$6;->this$0:Lcom/apportable/ui/VideoView;

    #setter for: Lcom/apportable/ui/VideoView;->mSurfaceHeight:I
    invoke-static {v4, p4}, Lcom/apportable/ui/VideoView;->access$1402(Lcom/apportable/ui/VideoView;I)I

    .line 420
    iget-object v4, p0, Lcom/apportable/ui/VideoView$6;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mTargetState:I
    invoke-static {v4}, Lcom/apportable/ui/VideoView;->access$1500(Lcom/apportable/ui/VideoView;)I

    move-result v4

    const/4 v5, 0x3

    if-ne v4, v5, :cond_2

    move v1, v2

    .line 421
    .local v1, isValidState:Z
    :goto_0
    iget-object v4, p0, Lcom/apportable/ui/VideoView$6;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mVideoWidth:I
    invoke-static {v4}, Lcom/apportable/ui/VideoView;->access$000(Lcom/apportable/ui/VideoView;)I

    move-result v4

    if-ne v4, p3, :cond_3

    iget-object v4, p0, Lcom/apportable/ui/VideoView$6;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mVideoHeight:I
    invoke-static {v4}, Lcom/apportable/ui/VideoView;->access$100(Lcom/apportable/ui/VideoView;)I

    move-result v4

    if-ne v4, p4, :cond_3

    move v0, v2

    .line 422
    .local v0, hasValidSize:Z
    :goto_1
    iget-object v2, p0, Lcom/apportable/ui/VideoView$6;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v2}, Lcom/apportable/ui/VideoView;->access$1000(Lcom/apportable/ui/VideoView;)Landroid/media/MediaPlayer;

    move-result-object v2

    if-eqz v2, :cond_1

    if-eqz v1, :cond_1

    if-eqz v0, :cond_1

    .line 423
    iget-object v2, p0, Lcom/apportable/ui/VideoView$6;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mSeekWhenPrepared:I
    invoke-static {v2}, Lcom/apportable/ui/VideoView;->access$1200(Lcom/apportable/ui/VideoView;)I

    move-result v2

    if-eqz v2, :cond_0

    .line 424
    iget-object v2, p0, Lcom/apportable/ui/VideoView$6;->this$0:Lcom/apportable/ui/VideoView;

    iget-object v3, p0, Lcom/apportable/ui/VideoView$6;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mSeekWhenPrepared:I
    invoke-static {v3}, Lcom/apportable/ui/VideoView;->access$1200(Lcom/apportable/ui/VideoView;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/apportable/ui/VideoView;->seekTo(I)V

    .line 426
    :cond_0
    iget-object v2, p0, Lcom/apportable/ui/VideoView$6;->this$0:Lcom/apportable/ui/VideoView;

    invoke-virtual {v2}, Lcom/apportable/ui/VideoView;->start()V

    .line 427
    iget-object v2, p0, Lcom/apportable/ui/VideoView$6;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v2}, Lcom/apportable/ui/VideoView;->access$1100(Lcom/apportable/ui/VideoView;)Landroid/widget/MediaController;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 428
    iget-object v2, p0, Lcom/apportable/ui/VideoView$6;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v2}, Lcom/apportable/ui/VideoView;->access$1100(Lcom/apportable/ui/VideoView;)Landroid/widget/MediaController;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/MediaController;->show()V

    .line 431
    :cond_1
    return-void

    .end local v0           #hasValidSize:Z
    .end local v1           #isValidState:Z
    :cond_2
    move v1, v3

    .line 420
    goto :goto_0

    .restart local v1       #isValidState:Z
    :cond_3
    move v0, v3

    .line 421
    goto :goto_1
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1
    .parameter "holder"

    .prologue
    .line 435
    iget-object v0, p0, Lcom/apportable/ui/VideoView$6;->this$0:Lcom/apportable/ui/VideoView;

    #setter for: Lcom/apportable/ui/VideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;
    invoke-static {v0, p1}, Lcom/apportable/ui/VideoView;->access$2002(Lcom/apportable/ui/VideoView;Landroid/view/SurfaceHolder;)Landroid/view/SurfaceHolder;

    .line 436
    iget-object v0, p0, Lcom/apportable/ui/VideoView$6;->this$0:Lcom/apportable/ui/VideoView;

    #calls: Lcom/apportable/ui/VideoView;->openVideo()V
    invoke-static {v0}, Lcom/apportable/ui/VideoView;->access$2100(Lcom/apportable/ui/VideoView;)V

    .line 437
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2
    .parameter "holder"

    .prologue
    .line 442
    iget-object v0, p0, Lcom/apportable/ui/VideoView$6;->this$0:Lcom/apportable/ui/VideoView;

    const/4 v1, 0x0

    #setter for: Lcom/apportable/ui/VideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;
    invoke-static {v0, v1}, Lcom/apportable/ui/VideoView;->access$2002(Lcom/apportable/ui/VideoView;Landroid/view/SurfaceHolder;)Landroid/view/SurfaceHolder;

    .line 443
    iget-object v0, p0, Lcom/apportable/ui/VideoView$6;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v0}, Lcom/apportable/ui/VideoView;->access$1100(Lcom/apportable/ui/VideoView;)Landroid/widget/MediaController;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/apportable/ui/VideoView$6;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v0}, Lcom/apportable/ui/VideoView;->access$1100(Lcom/apportable/ui/VideoView;)Landroid/widget/MediaController;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    .line 444
    :cond_0
    iget-object v0, p0, Lcom/apportable/ui/VideoView$6;->this$0:Lcom/apportable/ui/VideoView;

    const/4 v1, 0x1

    #calls: Lcom/apportable/ui/VideoView;->release(Z)V
    invoke-static {v0, v1}, Lcom/apportable/ui/VideoView;->access$2200(Lcom/apportable/ui/VideoView;Z)V

    .line 445
    return-void
.end method

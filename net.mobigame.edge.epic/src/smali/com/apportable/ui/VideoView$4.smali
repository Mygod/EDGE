.class Lcom/apportable/ui/VideoView$4;
.super Ljava/lang/Object;
.source "VideoView.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnErrorListener;


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
    .line 351
    iput-object p1, p0, Lcom/apportable/ui/VideoView$4;->this$0:Lcom/apportable/ui/VideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 5
    .parameter "mp"
    .parameter "framework_err"
    .parameter "impl_err"

    .prologue
    const/4 v4, 0x1

    const/4 v3, -0x1

    .line 353
    iget-object v0, p0, Lcom/apportable/ui/VideoView$4;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->TAG:Ljava/lang/String;
    invoke-static {v0}, Lcom/apportable/ui/VideoView;->access$1700(Lcom/apportable/ui/VideoView;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 354
    iget-object v0, p0, Lcom/apportable/ui/VideoView$4;->this$0:Lcom/apportable/ui/VideoView;

    #setter for: Lcom/apportable/ui/VideoView;->mCurrentState:I
    invoke-static {v0, v3}, Lcom/apportable/ui/VideoView;->access$202(Lcom/apportable/ui/VideoView;I)I

    .line 355
    iget-object v0, p0, Lcom/apportable/ui/VideoView$4;->this$0:Lcom/apportable/ui/VideoView;

    #setter for: Lcom/apportable/ui/VideoView;->mTargetState:I
    invoke-static {v0, v3}, Lcom/apportable/ui/VideoView;->access$1502(Lcom/apportable/ui/VideoView;I)I

    .line 356
    iget-object v0, p0, Lcom/apportable/ui/VideoView$4;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v0}, Lcom/apportable/ui/VideoView;->access$1100(Lcom/apportable/ui/VideoView;)Landroid/widget/MediaController;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 357
    iget-object v0, p0, Lcom/apportable/ui/VideoView$4;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v0}, Lcom/apportable/ui/VideoView;->access$1100(Lcom/apportable/ui/VideoView;)Landroid/widget/MediaController;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    .line 361
    :cond_0
    iget-object v0, p0, Lcom/apportable/ui/VideoView$4;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;
    invoke-static {v0}, Lcom/apportable/ui/VideoView;->access$1800(Lcom/apportable/ui/VideoView;)Landroid/media/MediaPlayer$OnErrorListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 362
    iget-object v0, p0, Lcom/apportable/ui/VideoView$4;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;
    invoke-static {v0}, Lcom/apportable/ui/VideoView;->access$1800(Lcom/apportable/ui/VideoView;)Landroid/media/MediaPlayer$OnErrorListener;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/VideoView$4;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mMediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1}, Lcom/apportable/ui/VideoView;->access$1000(Lcom/apportable/ui/VideoView;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-interface {v0, v1, p2, p3}, Landroid/media/MediaPlayer$OnErrorListener;->onError(Landroid/media/MediaPlayer;II)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 367
    :cond_1
    return v4
.end method

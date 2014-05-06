.class Lcom/apportable/ui/VideoView$1;
.super Ljava/lang/Object;
.source "VideoView.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnVideoSizeChangedListener;


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
    .line 265
    iput-object p1, p0, Lcom/apportable/ui/VideoView$1;->this$0:Lcom/apportable/ui/VideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onVideoSizeChanged(Landroid/media/MediaPlayer;II)V
    .locals 3
    .parameter "mp"
    .parameter "width"
    .parameter "height"

    .prologue
    .line 267
    iget-object v0, p0, Lcom/apportable/ui/VideoView$1;->this$0:Lcom/apportable/ui/VideoView;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoWidth()I

    move-result v1

    #setter for: Lcom/apportable/ui/VideoView;->mVideoWidth:I
    invoke-static {v0, v1}, Lcom/apportable/ui/VideoView;->access$002(Lcom/apportable/ui/VideoView;I)I

    .line 268
    iget-object v0, p0, Lcom/apportable/ui/VideoView$1;->this$0:Lcom/apportable/ui/VideoView;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoHeight()I

    move-result v1

    #setter for: Lcom/apportable/ui/VideoView;->mVideoHeight:I
    invoke-static {v0, v1}, Lcom/apportable/ui/VideoView;->access$102(Lcom/apportable/ui/VideoView;I)I

    .line 269
    iget-object v0, p0, Lcom/apportable/ui/VideoView$1;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mVideoWidth:I
    invoke-static {v0}, Lcom/apportable/ui/VideoView;->access$000(Lcom/apportable/ui/VideoView;)I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/apportable/ui/VideoView$1;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mVideoHeight:I
    invoke-static {v0}, Lcom/apportable/ui/VideoView;->access$100(Lcom/apportable/ui/VideoView;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 270
    iget-object v0, p0, Lcom/apportable/ui/VideoView$1;->this$0:Lcom/apportable/ui/VideoView;

    invoke-virtual {v0}, Lcom/apportable/ui/VideoView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/VideoView$1;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mVideoWidth:I
    invoke-static {v1}, Lcom/apportable/ui/VideoView;->access$000(Lcom/apportable/ui/VideoView;)I

    move-result v1

    iget-object v2, p0, Lcom/apportable/ui/VideoView$1;->this$0:Lcom/apportable/ui/VideoView;

    #getter for: Lcom/apportable/ui/VideoView;->mVideoHeight:I
    invoke-static {v2}, Lcom/apportable/ui/VideoView;->access$100(Lcom/apportable/ui/VideoView;)I

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 272
    :cond_0
    return-void
.end method

.class Lcom/apportable/ui/MediaPlayer$4;
.super Ljava/lang/Object;
.source "MediaPlayer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/MediaPlayer;->play()V
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
    .line 105
    iput-object p1, p0, Lcom/apportable/ui/MediaPlayer$4;->this$0:Lcom/apportable/ui/MediaPlayer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 108
    iget-object v0, p0, Lcom/apportable/ui/MediaPlayer$4;->this$0:Lcom/apportable/ui/MediaPlayer;

    #getter for: Lcom/apportable/ui/MediaPlayer;->mPlaybackPossible:Z
    invoke-static {v0}, Lcom/apportable/ui/MediaPlayer;->access$100(Lcom/apportable/ui/MediaPlayer;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 110
    invoke-static {}, Lcom/apportable/activity/VerdeActivity;->getActivity()Lcom/apportable/activity/VerdeActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/apportable/activity/VerdeActivity;->primaryContainer()Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v1

    invoke-virtual {v1}, Lcom/apportable/app/VerdeApplication;->getSurface()Lcom/apportable/gl/VerdeSurfaceView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 111
    invoke-static {}, Lcom/apportable/activity/VerdeActivity;->getActivity()Lcom/apportable/activity/VerdeActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/apportable/activity/VerdeActivity;->primaryContainer()Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v1

    invoke-virtual {v1}, Lcom/apportable/app/VerdeApplication;->getSurface()Lcom/apportable/gl/VerdeSurfaceView;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 113
    iget-object v0, p0, Lcom/apportable/ui/MediaPlayer$4;->this$0:Lcom/apportable/ui/MediaPlayer;

    #getter for: Lcom/apportable/ui/MediaPlayer;->mMediaPlayer:Lcom/apportable/ui/VideoView;
    invoke-static {v0}, Lcom/apportable/ui/MediaPlayer;->access$000(Lcom/apportable/ui/MediaPlayer;)Lcom/apportable/ui/VideoView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/apportable/ui/VideoView;->start()V

    .line 117
    :goto_0
    return-void

    .line 115
    :cond_0
    iget-object v0, p0, Lcom/apportable/ui/MediaPlayer$4;->this$0:Lcom/apportable/ui/MediaPlayer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/apportable/ui/MediaPlayer;->onCompletion(Landroid/media/MediaPlayer;)V

    goto :goto_0
.end method

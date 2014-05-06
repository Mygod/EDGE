.class Lcom/apportable/ui/VideoView$5;
.super Ljava/lang/Object;
.source "VideoView.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnBufferingUpdateListener;


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
    .line 372
    iput-object p1, p0, Lcom/apportable/ui/VideoView$5;->this$0:Lcom/apportable/ui/VideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBufferingUpdate(Landroid/media/MediaPlayer;I)V
    .locals 1
    .parameter "mp"
    .parameter "percent"

    .prologue
    .line 374
    iget-object v0, p0, Lcom/apportable/ui/VideoView$5;->this$0:Lcom/apportable/ui/VideoView;

    #setter for: Lcom/apportable/ui/VideoView;->mCurrentBufferPercentage:I
    invoke-static {v0, p2}, Lcom/apportable/ui/VideoView;->access$1902(Lcom/apportable/ui/VideoView;I)I

    .line 375
    return-void
.end method

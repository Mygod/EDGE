.class Lcom/apportable/ui/MediaPlayer$3;
.super Ljava/lang/Object;
.source "MediaPlayer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/MediaPlayer;->setContentURI(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/MediaPlayer;

.field final synthetic val$uriString:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/apportable/ui/MediaPlayer;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 85
    iput-object p1, p0, Lcom/apportable/ui/MediaPlayer$3;->this$0:Lcom/apportable/ui/MediaPlayer;

    iput-object p2, p0, Lcom/apportable/ui/MediaPlayer$3;->val$uriString:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    .line 89
    :try_start_0
    iget-object v0, p0, Lcom/apportable/ui/MediaPlayer$3;->val$uriString:Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    .line 91
    .local v9, uri:Landroid/net/Uri;
    invoke-virtual {v9}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    const-string v1, "^/"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 92
    .local v8, path:Ljava/lang/String;
    iget-object v0, p0, Lcom/apportable/ui/MediaPlayer$3;->this$0:Lcom/apportable/ui/MediaPlayer;

    invoke-virtual {v0}, Lcom/apportable/ui/MediaPlayer;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v7

    .line 93
    .local v7, fd:Landroid/content/res/AssetFileDescriptor;
    iget-object v0, p0, Lcom/apportable/ui/MediaPlayer$3;->this$0:Lcom/apportable/ui/MediaPlayer;

    #getter for: Lcom/apportable/ui/MediaPlayer;->mMediaPlayer:Lcom/apportable/ui/VideoView;
    invoke-static {v0}, Lcom/apportable/ui/MediaPlayer;->access$000(Lcom/apportable/ui/MediaPlayer;)Lcom/apportable/ui/VideoView;

    move-result-object v0

    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Lcom/apportable/ui/VideoView;->setVideoSource(Ljava/io/FileDescriptor;JJ)V

    .line 94
    iget-object v0, p0, Lcom/apportable/ui/MediaPlayer$3;->this$0:Lcom/apportable/ui/MediaPlayer;

    const/4 v1, 0x1

    #setter for: Lcom/apportable/ui/MediaPlayer;->mPlaybackPossible:Z
    invoke-static {v0, v1}, Lcom/apportable/ui/MediaPlayer;->access$102(Lcom/apportable/ui/MediaPlayer;Z)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    .end local v7           #fd:Landroid/content/res/AssetFileDescriptor;
    .end local v8           #path:Ljava/lang/String;
    .end local v9           #uri:Landroid/net/Uri;
    :goto_0
    return-void

    .line 96
    :catch_0
    move-exception v6

    .line 97
    .local v6, e:Ljava/io/IOException;
    const-string v0, "MediaPlayer"

    const-string v1, "Failed to set video source."

    invoke-static {v0, v1, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 98
    iget-object v0, p0, Lcom/apportable/ui/MediaPlayer$3;->this$0:Lcom/apportable/ui/MediaPlayer;

    const/4 v1, 0x0

    #setter for: Lcom/apportable/ui/MediaPlayer;->mPlaybackPossible:Z
    invoke-static {v0, v1}, Lcom/apportable/ui/MediaPlayer;->access$102(Lcom/apportable/ui/MediaPlayer;Z)Z

    goto :goto_0
.end method

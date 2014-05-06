.class public Lcom/google/ads/internal/AdVideoView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;
.implements Landroid/media/MediaPlayer$OnErrorListener;
.implements Landroid/media/MediaPlayer$OnPreparedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/ads/internal/AdVideoView$a;
    }
.end annotation


# static fields
.field private static final b:Lcom/google/ads/internal/a;


# instance fields
.field public a:Landroid/widget/MediaController;

.field private c:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private d:Lcom/google/ads/internal/AdWebView;

.field private e:J

.field private f:Landroid/widget/VideoView;

.field private g:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/google/ads/internal/a;->a:Lcom/google/ads/util/f;

    invoke-interface {v0}, Lcom/google/ads/util/f;->b()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/ads/internal/a;

    sput-object v0, Lcom/google/ads/internal/AdVideoView;->b:Lcom/google/ads/internal/a;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lcom/google/ads/internal/AdWebView;)V
    .locals 4
    .parameter "adActivity"
    .parameter "adWebView"

    .prologue
    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 96
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 98
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/ads/internal/AdVideoView;->c:Ljava/lang/ref/WeakReference;

    .line 99
    iput-object p2, p0, Lcom/google/ads/internal/AdVideoView;->d:Lcom/google/ads/internal/AdWebView;

    .line 102
    new-instance v0, Landroid/widget/VideoView;

    invoke-direct {v0, p1}, Landroid/widget/VideoView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/ads/internal/AdVideoView;->f:Landroid/widget/VideoView;

    .line 103
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v1, 0x11

    invoke-direct {v0, v2, v2, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 107
    iget-object v1, p0, Lcom/google/ads/internal/AdVideoView;->f:Landroid/widget/VideoView;

    invoke-virtual {p0, v1, v0}, Lcom/google/ads/internal/AdVideoView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 111
    iput-object v3, p0, Lcom/google/ads/internal/AdVideoView;->a:Landroid/widget/MediaController;

    .line 114
    iput-object v3, p0, Lcom/google/ads/internal/AdVideoView;->g:Ljava/lang/String;

    .line 117
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/ads/internal/AdVideoView;->e:J

    .line 118
    invoke-virtual {p0}, Lcom/google/ads/internal/AdVideoView;->a()V

    .line 120
    iget-object v0, p0, Lcom/google/ads/internal/AdVideoView;->f:Landroid/widget/VideoView;

    invoke-virtual {v0, p0}, Landroid/widget/VideoView;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 121
    iget-object v0, p0, Lcom/google/ads/internal/AdVideoView;->f:Landroid/widget/VideoView;

    invoke-virtual {v0, p0}, Landroid/widget/VideoView;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 122
    iget-object v0, p0, Lcom/google/ads/internal/AdVideoView;->f:Landroid/widget/VideoView;

    invoke-virtual {v0, p0}, Landroid/widget/VideoView;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 123
    return-void
.end method


# virtual methods
.method protected a()V
    .locals 1

    .prologue
    .line 129
    new-instance v0, Lcom/google/ads/internal/AdVideoView$a;

    invoke-direct {v0, p0}, Lcom/google/ads/internal/AdVideoView$a;-><init>(Lcom/google/ads/internal/AdVideoView;)V

    .line 130
    invoke-virtual {v0}, Lcom/google/ads/internal/AdVideoView$a;->a()V

    .line 131
    return-void
.end method

.method public a(I)V
    .locals 1
    .parameter

    .prologue
    .line 234
    iget-object v0, p0, Lcom/google/ads/internal/AdVideoView;->f:Landroid/widget/VideoView;

    invoke-virtual {v0, p1}, Landroid/widget/VideoView;->seekTo(I)V

    .line 235
    return-void
.end method

.method public a(Landroid/view/MotionEvent;)V
    .locals 1
    .parameter

    .prologue
    .line 241
    iget-object v0, p0, Lcom/google/ads/internal/AdVideoView;->f:Landroid/widget/VideoView;

    invoke-virtual {v0, p1}, Landroid/widget/VideoView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 242
    return-void
.end method

.method public b()V
    .locals 4

    .prologue
    .line 147
    iget-object v0, p0, Lcom/google/ads/internal/AdVideoView;->g:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 148
    iget-object v0, p0, Lcom/google/ads/internal/AdVideoView;->f:Landroid/widget/VideoView;

    iget-object v1, p0, Lcom/google/ads/internal/AdVideoView;->g:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/VideoView;->setVideoPath(Ljava/lang/String;)V

    .line 153
    :goto_0
    return-void

    .line 150
    :cond_0
    sget-object v0, Lcom/google/ads/internal/AdVideoView;->b:Lcom/google/ads/internal/a;

    iget-object v1, p0, Lcom/google/ads/internal/AdVideoView;->d:Lcom/google/ads/internal/AdWebView;

    const-string v2, "onVideoEvent"

    const-string v3, "{\'event\': \'error\', \'what\': \'no_src\'}"

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/ads/internal/a;->a(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public c()V
    .locals 1

    .prologue
    .line 219
    iget-object v0, p0, Lcom/google/ads/internal/AdVideoView;->f:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->pause()V

    .line 220
    return-void
.end method

.method public d()V
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lcom/google/ads/internal/AdVideoView;->f:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->start()V

    .line 227
    return-void
.end method

.method public e()V
    .locals 1

    .prologue
    .line 248
    iget-object v0, p0, Lcom/google/ads/internal/AdVideoView;->f:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->stopPlayback()V

    .line 249
    return-void
.end method

.method f()V
    .locals 8

    .prologue
    .line 255
    iget-object v0, p0, Lcom/google/ads/internal/AdVideoView;->f:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->getCurrentPosition()I

    move-result v0

    int-to-long v0, v0

    .line 256
    iget-wide v2, p0, Lcom/google/ads/internal/AdVideoView;->e:J

    cmp-long v2, v2, v0

    if-eqz v2, :cond_0

    .line 257
    long-to-float v2, v0

    const/high16 v3, 0x447a

    div-float/2addr v2, v3

    .line 258
    sget-object v3, Lcom/google/ads/internal/AdVideoView;->b:Lcom/google/ads/internal/a;

    iget-object v4, p0, Lcom/google/ads/internal/AdVideoView;->d:Lcom/google/ads/internal/AdWebView;

    const-string v5, "onVideoEvent"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "{\'event\': \'timeupdate\', \'time\': "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v6, "}"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v4, v5, v2}, Lcom/google/ads/internal/a;->a(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    iput-wide v0, p0, Lcom/google/ads/internal/AdVideoView;->e:J

    .line 263
    :cond_0
    return-void
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 4
    .parameter "mp"

    .prologue
    .line 190
    sget-object v0, Lcom/google/ads/internal/AdVideoView;->b:Lcom/google/ads/internal/a;

    iget-object v1, p0, Lcom/google/ads/internal/AdVideoView;->d:Lcom/google/ads/internal/AdWebView;

    const-string v2, "onVideoEvent"

    const-string v3, "{\'event\': \'ended\'}"

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/ads/internal/a;->a(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    return-void
.end method

.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 5
    .parameter "mp"
    .parameter "what"
    .parameter "extra"

    .prologue
    .line 198
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Video threw error! <what:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", extra:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->e(Ljava/lang/String;)V

    .line 199
    sget-object v0, Lcom/google/ads/internal/AdVideoView;->b:Lcom/google/ads/internal/a;

    iget-object v1, p0, Lcom/google/ads/internal/AdVideoView;->d:Lcom/google/ads/internal/AdWebView;

    const-string v2, "onVideoEvent"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "{\'event\': \'error\', \'what\': \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\', \'extra\': \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'}"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/ads/internal/a;->a(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    const/4 v0, 0x1

    return v0
.end method

.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 6
    .parameter "mp"

    .prologue
    .line 209
    iget-object v0, p0, Lcom/google/ads/internal/AdVideoView;->f:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->getDuration()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x447a

    div-float/2addr v0, v1

    .line 210
    sget-object v1, Lcom/google/ads/internal/AdVideoView;->b:Lcom/google/ads/internal/a;

    iget-object v2, p0, Lcom/google/ads/internal/AdVideoView;->d:Lcom/google/ads/internal/AdWebView;

    const-string v3, "onVideoEvent"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "{\'event\': \'canplaythrough\', \'duration\': \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "\'}"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v3, v0}, Lcom/google/ads/internal/a;->a(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;)V

    .line 213
    return-void
.end method

.method public setMediaControllerEnabled(Z)V
    .locals 2
    .parameter "enabled"

    .prologue
    .line 159
    iget-object v0, p0, Lcom/google/ads/internal/AdVideoView;->c:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 160
    if-nez v0, :cond_0

    .line 161
    const-string v0, "adActivity was null while trying to enable controls on a video."

    invoke-static {v0}, Lcom/google/ads/util/b;->e(Ljava/lang/String;)V

    .line 176
    :goto_0
    return-void

    .line 165
    :cond_0
    if-eqz p1, :cond_2

    .line 166
    iget-object v1, p0, Lcom/google/ads/internal/AdVideoView;->a:Landroid/widget/MediaController;

    if-nez v1, :cond_1

    .line 167
    new-instance v1, Landroid/widget/MediaController;

    invoke-direct {v1, v0}, Landroid/widget/MediaController;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/google/ads/internal/AdVideoView;->a:Landroid/widget/MediaController;

    .line 169
    :cond_1
    iget-object v0, p0, Lcom/google/ads/internal/AdVideoView;->f:Landroid/widget/VideoView;

    iget-object v1, p0, Lcom/google/ads/internal/AdVideoView;->a:Landroid/widget/MediaController;

    invoke-virtual {v0, v1}, Landroid/widget/VideoView;->setMediaController(Landroid/widget/MediaController;)V

    goto :goto_0

    .line 171
    :cond_2
    iget-object v0, p0, Lcom/google/ads/internal/AdVideoView;->a:Landroid/widget/MediaController;

    if-eqz v0, :cond_3

    .line 172
    iget-object v0, p0, Lcom/google/ads/internal/AdVideoView;->a:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    .line 174
    :cond_3
    iget-object v0, p0, Lcom/google/ads/internal/AdVideoView;->f:Landroid/widget/VideoView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/VideoView;->setMediaController(Landroid/widget/MediaController;)V

    goto :goto_0
.end method

.method public setSrc(Ljava/lang/String;)V
    .locals 0
    .parameter "src"

    .prologue
    .line 182
    iput-object p1, p0, Lcom/google/ads/internal/AdVideoView;->g:Ljava/lang/String;

    .line 183
    return-void
.end method

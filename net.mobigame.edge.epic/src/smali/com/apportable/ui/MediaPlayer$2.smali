.class final Lcom/apportable/ui/MediaPlayer$2;
.super Ljava/lang/Object;
.source "MediaPlayer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/MediaPlayer;->create(Landroid/app/Activity;ILandroid/graphics/RectF;)Lcom/apportable/ui/MediaPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$frame:Landroid/graphics/RectF;

.field final synthetic val$object:I

.field final synthetic val$view:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/util/concurrent/atomic/AtomicReference;ILandroid/graphics/RectF;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 47
    iput-object p1, p0, Lcom/apportable/ui/MediaPlayer$2;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/apportable/ui/MediaPlayer$2;->val$view:Ljava/util/concurrent/atomic/AtomicReference;

    iput p3, p0, Lcom/apportable/ui/MediaPlayer$2;->val$object:I

    iput-object p4, p0, Lcom/apportable/ui/MediaPlayer$2;->val$frame:Landroid/graphics/RectF;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 50
    iget-object v1, p0, Lcom/apportable/ui/MediaPlayer$2;->val$activity:Landroid/app/Activity;

    monitor-enter v1

    .line 51
    :try_start_0
    iget-object v0, p0, Lcom/apportable/ui/MediaPlayer$2;->val$view:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v2, Lcom/apportable/ui/MediaPlayer;

    iget-object v3, p0, Lcom/apportable/ui/MediaPlayer$2;->val$activity:Landroid/app/Activity;

    iget v4, p0, Lcom/apportable/ui/MediaPlayer$2;->val$object:I

    iget-object v5, p0, Lcom/apportable/ui/MediaPlayer$2;->val$frame:Landroid/graphics/RectF;

    invoke-direct {v2, v3, v4, v5}, Lcom/apportable/ui/MediaPlayer;-><init>(Landroid/app/Activity;ILandroid/graphics/RectF;)V

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 52
    iget-object v0, p0, Lcom/apportable/ui/MediaPlayer$2;->val$activity:Landroid/app/Activity;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 53
    monitor-exit v1

    .line 54
    return-void

    .line 53
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

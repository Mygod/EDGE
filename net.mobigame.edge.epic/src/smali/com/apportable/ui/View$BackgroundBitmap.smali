.class Lcom/apportable/ui/View$BackgroundBitmap;
.super Landroid/graphics/drawable/BitmapDrawable;
.source "View.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/apportable/ui/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BackgroundBitmap"
.end annotation


# instance fields
.field private mLocked:Z

.field private mRecycled:Z


# direct methods
.method public constructor <init>(IIZ)V
    .locals 2
    .parameter "width"
    .parameter "height"
    .parameter "locked"

    .prologue
    .line 710
    const/4 v0, 0x0

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 773
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/apportable/ui/View$BackgroundBitmap;->mRecycled:Z

    .line 711
    iput-boolean p3, p0, Lcom/apportable/ui/View$BackgroundBitmap;->mLocked:Z

    .line 712
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 1
    .parameter "canvas"

    .prologue
    .line 717
    monitor-enter p0

    .line 718
    :try_start_0
    iget-boolean v0, p0, Lcom/apportable/ui/View$BackgroundBitmap;->mRecycled:Z

    if-eqz v0, :cond_0

    .line 719
    monitor-exit p0

    .line 727
    :goto_0
    return-void

    .line 721
    :cond_0
    iget-boolean v0, p0, Lcom/apportable/ui/View$BackgroundBitmap;->mLocked:Z

    if-eqz v0, :cond_1

    .line 723
    monitor-exit p0

    goto :goto_0

    .line 726
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 725
    :cond_1
    :try_start_1
    invoke-super {p0, p1}, Landroid/graphics/drawable/BitmapDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 726
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 746
    invoke-virtual {p0}, Lcom/apportable/ui/View$BackgroundBitmap;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    return v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 743
    invoke-virtual {p0}, Lcom/apportable/ui/View$BackgroundBitmap;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    return v0
.end method

.method public lock()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 730
    monitor-enter p0

    .line 731
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/apportable/ui/View$BackgroundBitmap;->mLocked:Z

    .line 732
    invoke-virtual {p0}, Lcom/apportable/ui/View$BackgroundBitmap;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 733
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public recycle()V
    .locals 1

    .prologue
    .line 750
    monitor-enter p0

    .line 751
    :try_start_0
    iget-boolean v0, p0, Lcom/apportable/ui/View$BackgroundBitmap;->mRecycled:Z

    if-eqz v0, :cond_0

    .line 752
    monitor-exit p0

    .line 757
    :goto_0
    return-void

    .line 754
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/apportable/ui/View$BackgroundBitmap;->mRecycled:Z

    .line 755
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 756
    invoke-virtual {p0}, Lcom/apportable/ui/View$BackgroundBitmap;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_0

    .line 755
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public recycleOnMismatch(II)Z
    .locals 2
    .parameter "width"
    .parameter "height"

    .prologue
    const/4 v0, 0x1

    .line 760
    monitor-enter p0

    .line 761
    :try_start_0
    iget-boolean v1, p0, Lcom/apportable/ui/View$BackgroundBitmap;->mRecycled:Z

    if-eqz v1, :cond_0

    .line 762
    monitor-exit p0

    .line 768
    :goto_0
    return v0

    .line 764
    :cond_0
    invoke-virtual {p0}, Lcom/apportable/ui/View$BackgroundBitmap;->getWidth()I

    move-result v1

    if-ne p1, v1, :cond_1

    invoke-virtual {p0}, Lcom/apportable/ui/View$BackgroundBitmap;->getHeight()I

    move-result v1

    if-eq p2, v1, :cond_2

    .line 765
    :cond_1
    invoke-virtual {p0}, Lcom/apportable/ui/View$BackgroundBitmap;->recycle()V

    .line 766
    monitor-exit p0

    goto :goto_0

    .line 769
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 768
    :cond_2
    const/4 v0, 0x0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public unlock()V
    .locals 1

    .prologue
    .line 736
    monitor-enter p0

    .line 737
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/apportable/ui/View$BackgroundBitmap;->mLocked:Z

    .line 738
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 739
    monitor-exit p0

    .line 740
    return-void

    .line 739
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

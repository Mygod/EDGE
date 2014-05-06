.class Lcom/apportable/utils/PixelsDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "ImageUtils.java"


# instance fields
.field private mHeight:I

.field private mIntrinsicHeight:I

.field private mIntrinsicWidth:I

.field private mPaint:Landroid/graphics/Paint;

.field private mPixels:[I

.field private mWidth:I


# direct methods
.method public constructor <init>([III)V
    .locals 2
    .parameter "pixels"
    .parameter "width"
    .parameter "height"

    .prologue
    .line 162
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 212
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/apportable/utils/PixelsDrawable;->mPaint:Landroid/graphics/Paint;

    .line 163
    iput-object p1, p0, Lcom/apportable/utils/PixelsDrawable;->mPixels:[I

    .line 164
    iput p2, p0, Lcom/apportable/utils/PixelsDrawable;->mIntrinsicWidth:I

    iput p2, p0, Lcom/apportable/utils/PixelsDrawable;->mWidth:I

    .line 165
    iput p3, p0, Lcom/apportable/utils/PixelsDrawable;->mIntrinsicHeight:I

    iput p3, p0, Lcom/apportable/utils/PixelsDrawable;->mHeight:I

    .line 166
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 12
    .parameter "canvas"

    .prologue
    const/4 v4, 0x0

    .line 170
    invoke-virtual {p0}, Lcom/apportable/utils/PixelsDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v10

    .line 171
    .local v10, bounds:Landroid/graphics/Rect;
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v11

    .line 172
    .local v11, checkpoint:I
    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lcom/apportable/utils/PixelsDrawable;->mWidth:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Lcom/apportable/utils/PixelsDrawable;->mHeight:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->scale(FF)V

    .line 173
    iget-object v1, p0, Lcom/apportable/utils/PixelsDrawable;->mPixels:[I

    const/4 v2, 0x0

    iget v3, p0, Lcom/apportable/utils/PixelsDrawable;->mWidth:I

    iget v6, p0, Lcom/apportable/utils/PixelsDrawable;->mWidth:I

    iget v7, p0, Lcom/apportable/utils/PixelsDrawable;->mHeight:I

    const/4 v8, 0x1

    iget-object v9, p0, Lcom/apportable/utils/PixelsDrawable;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v5, v4

    invoke-virtual/range {v0 .. v9}, Landroid/graphics/Canvas;->drawBitmap([IIIFFIIZLandroid/graphics/Paint;)V

    .line 174
    invoke-virtual {p1, v11}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 175
    return-void
.end method

.method public getIntrinsicHeight()I
    .locals 1

    .prologue
    .line 204
    iget v0, p0, Lcom/apportable/utils/PixelsDrawable;->mIntrinsicHeight:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    .prologue
    .line 199
    iget v0, p0, Lcom/apportable/utils/PixelsDrawable;->mIntrinsicWidth:I

    return v0
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 179
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .locals 1
    .parameter "alpha"

    .prologue
    .line 184
    iget-object v0, p0, Lcom/apportable/utils/PixelsDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 185
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1
    .parameter "cf"

    .prologue
    .line 189
    iget-object v0, p0, Lcom/apportable/utils/PixelsDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 190
    return-void
.end method

.method public setIntrinsicSize(II)V
    .locals 0
    .parameter "width"
    .parameter "height"

    .prologue
    .line 193
    iput p1, p0, Lcom/apportable/utils/PixelsDrawable;->mIntrinsicWidth:I

    .line 194
    iput p2, p0, Lcom/apportable/utils/PixelsDrawable;->mIntrinsicHeight:I

    .line 195
    return-void
.end method

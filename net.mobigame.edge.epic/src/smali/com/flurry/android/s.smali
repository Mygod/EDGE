.class final Lcom/flurry/android/s;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/flurry/android/CatalogActivity;Landroid/content/Context;)V
    .locals 6
    .parameter
    .parameter

    .prologue
    const/4 v5, -0x2

    const/4 v4, 0x0

    .line 194
    invoke-direct {p0, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 197
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/flurry/android/s;->setBackgroundColor(I)V

    .line 199
    invoke-static {p1}, Lcom/flurry/android/CatalogActivity;->c(Lcom/flurry/android/CatalogActivity;)Lcom/flurry/android/v;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flurry/android/v;->l()Lcom/flurry/android/AdImage;

    move-result-object v0

    .line 200
    if-eqz v0, :cond_1

    .line 202
    new-instance v1, Landroid/widget/ImageView;

    invoke-direct {v1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 203
    const/16 v2, 0x2710

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setId(I)V

    .line 205
    iget-object v2, v0, Lcom/flurry/android/AdImage;->e:[B

    .line 206
    if-eqz v2, :cond_0

    .line 208
    array-length v3, v2

    invoke-static {v2, v4, v3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 209
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 212
    :cond_0
    iget v2, v0, Lcom/flurry/android/AdImage;->b:I

    invoke-static {p2, v2}, Lcom/flurry/android/r;->a(Landroid/content/Context;I)I

    move-result v2

    iget v0, v0, Lcom/flurry/android/AdImage;->c:I

    invoke-static {p2, v0}, Lcom/flurry/android/r;->a(Landroid/content/Context;I)I

    move-result v0

    invoke-static {p2, v1, v2, v0}, Lcom/flurry/android/r;->a(Landroid/content/Context;Landroid/widget/ImageView;II)V

    .line 215
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 218
    const/4 v2, -0x3

    invoke-virtual {v0, v4, v4, v4, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 220
    const/4 v2, 0x3

    invoke-virtual {p0, v2}, Lcom/flurry/android/s;->setGravity(I)V

    .line 221
    invoke-virtual {p0, v1, v0}, Lcom/flurry/android/s;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 223
    :cond_1
    return-void
.end method

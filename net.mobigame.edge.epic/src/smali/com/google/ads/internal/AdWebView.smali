.class public Lcom/google/ads/internal/AdWebView;
.super Landroid/webkit/WebView;
.source "SourceFile"


# instance fields
.field private a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/google/ads/AdActivity;",
            ">;"
        }
    .end annotation
.end field

.field private b:Lcom/google/ads/AdSize;

.field private c:Z


# direct methods
.method public constructor <init>(Lcom/google/ads/m;Lcom/google/ads/AdSize;)V
    .locals 4
    .parameter "slotState"
    .parameter "adSize"

    .prologue
    const/16 v3, 0xb

    const/4 v2, 0x0

    .line 59
    iget-object v0, p1, Lcom/google/ads/m;->d:Lcom/google/ads/util/i$b;

    invoke-virtual {v0}, Lcom/google/ads/util/i$b;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-direct {p0, v0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 62
    iput-object p2, p0, Lcom/google/ads/internal/AdWebView;->b:Lcom/google/ads/AdSize;

    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/ads/internal/AdWebView;->a:Ljava/lang/ref/WeakReference;

    .line 70
    iput-boolean v2, p0, Lcom/google/ads/internal/AdWebView;->c:Z

    .line 73
    invoke-virtual {p0, v2}, Lcom/google/ads/internal/AdWebView;->setBackgroundColor(I)V

    .line 76
    invoke-static {p0}, Lcom/google/ads/util/AdUtil;->a(Landroid/webkit/WebView;)V

    .line 79
    invoke-virtual {p0}, Lcom/google/ads/internal/AdWebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .line 80
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setSupportMultipleWindows(Z)V

    .line 83
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 87
    invoke-virtual {v0, v2}, Landroid/webkit/WebSettings;->setSavePassword(Z)V

    .line 90
    new-instance v1, Lcom/google/ads/internal/AdWebView$1;

    invoke-direct {v1, p0}, Lcom/google/ads/internal/AdWebView$1;-><init>(Lcom/google/ads/internal/AdWebView;)V

    invoke-virtual {p0, v1}, Lcom/google/ads/internal/AdWebView;->setDownloadListener(Landroid/webkit/DownloadListener;)V

    .line 110
    sget v1, Lcom/google/ads/util/AdUtil;->a:I

    if-lt v1, v3, :cond_0

    .line 111
    invoke-static {v0, p1}, Lcom/google/ads/util/g;->a(Landroid/webkit/WebSettings;Lcom/google/ads/m;)V

    .line 115
    :cond_0
    const/high16 v0, 0x200

    invoke-virtual {p0, v0}, Lcom/google/ads/internal/AdWebView;->setScrollBarStyle(I)V

    .line 121
    sget v0, Lcom/google/ads/util/AdUtil;->a:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_2

    .line 122
    new-instance v0, Lcom/google/ads/util/h$a;

    invoke-direct {v0, p1}, Lcom/google/ads/util/h$a;-><init>(Lcom/google/ads/m;)V

    invoke-virtual {p0, v0}, Lcom/google/ads/internal/AdWebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 126
    :cond_1
    :goto_0
    return-void

    .line 123
    :cond_2
    sget v0, Lcom/google/ads/util/AdUtil;->a:I

    if-lt v0, v3, :cond_1

    .line 124
    new-instance v0, Lcom/google/ads/util/g$a;

    invoke-direct {v0, p1}, Lcom/google/ads/util/g$a;-><init>(Lcom/google/ads/m;)V

    invoke-virtual {p0, v0}, Lcom/google/ads/internal/AdWebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    goto :goto_0
.end method


# virtual methods
.method public a()V
    .locals 1

    .prologue
    .line 134
    invoke-virtual {p0}, Lcom/google/ads/internal/AdWebView;->b()Lcom/google/ads/AdActivity;

    move-result-object v0

    .line 135
    if-eqz v0, :cond_0

    .line 136
    invoke-virtual {v0}, Lcom/google/ads/AdActivity;->finish()V

    .line 138
    :cond_0
    return-void
.end method

.method public b()Lcom/google/ads/AdActivity;
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lcom/google/ads/internal/AdWebView;->a:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/ads/internal/AdWebView;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/ads/AdActivity;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public destroy()V
    .locals 2

    .prologue
    .line 214
    :try_start_0
    invoke-super {p0}, Landroid/webkit/WebView;->destroy()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 218
    :goto_0
    return-void

    .line 215
    :catch_0
    move-exception v0

    .line 216
    const-string v1, "An error occurred while destroying an AdWebView:"

    invoke-static {v1, v0}, Lcom/google/ads/util/b;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "baseUrl"
    .parameter "data"
    .parameter "mimeType"
    .parameter "encoding"
    .parameter "historyUrl"

    .prologue
    .line 174
    :try_start_0
    invoke-super/range {p0 .. p5}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 178
    :goto_0
    return-void

    .line 175
    :catch_0
    move-exception v0

    .line 176
    const-string v1, "An error occurred while loading data in AdWebView:"

    invoke-static {v1, v0}, Lcom/google/ads/util/b;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public loadUrl(Ljava/lang/String;)V
    .locals 2
    .parameter "url"

    .prologue
    .line 187
    :try_start_0
    invoke-super {p0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 191
    :goto_0
    return-void

    .line 188
    :catch_0
    move-exception v0

    .line 189
    const-string v1, "An error occurred while loading a URL in AdWebView:"

    invoke-static {v1, v0}, Lcom/google/ads/util/b;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected onMeasure(II)V
    .locals 10
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    const v0, 0x7fffffff

    const/high16 v9, 0x4000

    const/high16 v8, -0x8000

    .line 228
    invoke-virtual {p0}, Lcom/google/ads/internal/AdWebView;->isInEditMode()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 229
    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->onMeasure(II)V

    .line 273
    :goto_0
    return-void

    .line 235
    :cond_0
    iget-object v1, p0, Lcom/google/ads/internal/AdWebView;->b:Lcom/google/ads/AdSize;

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/google/ads/internal/AdWebView;->c:Z

    if-eqz v1, :cond_2

    .line 236
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->onMeasure(II)V

    goto :goto_0

    .line 241
    :cond_2
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    .line 242
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    .line 245
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v4

    .line 246
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 249
    invoke-virtual {p0}, Lcom/google/ads/internal/AdWebView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    .line 251
    iget v5, v5, Landroid/util/DisplayMetrics;->density:F

    .line 254
    iget-object v6, p0, Lcom/google/ads/internal/AdWebView;->b:Lcom/google/ads/AdSize;

    invoke-virtual {v6}, Lcom/google/ads/AdSize;->getWidth()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v5

    float-to-int v6, v6

    .line 255
    iget-object v7, p0, Lcom/google/ads/internal/AdWebView;->b:Lcom/google/ads/AdSize;

    invoke-virtual {v7}, Lcom/google/ads/AdSize;->getHeight()I

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v7, v5

    float-to-int v7, v7

    .line 258
    if-eq v2, v8, :cond_3

    if-ne v2, v9, :cond_8

    :cond_3
    move v2, v3

    .line 262
    :goto_1
    if-eq v4, v8, :cond_4

    if-ne v4, v9, :cond_5

    :cond_4
    move v0, v1

    .line 265
    :cond_5
    int-to-float v4, v6

    const/high16 v8, 0x40c0

    mul-float/2addr v5, v8

    sub-float/2addr v4, v5

    int-to-float v2, v2

    cmpl-float v2, v4, v2

    if-gtz v2, :cond_6

    if-le v7, v0, :cond_7

    .line 266
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Not enough space to show ad! Wants: <"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ">, Has: <"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ">"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->e(Ljava/lang/String;)V

    .line 268
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/google/ads/internal/AdWebView;->setVisibility(I)V

    .line 269
    invoke-virtual {p0, v3, v1}, Lcom/google/ads/internal/AdWebView;->setMeasuredDimension(II)V

    goto/16 :goto_0

    .line 271
    :cond_7
    invoke-virtual {p0, v6, v7}, Lcom/google/ads/internal/AdWebView;->setMeasuredDimension(II)V

    goto/16 :goto_0

    :cond_8
    move v2, v0

    goto :goto_1
.end method

.method public setAdActivity(Lcom/google/ads/AdActivity;)V
    .locals 1
    .parameter "adActivity"

    .prologue
    .line 159
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/ads/internal/AdWebView;->a:Ljava/lang/ref/WeakReference;

    .line 160
    return-void
.end method

.method public setIsExpandedMraid(Z)V
    .locals 0
    .parameter "isCurrentlyExpandedMraid"

    .prologue
    .line 280
    iput-boolean p1, p0, Lcom/google/ads/internal/AdWebView;->c:Z

    .line 281
    return-void
.end method

.method public stopLoading()V
    .locals 2

    .prologue
    .line 200
    :try_start_0
    invoke-super {p0}, Landroid/webkit/WebView;->stopLoading()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 204
    :goto_0
    return-void

    .line 201
    :catch_0
    move-exception v0

    .line 202
    const-string v1, "An error occurred while stopping loading in AdWebView:"

    invoke-static {v1, v0}, Lcom/google/ads/util/b;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.class Lcom/apportable/ui/WebView;
.super Lcom/apportable/ui/View;
.source "WebView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/apportable/ui/WebView$WebViewClient;,
        Lcom/apportable/ui/WebView$JSInterface;
    }
.end annotation


# static fields
.field private static cacheManagerHack:Z


# instance fields
.field private mCanGoBack:Z

.field private mCanGoForward:Z

.field private mJsFinished:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mJsResult:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mJsTimeout:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mLoading:Z

.field private mRequestUrl:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mWebClient:Lcom/apportable/ui/WebView$WebViewClient;

.field private mWebView:Landroid/webkit/WebView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 148
    const/4 v0, 0x0

    sput-boolean v0, Lcom/apportable/ui/WebView;->cacheManagerHack:Z

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;I)V
    .locals 3
    .parameter "ctx"
    .parameter "object"

    .prologue
    const/4 v2, 0x0

    .line 203
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;I)V

    .line 30
    iput-boolean v2, p0, Lcom/apportable/ui/WebView;->mCanGoBack:Z

    .line 31
    iput-boolean v2, p0, Lcom/apportable/ui/WebView;->mCanGoForward:Z

    .line 32
    iput-boolean v2, p0, Lcom/apportable/ui/WebView;->mLoading:Z

    .line 33
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/apportable/ui/WebView;->mRequestUrl:Ljava/util/concurrent/atomic/AtomicReference;

    .line 34
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/apportable/ui/WebView;->mJsFinished:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 35
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/apportable/ui/WebView;->mJsTimeout:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 36
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/apportable/ui/WebView;->mJsResult:Ljava/util/concurrent/atomic/AtomicReference;

    .line 147
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/apportable/ui/WebView;->mWebClient:Lcom/apportable/ui/WebView$WebViewClient;

    .line 204
    invoke-direct {p0}, Lcom/apportable/ui/WebView;->init()V

    .line 205
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;ILandroid/graphics/RectF;)V
    .locals 3
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    const/4 v2, 0x0

    .line 208
    invoke-direct {p0, p1, p2, p3}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 30
    iput-boolean v2, p0, Lcom/apportable/ui/WebView;->mCanGoBack:Z

    .line 31
    iput-boolean v2, p0, Lcom/apportable/ui/WebView;->mCanGoForward:Z

    .line 32
    iput-boolean v2, p0, Lcom/apportable/ui/WebView;->mLoading:Z

    .line 33
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/apportable/ui/WebView;->mRequestUrl:Ljava/util/concurrent/atomic/AtomicReference;

    .line 34
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/apportable/ui/WebView;->mJsFinished:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 35
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/apportable/ui/WebView;->mJsTimeout:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 36
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/apportable/ui/WebView;->mJsResult:Ljava/util/concurrent/atomic/AtomicReference;

    .line 147
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/apportable/ui/WebView;->mWebClient:Lcom/apportable/ui/WebView$WebViewClient;

    .line 209
    invoke-direct {p0}, Lcom/apportable/ui/WebView;->init()V

    .line 210
    return-void
.end method

.method static synthetic access$000(Lcom/apportable/ui/WebView;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1
    .parameter "x0"

    .prologue
    .line 27
    iget-object v0, p0, Lcom/apportable/ui/WebView;->mJsTimeout:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic access$100(Lcom/apportable/ui/WebView;)Ljava/util/concurrent/atomic/AtomicReference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 27
    iget-object v0, p0, Lcom/apportable/ui/WebView;->mJsResult:Ljava/util/concurrent/atomic/AtomicReference;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/apportable/ui/WebView;IILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"

    .prologue
    .line 27
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/apportable/ui/WebView;->onReceivedError(IILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/apportable/ui/WebView;ILjava/lang/String;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 27
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/WebView;->onLink(ILjava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1200(Lcom/apportable/ui/WebView;)Landroid/webkit/WebView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 27
    iget-object v0, p0, Lcom/apportable/ui/WebView;->mWebView:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/apportable/ui/WebView;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1
    .parameter "x0"

    .prologue
    .line 27
    iget-object v0, p0, Lcom/apportable/ui/WebView;->mJsFinished:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic access$302(Lcom/apportable/ui/WebView;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 27
    iput-boolean p1, p0, Lcom/apportable/ui/WebView;->mLoading:Z

    return p1
.end method

.method static synthetic access$402(Lcom/apportable/ui/WebView;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 27
    iput-boolean p1, p0, Lcom/apportable/ui/WebView;->mCanGoBack:Z

    return p1
.end method

.method static synthetic access$502(Lcom/apportable/ui/WebView;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 27
    iput-boolean p1, p0, Lcom/apportable/ui/WebView;->mCanGoForward:Z

    return p1
.end method

.method static synthetic access$600(Lcom/apportable/ui/WebView;)Ljava/util/concurrent/atomic/AtomicReference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 27
    iget-object v0, p0, Lcom/apportable/ui/WebView;->mRequestUrl:Ljava/util/concurrent/atomic/AtomicReference;

    return-object v0
.end method

.method static synthetic access$800(Lcom/apportable/ui/WebView;ILjava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 27
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/WebView;->onPageFinished(ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$900(Lcom/apportable/ui/WebView;ILjava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 27
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/WebView;->onPageStarted(ILjava/lang/String;)V

    return-void
.end method

.method public static create(Landroid/content/Context;I)Lcom/apportable/ui/WebView;
    .locals 2
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 213
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 214
    new-instance v1, Lcom/apportable/ui/WebView;

    invoke-direct {v1, p0, p1}, Lcom/apportable/ui/WebView;-><init>(Landroid/content/Context;I)V

    .line 233
    :goto_0
    return-object v1

    .line 216
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 217
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/WebView;>;"
    new-instance v1, Lcom/apportable/ui/WebView$3;

    invoke-direct {v1, p0, v0, p1}, Lcom/apportable/ui/WebView$3;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;I)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 226
    monitor-enter p0

    .line 227
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 229
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 230
    :catch_0
    move-exception v1

    goto :goto_1

    .line 232
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 233
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/WebView;

    goto :goto_0

    .line 232
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public static create(Landroid/content/Context;ILandroid/graphics/RectF;)Lcom/apportable/ui/WebView;
    .locals 2
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 238
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 239
    new-instance v1, Lcom/apportable/ui/WebView;

    invoke-direct {v1, p0, p1, p2}, Lcom/apportable/ui/WebView;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 258
    :goto_0
    return-object v1

    .line 241
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 242
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/WebView;>;"
    new-instance v1, Lcom/apportable/ui/WebView$4;

    invoke-direct {v1, p0, v0, p1, p2}, Lcom/apportable/ui/WebView$4;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;ILandroid/graphics/RectF;)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 251
    monitor-enter p0

    .line 252
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 254
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 255
    :catch_0
    move-exception v1

    goto :goto_1

    .line 257
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 258
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/WebView;

    goto :goto_0

    .line 257
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method private init()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 150
    sget-boolean v1, Lcom/apportable/ui/WebView;->cacheManagerHack:Z

    if-nez v1, :cond_0

    .line 151
    sput-boolean v6, Lcom/apportable/ui/WebView;->cacheManagerHack:Z

    .line 153
    :try_start_0
    const-class v1, Landroid/webkit/CacheManager;

    const-string v2, "setCacheDisabled"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 154
    .local v0, m:Ljava/lang/reflect/Method;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 155
    const/4 v1, 0x0

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    .end local v0           #m:Ljava/lang/reflect/Method;
    :cond_0
    :goto_0
    new-instance v1, Landroid/webkit/WebView;

    invoke-virtual {p0}, Lcom/apportable/ui/WebView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/apportable/ui/WebView;->mWebView:Landroid/webkit/WebView;

    .line 162
    iget-object v1, p0, Lcom/apportable/ui/WebView;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    sget-object v2, Landroid/webkit/WebSettings$RenderPriority;->HIGH:Landroid/webkit/WebSettings$RenderPriority;

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setRenderPriority(Landroid/webkit/WebSettings$RenderPriority;)V

    .line 163
    iget-object v1, p0, Lcom/apportable/ui/WebView;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 164
    iget-object v1, p0, Lcom/apportable/ui/WebView;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 165
    iget-object v1, p0, Lcom/apportable/ui/WebView;->mWebView:Landroid/webkit/WebView;

    new-instance v2, Lcom/apportable/ui/WebView$JSInterface;

    invoke-direct {v2, p0, p0}, Lcom/apportable/ui/WebView$JSInterface;-><init>(Lcom/apportable/ui/WebView;Lcom/apportable/ui/WebView;)V

    const-string v3, "_VERDE_JS"

    invoke-virtual {v1, v2, v3}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 166
    new-instance v1, Lcom/apportable/ui/WebView$WebViewClient;

    invoke-direct {v1, p0, p0}, Lcom/apportable/ui/WebView$WebViewClient;-><init>(Lcom/apportable/ui/WebView;Lcom/apportable/ui/WebView;)V

    iput-object v1, p0, Lcom/apportable/ui/WebView;->mWebClient:Lcom/apportable/ui/WebView$WebViewClient;

    .line 167
    iget-object v1, p0, Lcom/apportable/ui/WebView;->mWebView:Landroid/webkit/WebView;

    iget-object v2, p0, Lcom/apportable/ui/WebView;->mWebClient:Lcom/apportable/ui/WebView$WebViewClient;

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 168
    iget-object v1, p0, Lcom/apportable/ui/WebView;->mWebView:Landroid/webkit/WebView;

    new-instance v2, Lcom/apportable/ui/WebView$1;

    invoke-direct {v2, p0}, Lcom/apportable/ui/WebView$1;-><init>(Lcom/apportable/ui/WebView;)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 184
    iget-object v1, p0, Lcom/apportable/ui/WebView;->mWebView:Landroid/webkit/WebView;

    new-instance v2, Lcom/apportable/ui/WebView$2;

    invoke-direct {v2, p0}, Lcom/apportable/ui/WebView$2;-><init>(Lcom/apportable/ui/WebView;)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 199
    iget-object v1, p0, Lcom/apportable/ui/WebView;->mWebView:Landroid/webkit/WebView;

    new-instance v2, Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/apportable/ui/WebView;->getFrame()Landroid/graphics/RectF;

    move-result-object v3

    invoke-static {v3}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/apportable/ui/WebView;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v1, v2}, Lcom/apportable/ui/WebView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 200
    return-void

    .line 157
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private native nativeWaitForJS(I)V
.end method

.method private native onLink(ILjava/lang/String;)Z
.end method

.method private native onPageFinished(ILjava/lang/String;)V
.end method

.method private native onPageStarted(ILjava/lang/String;)V
.end method

.method private native onReceivedError(IILjava/lang/String;Ljava/lang/String;)V
.end method


# virtual methods
.method protected _setFrame(Landroid/graphics/RectF;)V
    .locals 2
    .parameter "frame"

    .prologue
    .line 263
    invoke-super {p0, p1}, Lcom/apportable/ui/View;->_setFrame(Landroid/graphics/RectF;)V

    .line 264
    iget-object v0, p0, Lcom/apportable/ui/WebView;->mWebView:Landroid/webkit/WebView;

    invoke-static {p1}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/apportable/ui/WebView;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 265
    return-void
.end method

.method public canGoBack()Z
    .locals 1

    .prologue
    .line 340
    iget-boolean v0, p0, Lcom/apportable/ui/WebView;->mCanGoBack:Z

    return v0
.end method

.method public canGoForward()Z
    .locals 1

    .prologue
    .line 344
    iget-boolean v0, p0, Lcom/apportable/ui/WebView;->mCanGoForward:Z

    return v0
.end method

.method public getRequest()Ljava/lang/String;
    .locals 1

    .prologue
    .line 306
    iget-object v0, p0, Lcom/apportable/ui/WebView;->mRequestUrl:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public goBack()V
    .locals 2

    .prologue
    .line 348
    new-instance v0, Lcom/apportable/ui/WebView$10;

    invoke-direct {v0, p0}, Lcom/apportable/ui/WebView$10;-><init>(Lcom/apportable/ui/WebView;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/WebView;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 354
    return-void
.end method

.method public goForward()V
    .locals 2

    .prologue
    .line 357
    new-instance v0, Lcom/apportable/ui/WebView$11;

    invoke-direct {v0, p0}, Lcom/apportable/ui/WebView$11;-><init>(Lcom/apportable/ui/WebView;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/WebView;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 363
    return-void
.end method

.method public isLoading()Z
    .locals 1

    .prologue
    .line 310
    iget-boolean v0, p0, Lcom/apportable/ui/WebView;->mLoading:Z

    return v0
.end method

.method public loadData([BLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .parameter "data"
    .parameter "mimeType"
    .parameter "encodingName"
    .parameter "baseURL"

    .prologue
    .line 279
    new-instance v0, Lcom/apportable/ui/WebView$5;

    move-object v1, p0

    move-object v2, p4

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/apportable/ui/WebView$5;-><init>(Lcom/apportable/ui/WebView;Ljava/lang/String;[BLjava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/WebView;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 285
    return-void
.end method

.method public loadHTMLString(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "html"
    .parameter "baseURL"

    .prologue
    .line 288
    new-instance v0, Lcom/apportable/ui/WebView$6;

    invoke-direct {v0, p0, p2, p1}, Lcom/apportable/ui/WebView$6;-><init>(Lcom/apportable/ui/WebView;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/WebView;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 294
    return-void
.end method

.method public loadRequest(Ljava/lang/String;)V
    .locals 2
    .parameter "url"

    .prologue
    .line 297
    new-instance v0, Lcom/apportable/ui/WebView$7;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/WebView$7;-><init>(Lcom/apportable/ui/WebView;Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/WebView;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 303
    return-void
.end method

.method public reload()V
    .locals 2

    .prologue
    .line 323
    new-instance v0, Lcom/apportable/ui/WebView$9;

    invoke-direct {v0, p0}, Lcom/apportable/ui/WebView$9;-><init>(Lcom/apportable/ui/WebView;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/WebView;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 329
    return-void
.end method

.method public stopLoading()V
    .locals 2

    .prologue
    .line 314
    new-instance v0, Lcom/apportable/ui/WebView$8;

    invoke-direct {v0, p0}, Lcom/apportable/ui/WebView$8;-><init>(Lcom/apportable/ui/WebView;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/WebView;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 320
    return-void
.end method

.method public stringByEvaluatingJavaScriptFromString(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .parameter "js"

    .prologue
    const/4 v8, 0x0

    .line 379
    const-wide/16 v2, 0x2710

    .line 380
    .local v2, timeout:J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 383
    .local v0, start:J
    iget-object v4, p0, Lcom/apportable/ui/WebView;->mJsResult:Ljava/util/concurrent/atomic/AtomicReference;

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 384
    iget-object v4, p0, Lcom/apportable/ui/WebView;->mJsFinished:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v4, v8}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 385
    iget-object v4, p0, Lcom/apportable/ui/WebView;->mJsTimeout:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v4, v8}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 388
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 390
    const-string v4, "WebView"

    const-string v5, "Script evaluation called from the wrong thread!"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 391
    iget-object v4, p0, Lcom/apportable/ui/WebView;->mJsResult:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 414
    :goto_0
    return-object v4

    .line 394
    :cond_0
    new-instance v4, Lcom/apportable/ui/WebView$12;

    invoke-direct {v4, p0, p1}, Lcom/apportable/ui/WebView$12;-><init>(Lcom/apportable/ui/WebView;Ljava/lang/String;)V

    invoke-virtual {p0, v4, v8}, Lcom/apportable/ui/WebView;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 402
    monitor-enter p0

    .line 403
    :goto_1
    :try_start_0
    iget-object v4, p0, Lcom/apportable/ui/WebView;->mJsFinished:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v4

    if-nez v4, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    add-long v6, v0, v2

    cmp-long v4, v4, v6

    if-gez v4, :cond_1

    .line 404
    iget v4, p0, Lcom/apportable/ui/WebView;->mObject:I

    invoke-direct {p0, v4}, Lcom/apportable/ui/WebView;->nativeWaitForJS(I)V

    goto :goto_1

    .line 406
    :catchall_0
    move-exception v4

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    :cond_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 409
    iget-object v4, p0, Lcom/apportable/ui/WebView;->mJsFinished:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v4

    if-nez v4, :cond_2

    .line 410
    iget-object v4, p0, Lcom/apportable/ui/WebView;->mJsTimeout:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 413
    :cond_2
    iget-object v4, p0, Lcom/apportable/ui/WebView;->mJsFinished:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v4, v8}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 414
    iget-object v4, p0, Lcom/apportable/ui/WebView;->mJsResult:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    goto :goto_0
.end method

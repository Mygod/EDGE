.class public Lcom/google/ads/AdActivity;
.super Landroid/app/Activity;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/ads/AdActivity$StaticMethodWrapper;
    }
.end annotation


# static fields
.field public static final BASE_URL_PARAM:Ljava/lang/String; = "baseurl"

.field public static final HTML_PARAM:Ljava/lang/String; = "html"

.field public static final INTENT_ACTION_PARAM:Ljava/lang/String; = "i"

.field public static final ORIENTATION_PARAM:Ljava/lang/String; = "o"

.field public static final TYPE_PARAM:Ljava/lang/String; = "m"

.field public static final URL_PARAM:Ljava/lang/String; = "u"

.field private static final a:Lcom/google/ads/internal/a;

.field private static final b:Ljava/lang/Object;

.field private static c:Lcom/google/ads/AdActivity;

.field private static d:Lcom/google/ads/internal/d;

.field private static e:Lcom/google/ads/AdActivity;

.field private static f:Lcom/google/ads/AdActivity;

.field private static final g:Lcom/google/ads/AdActivity$StaticMethodWrapper;


# instance fields
.field private h:Lcom/google/ads/internal/AdWebView;

.field private i:Landroid/view/ViewGroup;

.field private j:Z

.field private k:J

.field private l:Landroid/widget/RelativeLayout;

.field private m:Lcom/google/ads/AdActivity;

.field private n:Z

.field private o:Z

.field private p:Lcom/google/ads/internal/AdVideoView;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 73
    sget-object v0, Lcom/google/ads/internal/a;->a:Lcom/google/ads/util/f;

    invoke-interface {v0}, Lcom/google/ads/util/f;->b()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/ads/internal/a;

    sput-object v0, Lcom/google/ads/AdActivity;->a:Lcom/google/ads/internal/a;

    .line 87
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/ads/AdActivity;->b:Ljava/lang/Object;

    .line 92
    sput-object v1, Lcom/google/ads/AdActivity;->c:Lcom/google/ads/AdActivity;

    .line 98
    sput-object v1, Lcom/google/ads/AdActivity;->d:Lcom/google/ads/internal/d;

    .line 101
    sput-object v1, Lcom/google/ads/AdActivity;->e:Lcom/google/ads/AdActivity;

    .line 104
    sput-object v1, Lcom/google/ads/AdActivity;->f:Lcom/google/ads/AdActivity;

    .line 107
    new-instance v0, Lcom/google/ads/AdActivity$StaticMethodWrapper;

    invoke-direct {v0}, Lcom/google/ads/AdActivity$StaticMethodWrapper;-><init>()V

    sput-object v0, Lcom/google/ads/AdActivity;->g:Lcom/google/ads/AdActivity$StaticMethodWrapper;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 48
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 177
    iput-object v0, p0, Lcom/google/ads/AdActivity;->i:Landroid/view/ViewGroup;

    .line 195
    iput-object v0, p0, Lcom/google/ads/AdActivity;->m:Lcom/google/ads/AdActivity;

    return-void
.end method

.method private a(IIII)Landroid/widget/RelativeLayout$LayoutParams;
    .locals 2
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 465
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, p3, p4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 467
    invoke-virtual {v0, p1, p2, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 468
    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 469
    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 471
    return-object v0
.end method

.method static synthetic a()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 48
    sget-object v0, Lcom/google/ads/AdActivity;->b:Ljava/lang/Object;

    return-object v0
.end method

.method private a(Ljava/lang/String;)V
    .locals 0
    .parameter

    .prologue
    .line 244
    invoke-static {p1}, Lcom/google/ads/util/b;->b(Ljava/lang/String;)V

    .line 245
    invoke-virtual {p0}, Lcom/google/ads/AdActivity;->finish()V

    .line 246
    return-void
.end method

.method private a(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 257
    invoke-static {p1, p2}, Lcom/google/ads/util/b;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 258
    invoke-virtual {p0}, Lcom/google/ads/AdActivity;->finish()V

    .line 259
    return-void
.end method

.method static synthetic b()Lcom/google/ads/AdActivity;
    .locals 1

    .prologue
    .line 48
    sget-object v0, Lcom/google/ads/AdActivity;->e:Lcom/google/ads/AdActivity;

    return-object v0
.end method

.method static synthetic b(Lcom/google/ads/internal/d;)Lcom/google/ads/internal/d;
    .locals 0
    .parameter

    .prologue
    .line 48
    sput-object p0, Lcom/google/ads/AdActivity;->d:Lcom/google/ads/internal/d;

    return-object p0
.end method

.method static synthetic c()Lcom/google/ads/internal/d;
    .locals 1

    .prologue
    .line 48
    sget-object v0, Lcom/google/ads/AdActivity;->d:Lcom/google/ads/internal/d;

    return-object v0
.end method

.method private d()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 782
    iget-boolean v0, p0, Lcom/google/ads/AdActivity;->j:Z

    if-nez v0, :cond_6

    .line 784
    iget-object v0, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    if-eqz v0, :cond_0

    .line 785
    sget-object v0, Lcom/google/ads/AdActivity;->a:Lcom/google/ads/internal/a;

    iget-object v1, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/a;->b(Landroid/webkit/WebView;)V

    .line 786
    iget-object v0, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    invoke-virtual {v0, v2}, Lcom/google/ads/internal/AdWebView;->setAdActivity(Lcom/google/ads/AdActivity;)V

    .line 789
    iget-boolean v0, p0, Lcom/google/ads/AdActivity;->o:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/ads/AdActivity;->l:Landroid/widget/RelativeLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/ads/AdActivity;->i:Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 790
    iget-object v0, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/AdWebView;->setIsExpandedMraid(Z)V

    .line 791
    iget-object v0, p0, Lcom/google/ads/AdActivity;->l:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 792
    iget-object v0, p0, Lcom/google/ads/AdActivity;->i:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 797
    :cond_0
    iget-object v0, p0, Lcom/google/ads/AdActivity;->p:Lcom/google/ads/internal/AdVideoView;

    if-eqz v0, :cond_1

    .line 798
    iget-object v0, p0, Lcom/google/ads/AdActivity;->p:Lcom/google/ads/internal/AdVideoView;

    invoke-virtual {v0}, Lcom/google/ads/internal/AdVideoView;->e()V

    .line 799
    iput-object v2, p0, Lcom/google/ads/AdActivity;->p:Lcom/google/ads/internal/AdVideoView;

    .line 803
    :cond_1
    sget-object v0, Lcom/google/ads/AdActivity;->c:Lcom/google/ads/AdActivity;

    if-ne p0, v0, :cond_2

    .line 804
    sput-object v2, Lcom/google/ads/AdActivity;->c:Lcom/google/ads/AdActivity;

    .line 808
    :cond_2
    iget-object v0, p0, Lcom/google/ads/AdActivity;->m:Lcom/google/ads/AdActivity;

    sput-object v0, Lcom/google/ads/AdActivity;->f:Lcom/google/ads/AdActivity;

    .line 810
    sget-object v1, Lcom/google/ads/AdActivity;->b:Ljava/lang/Object;

    monitor-enter v1

    .line 811
    :try_start_0
    sget-object v0, Lcom/google/ads/AdActivity;->d:Lcom/google/ads/internal/d;

    if-eqz v0, :cond_4

    .line 815
    iget-boolean v0, p0, Lcom/google/ads/AdActivity;->o:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    if-eqz v0, :cond_4

    .line 816
    iget-object v0, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    sget-object v2, Lcom/google/ads/AdActivity;->d:Lcom/google/ads/internal/d;

    invoke-virtual {v2}, Lcom/google/ads/internal/d;->j()Lcom/google/ads/internal/AdWebView;

    move-result-object v2

    if-ne v0, v2, :cond_3

    .line 817
    sget-object v0, Lcom/google/ads/AdActivity;->d:Lcom/google/ads/internal/d;

    invoke-virtual {v0}, Lcom/google/ads/internal/d;->a()V

    .line 819
    :cond_3
    iget-object v0, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    invoke-virtual {v0}, Lcom/google/ads/internal/AdWebView;->stopLoading()V

    .line 824
    :cond_4
    sget-object v0, Lcom/google/ads/AdActivity;->e:Lcom/google/ads/AdActivity;

    if-ne p0, v0, :cond_5

    .line 826
    const/4 v0, 0x0

    sput-object v0, Lcom/google/ads/AdActivity;->e:Lcom/google/ads/AdActivity;

    .line 829
    sget-object v0, Lcom/google/ads/AdActivity;->d:Lcom/google/ads/internal/d;

    if-eqz v0, :cond_7

    .line 831
    sget-object v0, Lcom/google/ads/AdActivity;->d:Lcom/google/ads/internal/d;

    invoke-virtual {v0}, Lcom/google/ads/internal/d;->s()V

    .line 834
    const/4 v0, 0x0

    sput-object v0, Lcom/google/ads/AdActivity;->d:Lcom/google/ads/internal/d;

    .line 840
    :cond_5
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 842
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/ads/AdActivity;->j:Z

    .line 844
    const-string v0, "AdActivity is closing."

    invoke-static {v0}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    .line 846
    :cond_6
    return-void

    .line 836
    :cond_7
    :try_start_1
    const-string v0, "currentAdManager is null while trying to destroy AdActivity."

    invoke-static {v0}, Lcom/google/ads/util/b;->e(Ljava/lang/String;)V

    goto :goto_0

    .line 840
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public static isShowing()Z
    .locals 1

    .prologue
    .line 305
    sget-object v0, Lcom/google/ads/AdActivity;->g:Lcom/google/ads/AdActivity$StaticMethodWrapper;

    invoke-virtual {v0}, Lcom/google/ads/AdActivity$StaticMethodWrapper;->isShowing()Z

    move-result v0

    return v0
.end method

.method public static launchAdActivity(Lcom/google/ads/internal/d;Lcom/google/ads/internal/e;)V
    .locals 1
    .parameter "adManager"
    .parameter "adOpener"

    .prologue
    .line 315
    sget-object v0, Lcom/google/ads/AdActivity;->g:Lcom/google/ads/AdActivity$StaticMethodWrapper;

    invoke-virtual {v0, p0, p1}, Lcom/google/ads/AdActivity$StaticMethodWrapper;->launchAdActivity(Lcom/google/ads/internal/d;Lcom/google/ads/internal/e;)V

    .line 316
    return-void
.end method


# virtual methods
.method protected a(I)Landroid/view/View;
    .locals 4
    .parameter

    .prologue
    const/4 v2, 0x0

    .line 218
    new-instance v0, Landroid/widget/ImageButton;

    invoke-virtual {p0}, Lcom/google/ads/AdActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 219
    const v1, 0x1080017

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 220
    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    .line 221
    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 222
    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/ImageButton;->setPadding(IIII)V

    .line 225
    const/4 v1, 0x1

    int-to-float v2, p1

    invoke-virtual {p0}, Lcom/google/ads/AdActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    invoke-static {v1, v2, v3}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-int v1, v1

    .line 230
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/google/ads/AdActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 231
    invoke-virtual {v2, v0, v1, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;II)V

    .line 233
    return-object v2
.end method

.method protected a(Landroid/app/Activity;)Lcom/google/ads/internal/AdVideoView;
    .locals 2
    .parameter

    .prologue
    .line 420
    new-instance v0, Lcom/google/ads/internal/AdVideoView;

    iget-object v1, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    invoke-direct {v0, p1, v1}, Lcom/google/ads/internal/AdVideoView;-><init>(Landroid/app/Activity;Lcom/google/ads/internal/AdWebView;)V

    return-object v0
.end method

.method protected a(Lcom/google/ads/internal/AdWebView;ZIZ)V
    .locals 8
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    const/16 v7, 0xb

    const/16 v6, 0xa

    const/4 v5, 0x1

    const/4 v4, -0x1

    const/4 v3, -0x2

    .line 657
    invoke-virtual {p0, v5}, Lcom/google/ads/AdActivity;->requestWindowFeature(I)Z

    .line 658
    invoke-virtual {p0}, Lcom/google/ads/AdActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 659
    const/16 v1, 0x400

    const/16 v2, 0x400

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setFlags(II)V

    .line 663
    sget v1, Lcom/google/ads/util/AdUtil;->a:I

    const/16 v2, 0xe

    if-lt v1, v2, :cond_3

    .line 664
    invoke-static {v0}, Lcom/google/ads/util/g;->a(Landroid/view/Window;)V

    .line 671
    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/ads/internal/AdWebView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 672
    if-eqz v0, :cond_1

    .line 673
    if-eqz p4, :cond_5

    .line 674
    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_4

    .line 675
    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/google/ads/AdActivity;->i:Landroid/view/ViewGroup;

    .line 676
    iget-object v0, p0, Lcom/google/ads/AdActivity;->i:Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 689
    :cond_1
    invoke-virtual {p1}, Lcom/google/ads/internal/AdWebView;->b()Lcom/google/ads/AdActivity;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 691
    const-string v0, "Interstitial created with an AdWebView that is already in use by another AdActivity."

    invoke-direct {p0, v0}, Lcom/google/ads/AdActivity;->a(Ljava/lang/String;)V

    .line 728
    :cond_2
    :goto_1
    return-void

    .line 665
    :cond_3
    sget v0, Lcom/google/ads/util/AdUtil;->a:I

    if-lt v0, v7, :cond_0

    .line 666
    invoke-static {p1}, Lcom/google/ads/util/g;->a(Landroid/view/View;)V

    goto :goto_0

    .line 678
    :cond_4
    const-string v0, "MRAID banner was not a child of a ViewGroup."

    invoke-direct {p0, v0}, Lcom/google/ads/AdActivity;->a(Ljava/lang/String;)V

    goto :goto_1

    .line 682
    :cond_5
    const-string v0, "Interstitial created with an AdWebView that has a parent."

    invoke-direct {p0, v0}, Lcom/google/ads/AdActivity;->a(Ljava/lang/String;)V

    goto :goto_1

    .line 695
    :cond_6
    invoke-virtual {p0, p3}, Lcom/google/ads/AdActivity;->setRequestedOrientation(I)V

    .line 696
    invoke-virtual {p1, p0}, Lcom/google/ads/internal/AdWebView;->setAdActivity(Lcom/google/ads/AdActivity;)V

    .line 699
    if-eqz p4, :cond_7

    const/16 v0, 0x32

    :goto_2
    invoke-virtual {p0, v0}, Lcom/google/ads/AdActivity;->a(I)Landroid/view/View;

    move-result-object v0

    .line 702
    iget-object v1, p0, Lcom/google/ads/AdActivity;->l:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, p1, v4, v4}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;II)V

    .line 705
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 709
    if-eqz p4, :cond_8

    .line 710
    invoke-virtual {v1, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 711
    invoke-virtual {v1, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 717
    :goto_3
    iget-object v2, p0, Lcom/google/ads/AdActivity;->l:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 718
    iget-object v0, p0, Lcom/google/ads/AdActivity;->l:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v5}, Landroid/widget/RelativeLayout;->setKeepScreenOn(Z)V

    .line 719
    iget-object v0, p0, Lcom/google/ads/AdActivity;->l:Landroid/widget/RelativeLayout;

    invoke-virtual {p0, v0}, Lcom/google/ads/AdActivity;->setContentView(Landroid/view/View;)V

    .line 722
    iget-object v0, p0, Lcom/google/ads/AdActivity;->l:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getRootView()Landroid/view/View;

    move-result-object v0

    const/high16 v1, -0x100

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 725
    if-eqz p2, :cond_2

    .line 726
    sget-object v0, Lcom/google/ads/AdActivity;->a:Lcom/google/ads/internal/a;

    invoke-virtual {v0, p1}, Lcom/google/ads/internal/a;->a(Landroid/webkit/WebView;)V

    goto :goto_1

    .line 699
    :cond_7
    const/16 v0, 0x20

    goto :goto_2

    .line 713
    :cond_8
    invoke-virtual {v1, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 714
    const/16 v2, 0x9

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    goto :goto_3
.end method

.method protected a(Lcom/google/ads/internal/d;)V
    .locals 2
    .parameter

    .prologue
    .line 403
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    .line 404
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/ads/AdActivity;->k:J

    .line 405
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/ads/AdActivity;->n:Z

    .line 408
    sget-object v1, Lcom/google/ads/AdActivity;->b:Ljava/lang/Object;

    monitor-enter v1

    .line 409
    :try_start_0
    sget-object v0, Lcom/google/ads/AdActivity;->c:Lcom/google/ads/AdActivity;

    if-nez v0, :cond_0

    .line 411
    sput-object p0, Lcom/google/ads/AdActivity;->c:Lcom/google/ads/AdActivity;

    .line 414
    invoke-virtual {p1}, Lcom/google/ads/internal/d;->u()V

    .line 416
    :cond_0
    monitor-exit v1

    .line 417
    return-void

    .line 416
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected a(Ljava/util/HashMap;Lcom/google/ads/internal/d;)V
    .locals 4
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/ads/internal/d;",
            ")V"
        }
    .end annotation

    .prologue
    .line 330
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 331
    new-instance v0, Landroid/content/ComponentName;

    const-string v2, "com.google.android.apps.plus"

    const-string v3, "com.google.android.apps.circles.platform.PlusOneActivity"

    invoke-direct {v0, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 333
    const-string v0, "android.intent.category.LAUNCHER"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 334
    invoke-virtual {p0}, Lcom/google/ads/AdActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 335
    const-string v2, "com.google.circles.platform.intent.extra.ENTITY"

    const-string v0, "u"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 337
    const-string v0, "com.google.circles.platform.intent.extra.ENTITY_TYPE"

    sget-object v2, Lcom/google/ads/ag$b;->a:Lcom/google/ads/ag$b;

    iget-object v2, v2, Lcom/google/ads/ag$b;->c:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 338
    const-string v2, "com.google.circles.platform.intent.extra.ACTION"

    const-string v0, "a"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 341
    invoke-virtual {p0, p2}, Lcom/google/ads/AdActivity;->a(Lcom/google/ads/internal/d;)V

    .line 344
    :try_start_0
    const-string v0, "Launching Google+ intent from AdActivity."

    invoke-static {v0}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    .line 345
    const/4 v0, 0x0

    invoke-virtual {p0, v1, v0}, Lcom/google/ads/AdActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 350
    :goto_0
    return-void

    .line 346
    :catch_0
    move-exception v0

    .line 347
    invoke-virtual {v0}, Landroid/content/ActivityNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/google/ads/AdActivity;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected b(Ljava/util/HashMap;Lcom/google/ads/internal/d;)V
    .locals 4
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/ads/internal/d;",
            ")V"
        }
    .end annotation

    .prologue
    .line 361
    if-nez p1, :cond_0

    .line 362
    const-string v0, "Could not get the paramMap in launchIntent()"

    invoke-direct {p0, v0}, Lcom/google/ads/AdActivity;->a(Ljava/lang/String;)V

    .line 399
    :goto_0
    return-void

    .line 367
    :cond_0
    const-string v0, "u"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 368
    if-nez v0, :cond_1

    .line 369
    const-string v0, "Could not get the URL parameter in launchIntent()."

    invoke-direct {p0, v0}, Lcom/google/ads/AdActivity;->a(Ljava/lang/String;)V

    goto :goto_0

    .line 374
    :cond_1
    const-string v1, "i"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 375
    const-string v2, "m"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 380
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 381
    if-nez v1, :cond_3

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 383
    :goto_1
    if-eqz v2, :cond_2

    .line 385
    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 388
    :cond_2
    invoke-virtual {p0, p2}, Lcom/google/ads/AdActivity;->a(Lcom/google/ads/internal/d;)V

    .line 392
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Launching an intent from AdActivity: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    .line 394
    invoke-virtual {p0, v0}, Lcom/google/ads/AdActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 395
    :catch_0
    move-exception v0

    .line 396
    invoke-virtual {v0}, Landroid/content/ActivityNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/google/ads/AdActivity;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 381
    :cond_3
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    goto :goto_1
.end method

.method public getAdVideoView()Lcom/google/ads/internal/AdVideoView;
    .locals 1

    .prologue
    .line 266
    iget-object v0, p0, Lcom/google/ads/AdActivity;->p:Lcom/google/ads/internal/AdVideoView;

    return-object v0
.end method

.method public getOpeningAdWebView()Lcom/google/ads/internal/AdWebView;
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 276
    iget-object v1, p0, Lcom/google/ads/AdActivity;->m:Lcom/google/ads/AdActivity;

    if-eqz v1, :cond_0

    .line 277
    iget-object v0, p0, Lcom/google/ads/AdActivity;->m:Lcom/google/ads/AdActivity;

    iget-object v0, v0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    .line 296
    :goto_0
    return-object v0

    .line 281
    :cond_0
    sget-object v2, Lcom/google/ads/AdActivity;->b:Ljava/lang/Object;

    monitor-enter v2

    .line 282
    :try_start_0
    sget-object v1, Lcom/google/ads/AdActivity;->d:Lcom/google/ads/internal/d;

    if-nez v1, :cond_1

    .line 283
    const-string v1, "currentAdManager was null while trying to get the opening AdWebView."

    invoke-static {v1}, Lcom/google/ads/util/b;->e(Ljava/lang/String;)V

    .line 285
    monitor-exit v2

    goto :goto_0

    .line 298
    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 288
    :cond_1
    :try_start_1
    sget-object v1, Lcom/google/ads/AdActivity;->d:Lcom/google/ads/internal/d;

    invoke-virtual {v1}, Lcom/google/ads/internal/d;->j()Lcom/google/ads/internal/AdWebView;

    move-result-object v1

    .line 289
    iget-object v3, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    if-eq v1, v3, :cond_2

    .line 292
    monitor-exit v2

    move-object v0, v1

    goto :goto_0

    .line 296
    :cond_2
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public moveAdVideoView(IIII)V
    .locals 2
    .parameter "x"
    .parameter "y"
    .parameter "width"
    .parameter "height"

    .prologue
    .line 428
    iget-object v0, p0, Lcom/google/ads/AdActivity;->p:Lcom/google/ads/internal/AdVideoView;

    if-eqz v0, :cond_0

    .line 429
    iget-object v0, p0, Lcom/google/ads/AdActivity;->p:Lcom/google/ads/internal/AdVideoView;

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/ads/AdActivity;->a(IIII)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/AdVideoView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 430
    iget-object v0, p0, Lcom/google/ads/AdActivity;->p:Lcom/google/ads/internal/AdVideoView;

    invoke-virtual {v0}, Lcom/google/ads/internal/AdVideoView;->requestLayout()V

    .line 432
    :cond_0
    return-void
.end method

.method public newAdVideoView(IIII)V
    .locals 4
    .parameter "x"
    .parameter "y"
    .parameter "width"
    .parameter "height"

    .prologue
    const/4 v3, 0x0

    .line 439
    iget-object v0, p0, Lcom/google/ads/AdActivity;->p:Lcom/google/ads/internal/AdVideoView;

    if-nez v0, :cond_0

    .line 442
    invoke-virtual {p0, p0}, Lcom/google/ads/AdActivity;->a(Landroid/app/Activity;)Lcom/google/ads/internal/AdVideoView;

    move-result-object v0

    iput-object v0, p0, Lcom/google/ads/AdActivity;->p:Lcom/google/ads/internal/AdVideoView;

    .line 443
    iget-object v0, p0, Lcom/google/ads/AdActivity;->l:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/google/ads/AdActivity;->p:Lcom/google/ads/internal/AdVideoView;

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/ads/AdActivity;->a(IIII)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v0, v1, v3, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 448
    sget-object v1, Lcom/google/ads/AdActivity;->b:Ljava/lang/Object;

    monitor-enter v1

    .line 449
    :try_start_0
    sget-object v0, Lcom/google/ads/AdActivity;->d:Lcom/google/ads/internal/d;

    if-nez v0, :cond_1

    .line 450
    const-string v0, "currentAdManager was null while trying to get the opening AdWebView."

    invoke-static {v0}, Lcom/google/ads/util/b;->e(Ljava/lang/String;)V

    .line 452
    monitor-exit v1

    .line 458
    :cond_0
    :goto_0
    return-void

    .line 454
    :cond_1
    sget-object v0, Lcom/google/ads/AdActivity;->d:Lcom/google/ads/internal/d;

    invoke-virtual {v0}, Lcom/google/ads/internal/d;->k()Lcom/google/ads/internal/i;

    move-result-object v0

    .line 455
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/google/ads/internal/i;->b(Z)V

    .line 456
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .parameter "reqCode"
    .parameter "resCode"
    .parameter "data"

    .prologue
    .line 876
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 879
    invoke-virtual {p0}, Lcom/google/ads/AdActivity;->getOpeningAdWebView()Lcom/google/ads/internal/AdWebView;

    move-result-object v0

    if-eqz v0, :cond_0

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "com.google.circles.platform.result.extra.CONFIRMATION"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "com.google.circles.platform.result.extra.ACTION"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 883
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "com.google.circles.platform.result.extra.CONFIRMATION"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 885
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "com.google.circles.platform.result.extra.ACTION"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 887
    const-string v2, "yes"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 888
    const-string v0, "insert"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 890
    invoke-virtual {p0}, Lcom/google/ads/AdActivity;->getOpeningAdWebView()Lcom/google/ads/internal/AdWebView;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/google/ads/ae;->a(Landroid/webkit/WebView;Z)V

    .line 899
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/google/ads/AdActivity;->finish()V

    .line 900
    return-void

    .line 891
    :cond_1
    const-string v0, "delete"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 893
    invoke-virtual {p0}, Lcom/google/ads/AdActivity;->getOpeningAdWebView()Lcom/google/ads/internal/AdWebView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/ads/ae;->a(Landroid/webkit/WebView;Z)V

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0
    .parameter "v"

    .prologue
    .line 482
    invoke-virtual {p0}, Lcom/google/ads/AdActivity;->finish()V

    .line 483
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 10
    .parameter "savedInstanceState"

    .prologue
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v1, 0x1

    .line 494
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 496
    iput-boolean v6, p0, Lcom/google/ads/AdActivity;->j:Z

    .line 501
    sget-object v2, Lcom/google/ads/AdActivity;->b:Ljava/lang/Object;

    monitor-enter v2

    .line 502
    :try_start_0
    sget-object v0, Lcom/google/ads/AdActivity;->d:Lcom/google/ads/internal/d;

    if-eqz v0, :cond_5

    .line 503
    sget-object v7, Lcom/google/ads/AdActivity;->d:Lcom/google/ads/internal/d;

    .line 510
    sget-object v0, Lcom/google/ads/AdActivity;->e:Lcom/google/ads/AdActivity;

    if-nez v0, :cond_0

    .line 511
    sput-object p0, Lcom/google/ads/AdActivity;->e:Lcom/google/ads/AdActivity;

    .line 514
    invoke-virtual {v7}, Lcom/google/ads/internal/d;->t()V

    .line 518
    :cond_0
    iget-object v0, p0, Lcom/google/ads/AdActivity;->m:Lcom/google/ads/AdActivity;

    if-nez v0, :cond_1

    sget-object v0, Lcom/google/ads/AdActivity;->f:Lcom/google/ads/AdActivity;

    if-eqz v0, :cond_1

    .line 519
    sget-object v0, Lcom/google/ads/AdActivity;->f:Lcom/google/ads/AdActivity;

    iput-object v0, p0, Lcom/google/ads/AdActivity;->m:Lcom/google/ads/AdActivity;

    .line 521
    :cond_1
    sput-object p0, Lcom/google/ads/AdActivity;->f:Lcom/google/ads/AdActivity;

    .line 524
    invoke-virtual {v7}, Lcom/google/ads/internal/d;->g()Lcom/google/ads/m;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/ads/m;->a()Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Lcom/google/ads/AdActivity;->e:Lcom/google/ads/AdActivity;

    if-eq v0, p0, :cond_3

    :cond_2
    invoke-virtual {v7}, Lcom/google/ads/internal/d;->g()Lcom/google/ads/m;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/ads/m;->b()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/google/ads/AdActivity;->m:Lcom/google/ads/AdActivity;

    sget-object v3, Lcom/google/ads/AdActivity;->e:Lcom/google/ads/AdActivity;

    if-ne v0, v3, :cond_4

    .line 527
    :cond_3
    invoke-virtual {v7}, Lcom/google/ads/internal/d;->v()V

    .line 531
    :cond_4
    sget-object v0, Lcom/google/ads/AdActivity;->d:Lcom/google/ads/internal/d;

    invoke-virtual {v0}, Lcom/google/ads/internal/d;->p()Z

    move-result v8

    .line 532
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 536
    iput-object v5, p0, Lcom/google/ads/AdActivity;->l:Landroid/widget/RelativeLayout;

    .line 539
    iput-boolean v6, p0, Lcom/google/ads/AdActivity;->n:Z

    .line 543
    iput-boolean v1, p0, Lcom/google/ads/AdActivity;->o:Z

    .line 546
    iput-object v5, p0, Lcom/google/ads/AdActivity;->p:Lcom/google/ads/internal/AdVideoView;

    .line 549
    invoke-virtual {p0}, Lcom/google/ads/AdActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v2, "com.google.ads.AdOpener"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 550
    if-nez v0, :cond_6

    .line 551
    const-string v0, "Could not get the Bundle used to create AdActivity."

    invoke-direct {p0, v0}, Lcom/google/ads/AdActivity;->a(Ljava/lang/String;)V

    .line 639
    :goto_0
    return-void

    .line 505
    :cond_5
    :try_start_1
    const-string v0, "Could not get currentAdManager."

    invoke-direct {p0, v0}, Lcom/google/ads/AdActivity;->a(Ljava/lang/String;)V

    .line 506
    monitor-exit v2

    goto :goto_0

    .line 532
    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 554
    :cond_6
    new-instance v2, Lcom/google/ads/internal/e;

    invoke-direct {v2, v0}, Lcom/google/ads/internal/e;-><init>(Landroid/os/Bundle;)V

    .line 557
    invoke-virtual {v2}, Lcom/google/ads/internal/e;->b()Ljava/lang/String;

    move-result-object v0

    .line 558
    invoke-virtual {v2}, Lcom/google/ads/internal/e;->c()Ljava/util/HashMap;

    move-result-object v9

    .line 561
    const-string v2, "plusone"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 562
    invoke-virtual {p0, v9, v7}, Lcom/google/ads/AdActivity;->a(Ljava/util/HashMap;Lcom/google/ads/internal/d;)V

    goto :goto_0

    .line 563
    :cond_7
    const-string v2, "intent"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 564
    invoke-virtual {p0, v9, v7}, Lcom/google/ads/AdActivity;->b(Ljava/util/HashMap;Lcom/google/ads/internal/d;)V

    goto :goto_0

    .line 567
    :cond_8
    new-instance v2, Landroid/widget/RelativeLayout;

    invoke-virtual {p0}, Lcom/google/ads/AdActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/google/ads/AdActivity;->l:Landroid/widget/RelativeLayout;

    .line 570
    const-string v2, "webapp"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 572
    new-instance v0, Lcom/google/ads/internal/AdWebView;

    invoke-virtual {v7}, Lcom/google/ads/internal/d;->g()Lcom/google/ads/m;

    move-result-object v2

    invoke-direct {v0, v2, v5}, Lcom/google/ads/internal/AdWebView;-><init>(Lcom/google/ads/m;Lcom/google/ads/AdSize;)V

    iput-object v0, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    .line 576
    sget-object v2, Lcom/google/ads/internal/a;->c:Ljava/util/Map;

    if-nez v8, :cond_a

    move v0, v1

    :goto_1
    invoke-static {v7, v2, v1, v0}, Lcom/google/ads/internal/i;->a(Lcom/google/ads/internal/d;Ljava/util/Map;ZZ)Lcom/google/ads/internal/i;

    move-result-object v0

    .line 578
    invoke-virtual {v0, v1}, Lcom/google/ads/internal/i;->d(Z)V

    .line 579
    if-eqz v8, :cond_9

    .line 580
    invoke-virtual {v0, v1}, Lcom/google/ads/internal/i;->a(Z)V

    .line 582
    :cond_9
    iget-object v1, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    invoke-virtual {v1, v0}, Lcom/google/ads/internal/AdWebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 585
    const-string v0, "u"

    invoke-virtual {v9, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 586
    const-string v1, "baseurl"

    invoke-virtual {v9, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 587
    const-string v2, "html"

    invoke-virtual {v9, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 589
    if-eqz v0, :cond_b

    .line 590
    iget-object v1, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    invoke-virtual {v1, v0}, Lcom/google/ads/internal/AdWebView;->loadUrl(Ljava/lang/String;)V

    .line 601
    :goto_2
    const-string v0, "o"

    invoke-virtual {v9, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 602
    const-string v1, "p"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 603
    invoke-static {}, Lcom/google/ads/util/AdUtil;->b()I

    move-result v0

    .line 619
    :goto_3
    iget-object v1, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    invoke-virtual {p0, v1, v6, v0, v8}, Lcom/google/ads/AdActivity;->a(Lcom/google/ads/internal/AdWebView;ZIZ)V

    goto/16 :goto_0

    :cond_a
    move v0, v6

    .line 576
    goto :goto_1

    .line 591
    :cond_b
    if-eqz v2, :cond_c

    .line 592
    iget-object v0, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    const-string v3, "text/html"

    const-string v4, "utf-8"

    invoke-virtual/range {v0 .. v5}, Lcom/google/ads/internal/AdWebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 595
    :cond_c
    const-string v0, "Could not get the URL or HTML parameter to show a web app."

    invoke-direct {p0, v0}, Lcom/google/ads/AdActivity;->a(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 604
    :cond_d
    const-string v1, "l"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 605
    invoke-static {}, Lcom/google/ads/util/AdUtil;->a()I

    move-result v0

    goto :goto_3

    .line 611
    :cond_e
    sget-object v0, Lcom/google/ads/AdActivity;->e:Lcom/google/ads/AdActivity;

    if-ne p0, v0, :cond_f

    .line 612
    invoke-virtual {v7}, Lcom/google/ads/internal/d;->m()I

    move-result v0

    goto :goto_3

    .line 614
    :cond_f
    const/4 v0, -0x1

    goto :goto_3

    .line 620
    :cond_10
    const-string v2, "interstitial"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_11

    const-string v2, "expand"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    .line 623
    :cond_11
    invoke-virtual {v7}, Lcom/google/ads/internal/d;->j()Lcom/google/ads/internal/AdWebView;

    move-result-object v2

    iput-object v2, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    .line 624
    invoke-virtual {v7}, Lcom/google/ads/internal/d;->m()I

    move-result v2

    .line 627
    const-string v3, "expand"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 628
    iget-object v0, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/AdWebView;->setIsExpandedMraid(Z)V

    .line 629
    iput-boolean v6, p0, Lcom/google/ads/AdActivity;->o:Z

    .line 633
    :cond_12
    iget-object v0, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    invoke-virtual {p0, v0, v1, v2, v8}, Lcom/google/ads/AdActivity;->a(Lcom/google/ads/internal/AdWebView;ZIZ)V

    goto/16 :goto_0

    .line 635
    :cond_13
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown AdOpener, <action: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/ads/AdActivity;->a(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 744
    iget-object v0, p0, Lcom/google/ads/AdActivity;->l:Landroid/widget/RelativeLayout;

    if-eqz v0, :cond_0

    .line 745
    iget-object v0, p0, Lcom/google/ads/AdActivity;->l:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->removeAllViews()V

    .line 749
    :cond_0
    invoke-virtual {p0}, Lcom/google/ads/AdActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 750
    invoke-direct {p0}, Lcom/google/ads/AdActivity;->d()V

    .line 751
    iget-boolean v0, p0, Lcom/google/ads/AdActivity;->o:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    if-eqz v0, :cond_1

    .line 752
    iget-object v0, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    invoke-virtual {v0}, Lcom/google/ads/internal/AdWebView;->stopLoading()V

    .line 753
    iget-object v0, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    invoke-virtual {v0}, Lcom/google/ads/internal/AdWebView;->destroy()V

    .line 754
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/ads/AdActivity;->h:Lcom/google/ads/internal/AdWebView;

    .line 758
    :cond_1
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 759
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 769
    invoke-virtual {p0}, Lcom/google/ads/AdActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 770
    invoke-direct {p0}, Lcom/google/ads/AdActivity;->d()V

    .line 773
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 774
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 4
    .parameter "hasFocus"

    .prologue
    .line 856
    iget-boolean v0, p0, Lcom/google/ads/AdActivity;->n:Z

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 858
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/ads/AdActivity;->k:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0xfa

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 859
    const-string v0, "Launcher AdActivity got focus and is closing."

    invoke-static {v0}, Lcom/google/ads/util/b;->d(Ljava/lang/String;)V

    .line 860
    invoke-virtual {p0}, Lcom/google/ads/AdActivity;->finish()V

    .line 864
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 865
    return-void
.end method

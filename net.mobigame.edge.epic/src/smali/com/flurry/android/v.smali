.class final Lcom/flurry/android/v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static volatile A:J

.field static a:Ljava/lang/String;

.field static b:Ljava/lang/String;

.field private static volatile c:Ljava/lang/String;

.field private static volatile d:Ljava/lang/String;

.field private static volatile e:Ljava/lang/String;

.field private static f:Ljava/lang/String;

.field private static g:I


# instance fields
.field private h:Ljava/lang/String;

.field private i:Ljava/lang/String;

.field private j:Ljava/lang/String;

.field private k:J

.field private l:J

.field private m:J

.field private n:J

.field private o:Lcom/flurry/android/aa;

.field private p:Z

.field private volatile q:Z

.field private r:Ljava/lang/String;

.field private s:Ljava/util/Map;

.field private t:Landroid/os/Handler;

.field private u:Z

.field private transient v:Ljava/util/Map;

.field private w:Lcom/flurry/android/ah;

.field private x:Ljava/util/List;

.field private y:Ljava/util/Map;

.field private z:Lcom/flurry/android/AppCircleCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 35
    const-string v0, "market://"

    sput-object v0, Lcom/flurry/android/v;->c:Ljava/lang/String;

    .line 36
    const-string v0, "market://details?id="

    sput-object v0, Lcom/flurry/android/v;->d:Ljava/lang/String;

    .line 37
    const-string v0, "https://market.android.com/details?id="

    sput-object v0, Lcom/flurry/android/v;->e:Ljava/lang/String;

    .line 38
    const-string v0, "com.flurry.android.ACTION_CATALOG"

    sput-object v0, Lcom/flurry/android/v;->f:Ljava/lang/String;

    .line 43
    const-string v0, "FlurryAgent"

    sput-object v0, Lcom/flurry/android/v;->a:Ljava/lang/String;

    .line 44
    new-instance v0, Ljava/util/Random;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Random;-><init>(J)V

    .line 45
    const/16 v0, 0x1388

    sput v0, Lcom/flurry/android/v;->g:I

    .line 53
    const-string v0, ""

    sput-object v0, Lcom/flurry/android/v;->b:Ljava/lang/String;

    .line 90
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/flurry/android/v;->A:J

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/android/v;->p:Z

    .line 69
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/v;->s:Ljava/util/Map;

    .line 76
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/v;->v:Ljava/util/Map;

    .line 82
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/v;->x:Ljava/util/List;

    .line 85
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/v;->y:Ljava/util/Map;

    .line 96
    new-instance v0, Lcom/flurry/android/aa;

    invoke-direct {v0}, Lcom/flurry/android/aa;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/v;->o:Lcom/flurry/android/aa;

    .line 97
    return-void
.end method

.method static synthetic a(Lcom/flurry/android/v;)Lcom/flurry/android/AppCircleCallback;
    .locals 1
    .parameter

    .prologue
    .line 32
    iget-object v0, p0, Lcom/flurry/android/v;->z:Lcom/flurry/android/AppCircleCallback;

    return-object v0
.end method

.method private a(Ljava/lang/String;Lcom/flurry/android/w;)Lcom/flurry/android/Offer;
    .locals 8
    .parameter
    .parameter

    .prologue
    .line 532
    new-instance v3, Lcom/flurry/android/p;

    const/4 v0, 0x3

    invoke-virtual {p0}, Lcom/flurry/android/v;->j()J

    move-result-wide v1

    invoke-direct {v3, p1, v0, v1, v2}, Lcom/flurry/android/p;-><init>(Ljava/lang/String;BJ)V

    .line 533
    invoke-direct {p0, v3}, Lcom/flurry/android/v;->c(Lcom/flurry/android/p;)V

    .line 534
    new-instance v0, Lcom/flurry/android/f;

    const/4 v1, 0x2

    invoke-virtual {p0}, Lcom/flurry/android/v;->j()J

    move-result-wide v4

    invoke-direct {v0, v1, v4, v5}, Lcom/flurry/android/f;-><init>(BJ)V

    invoke-virtual {v3, v0}, Lcom/flurry/android/p;->a(Lcom/flurry/android/f;)V

    .line 536
    iput-object p2, v3, Lcom/flurry/android/p;->c:Lcom/flurry/android/w;

    .line 537
    iget-object v0, p0, Lcom/flurry/android/v;->o:Lcom/flurry/android/aa;

    iget-wide v1, p2, Lcom/flurry/android/w;->a:J

    invoke-virtual {v0, v1, v2}, Lcom/flurry/android/aa;->a(J)Lcom/flurry/android/am;

    move-result-object v0

    .line 538
    if-nez v0, :cond_0

    const-string v6, ""

    .line 539
    :goto_0
    if-nez v0, :cond_1

    const/4 v7, 0x0

    .line 541
    :goto_1
    new-instance v0, Lcom/flurry/android/u;

    sget-wide v1, Lcom/flurry/android/v;->A:J

    const-wide/16 v4, 0x1

    add-long/2addr v1, v4

    sput-wide v1, Lcom/flurry/android/v;->A:J

    iget-object v4, p2, Lcom/flurry/android/w;->h:Lcom/flurry/android/AdImage;

    iget-object v5, p2, Lcom/flurry/android/w;->d:Ljava/lang/String;

    invoke-direct/range {v0 .. v7}, Lcom/flurry/android/u;-><init>(JLcom/flurry/android/p;Lcom/flurry/android/AdImage;Ljava/lang/String;Ljava/lang/String;I)V

    .line 542
    iget-object v1, p0, Lcom/flurry/android/v;->y:Ljava/util/Map;

    iget-wide v2, v0, Lcom/flurry/android/u;->a:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 544
    new-instance v7, Lcom/flurry/android/Offer;

    iget-wide v1, v0, Lcom/flurry/android/u;->a:J

    iget-object v3, v0, Lcom/flurry/android/u;->f:Lcom/flurry/android/AdImage;

    iget-object v4, v0, Lcom/flurry/android/u;->c:Ljava/lang/String;

    iget-object v5, v0, Lcom/flurry/android/u;->d:Ljava/lang/String;

    iget v6, v0, Lcom/flurry/android/u;->e:I

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/flurry/android/Offer;-><init>(JLcom/flurry/android/AdImage;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v7

    .line 538
    :cond_0
    iget-object v6, v0, Lcom/flurry/android/am;->a:Ljava/lang/String;

    goto :goto_0

    .line 539
    :cond_1
    iget v7, v0, Lcom/flurry/android/am;->c:I

    goto :goto_1
.end method

.method static synthetic a(Lcom/flurry/android/v;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lcom/flurry/android/v;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static a([B)Ljava/lang/String;
    .locals 4
    .parameter

    .prologue
    const/16 v3, 0xa

    .line 757
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 758
    const/4 v0, 0x0

    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_2

    .line 760
    aget-byte v2, p0, v0

    shr-int/lit8 v2, v2, 0x4

    and-int/lit8 v2, v2, 0xf

    .line 761
    if-ge v2, v3, :cond_0

    .line 763
    add-int/lit8 v2, v2, 0x30

    int-to-char v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 770
    :goto_1
    aget-byte v2, p0, v0

    and-int/lit8 v2, v2, 0xf

    .line 771
    if-ge v2, v3, :cond_1

    .line 773
    add-int/lit8 v2, v2, 0x30

    int-to-char v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 758
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 767
    :cond_0
    add-int/lit8 v2, v2, 0x41

    add-int/lit8 v2, v2, -0xa

    int-to-char v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 777
    :cond_1
    add-int/lit8 v2, v2, 0x41

    add-int/lit8 v2, v2, -0xa

    int-to-char v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 780
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private a(Ljava/util/List;Ljava/lang/Long;)Ljava/util/List;
    .locals 8
    .parameter
    .parameter

    .prologue
    const/4 v7, 0x0

    .line 618
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/flurry/android/v;->o:Lcom/flurry/android/aa;

    invoke-virtual {v0}, Lcom/flurry/android/aa;->b()Z

    move-result v0

    if-nez v0, :cond_1

    .line 620
    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    .line 644
    :goto_0
    return-object v0

    .line 623
    :cond_1
    iget-object v1, p0, Lcom/flurry/android/v;->o:Lcom/flurry/android/aa;

    invoke-interface {p1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/flurry/android/aa;->a(Ljava/lang/String;)[Lcom/flurry/android/w;

    move-result-object v0

    .line 625
    if-eqz v0, :cond_4

    array-length v1, v0

    if-lez v1, :cond_4

    .line 627
    new-instance v1, Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 628
    invoke-static {v1}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 629
    if-eqz p2, :cond_3

    .line 631
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 633
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/w;

    .line 634
    iget-wide v3, v0, Lcom/flurry/android/w;->a:J

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    cmp-long v0, v3, v5

    if-nez v0, :cond_2

    .line 636
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 642
    :cond_3
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-interface {v1, v7, v0}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    goto :goto_0

    .line 644
    :cond_4
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method static synthetic a(Lcom/flurry/android/v;Landroid/content/Context;Ljava/lang/String;)V
    .locals 4
    .parameter
    .parameter
    .parameter

    .prologue
    .line 32
    sget-object v0, Lcom/flurry/android/v;->d:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/flurry/android/v;->d:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    iget-boolean v1, p0, Lcom/flurry/android/v;->p:Z

    if-eqz v1, :cond_0

    :try_start_0
    sget-object v1, Lcom/flurry/android/v;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Launching Android Market for app "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    sget-object v1, Lcom/flurry/android/v;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot launch Marketplace url "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/flurry/android/ai;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :cond_0
    sget-object v1, Lcom/flurry/android/v;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Launching Android Market website for app "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flurry/android/v;->e:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/flurry/android/v;->a:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected android market url scheme: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static a(Ljava/lang/Runnable;)V
    .locals 1
    .parameter

    .prologue
    .line 824
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 825
    return-void
.end method

.method private b(Landroid/content/Context;Lcom/flurry/android/p;Ljava/lang/String;)V
    .locals 4
    .parameter
    .parameter
    .parameter

    .prologue
    .line 696
    new-instance v0, Landroid/content/Intent;

    invoke-static {}, Lcom/flurry/android/v;->o()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 697
    const-string v1, "android.intent.category.DEFAULT"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 698
    const-string v1, "u"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 699
    if-eqz p2, :cond_0

    .line 702
    const-string v1, "o"

    invoke-virtual {p2}, Lcom/flurry/android/p;->a()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 704
    :cond_0
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 705
    return-void
.end method

.method static synthetic b(Lcom/flurry/android/v;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lcom/flurry/android/v;->e(Ljava/lang/String;)V

    return-void
.end method

.method private c(Lcom/flurry/android/p;)V
    .locals 3
    .parameter

    .prologue
    .line 606
    iget-object v0, p0, Lcom/flurry/android/v;->x:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0x7fff

    if-ge v0, v1, :cond_0

    .line 608
    iget-object v0, p0, Lcom/flurry/android/v;->x:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 609
    iget-object v0, p0, Lcom/flurry/android/v;->v:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/flurry/android/p;->a()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 611
    :cond_0
    return-void
.end method

.method private d(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter

    .prologue
    const/4 v0, 0x0

    .line 353
    :try_start_0
    sget-object v1, Lcom/flurry/android/v;->c:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 355
    new-instance v1, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v1, p1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 356
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 357
    invoke-interface {v2, v1}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    .line 359
    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v2

    .line 361
    const/16 v3, 0xc8

    if-ne v2, v3, :cond_1

    .line 363
    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object p1

    .line 364
    sget-object v1, Lcom/flurry/android/v;->c:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 366
    invoke-direct {p0, p1}, Lcom/flurry/android/v;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 391
    :cond_0
    :goto_0
    return-object p1

    .line 371
    :cond_1
    sget-object v1, Lcom/flurry/android/v;->a:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cannot process with responseCode "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/flurry/android/ai;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 372
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error when fetching application\'s android market ID, responseCode "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/flurry/android/v;->e(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 377
    :catch_0
    move-exception v1

    .line 379
    sget-object v2, Lcom/flurry/android/v;->a:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown host: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/net/UnknownHostException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/flurry/android/ai;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 380
    iget-object v2, p0, Lcom/flurry/android/v;->z:Lcom/flurry/android/AppCircleCallback;

    if-eqz v2, :cond_2

    .line 382
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown host: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/net/UnknownHostException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 383
    invoke-direct {p0, v1}, Lcom/flurry/android/v;->e(Ljava/lang/String;)V

    :cond_2
    move-object p1, v0

    .line 386
    goto :goto_0

    .line 388
    :catch_1
    move-exception v1

    .line 390
    sget-object v2, Lcom/flurry/android/v;->a:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed on url: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Lcom/flurry/android/ai;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object p1, v0

    .line 391
    goto/16 :goto_0
.end method

.method private e(Ljava/lang/String;)V
    .locals 1
    .parameter

    .prologue
    .line 397
    new-instance v0, Lcom/flurry/android/af;

    invoke-direct {v0, p0, p1}, Lcom/flurry/android/af;-><init>(Lcom/flurry/android/v;Ljava/lang/String;)V

    .line 411
    invoke-static {v0}, Lcom/flurry/android/v;->a(Ljava/lang/Runnable;)V

    .line 412
    return-void
.end method

.method private declared-synchronized n()Lcom/flurry/android/AdImage;
    .locals 2

    .prologue
    .line 236
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/v;->p()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 238
    const/4 v0, 0x0

    .line 240
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/v;->o:Lcom/flurry/android/aa;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/flurry/android/aa;->a(S)Lcom/flurry/android/AdImage;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 236
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private static o()Ljava/lang/String;
    .locals 1

    .prologue
    .line 716
    sget-object v0, Lcom/flurry/android/FlurryAgent;->a:Ljava/lang/String;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/flurry/android/FlurryAgent;->a:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/flurry/android/v;->f:Ljava/lang/String;

    goto :goto_0
.end method

.method private p()Z
    .locals 2

    .prologue
    .line 856
    iget-boolean v0, p0, Lcom/flurry/android/v;->q:Z

    if-nez v0, :cond_0

    .line 858
    sget-object v0, Lcom/flurry/android/v;->a:Ljava/lang/String;

    const-string v1, "AppCircle is not initialized"

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 860
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/v;->r:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 862
    sget-object v0, Lcom/flurry/android/v;->a:Ljava/lang/String;

    const-string v1, "Cannot identify UDID."

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 864
    :cond_1
    iget-boolean v0, p0, Lcom/flurry/android/v;->q:Z

    return v0
.end method


# virtual methods
.method final declared-synchronized a(Landroid/content/Context;Ljava/lang/String;I)Landroid/view/View;
    .locals 2
    .parameter
    .parameter
    .parameter

    .prologue
    .line 593
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/v;->p()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 595
    const/4 v0, 0x0

    .line 601
    :goto_0
    monitor-exit p0

    return-object v0

    .line 598
    :cond_0
    :try_start_1
    new-instance v0, Lcom/flurry/android/o;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/flurry/android/o;-><init>(Lcom/flurry/android/v;Landroid/content/Context;Ljava/lang/String;I)V

    .line 599
    iget-object v1, p0, Lcom/flurry/android/v;->w:Lcom/flurry/android/ah;

    invoke-virtual {v1, v0}, Lcom/flurry/android/ah;->a(Lcom/flurry/android/o;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 593
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized a(J)Lcom/flurry/android/AdImage;
    .locals 1
    .parameter

    .prologue
    .line 218
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/v;->p()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 220
    const/4 v0, 0x0

    .line 222
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/v;->o:Lcom/flurry/android/aa;

    invoke-virtual {v0, p1, p2}, Lcom/flurry/android/aa;->b(J)Lcom/flurry/android/AdImage;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 218
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized a(Lcom/flurry/android/p;)Ljava/lang/String;
    .locals 5
    .parameter

    .prologue
    .line 722
    monitor-enter p0

    :try_start_0
    iget-object v1, p1, Lcom/flurry/android/p;->c:Lcom/flurry/android/w;

    .line 724
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "?apik="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/flurry/android/v;->j:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "&cid="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, v1, Lcom/flurry/android/w;->e:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "&adid="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, v1, Lcom/flurry/android/w;->a:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "&pid="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/flurry/android/v;->r:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "&iid="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/flurry/android/v;->k:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "&sid="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/flurry/android/v;->l:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "&lid="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p1, Lcom/flurry/android/p;->b:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "&aso="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v0, p1, Lcom/flurry/android/p;->e:Ljava/util/List;

    iget-object v3, p1, Lcom/flurry/android/p;->e:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/f;

    iget-wide v3, v0, Lcom/flurry/android/f;->b:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "&hid="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p1, Lcom/flurry/android/p;->a:Ljava/lang/String;

    invoke-static {v2}, Lcom/flurry/android/r;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "&ac="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, v1, Lcom/flurry/android/w;->g:[B

    invoke-static {v1}, Lcom/flurry/android/v;->a([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 737
    iget-object v0, p0, Lcom/flurry/android/v;->s:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flurry/android/v;->s:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 739
    iget-object v0, p0, Lcom/flurry/android/v;->s:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 741
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "c_"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lcom/flurry/android/r;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 742
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/flurry/android/r;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 743
    const-string v4, "&"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 722
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 750
    :cond_0
    :try_start_1
    const-string v0, "&ats="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 752
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0
.end method

.method final declared-synchronized a(Landroid/content/Context;Ljava/util/List;Ljava/lang/Long;IZ)Ljava/util/List;
    .locals 11
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 549
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/v;->p()Z

    move-result v0

    if-nez v0, :cond_0

    .line 551
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 588
    :goto_0
    monitor-exit p0

    return-object v0

    .line 554
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/v;->o:Lcom/flurry/android/aa;

    invoke-virtual {v0}, Lcom/flurry/android/aa;->b()Z

    move-result v0

    if-eqz v0, :cond_4

    if-eqz p2, :cond_4

    .line 556
    invoke-direct {p0, p2, p3}, Lcom/flurry/android/v;->a(Ljava/util/List;Ljava/lang/Long;)Ljava/util/List;

    move-result-object v9

    .line 558
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v10

    .line 559
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 560
    const/4 v0, 0x0

    move v8, v0

    :goto_1
    if-ge v8, v10, :cond_3

    .line 562
    invoke-interface {p2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 563
    iget-object v1, p0, Lcom/flurry/android/v;->o:Lcom/flurry/android/aa;

    invoke-virtual {v1, v0}, Lcom/flurry/android/aa;->b(Ljava/lang/String;)Lcom/flurry/android/e;

    move-result-object v4

    .line 564
    if-eqz v4, :cond_2

    .line 566
    new-instance v3, Lcom/flurry/android/p;

    invoke-interface {p2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/flurry/android/v;->j()J

    move-result-wide v5

    invoke-direct {v3, v0, v1, v5, v6}, Lcom/flurry/android/p;-><init>(Ljava/lang/String;BJ)V

    .line 567
    invoke-direct {p0, v3}, Lcom/flurry/android/v;->c(Lcom/flurry/android/p;)V

    .line 569
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v0

    if-ge v8, v0, :cond_1

    .line 571
    invoke-interface {v9, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/w;

    .line 572
    iput-object v0, v3, Lcom/flurry/android/p;->c:Lcom/flurry/android/w;

    .line 573
    new-instance v0, Lcom/flurry/android/f;

    const/4 v1, 0x2

    invoke-virtual {p0}, Lcom/flurry/android/v;->j()J

    move-result-wide v5

    invoke-direct {v0, v1, v5, v6}, Lcom/flurry/android/f;-><init>(BJ)V

    invoke-virtual {v3, v0}, Lcom/flurry/android/p;->a(Lcom/flurry/android/f;)V

    .line 575
    new-instance v0, Lcom/flurry/android/z;

    move-object v1, p1

    move-object v2, p0

    move v5, p4

    move/from16 v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/flurry/android/z;-><init>(Landroid/content/Context;Lcom/flurry/android/v;Lcom/flurry/android/p;Lcom/flurry/android/e;IZ)V

    .line 577
    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 560
    :cond_1
    :goto_2
    add-int/lit8 v0, v8, 0x1

    move v8, v0

    goto :goto_1

    .line 582
    :cond_2
    sget-object v1, Lcom/flurry/android/v;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot find hook: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/flurry/android/ai;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .line 549
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_3
    move-object v0, v7

    .line 585
    goto/16 :goto_0

    .line 588
    :cond_4
    :try_start_2
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v0

    goto/16 :goto_0
.end method

.method final declared-synchronized a(I)V
    .locals 1
    .parameter

    .prologue
    .line 829
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/v;->z:Lcom/flurry/android/AppCircleCallback;

    if-eqz v0, :cond_0

    .line 831
    new-instance v0, Lcom/flurry/android/ae;

    invoke-direct {v0, p0, p1}, Lcom/flurry/android/ae;-><init>(Lcom/flurry/android/v;I)V

    .line 841
    invoke-static {v0}, Lcom/flurry/android/v;->a(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 843
    :cond_0
    monitor-exit p0

    return-void

    .line 829
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized a(JJ)V
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 130
    monitor-enter p0

    :try_start_0
    iput-wide p1, p0, Lcom/flurry/android/v;->l:J

    .line 131
    iput-wide p3, p0, Lcom/flurry/android/v;->m:J

    .line 132
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/flurry/android/v;->n:J

    .line 133
    iget-object v0, p0, Lcom/flurry/android/v;->x:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 134
    monitor-exit p0

    return-void

    .line 130
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized a(Landroid/content/Context;J)V
    .locals 7
    .parameter
    .parameter

    .prologue
    .line 469
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/v;->p()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 489
    :goto_0
    monitor-exit p0

    return-void

    .line 474
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/v;->y:Ljava/util/Map;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/u;

    .line 475
    if-nez v0, :cond_1

    .line 477
    sget-object v0, Lcom/flurry/android/v;->a:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot find offer "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 469
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 480
    :cond_1
    :try_start_2
    iget-object v1, v0, Lcom/flurry/android/u;->b:Lcom/flurry/android/p;

    .line 481
    invoke-virtual {p0, v1}, Lcom/flurry/android/v;->b(Lcom/flurry/android/p;)Lcom/flurry/android/p;

    move-result-object v1

    .line 482
    iput-object v1, v0, Lcom/flurry/android/u;->b:Lcom/flurry/android/p;

    .line 484
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/flurry/android/FlurryAgent;->c()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0, v1}, Lcom/flurry/android/v;->a(Lcom/flurry/android/p;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 486
    sget-object v3, Lcom/flurry/android/v;->a:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Offer "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v5, v0, Lcom/flurry/android/u;->a:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " accepted. Sent with cookies: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v4, p0, Lcom/flurry/android/v;->s:Ljava/util/Map;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 488
    invoke-virtual {p0, p1, v1, v2}, Lcom/flurry/android/v;->a(Landroid/content/Context;Lcom/flurry/android/p;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method final declared-synchronized a(Landroid/content/Context;Lcom/flurry/android/a;)V
    .locals 5
    .parameter
    .parameter

    .prologue
    const/4 v0, 0x1

    .line 101
    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lcom/flurry/android/v;->q:Z

    if-nez v1, :cond_0

    .line 103
    iget-object v1, p2, Lcom/flurry/android/a;->c:Ljava/lang/String;

    iput-object v1, p0, Lcom/flurry/android/v;->h:Ljava/lang/String;

    .line 104
    iget-object v1, p2, Lcom/flurry/android/a;->d:Ljava/lang/String;

    iput-object v1, p0, Lcom/flurry/android/v;->i:Ljava/lang/String;

    .line 105
    iget-object v1, p2, Lcom/flurry/android/a;->a:Ljava/lang/String;

    iput-object v1, p0, Lcom/flurry/android/v;->j:Ljava/lang/String;

    .line 106
    iget-wide v1, p2, Lcom/flurry/android/a;->b:J

    iput-wide v1, p0, Lcom/flurry/android/v;->k:J

    .line 107
    iget-object v1, p2, Lcom/flurry/android/a;->e:Landroid/os/Handler;

    iput-object v1, p0, Lcom/flurry/android/v;->t:Landroid/os/Handler;

    .line 109
    new-instance v1, Lcom/flurry/android/ah;

    iget-object v2, p0, Lcom/flurry/android/v;->t:Landroid/os/Handler;

    sget v3, Lcom/flurry/android/v;->g:I

    invoke-direct {v1, v2, v3}, Lcom/flurry/android/ah;-><init>(Landroid/os/Handler;I)V

    iput-object v1, p0, Lcom/flurry/android/v;->w:Lcom/flurry/android/ah;

    .line 111
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 113
    iget-object v1, p0, Lcom/flurry/android/v;->y:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 114
    iget-object v1, p0, Lcom/flurry/android/v;->v:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 115
    iget-object v1, p0, Lcom/flurry/android/v;->o:Lcom/flurry/android/aa;

    invoke-virtual {v1, p1, p0, p2}, Lcom/flurry/android/aa;->a(Landroid/content/Context;Lcom/flurry/android/v;Lcom/flurry/android/a;)V

    .line 116
    iget-object v1, p0, Lcom/flurry/android/v;->s:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 118
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/flurry/android/v;->d:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.VIEW"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const/high16 v2, 0x1

    invoke-virtual {v1, v3, v2}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_1

    :goto_0
    iput-boolean v0, p0, Lcom/flurry/android/v;->p:Z

    .line 120
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/flurry/android/v;->q:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 122
    :cond_0
    monitor-exit p0

    return-void

    .line 118
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 101
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized a(Landroid/content/Context;Lcom/flurry/android/p;Ljava/lang/String;)V
    .locals 2
    .parameter
    .parameter
    .parameter

    .prologue
    .line 313
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/v;->p()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 346
    :goto_0
    monitor-exit p0

    return-void

    .line 318
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/v;->t:Landroid/os/Handler;

    new-instance v1, Lcom/flurry/android/al;

    invoke-direct {v1, p0, p3, p1, p2}, Lcom/flurry/android/al;-><init>(Lcom/flurry/android/v;Ljava/lang/String;Landroid/content/Context;Lcom/flurry/android/p;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 313
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized a(Landroid/content/Context;Ljava/lang/String;)V
    .locals 5
    .parameter
    .parameter

    .prologue
    .line 260
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/v;->p()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 286
    :goto_0
    monitor-exit p0

    return-void

    .line 267
    :cond_0
    const/4 v0, 0x1

    :try_start_1
    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/flurry/android/v;->a(Ljava/util/List;Ljava/lang/Long;)Ljava/util/List;

    move-result-object v0

    .line 268
    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 270
    new-instance v1, Lcom/flurry/android/p;

    const/4 v2, 0x2

    invoke-virtual {p0}, Lcom/flurry/android/v;->j()J

    move-result-wide v3

    invoke-direct {v1, p2, v2, v3, v4}, Lcom/flurry/android/p;-><init>(Ljava/lang/String;BJ)V

    .line 271
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/w;

    iput-object v0, v1, Lcom/flurry/android/p;->c:Lcom/flurry/android/w;

    .line 272
    invoke-direct {p0, v1}, Lcom/flurry/android/v;->c(Lcom/flurry/android/p;)V

    .line 274
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flurry/android/v;->h:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, v1}, Lcom/flurry/android/v;->a(Lcom/flurry/android/p;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 275
    invoke-direct {p0, p1, v1, v0}, Lcom/flurry/android/v;->b(Landroid/content/Context;Lcom/flurry/android/p;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 282
    :catch_0
    move-exception v0

    .line 284
    :try_start_2
    sget-object v1, Lcom/flurry/android/v;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to launch promotional canvas for hook: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/flurry/android/ai;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 260
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 279
    :cond_1
    :try_start_3
    new-instance v0, Landroid/content/Intent;

    invoke-static {}, Lcom/flurry/android/v;->o()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.category.DEFAULT"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0
.end method

.method final a(Lcom/flurry/android/AppCircleCallback;)V
    .locals 0
    .parameter

    .prologue
    .line 290
    iput-object p1, p0, Lcom/flurry/android/v;->z:Lcom/flurry/android/AppCircleCallback;

    .line 291
    return-void
.end method

.method final a(Ljava/lang/String;)V
    .locals 0
    .parameter

    .prologue
    .line 159
    iput-object p1, p0, Lcom/flurry/android/v;->r:Ljava/lang/String;

    .line 160
    return-void
.end method

.method final declared-synchronized a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 679
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/v;->s:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 680
    monitor-exit p0

    return-void

    .line 679
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized a(Ljava/util/List;)V
    .locals 3
    .parameter

    .prologue
    .line 520
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/v;->p()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_1

    .line 528
    :cond_0
    monitor-exit p0

    return-void

    .line 524
    :cond_1
    :try_start_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 526
    iget-object v2, p0, Lcom/flurry/android/v;->y:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 520
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized a(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V
    .locals 7
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 189
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/v;->p()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 196
    :goto_0
    monitor-exit p0

    return-void

    .line 193
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/v;->o:Lcom/flurry/android/aa;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/flurry/android/aa;->a(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V

    .line 195
    const-string v0, "FlurryAgent"

    iget-object v1, p0, Lcom/flurry/android/v;->o:Lcom/flurry/android/aa;

    invoke-virtual {v1}, Lcom/flurry/android/aa;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 189
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final a(Z)V
    .locals 0
    .parameter

    .prologue
    .line 295
    iput-boolean p1, p0, Lcom/flurry/android/v;->u:Z

    .line 296
    return-void
.end method

.method final a()Z
    .locals 1

    .prologue
    .line 138
    iget-boolean v0, p0, Lcom/flurry/android/v;->q:Z

    return v0
.end method

.method final declared-synchronized b(Ljava/lang/String;)Lcom/flurry/android/Offer;
    .locals 5
    .parameter

    .prologue
    const/4 v0, 0x0

    .line 449
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/v;->p()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-nez v1, :cond_1

    .line 464
    :cond_0
    :goto_0
    monitor-exit p0

    return-object v0

    .line 454
    :cond_1
    const/4 v1, 0x1

    :try_start_1
    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/flurry/android/v;->a(Ljava/util/List;Ljava/lang/Long;)Ljava/util/List;

    move-result-object v1

    .line 455
    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 459
    const/4 v0, 0x0

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/w;

    .line 460
    invoke-direct {p0, p1, v0}, Lcom/flurry/android/v;->a(Ljava/lang/String;Lcom/flurry/android/w;)Lcom/flurry/android/Offer;

    move-result-object v0

    .line 462
    sget-object v1, Lcom/flurry/android/v;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Impression for offer with ID "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/flurry/android/Offer;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 449
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized b(J)Lcom/flurry/android/p;
    .locals 2
    .parameter

    .prologue
    .line 250
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/v;->v:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/p;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized b(Lcom/flurry/android/p;)Lcom/flurry/android/p;
    .locals 4
    .parameter

    .prologue
    .line 812
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/v;->x:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 815
    new-instance v0, Lcom/flurry/android/p;

    invoke-virtual {p0}, Lcom/flurry/android/v;->j()J

    move-result-wide v1

    invoke-direct {v0, p1, v1, v2}, Lcom/flurry/android/p;-><init>(Lcom/flurry/android/p;J)V

    .line 816
    iget-object v1, p0, Lcom/flurry/android/v;->x:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object p1, v0

    .line 818
    :cond_0
    new-instance v0, Lcom/flurry/android/f;

    const/4 v1, 0x4

    invoke-virtual {p0}, Lcom/flurry/android/v;->j()J

    move-result-wide v2

    invoke-direct {v0, v1, v2, v3}, Lcom/flurry/android/f;-><init>(BJ)V

    invoke-virtual {p1, v0}, Lcom/flurry/android/p;->a(Lcom/flurry/android/f;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 819
    monitor-exit p0

    return-object p1

    .line 812
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized b()V
    .locals 1

    .prologue
    .line 165
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/v;->p()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 170
    :goto_0
    monitor-exit p0

    return-void

    .line 169
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/v;->o:Lcom/flurry/android/aa;

    invoke-virtual {v0}, Lcom/flurry/android/aa;->d()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 165
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized c(Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .parameter

    .prologue
    .line 493
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/v;->p()Z

    move-result v0

    if-nez v0, :cond_0

    .line 495
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 515
    :goto_0
    monitor-exit p0

    return-object v0

    .line 498
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/v;->o:Lcom/flurry/android/aa;

    invoke-virtual {v0}, Lcom/flurry/android/aa;->b()Z

    move-result v0

    if-nez v0, :cond_1

    .line 500
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_0

    .line 503
    :cond_1
    iget-object v0, p0, Lcom/flurry/android/v;->o:Lcom/flurry/android/aa;

    invoke-virtual {v0, p1}, Lcom/flurry/android/aa;->a(Ljava/lang/String;)[Lcom/flurry/android/w;

    move-result-object v2

    .line 505
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 506
    if-eqz v2, :cond_2

    array-length v1, v2

    if-lez v1, :cond_2

    .line 508
    array-length v3, v2

    const/4 v1, 0x0

    :goto_1
    if-ge v1, v3, :cond_2

    aget-object v4, v2, v1

    .line 510
    invoke-direct {p0, p1, v4}, Lcom/flurry/android/v;->a(Ljava/lang/String;Lcom/flurry/android/w;)Lcom/flurry/android/Offer;

    move-result-object v4

    .line 511
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 508
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 514
    :cond_2
    sget-object v1, Lcom/flurry/android/v;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Impressions for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " offers."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/flurry/android/ai;->a(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 493
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized c()V
    .locals 1

    .prologue
    .line 175
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/v;->p()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 180
    :goto_0
    monitor-exit p0

    return-void

    .line 179
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/v;->o:Lcom/flurry/android/aa;

    invoke-virtual {v0}, Lcom/flurry/android/aa;->e()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 175
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized d()J
    .locals 2

    .prologue
    .line 200
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/v;->p()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 202
    const-wide/16 v0, 0x0

    .line 204
    :goto_0
    monitor-exit p0

    return-wide v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/v;->o:Lcom/flurry/android/aa;

    invoke-virtual {v0}, Lcom/flurry/android/aa;->c()J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v0

    goto :goto_0

    .line 200
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized e()Ljava/util/Set;
    .locals 1

    .prologue
    .line 209
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/v;->p()Z

    move-result v0

    if-nez v0, :cond_0

    .line 211
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 213
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/v;->o:Lcom/flurry/android/aa;

    invoke-virtual {v0}, Lcom/flurry/android/aa;->a()Ljava/util/Set;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 209
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized f()Ljava/util/List;
    .locals 1

    .prologue
    .line 245
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/v;->x:Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized g()V
    .locals 1

    .prologue
    .line 255
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/v;->v:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 256
    monitor-exit p0

    return-void

    .line 255
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final h()Z
    .locals 1

    .prologue
    .line 300
    iget-boolean v0, p0, Lcom/flurry/android/v;->u:Z

    return v0
.end method

.method final i()Ljava/lang/String;
    .locals 1

    .prologue
    .line 305
    iget-object v0, p0, Lcom/flurry/android/v;->h:Ljava/lang/String;

    return-object v0
.end method

.method final declared-synchronized j()J
    .locals 4

    .prologue
    .line 650
    monitor-enter p0

    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/flurry/android/v;->m:J

    sub-long/2addr v0, v2

    .line 651
    iget-wide v2, p0, Lcom/flurry/android/v;->n:J

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    :goto_0
    iput-wide v0, p0, Lcom/flurry/android/v;->n:J

    .line 653
    iget-wide v0, p0, Lcom/flurry/android/v;->n:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    .line 651
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/flurry/android/v;->n:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/flurry/android/v;->n:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 650
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized k()V
    .locals 1

    .prologue
    .line 684
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/flurry/android/v;->s:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 685
    monitor-exit p0

    return-void

    .line 684
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized l()Lcom/flurry/android/AdImage;
    .locals 1

    .prologue
    .line 800
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/v;->p()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 802
    const/4 v0, 0x0

    .line 804
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    invoke-direct {p0}, Lcom/flurry/android/v;->n()Lcom/flurry/android/AdImage;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 800
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized m()Z
    .locals 1

    .prologue
    .line 847
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/flurry/android/v;->p()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 849
    const/4 v0, 0x0

    .line 851
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/flurry/android/v;->o:Lcom/flurry/android/aa;

    invoke-virtual {v0}, Lcom/flurry/android/aa;->b()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    goto :goto_0

    .line 847
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized onClick(Landroid/view/View;)V
    .locals 6
    .parameter

    .prologue
    .line 659
    monitor-enter p0

    :try_start_0
    move-object v0, p1

    check-cast v0, Lcom/flurry/android/z;

    move-object v1, v0

    .line 660
    invoke-virtual {v1}, Lcom/flurry/android/z;->a()Lcom/flurry/android/p;

    move-result-object v2

    .line 662
    invoke-virtual {p0, v2}, Lcom/flurry/android/v;->b(Lcom/flurry/android/p;)Lcom/flurry/android/p;

    move-result-object v2

    .line 663
    invoke-virtual {v1, v2}, Lcom/flurry/android/z;->a(Lcom/flurry/android/p;)V

    .line 666
    invoke-virtual {p0, v2}, Lcom/flurry/android/v;->a(Lcom/flurry/android/p;)Ljava/lang/String;

    move-result-object v1

    .line 667
    iget-boolean v3, p0, Lcom/flurry/android/v;->u:Z

    if-eqz v3, :cond_0

    .line 669
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/flurry/android/v;->h:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v3, v2, v1}, Lcom/flurry/android/v;->b(Landroid/content/Context;Lcom/flurry/android/p;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 675
    :goto_0
    monitor-exit p0

    return-void

    .line 673
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/flurry/android/v;->i:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v3, v2, v1}, Lcom/flurry/android/v;->a(Landroid/content/Context;Lcom/flurry/android/p;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 659
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 786
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 787
    const-string v1, "[adLogs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/flurry/android/v;->x:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 790
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

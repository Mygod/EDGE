.class final Lcom/flurry/android/x;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field private a:Landroid/view/View;

.field private b:Ljava/util/List;

.field private c:Z

.field private synthetic d:Lcom/flurry/android/CatalogActivity;


# direct methods
.method public constructor <init>(Lcom/flurry/android/CatalogActivity;Landroid/content/Context;)V
    .locals 2
    .parameter
    .parameter

    .prologue
    const/4 v1, 0x1

    .line 277
    iput-object p1, p0, Lcom/flurry/android/x;->d:Lcom/flurry/android/CatalogActivity;

    .line 278
    invoke-direct {p0, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 272
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/x;->b:Ljava/util/List;

    .line 274
    iput-boolean v1, p0, Lcom/flurry/android/x;->c:Z

    .line 279
    invoke-virtual {p0, v1}, Lcom/flurry/android/x;->setOrientation(I)V

    .line 280
    const/16 v0, 0x30

    invoke-virtual {p0, v0}, Lcom/flurry/android/x;->setGravity(I)V

    .line 282
    new-instance v0, Lcom/flurry/android/s;

    invoke-direct {v0, p1, p2}, Lcom/flurry/android/s;-><init>(Lcom/flurry/android/CatalogActivity;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/flurry/android/x;->a:Landroid/view/View;

    .line 283
    iget-object v0, p0, Lcom/flurry/android/x;->a:Landroid/view/View;

    const/16 v1, 0x2712

    invoke-virtual {v0, v1}, Landroid/view/View;->setId(I)V

    .line 284
    iget-object v0, p0, Lcom/flurry/android/x;->a:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 286
    invoke-virtual {p0, p2}, Lcom/flurry/android/x;->a(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    .line 287
    iget-boolean v1, p0, Lcom/flurry/android/x;->c:Z

    invoke-direct {p0, v0, v1}, Lcom/flurry/android/x;->a(Ljava/util/List;Z)V

    .line 288
    return-void
.end method

.method private a(Ljava/util/List;Z)V
    .locals 7
    .parameter
    .parameter

    .prologue
    const/4 v3, 0x0

    .line 322
    invoke-virtual {p0}, Lcom/flurry/android/x;->removeAllViews()V

    .line 324
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x1

    const/4 v2, -0x2

    invoke-direct {v1, v0, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 325
    invoke-virtual {v1, v3, v3, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 327
    iget-object v0, p0, Lcom/flurry/android/x;->a:Landroid/view/View;

    invoke-virtual {p0, v0, v1}, Lcom/flurry/android/x;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 329
    if-eqz p1, :cond_0

    .line 331
    iget-object v0, p0, Lcom/flurry/android/x;->b:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 332
    iget-object v0, p0, Lcom/flurry/android/x;->b:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 335
    :cond_0
    if-eqz p2, :cond_1

    .line 337
    iget-object v0, p0, Lcom/flurry/android/x;->b:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/z;

    .line 339
    invoke-virtual {p0, v0, v1}, Lcom/flurry/android/x;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 340
    invoke-virtual {v0}, Lcom/flurry/android/z;->a()Lcom/flurry/android/p;

    move-result-object v0

    .line 341
    new-instance v3, Lcom/flurry/android/f;

    const/4 v4, 0x3

    iget-object v5, p0, Lcom/flurry/android/x;->d:Lcom/flurry/android/CatalogActivity;

    invoke-static {v5}, Lcom/flurry/android/CatalogActivity;->b(Lcom/flurry/android/CatalogActivity;)J

    move-result-wide v5

    invoke-direct {v3, v4, v5, v6}, Lcom/flurry/android/f;-><init>(BJ)V

    invoke-virtual {v0, v3}, Lcom/flurry/android/p;->a(Lcom/flurry/android/f;)V

    goto :goto_0

    .line 344
    :cond_1
    invoke-virtual {p0}, Lcom/flurry/android/x;->refreshDrawableState()V

    .line 345
    return-void
.end method


# virtual methods
.method final a(Landroid/content/Context;)Ljava/util/List;
    .locals 6
    .parameter

    .prologue
    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 292
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    move v0, v4

    .line 293
    :goto_0
    const/4 v1, 0x3

    if-gt v0, v1, :cond_0

    .line 295
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Flurry_Canvas_Hook_"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 293
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 297
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/x;->d:Lcom/flurry/android/CatalogActivity;

    invoke-static {v0}, Lcom/flurry/android/CatalogActivity;->a(Lcom/flurry/android/CatalogActivity;)Lcom/flurry/android/p;

    move-result-object v0

    if-nez v0, :cond_1

    move-object v0, v3

    .line 298
    :goto_1
    if-nez v0, :cond_2

    .line 299
    :goto_2
    iget-object v0, p0, Lcom/flurry/android/x;->d:Lcom/flurry/android/CatalogActivity;

    invoke-static {v0}, Lcom/flurry/android/CatalogActivity;->c(Lcom/flurry/android/CatalogActivity;)Lcom/flurry/android/v;

    move-result-object v0

    move-object v1, p1

    move v5, v4

    invoke-virtual/range {v0 .. v5}, Lcom/flurry/android/v;->a(Landroid/content/Context;Ljava/util/List;Ljava/lang/Long;IZ)Ljava/util/List;

    move-result-object v1

    .line 302
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/z;

    .line 304
    iget-object v3, p0, Lcom/flurry/android/x;->d:Lcom/flurry/android/CatalogActivity;

    invoke-virtual {v0, v3}, Lcom/flurry/android/z;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_3

    .line 297
    :cond_1
    iget-object v0, p0, Lcom/flurry/android/x;->d:Lcom/flurry/android/CatalogActivity;

    invoke-static {v0}, Lcom/flurry/android/CatalogActivity;->a(Lcom/flurry/android/CatalogActivity;)Lcom/flurry/android/p;

    move-result-object v0

    iget-object v0, v0, Lcom/flurry/android/p;->c:Lcom/flurry/android/w;

    goto :goto_1

    .line 298
    :cond_2
    iget-wide v0, v0, Lcom/flurry/android/w;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    goto :goto_2

    .line 306
    :cond_3
    return-object v1
.end method

.method final a()V
    .locals 2

    .prologue
    .line 311
    iget-boolean v0, p0, Lcom/flurry/android/x;->c:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/flurry/android/x;->c:Z

    .line 312
    const/4 v0, 0x0

    iget-boolean v1, p0, Lcom/flurry/android/x;->c:Z

    invoke-direct {p0, v0, v1}, Lcom/flurry/android/x;->a(Ljava/util/List;Z)V

    .line 313
    return-void

    .line 311
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method final a(Ljava/util/List;)V
    .locals 1
    .parameter

    .prologue
    .line 317
    iget-boolean v0, p0, Lcom/flurry/android/x;->c:Z

    invoke-direct {p0, p1, v0}, Lcom/flurry/android/x;->a(Ljava/util/List;Z)V

    .line 318
    return-void
.end method

.method final b()Ljava/util/List;
    .locals 1

    .prologue
    .line 349
    iget-object v0, p0, Lcom/flurry/android/x;->b:Ljava/util/List;

    return-object v0
.end method

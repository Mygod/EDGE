.class public Lcom/google/ads/util/c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/ads/util/c$c;,
        Lcom/google/ads/util/c$b;,
        Lcom/google/ads/util/c$a;
    }
.end annotation


# static fields
.field static final synthetic a:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const-class v0, Lcom/google/ads/util/c;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/google/ads/util/c;->a:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 798
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 799
    return-void
.end method

.method public static a(Ljava/lang/String;)[B
    .locals 2
    .parameter

    .prologue
    .line 118
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/ads/util/c;->a([BI)[B

    move-result-object v0

    return-object v0
.end method

.method public static a([BI)[B
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 161
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1, p1}, Lcom/google/ads/util/c;->a([BIII)[B

    move-result-object v0

    return-object v0
.end method

.method public static a([BIII)[B
    .locals 4
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v3, 0x0

    .line 188
    new-instance v1, Lcom/google/ads/util/c$b;

    mul-int/lit8 v0, p2, 0x3

    div-int/lit8 v0, v0, 0x4

    new-array v0, v0, [B

    invoke-direct {v1, p3, v0}, Lcom/google/ads/util/c$b;-><init>(I[B)V

    .line 190
    const/4 v0, 0x1

    invoke-virtual {v1, p0, p1, p2, v0}, Lcom/google/ads/util/c$b;->a([BIIZ)Z

    move-result v0

    if-nez v0, :cond_0

    .line 191
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "bad base-64"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 195
    :cond_0
    iget v0, v1, Lcom/google/ads/util/c$b;->b:I

    iget-object v2, v1, Lcom/google/ads/util/c$b;->a:[B

    array-length v2, v2

    if-ne v0, v2, :cond_1

    .line 196
    iget-object v0, v1, Lcom/google/ads/util/c$b;->a:[B

    .line 203
    :goto_0
    return-object v0

    .line 201
    :cond_1
    iget v0, v1, Lcom/google/ads/util/c$b;->b:I

    new-array v0, v0, [B

    .line 202
    iget-object v2, v1, Lcom/google/ads/util/c$b;->a:[B

    iget v1, v1, Lcom/google/ads/util/c$b;->b:I

    invoke-static {v2, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static b([BI)Ljava/lang/String;
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 487
    :try_start_0
    new-instance v0, Ljava/lang/String;

    invoke-static {p0, p1}, Lcom/google/ads/util/c;->c([BI)[B

    move-result-object v1

    const-string v2, "US-ASCII"

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 489
    :catch_0
    move-exception v0

    .line 491
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public static b([BIII)[B
    .locals 5
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v2, 0x1

    .line 549
    new-instance v3, Lcom/google/ads/util/c$c;

    const/4 v0, 0x0

    invoke-direct {v3, p3, v0}, Lcom/google/ads/util/c$c;-><init>(I[B)V

    .line 552
    div-int/lit8 v0, p2, 0x3

    mul-int/lit8 v0, v0, 0x4

    .line 555
    iget-boolean v1, v3, Lcom/google/ads/util/c$c;->d:Z

    if-eqz v1, :cond_2

    .line 556
    rem-int/lit8 v1, p2, 0x3

    if-lez v1, :cond_0

    .line 557
    add-int/lit8 v0, v0, 0x4

    .line 574
    :cond_0
    :goto_0
    :pswitch_0
    iget-boolean v1, v3, Lcom/google/ads/util/c$c;->e:Z

    if-eqz v1, :cond_1

    if-lez p2, :cond_1

    .line 575
    add-int/lit8 v1, p2, -0x1

    div-int/lit8 v1, v1, 0x39

    add-int/lit8 v4, v1, 0x1

    iget-boolean v1, v3, Lcom/google/ads/util/c$c;->f:Z

    if-eqz v1, :cond_3

    const/4 v1, 0x2

    :goto_1
    mul-int/2addr v1, v4

    add-int/2addr v0, v1

    .line 579
    :cond_1
    new-array v1, v0, [B

    iput-object v1, v3, Lcom/google/ads/util/c$c;->a:[B

    .line 580
    invoke-virtual {v3, p0, p1, p2, v2}, Lcom/google/ads/util/c$c;->a([BIIZ)Z

    .line 582
    sget-boolean v1, Lcom/google/ads/util/c;->a:Z

    if-nez v1, :cond_4

    iget v1, v3, Lcom/google/ads/util/c$c;->b:I

    if-eq v1, v0, :cond_4

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 561
    :cond_2
    rem-int/lit8 v1, p2, 0x3

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 565
    :pswitch_1
    add-int/lit8 v0, v0, 0x2

    .line 566
    goto :goto_0

    .line 568
    :pswitch_2
    add-int/lit8 v0, v0, 0x3

    goto :goto_0

    :cond_3
    move v1, v2

    .line 575
    goto :goto_1

    .line 584
    :cond_4
    iget-object v0, v3, Lcom/google/ads/util/c$c;->a:[B

    return-object v0

    .line 561
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static c([BI)[B
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 531
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1, p1}, Lcom/google/ads/util/c;->b([BIII)[B

    move-result-object v0

    return-object v0
.end method

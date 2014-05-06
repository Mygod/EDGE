.class public Lcom/google/ads/internal/g;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static f:J

.field private static h:J


# instance fields
.field public a:Ljava/lang/String;

.field private b:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private c:J

.field private d:J

.field private e:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private g:Ljava/lang/String;

.field private i:Z

.field private j:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 72
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/google/ads/internal/g;->f:J

    .line 78
    const-wide/16 v0, -0x1

    sput-wide v0, Lcom/google/ads/internal/g;->h:J

    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    iput-boolean v0, p0, Lcom/google/ads/internal/g;->i:Z

    .line 88
    iput-boolean v0, p0, Lcom/google/ads/internal/g;->j:Z

    .line 99
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/google/ads/internal/g;->b:Ljava/util/LinkedList;

    .line 100
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/google/ads/internal/g;->e:Ljava/util/LinkedList;

    .line 101
    invoke-virtual {p0}, Lcom/google/ads/internal/g;->a()V

    .line 102
    return-void
.end method

.method public static q()J
    .locals 4

    .prologue
    .line 287
    sget-wide v0, Lcom/google/ads/internal/g;->h:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 289
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    sput-wide v0, Lcom/google/ads/internal/g;->h:J

    .line 290
    const-wide/16 v0, 0x0

    .line 292
    :goto_0
    return-wide v0

    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    sget-wide v2, Lcom/google/ads/internal/g;->h:J

    sub-long/2addr v0, v2

    goto :goto_0
.end method


# virtual methods
.method protected a()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    const/4 v1, 0x0

    .line 110
    iget-object v0, p0, Lcom/google/ads/internal/g;->b:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 111
    iput-wide v2, p0, Lcom/google/ads/internal/g;->c:J

    .line 112
    iput-wide v2, p0, Lcom/google/ads/internal/g;->d:J

    .line 113
    iget-object v0, p0, Lcom/google/ads/internal/g;->e:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 114
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/ads/internal/g;->g:Ljava/lang/String;

    .line 115
    iput-boolean v1, p0, Lcom/google/ads/internal/g;->i:Z

    .line 116
    iput-boolean v1, p0, Lcom/google/ads/internal/g;->j:Z

    .line 117
    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 2
    .parameter

    .prologue
    .line 242
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Prior ad identifier = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->d(Ljava/lang/String;)V

    .line 243
    iput-object p1, p0, Lcom/google/ads/internal/g;->g:Ljava/lang/String;

    .line 244
    return-void
.end method

.method protected b()V
    .locals 3

    .prologue
    .line 125
    const-string v0, "Ad clicked."

    invoke-static {v0}, Lcom/google/ads/util/b;->d(Ljava/lang/String;)V

    .line 126
    iget-object v0, p0, Lcom/google/ads/internal/g;->b:Ljava/util/LinkedList;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 127
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 2
    .parameter

    .prologue
    .line 277
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Prior impression ticket = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->d(Ljava/lang/String;)V

    .line 278
    iput-object p1, p0, Lcom/google/ads/internal/g;->a:Ljava/lang/String;

    .line 279
    return-void
.end method

.method protected c()V
    .locals 2

    .prologue
    .line 135
    const-string v0, "Ad request loaded."

    invoke-static {v0}, Lcom/google/ads/util/b;->d(Ljava/lang/String;)V

    .line 136
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/ads/internal/g;->c:J

    .line 137
    return-void
.end method

.method protected d()V
    .locals 4

    .prologue
    .line 145
    const-string v0, "Ad request started."

    invoke-static {v0}, Lcom/google/ads/util/b;->d(Ljava/lang/String;)V

    .line 146
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/ads/internal/g;->d:J

    .line 147
    sget-wide v0, Lcom/google/ads/internal/g;->f:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    sput-wide v0, Lcom/google/ads/internal/g;->f:J

    .line 148
    return-void
.end method

.method protected e()J
    .locals 2

    .prologue
    .line 158
    iget-object v0, p0, Lcom/google/ads/internal/g;->b:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    iget-object v1, p0, Lcom/google/ads/internal/g;->e:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 159
    const-wide/16 v0, -0x1

    .line 161
    :goto_0
    return-wide v0

    :cond_0
    iget-object v0, p0, Lcom/google/ads/internal/g;->b:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    int-to-long v0, v0

    goto :goto_0
.end method

.method protected f()Ljava/lang/String;
    .locals 7

    .prologue
    .line 176
    iget-object v0, p0, Lcom/google/ads/internal/g;->b:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/ads/internal/g;->b:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    iget-object v1, p0, Lcom/google/ads/internal/g;->e:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-eq v0, v1, :cond_1

    .line 178
    :cond_0
    const/4 v0, 0x0

    .line 190
    :goto_0
    return-object v0

    .line 182
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 183
    const/4 v0, 0x0

    move v1, v0

    :goto_1
    iget-object v0, p0, Lcom/google/ads/internal/g;->b:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-ge v1, v0, :cond_3

    .line 184
    if-eqz v1, :cond_2

    .line 185
    const-string v0, ","

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    :cond_2
    iget-object v0, p0, Lcom/google/ads/internal/g;->e:Ljava/util/LinkedList;

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    iget-object v0, p0, Lcom/google/ads/internal/g;->b:Ljava/util/LinkedList;

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    sub-long/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    .line 190
    :cond_3
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method protected g()Ljava/lang/String;
    .locals 7

    .prologue
    .line 204
    iget-object v0, p0, Lcom/google/ads/internal/g;->b:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 205
    const/4 v0, 0x0

    .line 217
    :goto_0
    return-object v0

    .line 209
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 210
    const/4 v0, 0x0

    move v1, v0

    :goto_1
    iget-object v0, p0, Lcom/google/ads/internal/g;->b:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-ge v1, v0, :cond_2

    .line 211
    if-eqz v1, :cond_1

    .line 212
    const-string v0, ","

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    :cond_1
    iget-object v0, p0, Lcom/google/ads/internal/g;->b:Ljava/util/LinkedList;

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/google/ads/internal/g;->c:J

    sub-long/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    .line 217
    :cond_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method protected h()J
    .locals 4

    .prologue
    .line 230
    iget-wide v0, p0, Lcom/google/ads/internal/g;->c:J

    iget-wide v2, p0, Lcom/google/ads/internal/g;->d:J

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method protected i()J
    .locals 2

    .prologue
    .line 234
    sget-wide v0, Lcom/google/ads/internal/g;->f:J

    return-wide v0
.end method

.method protected j()Ljava/lang/String;
    .locals 1

    .prologue
    .line 238
    iget-object v0, p0, Lcom/google/ads/internal/g;->g:Ljava/lang/String;

    return-object v0
.end method

.method protected k()Z
    .locals 1

    .prologue
    .line 247
    iget-boolean v0, p0, Lcom/google/ads/internal/g;->i:Z

    return v0
.end method

.method protected l()V
    .locals 1

    .prologue
    .line 251
    const-string v0, "Interstitial network error."

    invoke-static {v0}, Lcom/google/ads/util/b;->d(Ljava/lang/String;)V

    .line 252
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/ads/internal/g;->i:Z

    .line 253
    return-void
.end method

.method protected m()Z
    .locals 1

    .prologue
    .line 256
    iget-boolean v0, p0, Lcom/google/ads/internal/g;->j:Z

    return v0
.end method

.method protected n()V
    .locals 1

    .prologue
    .line 260
    const-string v0, "Interstitial no fill."

    invoke-static {v0}, Lcom/google/ads/util/b;->d(Ljava/lang/String;)V

    .line 261
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/ads/internal/g;->j:Z

    .line 262
    return-void
.end method

.method public o()V
    .locals 3

    .prologue
    .line 268
    const-string v0, "Landing page dismissed."

    invoke-static {v0}, Lcom/google/ads/util/b;->d(Ljava/lang/String;)V

    .line 269
    iget-object v0, p0, Lcom/google/ads/internal/g;->e:Ljava/util/LinkedList;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 270
    return-void
.end method

.method protected p()Ljava/lang/String;
    .locals 1

    .prologue
    .line 273
    iget-object v0, p0, Lcom/google/ads/internal/g;->a:Ljava/lang/String;

    return-object v0
.end method

.class final Lcom/flurry/android/m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic a:Ljava/lang/String;

.field private synthetic b:Lcom/flurry/android/al;


# direct methods
.method constructor <init>(Lcom/flurry/android/al;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 325
    iput-object p1, p0, Lcom/flurry/android/m;->b:Lcom/flurry/android/al;

    iput-object p2, p0, Lcom/flurry/android/m;->a:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .prologue
    .line 330
    iget-object v0, p0, Lcom/flurry/android/m;->a:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 332
    iget-object v0, p0, Lcom/flurry/android/m;->b:Lcom/flurry/android/al;

    iget-object v0, v0, Lcom/flurry/android/al;->d:Lcom/flurry/android/v;

    iget-object v1, p0, Lcom/flurry/android/m;->b:Lcom/flurry/android/al;

    iget-object v1, v1, Lcom/flurry/android/al;->b:Landroid/content/Context;

    iget-object v2, p0, Lcom/flurry/android/m;->a:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/flurry/android/v;->a(Lcom/flurry/android/v;Landroid/content/Context;Ljava/lang/String;)V

    .line 333
    iget-object v0, p0, Lcom/flurry/android/m;->b:Lcom/flurry/android/al;

    iget-object v0, v0, Lcom/flurry/android/al;->c:Lcom/flurry/android/p;

    new-instance v1, Lcom/flurry/android/f;

    const/16 v2, 0x8

    iget-object v3, p0, Lcom/flurry/android/m;->b:Lcom/flurry/android/al;

    iget-object v3, v3, Lcom/flurry/android/al;->d:Lcom/flurry/android/v;

    invoke-virtual {v3}, Lcom/flurry/android/v;->j()J

    move-result-wide v3

    invoke-direct {v1, v2, v3, v4}, Lcom/flurry/android/f;-><init>(BJ)V

    invoke-virtual {v0, v1}, Lcom/flurry/android/p;->a(Lcom/flurry/android/f;)V

    .line 342
    :goto_0
    return-void

    .line 338
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unable to launch in app market: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/flurry/android/m;->b:Lcom/flurry/android/al;

    iget-object v1, v1, Lcom/flurry/android/al;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 339
    sget-object v1, Lcom/flurry/android/v;->a:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/flurry/android/ai;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 340
    iget-object v1, p0, Lcom/flurry/android/m;->b:Lcom/flurry/android/al;

    iget-object v1, v1, Lcom/flurry/android/al;->d:Lcom/flurry/android/v;

    invoke-static {v1, v0}, Lcom/flurry/android/v;->b(Lcom/flurry/android/v;Ljava/lang/String;)V

    goto :goto_0
.end method

.class final Lcom/flurry/android/al;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Landroid/content/Context;

.field final synthetic c:Lcom/flurry/android/p;

.field final synthetic d:Lcom/flurry/android/v;


# direct methods
.method constructor <init>(Lcom/flurry/android/v;Ljava/lang/String;Landroid/content/Context;Lcom/flurry/android/p;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 319
    iput-object p1, p0, Lcom/flurry/android/al;->d:Lcom/flurry/android/v;

    iput-object p2, p0, Lcom/flurry/android/al;->a:Ljava/lang/String;

    iput-object p3, p0, Lcom/flurry/android/al;->b:Landroid/content/Context;

    iput-object p4, p0, Lcom/flurry/android/al;->c:Lcom/flurry/android/p;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .prologue
    .line 323
    iget-object v0, p0, Lcom/flurry/android/al;->d:Lcom/flurry/android/v;

    iget-object v1, p0, Lcom/flurry/android/al;->a:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/flurry/android/v;->a(Lcom/flurry/android/v;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 324
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    new-instance v2, Lcom/flurry/android/m;

    invoke-direct {v2, p0, v0}, Lcom/flurry/android/m;-><init>(Lcom/flurry/android/al;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 344
    return-void
.end method

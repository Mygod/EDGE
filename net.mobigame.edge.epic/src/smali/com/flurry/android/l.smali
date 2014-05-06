.class final Lcom/flurry/android/l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic a:Lcom/flurry/android/b;


# direct methods
.method constructor <init>(Lcom/flurry/android/b;)V
    .locals 0
    .parameter

    .prologue
    .line 1229
    iput-object p1, p0, Lcom/flurry/android/l;->a:Lcom/flurry/android/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .prologue
    .line 1233
    iget-object v0, p0, Lcom/flurry/android/l;->a:Lcom/flurry/android/b;

    iget-object v0, v0, Lcom/flurry/android/b;->b:Lcom/flurry/android/FlurryAgent;

    iget-object v1, p0, Lcom/flurry/android/l;->a:Lcom/flurry/android/b;

    iget-object v1, v1, Lcom/flurry/android/b;->a:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/flurry/android/FlurryAgent;->b(Lcom/flurry/android/FlurryAgent;Landroid/content/Context;)V

    .line 1234
    return-void
.end method

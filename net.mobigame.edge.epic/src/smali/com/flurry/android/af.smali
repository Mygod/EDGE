.class final Lcom/flurry/android/af;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic a:Ljava/lang/String;

.field private synthetic b:Lcom/flurry/android/v;


# direct methods
.method constructor <init>(Lcom/flurry/android/v;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 398
    iput-object p1, p0, Lcom/flurry/android/af;->b:Lcom/flurry/android/v;

    iput-object p2, p0, Lcom/flurry/android/af;->a:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .prologue
    .line 403
    new-instance v0, Lcom/flurry/android/CallbackEvent;

    const/16 v1, 0x65

    invoke-direct {v0, v1}, Lcom/flurry/android/CallbackEvent;-><init>(I)V

    .line 404
    iget-object v1, p0, Lcom/flurry/android/af;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/flurry/android/CallbackEvent;->setMessage(Ljava/lang/String;)V

    .line 405
    iget-object v1, p0, Lcom/flurry/android/af;->b:Lcom/flurry/android/v;

    invoke-static {v1}, Lcom/flurry/android/v;->a(Lcom/flurry/android/v;)Lcom/flurry/android/AppCircleCallback;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 407
    iget-object v1, p0, Lcom/flurry/android/af;->b:Lcom/flurry/android/v;

    invoke-static {v1}, Lcom/flurry/android/v;->a(Lcom/flurry/android/v;)Lcom/flurry/android/AppCircleCallback;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/flurry/android/AppCircleCallback;->onMarketAppLaunchError(Lcom/flurry/android/CallbackEvent;)V

    .line 409
    :cond_0
    return-void
.end method

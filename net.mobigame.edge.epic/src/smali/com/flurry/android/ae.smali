.class final Lcom/flurry/android/ae;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic a:I

.field private synthetic b:Lcom/flurry/android/v;


# direct methods
.method constructor <init>(Lcom/flurry/android/v;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 832
    iput-object p1, p0, Lcom/flurry/android/ae;->b:Lcom/flurry/android/v;

    iput p2, p0, Lcom/flurry/android/ae;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .prologue
    .line 837
    new-instance v0, Lcom/flurry/android/CallbackEvent;

    iget v1, p0, Lcom/flurry/android/ae;->a:I

    invoke-direct {v0, v1}, Lcom/flurry/android/CallbackEvent;-><init>(I)V

    .line 838
    iget-object v1, p0, Lcom/flurry/android/ae;->b:Lcom/flurry/android/v;

    invoke-static {v1}, Lcom/flurry/android/v;->a(Lcom/flurry/android/v;)Lcom/flurry/android/AppCircleCallback;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/flurry/android/AppCircleCallback;->onAdsUpdated(Lcom/flurry/android/CallbackEvent;)V

    .line 839
    return-void
.end method

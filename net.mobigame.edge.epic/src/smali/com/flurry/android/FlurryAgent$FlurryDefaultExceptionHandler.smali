.class public Lcom/flurry/android/FlurryAgent$FlurryDefaultExceptionHandler;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# instance fields
.field private a:Ljava/lang/Thread$UncaughtExceptionHandler;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 240
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 241
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/FlurryAgent$FlurryDefaultExceptionHandler;->a:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 242
    return-void
.end method


# virtual methods
.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 3
    .parameter
    .parameter

    .prologue
    .line 249
    :try_start_0
    invoke-static {}, Lcom/flurry/android/FlurryAgent;->h()Lcom/flurry/android/FlurryAgent;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/flurry/android/FlurryAgent;->a(Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 256
    :goto_0
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent$FlurryDefaultExceptionHandler;->a:Ljava/lang/Thread$UncaughtExceptionHandler;

    if-eqz v0, :cond_0

    .line 258
    iget-object v0, p0, Lcom/flurry/android/FlurryAgent$FlurryDefaultExceptionHandler;->a:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v0, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 260
    :cond_0
    return-void

    .line 251
    :catch_0
    move-exception v0

    .line 253
    const-string v1, "FlurryAgent"

    const-string v2, ""

    invoke-static {v1, v2, v0}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

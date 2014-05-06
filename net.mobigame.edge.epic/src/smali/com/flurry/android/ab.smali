.class final Lcom/flurry/android/ab;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field a:I

.field b:J

.field c:Ljava/lang/String;

.field d:Ljava/lang/String;

.field e:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 230
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 231
    invoke-static {}, Lcom/flurry/android/FlurryAgent;->g()I

    move-result v0

    iput v0, p0, Lcom/flurry/android/ab;->a:I

    .line 232
    return-void
.end method

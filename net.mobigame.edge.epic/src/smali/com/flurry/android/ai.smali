.class final Lcom/flurry/android/ai;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:Z

.field private static b:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 9
    const/4 v0, 0x0

    sput-boolean v0, Lcom/flurry/android/ai;->a:Z

    .line 10
    const/4 v0, 0x5

    sput v0, Lcom/flurry/android/ai;->b:I

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static a(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 54
    sget-boolean v0, Lcom/flurry/android/ai;->a:Z

    if-nez v0, :cond_0

    sget v0, Lcom/flurry/android/ai;->b:I

    const/4 v1, 0x3

    if-gt v0, v1, :cond_1

    .line 55
    :cond_0
    const/4 v0, 0x0

    .line 56
    :goto_0
    return v0

    :cond_1
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method static a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 2
    .parameter
    .parameter
    .parameter

    .prologue
    .line 47
    sget-boolean v0, Lcom/flurry/android/ai;->a:Z

    if-nez v0, :cond_0

    sget v0, Lcom/flurry/android/ai;->b:I

    const/4 v1, 0x3

    if-gt v0, v1, :cond_1

    .line 48
    :cond_0
    const/4 v0, 0x0

    .line 49
    :goto_0
    return v0

    :cond_1
    invoke-static {p0, p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result v0

    goto :goto_0
.end method

.method static a()V
    .locals 1

    .prologue
    .line 25
    const/4 v0, 0x1

    sput-boolean v0, Lcom/flurry/android/ai;->a:Z

    .line 26
    return-void
.end method

.method static a(I)V
    .locals 0
    .parameter

    .prologue
    .line 37
    sput p0, Lcom/flurry/android/ai;->b:I

    .line 38
    return-void
.end method

.method static a(Ljava/lang/String;)Z
    .locals 1
    .parameter

    .prologue
    .line 42
    const/4 v0, 0x3

    invoke-static {p0, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method static b(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 68
    sget-boolean v0, Lcom/flurry/android/ai;->a:Z

    if-nez v0, :cond_0

    sget v0, Lcom/flurry/android/ai;->b:I

    const/4 v1, 0x6

    if-gt v0, v1, :cond_1

    .line 69
    :cond_0
    const/4 v0, 0x0

    .line 70
    :goto_0
    return v0

    :cond_1
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method static b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 2
    .parameter
    .parameter
    .parameter

    .prologue
    .line 61
    sget-boolean v0, Lcom/flurry/android/ai;->a:Z

    if-nez v0, :cond_0

    sget v0, Lcom/flurry/android/ai;->b:I

    const/4 v1, 0x6

    if-gt v0, v1, :cond_1

    .line 62
    :cond_0
    const/4 v0, 0x0

    .line 63
    :goto_0
    return v0

    :cond_1
    invoke-static {p0, p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result v0

    goto :goto_0
.end method

.method static b()V
    .locals 1

    .prologue
    .line 32
    const/4 v0, 0x0

    sput-boolean v0, Lcom/flurry/android/ai;->a:Z

    .line 33
    return-void
.end method

.method static c(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 82
    sget-boolean v0, Lcom/flurry/android/ai;->a:Z

    if-nez v0, :cond_0

    sget v0, Lcom/flurry/android/ai;->b:I

    const/4 v1, 0x4

    if-gt v0, v1, :cond_1

    .line 83
    :cond_0
    const/4 v0, 0x0

    .line 84
    :goto_0
    return v0

    :cond_1
    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method static c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 2
    .parameter
    .parameter
    .parameter

    .prologue
    .line 75
    sget-boolean v0, Lcom/flurry/android/ai;->a:Z

    if-nez v0, :cond_0

    sget v0, Lcom/flurry/android/ai;->b:I

    const/4 v1, 0x4

    if-gt v0, v1, :cond_1

    .line 76
    :cond_0
    const/4 v0, 0x0

    .line 77
    :goto_0
    return v0

    :cond_1
    invoke-static {p0, p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result v0

    goto :goto_0
.end method

.method static d(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 110
    sget-boolean v0, Lcom/flurry/android/ai;->a:Z

    if-nez v0, :cond_0

    sget v0, Lcom/flurry/android/ai;->b:I

    const/4 v1, 0x5

    if-gt v0, v1, :cond_1

    .line 111
    :cond_0
    const/4 v0, 0x0

    .line 112
    :goto_0
    return v0

    :cond_1
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method static d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 2
    .parameter
    .parameter
    .parameter

    .prologue
    .line 103
    sget-boolean v0, Lcom/flurry/android/ai;->a:Z

    if-nez v0, :cond_0

    sget v0, Lcom/flurry/android/ai;->b:I

    const/4 v1, 0x5

    if-gt v0, v1, :cond_1

    .line 104
    :cond_0
    const/4 v0, 0x0

    .line 105
    :goto_0
    return v0

    :cond_1
    invoke-static {p0, p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result v0

    goto :goto_0
.end method

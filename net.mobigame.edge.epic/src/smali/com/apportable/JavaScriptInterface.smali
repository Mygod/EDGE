.class public Lcom/apportable/JavaScriptInterface;
.super Ljava/lang/Object;
.source "JavaScriptInterface.java"


# instance fields
.field context:J


# direct methods
.method public constructor <init>(J)V
    .locals 0
    .parameter "context"

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-wide p1, p0, Lcom/apportable/JavaScriptInterface;->context:J

    .line 12
    return-void
.end method

.method private static native nativeOnJavaScriptResult(JLjava/lang/String;)V
.end method


# virtual methods
.method public ReturnValue(Ljava/lang/String;)V
    .locals 2
    .parameter "val"

    .prologue
    .line 15
    iget-wide v0, p0, Lcom/apportable/JavaScriptInterface;->context:J

    invoke-static {v0, v1, p1}, Lcom/apportable/JavaScriptInterface;->nativeOnJavaScriptResult(JLjava/lang/String;)V

    .line 16
    return-void
.end method

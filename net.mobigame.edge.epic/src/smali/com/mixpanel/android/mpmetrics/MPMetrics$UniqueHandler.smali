.class Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;
.super Landroid/os/Handler;
.source "MPMetrics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mixpanel/android/mpmetrics/MPMetrics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UniqueHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;


# direct methods
.method private constructor <init>(Lcom/mixpanel/android/mpmetrics/MPMetrics;)V
    .locals 0
    .parameter

    .prologue
    .line 74
    iput-object p1, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mixpanel/android/mpmetrics/MPMetrics;Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 74
    invoke-direct {p0, p1}, Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;-><init>(Lcom/mixpanel/android/mpmetrics/MPMetrics;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 77
    iget v0, p1, Landroid/os/Message;->what:I

    invoke-static {}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$0()I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 78
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    invoke-virtual {v0}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->flushEvents()V

    .line 82
    :cond_0
    :goto_0
    return-void

    .line 79
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    invoke-static {}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$1()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 80
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    invoke-virtual {v0}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->flushPeople()V

    goto :goto_0
.end method

.method public sendUniqueEmptyMessageDelayed(IJ)Z
    .locals 3
    .parameter "what"
    .parameter "delayMillis"

    .prologue
    .line 85
    sget-boolean v0, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "MPMetrics"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "sendUniqueEmptyMessageDelayed "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "..."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    :cond_0
    invoke-virtual {p0, p1}, Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_2

    .line 87
    sget-boolean v0, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v0, :cond_1

    const-string v0, "MPMetrics"

    const-string v1, "success."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    :cond_1
    invoke-virtual {p0, p1, p2, p3}, Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;->sendEmptyMessageDelayed(IJ)Z

    move-result v0

    .line 91
    :goto_0
    return v0

    .line 90
    :cond_2
    sget-boolean v0, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v0, :cond_3

    const-string v0, "MPMetrics"

    const-string v1, "blocked."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method

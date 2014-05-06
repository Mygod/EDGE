.class Lcom/mixpanel/android/mpmetrics/MPMetrics$RegistrationReceiver;
.super Landroid/content/BroadcastReceiver;
.source "MPMetrics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mixpanel/android/mpmetrics/MPMetrics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RegistrationReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;


# direct methods
.method private constructor <init>(Lcom/mixpanel/android/mpmetrics/MPMetrics;)V
    .locals 0
    .parameter

    .prologue
    .line 314
    iput-object p1, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$RegistrationReceiver;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mixpanel/android/mpmetrics/MPMetrics;Lcom/mixpanel/android/mpmetrics/MPMetrics$RegistrationReceiver;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 314
    invoke-direct {p0, p1}, Lcom/mixpanel/android/mpmetrics/MPMetrics$RegistrationReceiver;-><init>(Lcom/mixpanel/android/mpmetrics/MPMetrics;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 317
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 318
    .local v0, action:Ljava/lang/String;
    sget-boolean v2, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "MPMetrics"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Intent received: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    :cond_0
    const-string v2, "com.google.android.c2dm.intent.REGISTRATION"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 321
    const-string v2, "registration_id"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 322
    .local v1, registration:Ljava/lang/String;
    const-string v2, "error"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 323
    sget-boolean v2, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v2, :cond_1

    const-string v2, "MPMetrics"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Error when registering for C2DM: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "error"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 333
    .end local v1           #registration:Ljava/lang/String;
    :cond_1
    :goto_0
    return-void

    .line 325
    .restart local v1       #registration:Ljava/lang/String;
    :cond_2
    const-string v2, "unregistered"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 327
    const-string v2, "MPMetrics"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Received unregistration: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "unregistered"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 328
    :cond_3
    if-eqz v1, :cond_1

    .line 329
    const-string v2, "MPMetrics"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Received registration ID: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 330
    iget-object v2, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$RegistrationReceiver;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    const-string v3, "$registration_id"

    invoke-virtual {v2, v3, v1}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->set(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

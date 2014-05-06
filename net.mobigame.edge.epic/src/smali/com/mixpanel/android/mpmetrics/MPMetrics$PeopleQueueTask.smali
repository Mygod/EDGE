.class Lcom/mixpanel/android/mpmetrics/MPMetrics$PeopleQueueTask;
.super Ljava/lang/Object;
.source "MPMetrics.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mixpanel/android/mpmetrics/MPMetrics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PeopleQueueTask"
.end annotation


# instance fields
.field private actionType:Ljava/lang/String;

.field private properties:Lorg/json/JSONObject;

.field final synthetic this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;


# direct methods
.method public constructor <init>(Lcom/mixpanel/android/mpmetrics/MPMetrics;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0
    .parameter
    .parameter "actionType"
    .parameter "properties"

    .prologue
    .line 477
    iput-object p1, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$PeopleQueueTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 478
    iput-object p2, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$PeopleQueueTask;->actionType:Ljava/lang/String;

    .line 479
    iput-object p3, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$PeopleQueueTask;->properties:Lorg/json/JSONObject;

    .line 480
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 483
    sget-boolean v3, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v3, :cond_0

    const-string v3, "MPMetrics"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "PeopleQueueTask running, queueing "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$PeopleQueueTask;->actionType:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 484
    :cond_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 486
    .local v1, dataObj:Lorg/json/JSONObject;
    :try_start_0
    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$PeopleQueueTask;->actionType:Ljava/lang/String;

    iget-object v4, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$PeopleQueueTask;->properties:Lorg/json/JSONObject;

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 487
    const-string v3, "$token"

    iget-object v4, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$PeopleQueueTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mToken:Ljava/lang/String;
    invoke-static {v4}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$6(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 488
    const-string v3, "$distinct_id"

    iget-object v4, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$PeopleQueueTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->distinct_id:Ljava/lang/String;
    invoke-static {v4}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$12(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 489
    const-string v3, "$time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v1, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 495
    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$PeopleQueueTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mDbAdapter:Lcom/mixpanel/android/mpmetrics/MPDbAdapter;
    invoke-static {v3}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$4(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Lcom/mixpanel/android/mpmetrics/MPDbAdapter;

    move-result-object v3

    const-string v4, "people"

    invoke-virtual {v3, v1, v4}, Lcom/mixpanel/android/mpmetrics/MPDbAdapter;->addJSON(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v0

    .line 496
    .local v0, count:I
    sget-boolean v3, Lcom/mixpanel/android/mpmetrics/MPConfig;->TEST_MODE:Z

    if-nez v3, :cond_1

    sget v3, Lcom/mixpanel/android/mpmetrics/MPConfig;->BULK_UPLOAD_LIMIT:I

    if-lt v0, v3, :cond_3

    .line 497
    :cond_1
    sget-boolean v3, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v3, :cond_2

    const-string v3, "MPMetrics"

    const-string v4, "PeopleQueueTask MPConfig.TEST_MODE set or count greater than MPConfig.BULK_UPLOAD_LIMIT"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 498
    :cond_2
    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$PeopleQueueTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    invoke-virtual {v3}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->flushPeople()V

    .line 502
    .end local v0           #count:I
    :goto_0
    return-void

    .line 490
    :catch_0
    move-exception v2

    .line 491
    .local v2, e:Lorg/json/JSONException;
    const-string v3, "MPMetrics"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "PeopleQueueTask "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$PeopleQueueTask;->properties:Lorg/json/JSONObject;

    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 500
    .end local v2           #e:Lorg/json/JSONException;
    .restart local v0       #count:I
    :cond_3
    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$PeopleQueueTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mTimerHandler:Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;
    invoke-static {v3}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$5(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;

    move-result-object v3

    invoke-static {}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$1()I

    move-result v4

    sget-wide v5, Lcom/mixpanel/android/mpmetrics/MPConfig;->FLUSH_RATE:J

    invoke-virtual {v3, v4, v5, v6}, Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;->sendUniqueEmptyMessageDelayed(IJ)Z

    goto :goto_0
.end method

.class Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;
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
    name = "EventsQueueTask"
.end annotation


# instance fields
.field private eventName:Ljava/lang/String;

.field private properties:Lorg/json/JSONObject;

.field final synthetic this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

.field private time:J


# direct methods
.method public constructor <init>(Lcom/mixpanel/android/mpmetrics/MPMetrics;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 4
    .parameter
    .parameter "eventName"
    .parameter "properties"

    .prologue
    .line 420
    iput-object p1, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 421
    iput-object p2, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->eventName:Ljava/lang/String;

    .line 422
    iput-object p3, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->properties:Lorg/json/JSONObject;

    .line 423
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    iput-wide v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->time:J

    .line 424
    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    .line 427
    sget-boolean v6, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v6, :cond_0

    const-string v6, "MPMetrics"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "EventsQueueTask running, queueing "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v8, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->eventName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 429
    :cond_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 431
    .local v1, dataObj:Lorg/json/JSONObject;
    :try_start_0
    const-string v6, "event"

    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->eventName:Ljava/lang/String;

    invoke-virtual {v1, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 432
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 433
    .local v5, propertiesObj:Lorg/json/JSONObject;
    const-string v6, "token"

    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mToken:Ljava/lang/String;
    invoke-static {v7}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$6(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 434
    const-string v6, "time"

    iget-wide v7, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->time:J

    invoke-virtual {v5, v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 435
    const-string v7, "distinct_id"

    iget-object v6, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mDeviceId:Ljava/lang/String;
    invoke-static {v6}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$7(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_5

    const-string v6, "UNKNOWN"

    :goto_0
    invoke-virtual {v5, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 436
    const-string v7, "carrier"

    iget-object v6, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mCarrier:Ljava/lang/String;
    invoke-static {v6}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$8(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_6

    const-string v6, "UNKNOWN"

    :goto_1
    invoke-virtual {v5, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 437
    const-string v7, "model"

    iget-object v6, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mModel:Ljava/lang/String;
    invoke-static {v6}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$9(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_7

    const-string v6, "UNKNOWN"

    :goto_2
    invoke-virtual {v5, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 438
    const-string v7, "version"

    iget-object v6, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mVersion:Ljava/lang/String;
    invoke-static {v6}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$10(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_8

    const-string v6, "UNKNOWN"

    :goto_3
    invoke-virtual {v5, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 439
    const-string v6, "mp_lib"

    const-string v7, "android"

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 441
    iget-object v6, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mSuperProperties:Lorg/json/JSONObject;
    invoke-static {v6}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$11(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v6}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v3

    .local v3, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_9

    .line 446
    iget-object v6, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->distinct_id:Ljava/lang/String;
    invoke-static {v6}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$12(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 447
    const-string v6, "distinct_id"

    iget-object v7, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->distinct_id:Ljava/lang/String;
    invoke-static {v7}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$12(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 450
    :cond_1
    iget-object v6, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->properties:Lorg/json/JSONObject;

    if-eqz v6, :cond_2

    .line 451
    iget-object v6, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->properties:Lorg/json/JSONObject;

    invoke-virtual {v6}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v3

    :goto_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_a

    .line 457
    :cond_2
    const-string v6, "properties"

    invoke-virtual {v1, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 463
    iget-object v6, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mDbAdapter:Lcom/mixpanel/android/mpmetrics/MPDbAdapter;
    invoke-static {v6}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$4(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Lcom/mixpanel/android/mpmetrics/MPDbAdapter;

    move-result-object v6

    const-string v7, "events"

    invoke-virtual {v6, v1, v7}, Lcom/mixpanel/android/mpmetrics/MPDbAdapter;->addJSON(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v0

    .line 464
    .local v0, count:I
    sget-boolean v6, Lcom/mixpanel/android/mpmetrics/MPConfig;->TEST_MODE:Z

    if-nez v6, :cond_3

    sget v6, Lcom/mixpanel/android/mpmetrics/MPConfig;->BULK_UPLOAD_LIMIT:I

    if-lt v0, v6, :cond_b

    .line 465
    :cond_3
    sget-boolean v6, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v6, :cond_4

    const-string v6, "MPMetrics"

    const-string v7, "EventsQueueTask in test or count greater than MPConfig.BULK_UPLOAD_LIMIT"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 466
    :cond_4
    iget-object v6, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    invoke-virtual {v6}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->flushEvents()V

    .line 470
    .end local v0           #count:I
    .end local v3           #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v5           #propertiesObj:Lorg/json/JSONObject;
    :goto_6
    return-void

    .line 435
    .restart local v5       #propertiesObj:Lorg/json/JSONObject;
    :cond_5
    :try_start_1
    iget-object v6, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mDeviceId:Ljava/lang/String;
    invoke-static {v6}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$7(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_0

    .line 436
    :cond_6
    iget-object v6, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mCarrier:Ljava/lang/String;
    invoke-static {v6}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$8(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 437
    :cond_7
    iget-object v6, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mModel:Ljava/lang/String;
    invoke-static {v6}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$9(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_2

    .line 438
    :cond_8
    iget-object v6, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mVersion:Ljava/lang/String;
    invoke-static {v6}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$10(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_3

    .line 442
    .restart local v3       #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_9
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 443
    .local v4, key:Ljava/lang/String;
    iget-object v6, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mSuperProperties:Lorg/json/JSONObject;
    invoke-static {v6}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$11(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v6, v4}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v4, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_4

    .line 458
    .end local v3           #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v4           #key:Ljava/lang/String;
    .end local v5           #propertiesObj:Lorg/json/JSONObject;
    :catch_0
    move-exception v2

    .line 459
    .local v2, e:Lorg/json/JSONException;
    const-string v6, "MPMetrics"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "EventsQueueTask "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v8, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->eventName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_6

    .line 452
    .end local v2           #e:Lorg/json/JSONException;
    .restart local v3       #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    .restart local v5       #propertiesObj:Lorg/json/JSONObject;
    :cond_a
    :try_start_2
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 453
    .restart local v4       #key:Ljava/lang/String;
    iget-object v6, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->properties:Lorg/json/JSONObject;

    invoke-virtual {v6, v4}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v4, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_5

    .line 468
    .end local v4           #key:Ljava/lang/String;
    .restart local v0       #count:I
    :cond_b
    iget-object v6, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$EventsQueueTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mTimerHandler:Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;
    invoke-static {v6}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$5(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;

    move-result-object v6

    invoke-static {}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$0()I

    move-result v7

    sget-wide v8, Lcom/mixpanel/android/mpmetrics/MPConfig;->FLUSH_RATE:J

    invoke-virtual {v6, v7, v8, v9}, Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;->sendUniqueEmptyMessageDelayed(IJ)Z

    goto :goto_6
.end method

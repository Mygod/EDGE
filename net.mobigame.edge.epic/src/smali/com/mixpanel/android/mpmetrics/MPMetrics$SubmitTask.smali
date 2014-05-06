.class Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;
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
    name = "SubmitTask"
.end annotation


# instance fields
.field private messageType:I

.field private table:Ljava/lang/String;

.field final synthetic this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;


# direct methods
.method public constructor <init>(Lcom/mixpanel/android/mpmetrics/MPMetrics;I)V
    .locals 2
    .parameter
    .parameter "messageType"

    .prologue
    const/4 v1, 0x0

    .line 340
    iput-object p1, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 341
    iput p2, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->messageType:I

    .line 342
    invoke-static {}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$1()I

    move-result v0

    if-ne p2, v0, :cond_0

    .line 343
    const-string v0, "people"

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->table:Ljava/lang/String;

    .line 344
    invoke-static {v1}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$2(Z)V

    .line 349
    :goto_0
    return-void

    .line 346
    :cond_0
    const-string v0, "events"

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->table:Ljava/lang/String;

    .line 347
    invoke-static {v1}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$3(Z)V

    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    .line 353
    sget-boolean v8, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v8, :cond_0

    const-string v8, "MPMetrics"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "SubmitTask "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->table:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " running."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 355
    :cond_0
    iget-object v8, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mDbAdapter:Lcom/mixpanel/android/mpmetrics/MPDbAdapter;
    invoke-static {v8}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$4(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Lcom/mixpanel/android/mpmetrics/MPDbAdapter;

    move-result-object v8

    iget-object v9, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->table:Ljava/lang/String;

    invoke-virtual {v8, v9}, Lcom/mixpanel/android/mpmetrics/MPDbAdapter;->generateDataString(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 356
    .local v0, data:[Ljava/lang/String;
    if-nez v0, :cond_1

    .line 412
    :goto_0
    return-void

    .line 360
    :cond_1
    new-instance v3, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v3}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 362
    .local v3, httpclient:Lorg/apache/http/client/HttpClient;
    iget-object v8, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->table:Ljava/lang/String;

    const-string v9, "people"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 363
    new-instance v4, Lorg/apache/http/client/methods/HttpPost;

    new-instance v8, Ljava/lang/StringBuilder;

    sget-object v9, Lcom/mixpanel/android/mpmetrics/MPConfig;->BASE_ENDPOINT:Ljava/lang/String;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, "/engage"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v4, v8}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 369
    .local v4, httppost:Lorg/apache/http/client/methods/HttpPost;
    :goto_1
    :try_start_0
    new-instance v5, Ljava/util/ArrayList;

    const/4 v8, 0x1

    invoke-direct {v5, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 370
    .local v5, nameValuePairs:Ljava/util/List;,"Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v8, Lorg/apache/http/message/BasicNameValuePair;

    const-string v9, "data"

    const/4 v10, 0x1

    aget-object v10, v0, v10

    invoke-direct {v8, v9, v10}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v5, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 371
    new-instance v8, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    invoke-direct {v8, v5}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;)V

    invoke-virtual {v4, v8}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 373
    invoke-interface {v3, v4}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v6

    .line 374
    .local v6, response:Lorg/apache/http/HttpResponse;
    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v2

    .line 375
    .local v2, entity:Lorg/apache/http/HttpEntity;
    if-nez v2, :cond_3

    .line 376
    iget-object v8, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mTimerHandler:Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;
    invoke-static {v8}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$5(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;

    move-result-object v8

    iget v9, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->messageType:I

    sget-wide v10, Lcom/mixpanel/android/mpmetrics/MPConfig;->FLUSH_RATE:J

    invoke-virtual {v8, v9, v10, v11}, Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;->sendUniqueEmptyMessageDelayed(IJ)Z
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 403
    .end local v2           #entity:Lorg/apache/http/HttpEntity;
    .end local v5           #nameValuePairs:Ljava/util/List;,"Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v6           #response:Lorg/apache/http/HttpResponse;
    :catch_0
    move-exception v1

    .line 404
    .local v1, e:Lorg/apache/http/client/ClientProtocolException;
    const-string v8, "MPMetrics"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "SubmitTask "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->table:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 405
    iget-object v8, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mTimerHandler:Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;
    invoke-static {v8}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$5(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;

    move-result-object v8

    iget v9, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->messageType:I

    sget-wide v10, Lcom/mixpanel/android/mpmetrics/MPConfig;->FLUSH_RATE:J

    invoke-virtual {v8, v9, v10, v11}, Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;->sendUniqueEmptyMessageDelayed(IJ)Z

    goto/16 :goto_0

    .line 365
    .end local v1           #e:Lorg/apache/http/client/ClientProtocolException;
    .end local v4           #httppost:Lorg/apache/http/client/methods/HttpPost;
    :cond_2
    new-instance v4, Lorg/apache/http/client/methods/HttpPost;

    new-instance v8, Ljava/lang/StringBuilder;

    sget-object v9, Lcom/mixpanel/android/mpmetrics/MPConfig;->BASE_ENDPOINT:Ljava/lang/String;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, "/track?ip=1"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v4, v8}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .restart local v4       #httppost:Lorg/apache/http/client/methods/HttpPost;
    goto :goto_1

    .line 381
    .restart local v2       #entity:Lorg/apache/http/HttpEntity;
    .restart local v5       #nameValuePairs:Ljava/util/List;,"Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .restart local v6       #response:Lorg/apache/http/HttpResponse;
    :cond_3
    :try_start_1
    invoke-interface {v2}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v8

    invoke-static {v8}, Lcom/mixpanel/android/util/StringUtils;->inputStreamToString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v7

    .line 382
    .local v7, result:Ljava/lang/String;
    sget-boolean v8, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v8, :cond_4

    .line 383
    const-string v8, "MPMetrics"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "HttpResponse result: "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 385
    :cond_4
    const-string v8, "1\n"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_5

    .line 386
    iget-object v8, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mTimerHandler:Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;
    invoke-static {v8}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$5(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;

    move-result-object v8

    iget v9, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->messageType:I

    sget-wide v10, Lcom/mixpanel/android/mpmetrics/MPConfig;->FLUSH_RATE:J

    invoke-virtual {v8, v9, v10, v11}, Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;->sendUniqueEmptyMessageDelayed(IJ)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_3
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 393
    .end local v7           #result:Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 394
    .local v1, e:Ljava/io/IOException;
    :try_start_2
    const-string v8, "MPMetrics"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "SubmitTask "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->table:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 395
    iget-object v8, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mTimerHandler:Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;
    invoke-static {v8}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$5(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;

    move-result-object v8

    iget v9, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->messageType:I

    sget-wide v10, Lcom/mixpanel/android/mpmetrics/MPConfig;->FLUSH_RATE:J

    invoke-virtual {v8, v9, v10, v11}, Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;->sendUniqueEmptyMessageDelayed(IJ)Z
    :try_end_2
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_0

    .line 407
    .end local v1           #e:Ljava/io/IOException;
    .end local v2           #entity:Lorg/apache/http/HttpEntity;
    .end local v5           #nameValuePairs:Ljava/util/List;,"Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v6           #response:Lorg/apache/http/HttpResponse;
    :catch_2
    move-exception v1

    .line 408
    .restart local v1       #e:Ljava/io/IOException;
    const-string v8, "MPMetrics"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "SubmitTask "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->table:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 409
    iget-object v8, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mTimerHandler:Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;
    invoke-static {v8}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$5(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;

    move-result-object v8

    iget v9, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->messageType:I

    sget-wide v10, Lcom/mixpanel/android/mpmetrics/MPConfig;->FLUSH_RATE:J

    invoke-virtual {v8, v9, v10, v11}, Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;->sendUniqueEmptyMessageDelayed(IJ)Z

    goto/16 :goto_0

    .line 391
    .end local v1           #e:Ljava/io/IOException;
    .restart local v2       #entity:Lorg/apache/http/HttpEntity;
    .restart local v5       #nameValuePairs:Ljava/util/List;,"Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .restart local v6       #response:Lorg/apache/http/HttpResponse;
    .restart local v7       #result:Ljava/lang/String;
    :cond_5
    :try_start_3
    iget-object v8, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mDbAdapter:Lcom/mixpanel/android/mpmetrics/MPDbAdapter;
    invoke-static {v8}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$4(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Lcom/mixpanel/android/mpmetrics/MPDbAdapter;

    move-result-object v8

    const/4 v9, 0x0

    aget-object v9, v0, v9

    iget-object v10, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->table:Ljava/lang/String;

    invoke-virtual {v8, v9, v10}, Lcom/mixpanel/android/mpmetrics/MPDbAdapter;->cleanupEvents(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_3 .. :try_end_3} :catch_3
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_0

    .line 397
    .end local v7           #result:Ljava/lang/String;
    :catch_3
    move-exception v1

    .line 398
    .local v1, e:Ljava/lang/OutOfMemoryError;
    :try_start_4
    const-string v8, "MPMetrics"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "SubmitTask "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->table:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 399
    iget-object v8, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->this$0:Lcom/mixpanel/android/mpmetrics/MPMetrics;

    #getter for: Lcom/mixpanel/android/mpmetrics/MPMetrics;->mTimerHandler:Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;
    invoke-static {v8}, Lcom/mixpanel/android/mpmetrics/MPMetrics;->access$5(Lcom/mixpanel/android/mpmetrics/MPMetrics;)Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;

    move-result-object v8

    iget v9, p0, Lcom/mixpanel/android/mpmetrics/MPMetrics$SubmitTask;->messageType:I

    sget-wide v10, Lcom/mixpanel/android/mpmetrics/MPConfig;->FLUSH_RATE:J

    invoke-virtual {v8, v9, v10, v11}, Lcom/mixpanel/android/mpmetrics/MPMetrics$UniqueHandler;->sendUniqueEmptyMessageDelayed(IJ)Z
    :try_end_4
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto/16 :goto_0
.end method

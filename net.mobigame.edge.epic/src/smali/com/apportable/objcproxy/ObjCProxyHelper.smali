.class public Lcom/apportable/objcproxy/ObjCProxyHelper;
.super Ljava/lang/Object;
.source "ObjCProxyHelper.java"


# static fields
.field private static TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    const-string v0, "ObjCProxyHelper"

    sput-object v0, Lcom/apportable/objcproxy/ObjCProxyHelper;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static invokeMethod(Lcom/apportable/objcproxy/ObjCProxy;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .parameter "callee"
    .parameter "methodName"
    .parameter "param"

    .prologue
    .line 17
    sget-object v4, Lcom/apportable/objcproxy/ObjCProxyHelper;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " called from JavaProxy with methodName "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v4, p1, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 20
    .local v2, method:Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    .line 21
    .local v1, jsonParam:Lorg/json/JSONObject;
    if-eqz p2, :cond_0

    .line 22
    new-instance v1, Lorg/json/JSONObject;

    .end local v1           #jsonParam:Lorg/json/JSONObject;
    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 24
    .restart local v1       #jsonParam:Lorg/json/JSONObject;
    :cond_0
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    invoke-virtual {v2, p0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 25
    .local v3, result:Ljava/lang/Object;
    if-eqz v3, :cond_1

    .line 26
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 28
    :goto_0
    return-object v4

    :cond_1
    const/4 v4, 0x0

    goto :goto_0

    .line 30
    .end local v1           #jsonParam:Lorg/json/JSONObject;
    .end local v2           #method:Ljava/lang/reflect/Method;
    .end local v3           #result:Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 31
    .local v0, e:Ljava/lang/Exception;
    sget-object v4, Lcom/apportable/objcproxy/ObjCProxyHelper;->TAG:Ljava/lang/String;

    const-string v5, "Failed method invokation due to: "

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 32
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to invoke method "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " due to exception: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method public static marshalToBoolean(Ljava/lang/String;)Z
    .locals 8
    .parameter "value"

    .prologue
    const/4 v4, 0x0

    .line 92
    invoke-static {p0}, Lcom/apportable/objcproxy/ObjCProxyHelper;->marshalToJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 94
    .local v0, arr:Lorg/json/JSONArray;
    const/4 v5, 0x0

    :try_start_0
    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getBoolean(I)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .local v3, retval:Z
    move v4, v3

    .line 104
    .end local v3           #retval:Z
    :cond_0
    :goto_0
    return v4

    .line 96
    :catch_0
    move-exception v1

    .line 98
    .local v1, e:Lorg/json/JSONException;
    const/4 v5, 0x0

    :try_start_1
    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getInt(I)I
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v3

    .line 99
    .local v3, retval:I
    if-eqz v3, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    .line 100
    .end local v3           #retval:I
    :catch_1
    move-exception v2

    .line 101
    .local v2, ex:Lorg/json/JSONException;
    const-string v5, "ObjCProxyHelper"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Expected: JSON Array with boolean at element 0.  Actual: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static marshalToDouble(Ljava/lang/String;)D
    .locals 7
    .parameter "value"

    .prologue
    .line 119
    invoke-static {p0}, Lcom/apportable/objcproxy/ObjCProxyHelper;->marshalToJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 121
    .local v0, arr:Lorg/json/JSONArray;
    const/4 v4, 0x0

    :try_start_0
    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getDouble(I)D
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    .line 126
    :goto_0
    return-wide v2

    .line 123
    :catch_0
    move-exception v1

    .line 124
    .local v1, e:Lorg/json/JSONException;
    const-string v4, "ObjCProxyHelper"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Expected: JSON Array with double at element 0.  Actual: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    const-wide/16 v2, 0x0

    goto :goto_0
.end method

.method public static marshalToInt(Ljava/lang/String;)I
    .locals 6
    .parameter "value"

    .prologue
    const/4 v2, 0x0

    .line 108
    invoke-static {p0}, Lcom/apportable/objcproxy/ObjCProxyHelper;->marshalToJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 110
    .local v0, arr:Lorg/json/JSONArray;
    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getInt(I)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 115
    :goto_0
    return v2

    .line 112
    :catch_0
    move-exception v1

    .line 113
    .local v1, e:Lorg/json/JSONException;
    const-string v3, "ObjCProxyHelper"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Expected: JSON Array with int at element 0.  Actual: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static marshalToJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 5
    .parameter "value"

    .prologue
    .line 53
    if-nez p0, :cond_0

    .line 54
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 63
    :goto_0
    return-object v1

    .line 58
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    .local v1, retval:Lorg/json/JSONArray;
    goto :goto_0

    .line 60
    .end local v1           #retval:Lorg/json/JSONArray;
    :catch_0
    move-exception v0

    .line 61
    .local v0, e:Lorg/json/JSONException;
    const-string v2, "ObjCProxyHelper"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Expected: JSON Array String.  Actual: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    goto :goto_0
.end method

.method public static marshalToJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 5
    .parameter "value"

    .prologue
    .line 67
    if-nez p0, :cond_0

    .line 68
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 77
    :goto_0
    return-object v1

    .line 72
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .local v1, retval:Lorg/json/JSONObject;
    goto :goto_0

    .line 74
    .end local v1           #retval:Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 75
    .local v0, e:Lorg/json/JSONException;
    const-string v2, "ObjCProxyHelper"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Expected: JSON Array String.  Actual: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    goto :goto_0
.end method

.method public static marshalToString(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .parameter "value"

    .prologue
    .line 81
    invoke-static {p0}, Lcom/apportable/objcproxy/ObjCProxyHelper;->marshalToJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 83
    .local v0, arr:Lorg/json/JSONArray;
    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 88
    :goto_0
    return-object v2

    .line 85
    :catch_0
    move-exception v1

    .line 86
    .local v1, e:Lorg/json/JSONException;
    const-string v3, "ObjCProxyHelper"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Expected: JSON Array with String at element 0.  Actual: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    const-string v2, ""

    goto :goto_0
.end method

.method public static performAsyncSelectorWithPayload(Lcom/apportable/objcproxy/AbstractObjCProxy;Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;Z)V
    .locals 1
    .parameter "callee"
    .parameter "methodname"
    .parameter "payload"
    .parameter "useMainThread"

    .prologue
    .line 37
    new-instance v0, Lcom/apportable/objcproxy/ObjCProxyHelper$1;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/apportable/objcproxy/ObjCProxyHelper$1;-><init>(Lcom/apportable/objcproxy/AbstractObjCProxy;Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;Z)V

    .line 38
    .local v0, t:Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 39
    return-void
.end method

.method public static performSelectorWithPayload(Lcom/apportable/objcproxy/ObjCProxy;Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;)Ljava/lang/String;
    .locals 7
    .parameter "callee"
    .parameter "methodname"
    .parameter "payload"

    .prologue
    const/4 v5, 0x1

    .line 42
    const/4 v6, 0x0

    .line 43
    .local v6, result:Ljava/lang/String;
    if-eqz p2, :cond_0

    .line 44
    invoke-interface {p0}, Lcom/apportable/objcproxy/ObjCProxy;->getObjcObject()J

    move-result-wide v1

    invoke-virtual {p2}, Lcom/apportable/objcproxy/CallbackPayload;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v0, p0

    move-object v3, p1

    invoke-interface/range {v0 .. v5}, Lcom/apportable/objcproxy/ObjCProxy;->performSelector(JLjava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v6

    .line 49
    :goto_0
    return-object v6

    .line 46
    :cond_0
    invoke-interface {p0}, Lcom/apportable/objcproxy/ObjCProxy;->getObjcObject()J

    move-result-wide v1

    new-instance v0, Lcom/apportable/objcproxy/CallbackPayload;

    invoke-direct {v0}, Lcom/apportable/objcproxy/CallbackPayload;-><init>()V

    invoke-virtual {v0}, Lcom/apportable/objcproxy/CallbackPayload;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v0, p0

    move-object v3, p1

    invoke-interface/range {v0 .. v5}, Lcom/apportable/objcproxy/ObjCProxy;->performSelector(JLjava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v6

    goto :goto_0
.end method

.class public abstract Lcom/apportable/objcproxy/AbstractObjCProxy;
.super Ljava/lang/Object;
.source "AbstractObjCProxy.java"

# interfaces
.implements Lcom/apportable/objcproxy/ObjCProxy;


# static fields
.field private static final TAG:Ljava/lang/String; = "AbstractObjCProxy"


# instance fields
.field protected final objcObject:J


# direct methods
.method public constructor <init>(J)V
    .locals 0
    .parameter "delegate"

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-wide p1, p0, Lcom/apportable/objcproxy/AbstractObjCProxy;->objcObject:J

    .line 14
    return-void
.end method


# virtual methods
.method public getObjcObject()J
    .locals 2

    .prologue
    .line 19
    iget-wide v0, p0, Lcom/apportable/objcproxy/AbstractObjCProxy;->objcObject:J

    return-wide v0
.end method

.method public invokeMethod(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "selector"
    .parameter "param"

    .prologue
    .line 23
    invoke-static {p0, p1, p2}, Lcom/apportable/objcproxy/ObjCProxyHelper;->invokeMethod(Lcom/apportable/objcproxy/ObjCProxy;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public performArraySelector(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 1
    .parameter "selector"

    .prologue
    .line 51
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/apportable/objcproxy/ObjCProxyHelper;->performSelectorWithPayload(Lcom/apportable/objcproxy/ObjCProxy;Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/apportable/objcproxy/ObjCProxyHelper;->marshalToJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    return-object v0
.end method

.method public performArraySelector(Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;)Lorg/json/JSONArray;
    .locals 1
    .parameter "selector"
    .parameter "param"

    .prologue
    .line 27
    invoke-static {p0, p1, p2}, Lcom/apportable/objcproxy/ObjCProxyHelper;->performSelectorWithPayload(Lcom/apportable/objcproxy/ObjCProxy;Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/apportable/objcproxy/ObjCProxyHelper;->marshalToJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    return-object v0
.end method

.method public performAsyncSelector(Ljava/lang/String;)V
    .locals 1
    .parameter "selector"

    .prologue
    .line 83
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/apportable/objcproxy/AbstractObjCProxy;->performAsyncSelector(Ljava/lang/String;Z)V

    .line 84
    return-void
.end method

.method public performAsyncSelector(Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;Z)V
    .locals 0
    .parameter "selector"
    .parameter "param"
    .parameter "useMainThread"

    .prologue
    .line 87
    invoke-static {p0, p1, p2, p3}, Lcom/apportable/objcproxy/ObjCProxyHelper;->performAsyncSelectorWithPayload(Lcom/apportable/objcproxy/AbstractObjCProxy;Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;Z)V

    .line 88
    return-void
.end method

.method public performAsyncSelector(Ljava/lang/String;Z)V
    .locals 1
    .parameter "selector"
    .parameter "useMainThread"

    .prologue
    .line 79
    new-instance v0, Lcom/apportable/objcproxy/CallbackPayload;

    invoke-direct {v0}, Lcom/apportable/objcproxy/CallbackPayload;-><init>()V

    invoke-static {p0, p1, v0, p2}, Lcom/apportable/objcproxy/ObjCProxyHelper;->performAsyncSelectorWithPayload(Lcom/apportable/objcproxy/AbstractObjCProxy;Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;Z)V

    .line 80
    return-void
.end method

.method public performBooleanSelector(Ljava/lang/String;)Z
    .locals 1
    .parameter "selector"

    .prologue
    .line 63
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/apportable/objcproxy/ObjCProxyHelper;->performSelectorWithPayload(Lcom/apportable/objcproxy/ObjCProxy;Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/apportable/objcproxy/ObjCProxyHelper;->marshalToBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public performBooleanSelector(Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;)Z
    .locals 1
    .parameter "selector"
    .parameter "param"

    .prologue
    .line 39
    invoke-static {p0, p1, p2}, Lcom/apportable/objcproxy/ObjCProxyHelper;->performSelectorWithPayload(Lcom/apportable/objcproxy/ObjCProxy;Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/apportable/objcproxy/ObjCProxyHelper;->marshalToBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public performDoubleSelector(Ljava/lang/String;)D
    .locals 2
    .parameter "selector"

    .prologue
    .line 71
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/apportable/objcproxy/ObjCProxyHelper;->performSelectorWithPayload(Lcom/apportable/objcproxy/ObjCProxy;Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/apportable/objcproxy/ObjCProxyHelper;->marshalToDouble(Ljava/lang/String;)D

    move-result-wide v0

    return-wide v0
.end method

.method public performDoubleSelector(Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;)D
    .locals 2
    .parameter "selector"
    .parameter "param"

    .prologue
    .line 47
    invoke-static {p0, p1, p2}, Lcom/apportable/objcproxy/ObjCProxyHelper;->performSelectorWithPayload(Lcom/apportable/objcproxy/ObjCProxy;Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/apportable/objcproxy/ObjCProxyHelper;->marshalToDouble(Ljava/lang/String;)D

    move-result-wide v0

    return-wide v0
.end method

.method public performIntSelector(Ljava/lang/String;)I
    .locals 1
    .parameter "selector"

    .prologue
    .line 67
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/apportable/objcproxy/ObjCProxyHelper;->performSelectorWithPayload(Lcom/apportable/objcproxy/ObjCProxy;Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/apportable/objcproxy/ObjCProxyHelper;->marshalToInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public performIntSelector(Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;)I
    .locals 1
    .parameter "selector"
    .parameter "param"

    .prologue
    .line 43
    invoke-static {p0, p1, p2}, Lcom/apportable/objcproxy/ObjCProxyHelper;->performSelectorWithPayload(Lcom/apportable/objcproxy/ObjCProxy;Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/apportable/objcproxy/ObjCProxyHelper;->marshalToInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public performObjectSelector(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1
    .parameter "selector"

    .prologue
    .line 55
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/apportable/objcproxy/ObjCProxyHelper;->performSelectorWithPayload(Lcom/apportable/objcproxy/ObjCProxy;Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/apportable/objcproxy/ObjCProxyHelper;->marshalToJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method public performObjectSelector(Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;)Lorg/json/JSONObject;
    .locals 1
    .parameter "selector"
    .parameter "param"

    .prologue
    .line 31
    invoke-static {p0, p1, p2}, Lcom/apportable/objcproxy/ObjCProxyHelper;->performSelectorWithPayload(Lcom/apportable/objcproxy/ObjCProxy;Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/apportable/objcproxy/ObjCProxyHelper;->marshalToJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method public abstract performSelector(JLjava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
.end method

.method public performSelector(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "selector"

    .prologue
    .line 91
    new-instance v0, Lcom/apportable/objcproxy/CallbackPayload;

    invoke-direct {v0}, Lcom/apportable/objcproxy/CallbackPayload;-><init>()V

    invoke-static {p0, p1, v0}, Lcom/apportable/objcproxy/ObjCProxyHelper;->performSelectorWithPayload(Lcom/apportable/objcproxy/ObjCProxy;Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public performSelector(Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;)Ljava/lang/String;
    .locals 1
    .parameter "selector"
    .parameter "param"

    .prologue
    .line 75
    invoke-static {p0, p1, p2}, Lcom/apportable/objcproxy/ObjCProxyHelper;->performSelectorWithPayload(Lcom/apportable/objcproxy/ObjCProxy;Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public performStringSelector(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "selector"

    .prologue
    .line 59
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/apportable/objcproxy/ObjCProxyHelper;->performSelectorWithPayload(Lcom/apportable/objcproxy/ObjCProxy;Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/apportable/objcproxy/ObjCProxyHelper;->marshalToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public performStringSelector(Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;)Ljava/lang/String;
    .locals 1
    .parameter "selector"
    .parameter "param"

    .prologue
    .line 35
    invoke-static {p0, p1, p2}, Lcom/apportable/objcproxy/ObjCProxyHelper;->performSelectorWithPayload(Lcom/apportable/objcproxy/ObjCProxy;Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/apportable/objcproxy/ObjCProxyHelper;->marshalToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

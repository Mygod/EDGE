.class final Lcom/apportable/objcproxy/ObjCProxyHelper$1;
.super Ljava/lang/Thread;
.source "ObjCProxyHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/objcproxy/ObjCProxyHelper;->performAsyncSelectorWithPayload(Lcom/apportable/objcproxy/AbstractObjCProxy;Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$callee:Lcom/apportable/objcproxy/AbstractObjCProxy;

.field final synthetic val$methodname:Ljava/lang/String;

.field final synthetic val$payload:Lcom/apportable/objcproxy/CallbackPayload;

.field final synthetic val$useMainThread:Z


# direct methods
.method constructor <init>(Lcom/apportable/objcproxy/AbstractObjCProxy;Ljava/lang/String;Lcom/apportable/objcproxy/CallbackPayload;Z)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 37
    iput-object p1, p0, Lcom/apportable/objcproxy/ObjCProxyHelper$1;->val$callee:Lcom/apportable/objcproxy/AbstractObjCProxy;

    iput-object p2, p0, Lcom/apportable/objcproxy/ObjCProxyHelper$1;->val$methodname:Ljava/lang/String;

    iput-object p3, p0, Lcom/apportable/objcproxy/ObjCProxyHelper$1;->val$payload:Lcom/apportable/objcproxy/CallbackPayload;

    iput-boolean p4, p0, Lcom/apportable/objcproxy/ObjCProxyHelper$1;->val$useMainThread:Z

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 37
    iget-object v0, p0, Lcom/apportable/objcproxy/ObjCProxyHelper$1;->val$callee:Lcom/apportable/objcproxy/AbstractObjCProxy;

    iget-object v1, p0, Lcom/apportable/objcproxy/ObjCProxyHelper$1;->val$callee:Lcom/apportable/objcproxy/AbstractObjCProxy;

    invoke-virtual {v1}, Lcom/apportable/objcproxy/AbstractObjCProxy;->getObjcObject()J

    move-result-wide v1

    iget-object v3, p0, Lcom/apportable/objcproxy/ObjCProxyHelper$1;->val$methodname:Ljava/lang/String;

    iget-object v4, p0, Lcom/apportable/objcproxy/ObjCProxyHelper$1;->val$payload:Lcom/apportable/objcproxy/CallbackPayload;

    invoke-virtual {v4}, Lcom/apportable/objcproxy/CallbackPayload;->toString()Ljava/lang/String;

    move-result-object v4

    iget-boolean v5, p0, Lcom/apportable/objcproxy/ObjCProxyHelper$1;->val$useMainThread:Z

    invoke-virtual/range {v0 .. v5}, Lcom/apportable/objcproxy/AbstractObjCProxy;->performSelector(JLjava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    return-void
.end method

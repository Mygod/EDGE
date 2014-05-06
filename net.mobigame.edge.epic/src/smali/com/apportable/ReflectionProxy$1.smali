.class Lcom/apportable/ReflectionProxy$1;
.super Ljava/lang/Object;
.source "ReflectionProxy.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ReflectionProxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ReflectionProxy;


# direct methods
.method constructor <init>(Lcom/apportable/ReflectionProxy;)V
    .locals 0
    .parameter

    .prologue
    .line 23
    iput-object p1, p0, Lcom/apportable/ReflectionProxy$1;->this$0:Lcom/apportable/ReflectionProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .parameter "proxy"
    .parameter "method"
    .parameter "args"

    .prologue
    .line 27
    iget-object v0, p0, Lcom/apportable/ReflectionProxy$1;->this$0:Lcom/apportable/ReflectionProxy;

    iget-object v0, p0, Lcom/apportable/ReflectionProxy$1;->this$0:Lcom/apportable/ReflectionProxy;

    #getter for: Lcom/apportable/ReflectionProxy;->mDelegate:J
    invoke-static {v0}, Lcom/apportable/ReflectionProxy;->access$000(Lcom/apportable/ReflectionProxy;)J

    move-result-wide v0

    iget-object v2, p0, Lcom/apportable/ReflectionProxy$1;->this$0:Lcom/apportable/ReflectionProxy;

    #getter for: Lcom/apportable/ReflectionProxy;->mMethods:Ljava/util/HashMap;
    invoke-static {v2}, Lcom/apportable/ReflectionProxy;->access$100(Lcom/apportable/ReflectionProxy;)Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    move-object v4, p1

    move-object v5, p3

    #calls: Lcom/apportable/ReflectionProxy;->invoke(JJLjava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static/range {v0 .. v5}, Lcom/apportable/ReflectionProxy;->access$200(JJLjava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

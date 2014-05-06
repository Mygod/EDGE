.class public Lcom/apportable/ReflectionProxy;
.super Ljava/lang/Object;
.source "ReflectionProxy.java"


# instance fields
.field private mClass:Ljava/lang/Class;

.field private mDelegate:J

.field private mMethods:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(J)V
    .locals 0
    .parameter "delegate"

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-wide p1, p0, Lcom/apportable/ReflectionProxy;->mDelegate:J

    .line 19
    return-void
.end method

.method static synthetic access$000(Lcom/apportable/ReflectionProxy;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 9
    iget-wide v0, p0, Lcom/apportable/ReflectionProxy;->mDelegate:J

    return-wide v0
.end method

.method static synthetic access$100(Lcom/apportable/ReflectionProxy;)Ljava/util/HashMap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 9
    iget-object v0, p0, Lcom/apportable/ReflectionProxy;->mMethods:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$200(JJLjava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 9
    invoke-static/range {p0 .. p5}, Lcom/apportable/ReflectionProxy;->invoke(JJLjava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private static native invoke(JJLjava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
.end method


# virtual methods
.method public newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .parameter "loader"
    .parameter "interfaces"

    .prologue
    .line 23
    new-instance v0, Lcom/apportable/ReflectionProxy$1;

    invoke-direct {v0, p0}, Lcom/apportable/ReflectionProxy$1;-><init>(Lcom/apportable/ReflectionProxy;)V

    invoke-static {p1, p2, v0}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public proxyMethod(JLjava/lang/reflect/Method;)V
    .locals 2
    .parameter "selector"
    .parameter "m"

    .prologue
    .line 33
    iget-object v0, p0, Lcom/apportable/ReflectionProxy;->mMethods:Ljava/util/HashMap;

    new-instance v1, Ljava/lang/Long;

    invoke-direct {v1, p1, p2}, Ljava/lang/Long;-><init>(J)V

    invoke-virtual {v0, p3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    return-void
.end method

.class public Lcom/apportable/ui/FullScreen;
.super Ljava/lang/Object;
.source "FullScreen.java"

# interfaces
.implements Lcom/apportable/objcproxy/ObjCProxy;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/apportable/ui/FullScreen$FullScreenRunner;
    }
.end annotation


# static fields
.field private static TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    const-string v0, "FullScreen"

    sput-object v0, Lcom/apportable/ui/FullScreen;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(J)V
    .locals 0
    .parameter "delegate"

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 12
    sget-object v0, Lcom/apportable/ui/FullScreen;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public getObjcObject()J
    .locals 2

    .prologue
    .line 27
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public invokeMethod(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "methodName"
    .parameter "param"

    .prologue
    .line 20
    new-instance v0, Lcom/apportable/ui/FullScreen$FullScreenRunner;

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-direct {v0, p0, v1}, Lcom/apportable/ui/FullScreen$FullScreenRunner;-><init>(Lcom/apportable/ui/FullScreen;I)V

    .line 21
    .local v0, runner:Lcom/apportable/ui/FullScreen$FullScreenRunner;
    invoke-static {}, Lcom/apportable/activity/VerdeActivity;->getActivity()Lcom/apportable/activity/VerdeActivity;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/apportable/activity/VerdeActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 22
    const/4 v1, 0x0

    return-object v1
.end method

.method public native performSelector(JLjava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
.end method

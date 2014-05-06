.class public Lcom/apportable/notifications/NotificationsBootReceiver;
.super Landroid/content/BroadcastReceiver;
.source "NotificationsBootReceiver.java"


# static fields
.field private static TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    const-string v0, "NotificationsBootReceiver"

    sput-object v0, Lcom/apportable/notifications/NotificationsBootReceiver;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 16
    sget-object v0, Lcom/apportable/notifications/NotificationsBootReceiver;->TAG:Ljava/lang/String;

    const-string v1, "on-boot Intent received, running initial scheduling"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/apportable/notifications/LocalNotificationService;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 21
    return-void
.end method

.class Lcom/apportable/ui/Device$3;
.super Ljava/lang/Object;
.source "Device.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Device;->enable()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Device;


# direct methods
.method constructor <init>(Lcom/apportable/ui/Device;)V
    .locals 0
    .parameter

    .prologue
    .line 81
    iput-object p1, p0, Lcom/apportable/ui/Device$3;->this$0:Lcom/apportable/ui/Device;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/apportable/ui/Device$3;->this$0:Lcom/apportable/ui/Device;

    #getter for: Lcom/apportable/ui/Device;->listener:Landroid/view/OrientationEventListener;
    invoke-static {v0}, Lcom/apportable/ui/Device;->access$200(Lcom/apportable/ui/Device;)Landroid/view/OrientationEventListener;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->enable()V

    .line 85
    return-void
.end method

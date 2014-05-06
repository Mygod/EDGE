.class Lcom/apportable/ui/Device$1$1;
.super Ljava/lang/Object;
.source "Device.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Device$1;->onOrientationChanged(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/apportable/ui/Device$1;

.field final synthetic val$orientation:I


# direct methods
.method constructor <init>(Lcom/apportable/ui/Device$1;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 42
    iput-object p1, p0, Lcom/apportable/ui/Device$1$1;->this$1:Lcom/apportable/ui/Device$1;

    iput p2, p0, Lcom/apportable/ui/Device$1$1;->val$orientation:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 45
    iget-object v0, p0, Lcom/apportable/ui/Device$1$1;->this$1:Lcom/apportable/ui/Device$1;

    iget-object v0, v0, Lcom/apportable/ui/Device$1;->this$0:Lcom/apportable/ui/Device;

    iget-object v1, p0, Lcom/apportable/ui/Device$1$1;->this$1:Lcom/apportable/ui/Device$1;

    iget-object v1, v1, Lcom/apportable/ui/Device$1;->this$0:Lcom/apportable/ui/Device;

    #getter for: Lcom/apportable/ui/Device;->mObject:I
    invoke-static {v1}, Lcom/apportable/ui/Device;->access$000(Lcom/apportable/ui/Device;)I

    move-result v1

    iget v2, p0, Lcom/apportable/ui/Device$1$1;->val$orientation:I

    #calls: Lcom/apportable/ui/Device;->nativeOnOrientationChanged(II)V
    invoke-static {v0, v1, v2}, Lcom/apportable/ui/Device;->access$100(Lcom/apportable/ui/Device;II)V

    .line 46
    return-void
.end method

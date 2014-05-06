.class Lcom/apportable/activity/VerdeActivity$6;
.super Ljava/lang/Object;
.source "VerdeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/activity/VerdeActivity;->_setRequestedOrientation(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/activity/VerdeActivity;

.field final synthetic val$orientation:I


# direct methods
.method constructor <init>(Lcom/apportable/activity/VerdeActivity;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 612
    iput-object p1, p0, Lcom/apportable/activity/VerdeActivity$6;->this$0:Lcom/apportable/activity/VerdeActivity;

    iput p2, p0, Lcom/apportable/activity/VerdeActivity$6;->val$orientation:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/16 v1, 0x8

    .line 615
    iget v0, p0, Lcom/apportable/activity/VerdeActivity$6;->val$orientation:I

    packed-switch v0, :pswitch_data_0

    .line 635
    :goto_0
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity$6;->this$0:Lcom/apportable/activity/VerdeActivity;

    iget-object v1, p0, Lcom/apportable/activity/VerdeActivity$6;->this$0:Lcom/apportable/activity/VerdeActivity;

    #getter for: Lcom/apportable/activity/VerdeActivity;->mRequestedOrientation:I
    invoke-static {v1}, Lcom/apportable/activity/VerdeActivity;->access$400(Lcom/apportable/activity/VerdeActivity;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/apportable/activity/VerdeActivity;->setRequestedOrientation(I)V

    .line 636
    return-void

    .line 617
    :pswitch_0
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity$6;->this$0:Lcom/apportable/activity/VerdeActivity;

    #setter for: Lcom/apportable/activity/VerdeActivity;->mRequestedOrientation:I
    invoke-static {v0, v3}, Lcom/apportable/activity/VerdeActivity;->access$402(Lcom/apportable/activity/VerdeActivity;I)I

    goto :goto_0

    .line 620
    :pswitch_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-le v0, v1, :cond_0

    .line 621
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity$6;->this$0:Lcom/apportable/activity/VerdeActivity;

    const/16 v1, 0x9

    #setter for: Lcom/apportable/activity/VerdeActivity;->mRequestedOrientation:I
    invoke-static {v0, v1}, Lcom/apportable/activity/VerdeActivity;->access$402(Lcom/apportable/activity/VerdeActivity;I)I

    goto :goto_0

    .line 623
    :cond_0
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity$6;->this$0:Lcom/apportable/activity/VerdeActivity;

    #setter for: Lcom/apportable/activity/VerdeActivity;->mRequestedOrientation:I
    invoke-static {v0, v3}, Lcom/apportable/activity/VerdeActivity;->access$402(Lcom/apportable/activity/VerdeActivity;I)I

    goto :goto_0

    .line 626
    :pswitch_2
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity$6;->this$0:Lcom/apportable/activity/VerdeActivity;

    #setter for: Lcom/apportable/activity/VerdeActivity;->mRequestedOrientation:I
    invoke-static {v0, v2}, Lcom/apportable/activity/VerdeActivity;->access$402(Lcom/apportable/activity/VerdeActivity;I)I

    goto :goto_0

    .line 629
    :pswitch_3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-le v0, v1, :cond_1

    .line 630
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity$6;->this$0:Lcom/apportable/activity/VerdeActivity;

    #setter for: Lcom/apportable/activity/VerdeActivity;->mRequestedOrientation:I
    invoke-static {v0, v1}, Lcom/apportable/activity/VerdeActivity;->access$402(Lcom/apportable/activity/VerdeActivity;I)I

    goto :goto_0

    .line 632
    :cond_1
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity$6;->this$0:Lcom/apportable/activity/VerdeActivity;

    #setter for: Lcom/apportable/activity/VerdeActivity;->mRequestedOrientation:I
    invoke-static {v0, v2}, Lcom/apportable/activity/VerdeActivity;->access$402(Lcom/apportable/activity/VerdeActivity;I)I

    goto :goto_0

    .line 615
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

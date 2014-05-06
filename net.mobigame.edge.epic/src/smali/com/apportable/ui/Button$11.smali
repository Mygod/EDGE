.class Lcom/apportable/ui/Button$11;
.super Ljava/lang/Object;
.source "Button.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Button;->setTextAlignment(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Button;

.field final synthetic val$alignment:I


# direct methods
.method constructor <init>(Lcom/apportable/ui/Button;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 333
    iput-object p1, p0, Lcom/apportable/ui/Button$11;->this$0:Lcom/apportable/ui/Button;

    iput p2, p0, Lcom/apportable/ui/Button$11;->val$alignment:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 336
    iget v0, p0, Lcom/apportable/ui/Button$11;->val$alignment:I

    packed-switch v0, :pswitch_data_0

    .line 347
    :goto_0
    return-void

    .line 338
    :pswitch_0
    iget-object v0, p0, Lcom/apportable/ui/Button$11;->this$0:Lcom/apportable/ui/Button;

    #getter for: Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;
    invoke-static {v0}, Lcom/apportable/ui/Button;->access$000(Lcom/apportable/ui/Button;)Landroid/widget/Button;

    move-result-object v0

    const/16 v1, 0x13

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setGravity(I)V

    goto :goto_0

    .line 341
    :pswitch_1
    iget-object v0, p0, Lcom/apportable/ui/Button$11;->this$0:Lcom/apportable/ui/Button;

    #getter for: Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;
    invoke-static {v0}, Lcom/apportable/ui/Button;->access$000(Lcom/apportable/ui/Button;)Landroid/widget/Button;

    move-result-object v0

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setGravity(I)V

    goto :goto_0

    .line 344
    :pswitch_2
    iget-object v0, p0, Lcom/apportable/ui/Button$11;->this$0:Lcom/apportable/ui/Button;

    #getter for: Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;
    invoke-static {v0}, Lcom/apportable/ui/Button;->access$000(Lcom/apportable/ui/Button;)Landroid/widget/Button;

    move-result-object v0

    const/16 v1, 0x15

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setGravity(I)V

    goto :goto_0

    .line 336
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

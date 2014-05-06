.class Lcom/apportable/ui/Label$6;
.super Ljava/lang/Object;
.source "Label.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Label;->setTextAlignment(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Label;

.field final synthetic val$alignment:I


# direct methods
.method constructor <init>(Lcom/apportable/ui/Label;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 274
    iput-object p1, p0, Lcom/apportable/ui/Label$6;->this$0:Lcom/apportable/ui/Label;

    iput p2, p0, Lcom/apportable/ui/Label$6;->val$alignment:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 277
    iget v0, p0, Lcom/apportable/ui/Label$6;->val$alignment:I

    packed-switch v0, :pswitch_data_0

    .line 288
    :goto_0
    return-void

    .line 279
    :pswitch_0
    iget-object v0, p0, Lcom/apportable/ui/Label$6;->this$0:Lcom/apportable/ui/Label;

    #getter for: Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;
    invoke-static {v0}, Lcom/apportable/ui/Label;->access$000(Lcom/apportable/ui/Label;)Lcom/apportable/ui/Label$LabelView;

    move-result-object v0

    const/16 v1, 0x13

    invoke-virtual {v0, v1}, Lcom/apportable/ui/Label$LabelView;->setGravity(I)V

    goto :goto_0

    .line 282
    :pswitch_1
    iget-object v0, p0, Lcom/apportable/ui/Label$6;->this$0:Lcom/apportable/ui/Label;

    #getter for: Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;
    invoke-static {v0}, Lcom/apportable/ui/Label;->access$000(Lcom/apportable/ui/Label;)Lcom/apportable/ui/Label$LabelView;

    move-result-object v0

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Lcom/apportable/ui/Label$LabelView;->setGravity(I)V

    goto :goto_0

    .line 285
    :pswitch_2
    iget-object v0, p0, Lcom/apportable/ui/Label$6;->this$0:Lcom/apportable/ui/Label;

    #getter for: Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;
    invoke-static {v0}, Lcom/apportable/ui/Label;->access$000(Lcom/apportable/ui/Label;)Lcom/apportable/ui/Label$LabelView;

    move-result-object v0

    const/16 v1, 0x15

    invoke-virtual {v0, v1}, Lcom/apportable/ui/Label$LabelView;->setGravity(I)V

    goto :goto_0

    .line 277
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

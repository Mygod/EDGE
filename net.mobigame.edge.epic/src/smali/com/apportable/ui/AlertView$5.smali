.class Lcom/apportable/ui/AlertView$5;
.super Ljava/lang/Object;
.source "AlertView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/AlertView;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/AlertView;

.field final synthetic val$which:I


# direct methods
.method constructor <init>(Lcom/apportable/ui/AlertView;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 172
    iput-object p1, p0, Lcom/apportable/ui/AlertView$5;->this$0:Lcom/apportable/ui/AlertView;

    iput p2, p0, Lcom/apportable/ui/AlertView$5;->val$which:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v2, 0x1

    .line 175
    const/4 v0, -0x1

    .line 176
    .local v0, buttonIndex:I
    iget-object v3, p0, Lcom/apportable/ui/AlertView$5;->this$0:Lcom/apportable/ui/AlertView;

    #getter for: Lcom/apportable/ui/AlertView;->mCancelButton:I
    invoke-static {v3}, Lcom/apportable/ui/AlertView;->access$500(Lcom/apportable/ui/AlertView;)I

    move-result v1

    .line 177
    .local v1, cancelButtonIndex:I
    iget-object v3, p0, Lcom/apportable/ui/AlertView$5;->this$0:Lcom/apportable/ui/AlertView;

    #getter for: Lcom/apportable/ui/AlertView;->mCancelTitle:Ljava/lang/String;
    invoke-static {v3}, Lcom/apportable/ui/AlertView;->access$400(Lcom/apportable/ui/AlertView;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/apportable/ui/AlertView$5;->this$0:Lcom/apportable/ui/AlertView;

    #getter for: Lcom/apportable/ui/AlertView;->mCancelButton:I
    invoke-static {v3}, Lcom/apportable/ui/AlertView;->access$500(Lcom/apportable/ui/AlertView;)I

    move-result v3

    if-gez v3, :cond_0

    .line 178
    const/4 v1, 0x0

    .line 179
    :cond_0
    iget v3, p0, Lcom/apportable/ui/AlertView$5;->val$which:I

    packed-switch v3, :pswitch_data_0

    .line 190
    :goto_0
    iget-object v2, p0, Lcom/apportable/ui/AlertView$5;->this$0:Lcom/apportable/ui/AlertView;

    iget-object v3, p0, Lcom/apportable/ui/AlertView$5;->this$0:Lcom/apportable/ui/AlertView;

    iget v3, v3, Lcom/apportable/ui/AlertView;->mObject:I

    #calls: Lcom/apportable/ui/AlertView;->nativeOnClick(II)V
    invoke-static {v2, v3, v0}, Lcom/apportable/ui/AlertView;->access$600(Lcom/apportable/ui/AlertView;II)V

    .line 191
    return-void

    .line 181
    :pswitch_0
    move v0, v1

    .line 182
    goto :goto_0

    .line 184
    :pswitch_1
    if-nez v1, :cond_1

    move v0, v2

    .line 185
    :goto_1
    goto :goto_0

    .line 184
    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    .line 187
    :pswitch_2
    if-eqz v1, :cond_2

    iget-object v3, p0, Lcom/apportable/ui/AlertView$5;->this$0:Lcom/apportable/ui/AlertView;

    #getter for: Lcom/apportable/ui/AlertView;->mCancelButton:I
    invoke-static {v3}, Lcom/apportable/ui/AlertView;->access$500(Lcom/apportable/ui/AlertView;)I

    move-result v3

    if-ne v3, v2, :cond_3

    :cond_2
    const/4 v0, 0x2

    :goto_2
    goto :goto_0

    :cond_3
    move v0, v2

    goto :goto_2

    .line 179
    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.class Lcom/apportable/ui/Button$6;
.super Ljava/lang/Object;
.source "Button.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Button;->setIconDrawable(Landroid/graphics/drawable/Drawable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Button;

.field final synthetic val$drawable:Landroid/graphics/drawable/Drawable;


# direct methods
.method constructor <init>(Lcom/apportable/ui/Button;Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 204
    iput-object p1, p0, Lcom/apportable/ui/Button$6;->this$0:Lcom/apportable/ui/Button;

    iput-object p2, p0, Lcom/apportable/ui/Button$6;->val$drawable:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 207
    iget-object v0, p0, Lcom/apportable/ui/Button$6;->this$0:Lcom/apportable/ui/Button;

    #getter for: Lcom/apportable/ui/Button;->mContentMode:I
    invoke-static {v0}, Lcom/apportable/ui/Button;->access$100(Lcom/apportable/ui/Button;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 221
    iget-object v0, p0, Lcom/apportable/ui/Button$6;->this$0:Lcom/apportable/ui/Button;

    #getter for: Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;
    invoke-static {v0}, Lcom/apportable/ui/Button;->access$000(Lcom/apportable/ui/Button;)Landroid/widget/Button;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/Button$6;->val$drawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 223
    :goto_0
    return-void

    .line 209
    :pswitch_0
    iget-object v0, p0, Lcom/apportable/ui/Button$6;->this$0:Lcom/apportable/ui/Button;

    #getter for: Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;
    invoke-static {v0}, Lcom/apportable/ui/Button;->access$000(Lcom/apportable/ui/Button;)Landroid/widget/Button;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/Button$6;->val$drawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v2, v2, v1, v2}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 212
    :pswitch_1
    iget-object v0, p0, Lcom/apportable/ui/Button$6;->this$0:Lcom/apportable/ui/Button;

    #getter for: Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;
    invoke-static {v0}, Lcom/apportable/ui/Button;->access$000(Lcom/apportable/ui/Button;)Landroid/widget/Button;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/Button$6;->val$drawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v2, v2, v2, v1}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 215
    :pswitch_2
    iget-object v0, p0, Lcom/apportable/ui/Button$6;->this$0:Lcom/apportable/ui/Button;

    #getter for: Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;
    invoke-static {v0}, Lcom/apportable/ui/Button;->access$000(Lcom/apportable/ui/Button;)Landroid/widget/Button;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/Button$6;->val$drawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v2, v1, v2, v2}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 218
    :pswitch_3
    iget-object v0, p0, Lcom/apportable/ui/Button$6;->this$0:Lcom/apportable/ui/Button;

    #getter for: Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;
    invoke-static {v0}, Lcom/apportable/ui/Button;->access$000(Lcom/apportable/ui/Button;)Landroid/widget/Button;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/Button$6;->val$drawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1, v2, v2, v2}, Landroid/widget/Button;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 207
    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_2
        :pswitch_1
        :pswitch_3
        :pswitch_0
    .end packed-switch
.end method

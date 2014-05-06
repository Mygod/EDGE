.class Lcom/apportable/gl/VerdeSurfaceView$1;
.super Landroid/os/Handler;
.source "VerdeSurfaceView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/gl/VerdeSurfaceView;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/gl/VerdeSurfaceView;


# direct methods
.method constructor <init>(Lcom/apportable/gl/VerdeSurfaceView;)V
    .locals 0
    .parameter

    .prologue
    .line 232
    iput-object p1, p0, Lcom/apportable/gl/VerdeSurfaceView$1;->this$0:Lcom/apportable/gl/VerdeSurfaceView;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .parameter "msg"

    .prologue
    const/4 v4, 0x0

    .line 234
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    .line 258
    :cond_0
    :goto_0
    return-void

    .line 236
    :pswitch_0
    iget-object v2, p0, Lcom/apportable/gl/VerdeSurfaceView$1;->this$0:Lcom/apportable/gl/VerdeSurfaceView;

    #getter for: Lcom/apportable/gl/VerdeSurfaceView;->mTextField:Landroid/widget/TextView;
    invoke-static {v2}, Lcom/apportable/gl/VerdeSurfaceView;->access$000(Lcom/apportable/gl/VerdeSurfaceView;)Landroid/widget/TextView;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/apportable/gl/VerdeSurfaceView$1;->this$0:Lcom/apportable/gl/VerdeSurfaceView;

    #getter for: Lcom/apportable/gl/VerdeSurfaceView;->mTextField:Landroid/widget/TextView;
    invoke-static {v2}, Lcom/apportable/gl/VerdeSurfaceView;->access$000(Lcom/apportable/gl/VerdeSurfaceView;)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/TextView;->requestFocus()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 237
    iget-object v2, p0, Lcom/apportable/gl/VerdeSurfaceView$1;->this$0:Lcom/apportable/gl/VerdeSurfaceView;

    #getter for: Lcom/apportable/gl/VerdeSurfaceView;->mTextField:Landroid/widget/TextView;
    invoke-static {v2}, Lcom/apportable/gl/VerdeSurfaceView;->access$000(Lcom/apportable/gl/VerdeSurfaceView;)Landroid/widget/TextView;

    move-result-object v2

    invoke-static {}, Lcom/apportable/gl/VerdeSurfaceView;->access$100()Lcom/apportable/gl/TextInputWraper;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 238
    iget-object v2, p0, Lcom/apportable/gl/VerdeSurfaceView$1;->this$0:Lcom/apportable/gl/VerdeSurfaceView;

    #getter for: Lcom/apportable/gl/VerdeSurfaceView;->mTextField:Landroid/widget/TextView;
    invoke-static {v2}, Lcom/apportable/gl/VerdeSurfaceView;->access$000(Lcom/apportable/gl/VerdeSurfaceView;)Landroid/widget/TextView;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 239
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    .line 240
    .local v1, text:Ljava/lang/String;
    iget-object v2, p0, Lcom/apportable/gl/VerdeSurfaceView$1;->this$0:Lcom/apportable/gl/VerdeSurfaceView;

    #getter for: Lcom/apportable/gl/VerdeSurfaceView;->mTextField:Landroid/widget/TextView;
    invoke-static {v2}, Lcom/apportable/gl/VerdeSurfaceView;->access$000(Lcom/apportable/gl/VerdeSurfaceView;)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    .line 241
    invoke-static {}, Lcom/apportable/gl/VerdeSurfaceView;->access$100()Lcom/apportable/gl/TextInputWraper;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/apportable/gl/TextInputWraper;->setOriginText(Ljava/lang/String;)V

    .line 242
    iget-object v2, p0, Lcom/apportable/gl/VerdeSurfaceView$1;->this$0:Lcom/apportable/gl/VerdeSurfaceView;

    #getter for: Lcom/apportable/gl/VerdeSurfaceView;->mTextField:Landroid/widget/TextView;
    invoke-static {v2}, Lcom/apportable/gl/VerdeSurfaceView;->access$000(Lcom/apportable/gl/VerdeSurfaceView;)Landroid/widget/TextView;

    move-result-object v2

    invoke-static {}, Lcom/apportable/gl/VerdeSurfaceView;->access$100()Lcom/apportable/gl/TextInputWraper;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 243
    invoke-static {}, Lcom/apportable/gl/VerdeSurfaceView;->access$200()Lcom/apportable/gl/VerdeSurfaceView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/apportable/gl/VerdeSurfaceView;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "input_method"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 244
    .local v0, imm:Landroid/view/inputmethod/InputMethodManager;
    iget-object v2, p0, Lcom/apportable/gl/VerdeSurfaceView$1;->this$0:Lcom/apportable/gl/VerdeSurfaceView;

    #getter for: Lcom/apportable/gl/VerdeSurfaceView;->mTextField:Landroid/widget/TextView;
    invoke-static {v2}, Lcom/apportable/gl/VerdeSurfaceView;->access$000(Lcom/apportable/gl/VerdeSurfaceView;)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v0, v2, v4}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 245
    const-string v2, "GLSurfaceView"

    const-string v3, "showSoftInput"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 250
    .end local v0           #imm:Landroid/view/inputmethod/InputMethodManager;
    .end local v1           #text:Ljava/lang/String;
    :pswitch_1
    iget-object v2, p0, Lcom/apportable/gl/VerdeSurfaceView$1;->this$0:Lcom/apportable/gl/VerdeSurfaceView;

    #getter for: Lcom/apportable/gl/VerdeSurfaceView;->mTextField:Landroid/widget/TextView;
    invoke-static {v2}, Lcom/apportable/gl/VerdeSurfaceView;->access$000(Lcom/apportable/gl/VerdeSurfaceView;)Landroid/widget/TextView;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 251
    iget-object v2, p0, Lcom/apportable/gl/VerdeSurfaceView$1;->this$0:Lcom/apportable/gl/VerdeSurfaceView;

    #getter for: Lcom/apportable/gl/VerdeSurfaceView;->mTextField:Landroid/widget/TextView;
    invoke-static {v2}, Lcom/apportable/gl/VerdeSurfaceView;->access$000(Lcom/apportable/gl/VerdeSurfaceView;)Landroid/widget/TextView;

    move-result-object v2

    invoke-static {}, Lcom/apportable/gl/VerdeSurfaceView;->access$100()Lcom/apportable/gl/TextInputWraper;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 252
    invoke-static {}, Lcom/apportable/gl/VerdeSurfaceView;->access$200()Lcom/apportable/gl/VerdeSurfaceView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/apportable/gl/VerdeSurfaceView;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "input_method"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 253
    .restart local v0       #imm:Landroid/view/inputmethod/InputMethodManager;
    iget-object v2, p0, Lcom/apportable/gl/VerdeSurfaceView$1;->this$0:Lcom/apportable/gl/VerdeSurfaceView;

    #getter for: Lcom/apportable/gl/VerdeSurfaceView;->mTextField:Landroid/widget/TextView;
    invoke-static {v2}, Lcom/apportable/gl/VerdeSurfaceView;->access$000(Lcom/apportable/gl/VerdeSurfaceView;)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/TextView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    invoke-virtual {v0, v2, v4}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 254
    const-string v2, "GLSurfaceView"

    const-string v3, "HideSoftInput"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 234
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

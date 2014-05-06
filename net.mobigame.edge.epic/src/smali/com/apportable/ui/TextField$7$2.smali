.class Lcom/apportable/ui/TextField$7$2;
.super Ljava/lang/Object;
.source "TextField.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/TextField$7;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/apportable/ui/TextField$7;

.field final synthetic val$input:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/apportable/ui/TextField$7;Landroid/widget/EditText;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 331
    iput-object p1, p0, Lcom/apportable/ui/TextField$7$2;->this$1:Lcom/apportable/ui/TextField$7;

    iput-object p2, p0, Lcom/apportable/ui/TextField$7$2;->val$input:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .parameter "dialog"
    .parameter "whichButton"

    .prologue
    .line 333
    iget-object v2, p0, Lcom/apportable/ui/TextField$7$2;->val$input:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 334
    .local v1, value:Ljava/lang/String;
    iget-object v2, p0, Lcom/apportable/ui/TextField$7$2;->this$1:Lcom/apportable/ui/TextField$7;

    iget-object v2, v2, Lcom/apportable/ui/TextField$7;->this$0:Lcom/apportable/ui/TextField;

    #getter for: Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;
    invoke-static {v2}, Lcom/apportable/ui/TextField;->access$100(Lcom/apportable/ui/TextField;)Lcom/apportable/ui/TextField$BackEditText;

    move-result-object v2

    invoke-virtual {v2}, Lcom/apportable/ui/TextField$BackEditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->clear()V

    .line 335
    iget-object v2, p0, Lcom/apportable/ui/TextField$7$2;->this$1:Lcom/apportable/ui/TextField$7;

    iget-object v2, v2, Lcom/apportable/ui/TextField$7;->this$0:Lcom/apportable/ui/TextField;

    #getter for: Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;
    invoke-static {v2}, Lcom/apportable/ui/TextField;->access$100(Lcom/apportable/ui/TextField;)Lcom/apportable/ui/TextField$BackEditText;

    move-result-object v2

    invoke-virtual {v2}, Lcom/apportable/ui/TextField$BackEditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2, v1}, Landroid/text/Editable;->append(Ljava/lang/CharSequence;)Landroid/text/Editable;

    .line 336
    iget-object v2, p0, Lcom/apportable/ui/TextField$7$2;->this$1:Lcom/apportable/ui/TextField$7;

    iget-object v2, v2, Lcom/apportable/ui/TextField$7;->this$0:Lcom/apportable/ui/TextField;

    #getter for: Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;
    invoke-static {v2}, Lcom/apportable/ui/TextField;->access$100(Lcom/apportable/ui/TextField;)Lcom/apportable/ui/TextField$BackEditText;

    move-result-object v2

    invoke-virtual {v2}, Lcom/apportable/ui/TextField$BackEditText;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "input_method"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 337
    .local v0, imm:Landroid/view/inputmethod/InputMethodManager;
    iget-object v2, p0, Lcom/apportable/ui/TextField$7$2;->val$input:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 338
    iget-object v2, p0, Lcom/apportable/ui/TextField$7$2;->this$1:Lcom/apportable/ui/TextField$7;

    iget-object v2, v2, Lcom/apportable/ui/TextField$7;->this$0:Lcom/apportable/ui/TextField;

    #calls: Lcom/apportable/ui/TextField;->finish()V
    invoke-static {v2}, Lcom/apportable/ui/TextField;->access$000(Lcom/apportable/ui/TextField;)V

    .line 339
    return-void
.end method

.class Lcom/apportable/ui/TextField$7$3;
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
    .line 342
    iput-object p1, p0, Lcom/apportable/ui/TextField$7$3;->this$1:Lcom/apportable/ui/TextField$7;

    iput-object p2, p0, Lcom/apportable/ui/TextField$7$3;->val$input:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "whichButton"

    .prologue
    .line 345
    iget-object v1, p0, Lcom/apportable/ui/TextField$7$3;->this$1:Lcom/apportable/ui/TextField$7;

    iget-object v1, v1, Lcom/apportable/ui/TextField$7;->this$0:Lcom/apportable/ui/TextField;

    #getter for: Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;
    invoke-static {v1}, Lcom/apportable/ui/TextField;->access$100(Lcom/apportable/ui/TextField;)Lcom/apportable/ui/TextField$BackEditText;

    move-result-object v1

    invoke-virtual {v1}, Lcom/apportable/ui/TextField$BackEditText;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 346
    .local v0, imm:Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/apportable/ui/TextField$7$3;->val$input:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 347
    iget-object v1, p0, Lcom/apportable/ui/TextField$7$3;->this$1:Lcom/apportable/ui/TextField$7;

    iget-object v1, v1, Lcom/apportable/ui/TextField$7;->this$0:Lcom/apportable/ui/TextField;

    #calls: Lcom/apportable/ui/TextField;->finish()V
    invoke-static {v1}, Lcom/apportable/ui/TextField;->access$000(Lcom/apportable/ui/TextField;)V

    .line 348
    return-void
.end method

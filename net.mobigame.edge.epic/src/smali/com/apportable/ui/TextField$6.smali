.class Lcom/apportable/ui/TextField$6;
.super Ljava/lang/Object;
.source "TextField.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/TextField;->hideKeyboard()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/TextField;


# direct methods
.method constructor <init>(Lcom/apportable/ui/TextField;)V
    .locals 0
    .parameter

    .prologue
    .line 280
    iput-object p1, p0, Lcom/apportable/ui/TextField$6;->this$0:Lcom/apportable/ui/TextField;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 283
    iget-object v1, p0, Lcom/apportable/ui/TextField$6;->this$0:Lcom/apportable/ui/TextField;

    #getter for: Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;
    invoke-static {v1}, Lcom/apportable/ui/TextField;->access$100(Lcom/apportable/ui/TextField;)Lcom/apportable/ui/TextField$BackEditText;

    move-result-object v1

    invoke-virtual {v1}, Lcom/apportable/ui/TextField$BackEditText;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 284
    .local v0, imm:Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/apportable/ui/TextField$6;->this$0:Lcom/apportable/ui/TextField;

    #getter for: Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;
    invoke-static {v1}, Lcom/apportable/ui/TextField;->access$100(Lcom/apportable/ui/TextField;)Lcom/apportable/ui/TextField$BackEditText;

    move-result-object v1

    invoke-virtual {v1}, Lcom/apportable/ui/TextField$BackEditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 285
    iget-object v1, p0, Lcom/apportable/ui/TextField$6;->this$0:Lcom/apportable/ui/TextField;

    #getter for: Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;
    invoke-static {v1}, Lcom/apportable/ui/TextField;->access$100(Lcom/apportable/ui/TextField;)Lcom/apportable/ui/TextField$BackEditText;

    move-result-object v1

    invoke-virtual {v1}, Lcom/apportable/ui/TextField$BackEditText;->clearFocus()V

    .line 286
    return-void
.end method

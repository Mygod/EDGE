.class Lcom/apportable/ui/TextField$7;
.super Ljava/lang/Object;
.source "TextField.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/TextField;->showKeyboardWithEditDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/TextField;

.field final synthetic val$det:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/apportable/ui/TextField;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 293
    iput-object p1, p0, Lcom/apportable/ui/TextField$7;->this$0:Lcom/apportable/ui/TextField;

    iput-object p2, p0, Lcom/apportable/ui/TextField$7;->val$det:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 297
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/apportable/ui/TextField$7;->this$0:Lcom/apportable/ui/TextField;

    invoke-virtual {v2}, Lcom/apportable/ui/TextField;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 303
    .local v0, alert:Landroid/app/AlertDialog$Builder;
    new-instance v1, Landroid/widget/EditText;

    iget-object v2, p0, Lcom/apportable/ui/TextField$7;->this$0:Lcom/apportable/ui/TextField;

    invoke-virtual {v2}, Lcom/apportable/ui/TextField;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 305
    .local v1, input:Landroid/widget/EditText;
    iget-object v2, p0, Lcom/apportable/ui/TextField$7;->this$0:Lcom/apportable/ui/TextField;

    #getter for: Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;
    invoke-static {v2}, Lcom/apportable/ui/TextField;->access$100(Lcom/apportable/ui/TextField;)Lcom/apportable/ui/TextField$BackEditText;

    move-result-object v2

    invoke-virtual {v2}, Lcom/apportable/ui/TextField$BackEditText;->getHint()Ljava/lang/CharSequence;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/apportable/ui/TextField$7;->this$0:Lcom/apportable/ui/TextField;

    #getter for: Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;
    invoke-static {v2}, Lcom/apportable/ui/TextField;->access$100(Lcom/apportable/ui/TextField;)Lcom/apportable/ui/TextField$BackEditText;

    move-result-object v2

    invoke-virtual {v2}, Lcom/apportable/ui/TextField$BackEditText;->getHint()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 306
    iget-object v2, p0, Lcom/apportable/ui/TextField$7;->this$0:Lcom/apportable/ui/TextField;

    #getter for: Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;
    invoke-static {v2}, Lcom/apportable/ui/TextField;->access$100(Lcom/apportable/ui/TextField;)Lcom/apportable/ui/TextField$BackEditText;

    move-result-object v2

    invoke-virtual {v2}, Lcom/apportable/ui/TextField$BackEditText;->getHint()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 309
    :cond_0
    iget-object v2, p0, Lcom/apportable/ui/TextField$7;->val$det:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/apportable/ui/TextField$7;->val$det:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1

    .line 310
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->clear()V

    .line 311
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    iget-object v3, p0, Lcom/apportable/ui/TextField$7;->val$det:Ljava/lang/String;

    invoke-interface {v2, v3}, Landroid/text/Editable;->append(Ljava/lang/CharSequence;)Landroid/text/Editable;

    .line 314
    :cond_1
    iget-object v2, p0, Lcom/apportable/ui/TextField$7;->this$0:Lcom/apportable/ui/TextField;

    #getter for: Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;
    invoke-static {v2}, Lcom/apportable/ui/TextField;->access$100(Lcom/apportable/ui/TextField;)Lcom/apportable/ui/TextField$BackEditText;

    move-result-object v2

    invoke-virtual {v2}, Lcom/apportable/ui/TextField$BackEditText;->getFilters()[Landroid/text/InputFilter;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 315
    iget-object v2, p0, Lcom/apportable/ui/TextField$7;->this$0:Lcom/apportable/ui/TextField;

    #getter for: Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;
    invoke-static {v2}, Lcom/apportable/ui/TextField;->access$100(Lcom/apportable/ui/TextField;)Lcom/apportable/ui/TextField$BackEditText;

    move-result-object v2

    invoke-virtual {v2}, Lcom/apportable/ui/TextField$BackEditText;->getFilters()[Landroid/text/InputFilter;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 318
    :cond_2
    new-instance v2, Lcom/apportable/ui/TextField$7$1;

    invoke-direct {v2, p0}, Lcom/apportable/ui/TextField$7$1;-><init>(Lcom/apportable/ui/TextField$7;)V

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 329
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 331
    const-string v2, "Ok"

    new-instance v3, Lcom/apportable/ui/TextField$7$2;

    invoke-direct {v3, p0, v1}, Lcom/apportable/ui/TextField$7$2;-><init>(Lcom/apportable/ui/TextField$7;Landroid/widget/EditText;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 342
    const-string v2, "Cancel"

    new-instance v3, Lcom/apportable/ui/TextField$7$3;

    invoke-direct {v3, p0, v1}, Lcom/apportable/ui/TextField$7$3;-><init>(Lcom/apportable/ui/TextField$7;Landroid/widget/EditText;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 351
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 352
    return-void
.end method

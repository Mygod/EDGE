.class Lcom/apportable/ui/TextField$4;
.super Ljava/lang/Object;
.source "TextField.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/TextField;->setText(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/TextField;

.field final synthetic val$text:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/apportable/ui/TextField;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 217
    iput-object p1, p0, Lcom/apportable/ui/TextField$4;->this$0:Lcom/apportable/ui/TextField;

    iput-object p2, p0, Lcom/apportable/ui/TextField$4;->val$text:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 220
    iget-object v1, p0, Lcom/apportable/ui/TextField$4;->val$text:Ljava/lang/String;

    if-nez v1, :cond_0

    const-string v0, ""

    .line 221
    .local v0, t:Ljava/lang/String;
    :goto_0
    iget-object v1, p0, Lcom/apportable/ui/TextField$4;->this$0:Lcom/apportable/ui/TextField;

    #getter for: Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;
    invoke-static {v1}, Lcom/apportable/ui/TextField;->access$100(Lcom/apportable/ui/TextField;)Lcom/apportable/ui/TextField$BackEditText;

    move-result-object v1

    iget-object v2, p0, Lcom/apportable/ui/TextField$4;->this$0:Lcom/apportable/ui/TextField;

    invoke-virtual {v1, v2}, Lcom/apportable/ui/TextField$BackEditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 222
    iget-object v1, p0, Lcom/apportable/ui/TextField$4;->this$0:Lcom/apportable/ui/TextField;

    #getter for: Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;
    invoke-static {v1}, Lcom/apportable/ui/TextField;->access$100(Lcom/apportable/ui/TextField;)Lcom/apportable/ui/TextField$BackEditText;

    move-result-object v1

    invoke-virtual {v1}, Lcom/apportable/ui/TextField$BackEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->clear()V

    .line 223
    iget-object v1, p0, Lcom/apportable/ui/TextField$4;->this$0:Lcom/apportable/ui/TextField;

    #getter for: Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;
    invoke-static {v1}, Lcom/apportable/ui/TextField;->access$100(Lcom/apportable/ui/TextField;)Lcom/apportable/ui/TextField$BackEditText;

    move-result-object v1

    invoke-virtual {v1}, Lcom/apportable/ui/TextField$BackEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/text/Editable;->append(Ljava/lang/CharSequence;)Landroid/text/Editable;

    .line 224
    iget-object v1, p0, Lcom/apportable/ui/TextField$4;->this$0:Lcom/apportable/ui/TextField;

    #getter for: Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;
    invoke-static {v1}, Lcom/apportable/ui/TextField;->access$100(Lcom/apportable/ui/TextField;)Lcom/apportable/ui/TextField$BackEditText;

    move-result-object v1

    iget-object v2, p0, Lcom/apportable/ui/TextField$4;->this$0:Lcom/apportable/ui/TextField;

    invoke-virtual {v1, v2}, Lcom/apportable/ui/TextField$BackEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 225
    return-void

    .line 220
    .end local v0           #t:Ljava/lang/String;
    :cond_0
    iget-object v0, p0, Lcom/apportable/ui/TextField$4;->val$text:Ljava/lang/String;

    goto :goto_0
.end method

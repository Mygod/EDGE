.class Lcom/apportable/ui/TextField$7$1;
.super Ljava/lang/Object;
.source "TextField.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


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


# direct methods
.method constructor <init>(Lcom/apportable/ui/TextField$7;)V
    .locals 0
    .parameter

    .prologue
    .line 318
    iput-object p1, p0, Lcom/apportable/ui/TextField$7$1;->this$1:Lcom/apportable/ui/TextField$7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .locals 3
    .parameter "v"
    .parameter "hasFocus"

    .prologue
    .line 320
    if-eqz p2, :cond_0

    .line 322
    iget-object v1, p0, Lcom/apportable/ui/TextField$7$1;->this$1:Lcom/apportable/ui/TextField$7;

    iget-object v1, v1, Lcom/apportable/ui/TextField$7;->this$0:Lcom/apportable/ui/TextField;

    invoke-virtual {v1}, Lcom/apportable/ui/TextField;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 323
    .local v0, imm:Landroid/view/inputmethod/InputMethodManager;
    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->toggleSoftInput(II)V

    .line 326
    .end local v0           #imm:Landroid/view/inputmethod/InputMethodManager;
    :cond_0
    return-void
.end method

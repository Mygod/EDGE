.class Lcom/apportable/ui/TextView$3;
.super Ljava/lang/Object;
.source "TextView.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/TextView;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/TextView;


# direct methods
.method constructor <init>(Lcom/apportable/ui/TextView;)V
    .locals 0
    .parameter

    .prologue
    .line 93
    iput-object p1, p0, Lcom/apportable/ui/TextView$3;->this$0:Lcom/apportable/ui/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 3
    .parameter "s"

    .prologue
    .line 97
    iget-object v0, p0, Lcom/apportable/ui/TextView$3;->this$0:Lcom/apportable/ui/TextView;

    iget-object v1, p0, Lcom/apportable/ui/TextView$3;->this$0:Lcom/apportable/ui/TextView;

    #getter for: Lcom/apportable/ui/TextView;->mTextView:Lcom/apportable/ui/TextView$EditText;
    invoke-static {v1}, Lcom/apportable/ui/TextView;->access$200(Lcom/apportable/ui/TextView;)Lcom/apportable/ui/TextView$EditText;

    move-result-object v1

    invoke-virtual {v1}, Lcom/apportable/ui/TextView$EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    #setter for: Lcom/apportable/ui/TextView;->mText:Ljava/lang/String;
    invoke-static {v0, v1}, Lcom/apportable/ui/TextView;->access$102(Lcom/apportable/ui/TextView;Ljava/lang/String;)Ljava/lang/String;

    .line 98
    iget-object v0, p0, Lcom/apportable/ui/TextView$3;->this$0:Lcom/apportable/ui/TextView;

    new-instance v1, Lcom/apportable/ui/TextView$3$1;

    invoke-direct {v1, p0}, Lcom/apportable/ui/TextView$3$1;-><init>(Lcom/apportable/ui/TextView$3;)V

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/apportable/ui/TextView;->runOnGlThread(Ljava/lang/Runnable;Z)V

    .line 105
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 7
    .parameter "s"
    .parameter "start"
    .parameter "count"
    .parameter "after"

    .prologue
    .line 109
    iget-object v6, p0, Lcom/apportable/ui/TextView$3;->this$0:Lcom/apportable/ui/TextView;

    new-instance v0, Lcom/apportable/ui/TextView$3$2;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/apportable/ui/TextView$3$2;-><init>(Lcom/apportable/ui/TextView$3;Ljava/lang/CharSequence;III)V

    const/4 v1, 0x0

    invoke-virtual {v6, v0, v1}, Lcom/apportable/ui/TextView;->runOnGlThread(Ljava/lang/Runnable;Z)V

    .line 115
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 3
    .parameter "s"
    .parameter "start"
    .parameter "before"
    .parameter "count"

    .prologue
    .line 119
    iget-object v0, p0, Lcom/apportable/ui/TextView$3;->this$0:Lcom/apportable/ui/TextView;

    new-instance v1, Lcom/apportable/ui/TextView$3$3;

    invoke-direct {v1, p0, p1, p2, p4}, Lcom/apportable/ui/TextView$3$3;-><init>(Lcom/apportable/ui/TextView$3;Ljava/lang/CharSequence;II)V

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/apportable/ui/TextView;->runOnGlThread(Ljava/lang/Runnable;Z)V

    .line 125
    return-void
.end method

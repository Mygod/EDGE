.class Lcom/apportable/ui/TextView$8;
.super Ljava/lang/Object;
.source "TextView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/TextView;->setEditable(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/TextView;

.field final synthetic val$editable:Z


# direct methods
.method constructor <init>(Lcom/apportable/ui/TextView;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 203
    iput-object p1, p0, Lcom/apportable/ui/TextView$8;->this$0:Lcom/apportable/ui/TextView;

    iput-boolean p2, p0, Lcom/apportable/ui/TextView$8;->val$editable:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 206
    iget-object v0, p0, Lcom/apportable/ui/TextView$8;->this$0:Lcom/apportable/ui/TextView;

    #getter for: Lcom/apportable/ui/TextView;->mTextView:Lcom/apportable/ui/TextView$EditText;
    invoke-static {v0}, Lcom/apportable/ui/TextView;->access$200(Lcom/apportable/ui/TextView;)Lcom/apportable/ui/TextView$EditText;

    move-result-object v1

    iget-boolean v0, p0, Lcom/apportable/ui/TextView$8;->val$editable:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/apportable/ui/TextView$8;->this$0:Lcom/apportable/ui/TextView;

    #getter for: Lcom/apportable/ui/TextView;->mTextView:Lcom/apportable/ui/TextView$EditText;
    invoke-static {v0}, Lcom/apportable/ui/TextView;->access$200(Lcom/apportable/ui/TextView;)Lcom/apportable/ui/TextView$EditText;

    move-result-object v0

    invoke-virtual {v0}, Lcom/apportable/ui/TextView$EditText;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/method/KeyListener;

    :goto_0
    invoke-virtual {v1, v0}, Lcom/apportable/ui/TextView$EditText;->setKeyListener(Landroid/text/method/KeyListener;)V

    .line 207
    return-void

    .line 206
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

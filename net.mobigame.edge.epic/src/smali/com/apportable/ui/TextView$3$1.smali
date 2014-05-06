.class Lcom/apportable/ui/TextView$3$1;
.super Ljava/lang/Object;
.source "TextView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/TextView$3;->afterTextChanged(Landroid/text/Editable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/apportable/ui/TextView$3;


# direct methods
.method constructor <init>(Lcom/apportable/ui/TextView$3;)V
    .locals 0
    .parameter

    .prologue
    .line 98
    iput-object p1, p0, Lcom/apportable/ui/TextView$3$1;->this$1:Lcom/apportable/ui/TextView$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 101
    iget-object v0, p0, Lcom/apportable/ui/TextView$3$1;->this$1:Lcom/apportable/ui/TextView$3;

    iget-object v0, v0, Lcom/apportable/ui/TextView$3;->this$0:Lcom/apportable/ui/TextView;

    iget-object v1, p0, Lcom/apportable/ui/TextView$3$1;->this$1:Lcom/apportable/ui/TextView$3;

    iget-object v1, v1, Lcom/apportable/ui/TextView$3;->this$0:Lcom/apportable/ui/TextView;

    iget v1, v1, Lcom/apportable/ui/TextView;->mObject:I

    iget-object v2, p0, Lcom/apportable/ui/TextView$3$1;->this$1:Lcom/apportable/ui/TextView$3;

    iget-object v2, v2, Lcom/apportable/ui/TextView$3;->this$0:Lcom/apportable/ui/TextView;

    #getter for: Lcom/apportable/ui/TextView;->mText:Ljava/lang/String;
    invoke-static {v2}, Lcom/apportable/ui/TextView;->access$100(Lcom/apportable/ui/TextView;)Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/apportable/ui/TextView;->textDidChange(ILjava/lang/String;)V
    invoke-static {v0, v1, v2}, Lcom/apportable/ui/TextView;->access$300(Lcom/apportable/ui/TextView;ILjava/lang/String;)V

    .line 102
    return-void
.end method

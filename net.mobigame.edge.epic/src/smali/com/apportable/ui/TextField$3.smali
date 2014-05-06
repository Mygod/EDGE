.class Lcom/apportable/ui/TextField$3;
.super Ljava/lang/Object;
.source "TextField.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/TextField;->finish()V
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
    .line 131
    iput-object p1, p0, Lcom/apportable/ui/TextField$3;->this$0:Lcom/apportable/ui/TextField;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/apportable/ui/TextField$3;->this$0:Lcom/apportable/ui/TextField;

    #getter for: Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;
    invoke-static {v0}, Lcom/apportable/ui/TextField;->access$100(Lcom/apportable/ui/TextField;)Lcom/apportable/ui/TextField$BackEditText;

    move-result-object v0

    invoke-virtual {v0}, Lcom/apportable/ui/TextField$BackEditText;->getTextField()Lcom/apportable/ui/TextField;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/TextField$3;->this$0:Lcom/apportable/ui/TextField;

    iget v1, v1, Lcom/apportable/ui/TextField;->mObject:I

    #calls: Lcom/apportable/ui/TextField;->nativeTextFieldShouldEndEditing(I)V
    invoke-static {v0, v1}, Lcom/apportable/ui/TextField;->access$200(Lcom/apportable/ui/TextField;I)V

    .line 135
    iget-object v0, p0, Lcom/apportable/ui/TextField$3;->this$0:Lcom/apportable/ui/TextField;

    #getter for: Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;
    invoke-static {v0}, Lcom/apportable/ui/TextField;->access$100(Lcom/apportable/ui/TextField;)Lcom/apportable/ui/TextField$BackEditText;

    move-result-object v0

    invoke-virtual {v0}, Lcom/apportable/ui/TextField$BackEditText;->getTextField()Lcom/apportable/ui/TextField;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/TextField$3;->this$0:Lcom/apportable/ui/TextField;

    iget v1, v1, Lcom/apportable/ui/TextField;->mObject:I

    #calls: Lcom/apportable/ui/TextField;->nativeTextFieldDidEndEditing(I)V
    invoke-static {v0, v1}, Lcom/apportable/ui/TextField;->access$300(Lcom/apportable/ui/TextField;I)V

    .line 136
    iget-object v0, p0, Lcom/apportable/ui/TextField$3;->this$0:Lcom/apportable/ui/TextField;

    #getter for: Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;
    invoke-static {v0}, Lcom/apportable/ui/TextField;->access$100(Lcom/apportable/ui/TextField;)Lcom/apportable/ui/TextField$BackEditText;

    move-result-object v0

    invoke-virtual {v0}, Lcom/apportable/ui/TextField$BackEditText;->clearFocus()V

    .line 137
    return-void
.end method

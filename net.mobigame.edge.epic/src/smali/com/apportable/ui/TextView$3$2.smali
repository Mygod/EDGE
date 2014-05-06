.class Lcom/apportable/ui/TextView$3$2;
.super Ljava/lang/Object;
.source "TextView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/TextView$3;->beforeTextChanged(Ljava/lang/CharSequence;III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/apportable/ui/TextView$3;

.field final synthetic val$after:I

.field final synthetic val$count:I

.field final synthetic val$s:Ljava/lang/CharSequence;

.field final synthetic val$start:I


# direct methods
.method constructor <init>(Lcom/apportable/ui/TextView$3;Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 109
    iput-object p1, p0, Lcom/apportable/ui/TextView$3$2;->this$1:Lcom/apportable/ui/TextView$3;

    iput-object p2, p0, Lcom/apportable/ui/TextView$3$2;->val$s:Ljava/lang/CharSequence;

    iput p3, p0, Lcom/apportable/ui/TextView$3$2;->val$start:I

    iput p4, p0, Lcom/apportable/ui/TextView$3$2;->val$count:I

    iput p5, p0, Lcom/apportable/ui/TextView$3$2;->val$after:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 112
    iget-object v0, p0, Lcom/apportable/ui/TextView$3$2;->this$1:Lcom/apportable/ui/TextView$3;

    iget-object v0, v0, Lcom/apportable/ui/TextView$3;->this$0:Lcom/apportable/ui/TextView;

    iget-object v1, p0, Lcom/apportable/ui/TextView$3$2;->this$1:Lcom/apportable/ui/TextView$3;

    iget-object v1, v1, Lcom/apportable/ui/TextView$3;->this$0:Lcom/apportable/ui/TextView;

    iget v1, v1, Lcom/apportable/ui/TextView;->mObject:I

    iget-object v2, p0, Lcom/apportable/ui/TextView$3$2;->val$s:Ljava/lang/CharSequence;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lcom/apportable/ui/TextView$3$2;->val$start:I

    iget v4, p0, Lcom/apportable/ui/TextView$3$2;->val$count:I

    iget v5, p0, Lcom/apportable/ui/TextView$3$2;->val$after:I

    #calls: Lcom/apportable/ui/TextView;->textWillChange(ILjava/lang/String;III)V
    invoke-static/range {v0 .. v5}, Lcom/apportable/ui/TextView;->access$400(Lcom/apportable/ui/TextView;ILjava/lang/String;III)V

    .line 113
    return-void
.end method

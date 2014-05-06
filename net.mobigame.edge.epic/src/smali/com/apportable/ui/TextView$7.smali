.class Lcom/apportable/ui/TextView$7;
.super Ljava/lang/Object;
.source "TextView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/TextView;->setTextColor(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/TextView;

.field final synthetic val$color:I


# direct methods
.method constructor <init>(Lcom/apportable/ui/TextView;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 189
    iput-object p1, p0, Lcom/apportable/ui/TextView$7;->this$0:Lcom/apportable/ui/TextView;

    iput p2, p0, Lcom/apportable/ui/TextView$7;->val$color:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 192
    iget-object v0, p0, Lcom/apportable/ui/TextView$7;->this$0:Lcom/apportable/ui/TextView;

    #getter for: Lcom/apportable/ui/TextView;->mTextView:Lcom/apportable/ui/TextView$EditText;
    invoke-static {v0}, Lcom/apportable/ui/TextView;->access$200(Lcom/apportable/ui/TextView;)Lcom/apportable/ui/TextView$EditText;

    move-result-object v0

    iget v1, p0, Lcom/apportable/ui/TextView$7;->val$color:I

    invoke-virtual {v0, v1}, Lcom/apportable/ui/TextView$EditText;->setTextColor(I)V

    .line 193
    return-void
.end method

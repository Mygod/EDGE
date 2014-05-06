.class Lcom/apportable/ui/TextView$EditText;
.super Landroid/widget/EditText;
.source "TextView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/apportable/ui/TextView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EditText"
.end annotation


# instance fields
.field private mOwner:Lcom/apportable/ui/TextView;

.field final synthetic this$0:Lcom/apportable/ui/TextView;


# direct methods
.method public constructor <init>(Lcom/apportable/ui/TextView;Landroid/content/Context;Lcom/apportable/ui/TextView;)V
    .locals 0
    .parameter
    .parameter "context"
    .parameter "owner"

    .prologue
    .line 28
    iput-object p1, p0, Lcom/apportable/ui/TextView$EditText;->this$0:Lcom/apportable/ui/TextView;

    .line 29
    invoke-direct {p0, p2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 30
    iput-object p3, p0, Lcom/apportable/ui/TextView$EditText;->mOwner:Lcom/apportable/ui/TextView;

    .line 31
    return-void
.end method


# virtual methods
.method protected onSelectionChanged(II)V
    .locals 2
    .parameter "selStart"
    .parameter "selEnd"

    .prologue
    .line 35
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onSelectionChanged(II)V

    .line 36
    iget-object v0, p0, Lcom/apportable/ui/TextView$EditText;->mOwner:Lcom/apportable/ui/TextView;

    if-eqz v0, :cond_0

    .line 37
    iget-object v0, p0, Lcom/apportable/ui/TextView$EditText;->mOwner:Lcom/apportable/ui/TextView;

    iget-object v1, p0, Lcom/apportable/ui/TextView$EditText;->mOwner:Lcom/apportable/ui/TextView;

    iget v1, v1, Lcom/apportable/ui/TextView;->mObject:I

    #calls: Lcom/apportable/ui/TextView;->selectionChange(III)V
    invoke-static {v0, v1, p1, p2}, Lcom/apportable/ui/TextView;->access$000(Lcom/apportable/ui/TextView;III)V

    .line 38
    :cond_0
    return-void
.end method

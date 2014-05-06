.class Lcom/apportable/ui/Label$3;
.super Ljava/lang/Object;
.source "Label.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Label;->setText(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Label;

.field final synthetic val$text:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/apportable/ui/Label;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 219
    iput-object p1, p0, Lcom/apportable/ui/Label$3;->this$0:Lcom/apportable/ui/Label;

    iput-object p2, p0, Lcom/apportable/ui/Label$3;->val$text:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 222
    iget-object v0, p0, Lcom/apportable/ui/Label$3;->this$0:Lcom/apportable/ui/Label;

    #getter for: Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;
    invoke-static {v0}, Lcom/apportable/ui/Label;->access$000(Lcom/apportable/ui/Label;)Lcom/apportable/ui/Label$LabelView;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/Label$3;->val$text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/apportable/ui/Label$LabelView;->setText(Ljava/lang/CharSequence;)V

    .line 223
    return-void
.end method

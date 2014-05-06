.class Lcom/apportable/ui/Label$7;
.super Ljava/lang/Object;
.source "Label.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Label;->adjustsFontSizeToFitWidth(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Label;

.field final synthetic val$adjust:Z


# direct methods
.method constructor <init>(Lcom/apportable/ui/Label;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 325
    iput-object p1, p0, Lcom/apportable/ui/Label$7;->this$0:Lcom/apportable/ui/Label;

    iput-boolean p2, p0, Lcom/apportable/ui/Label$7;->val$adjust:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 328
    iget-object v0, p0, Lcom/apportable/ui/Label$7;->this$0:Lcom/apportable/ui/Label;

    #getter for: Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;
    invoke-static {v0}, Lcom/apportable/ui/Label;->access$000(Lcom/apportable/ui/Label;)Lcom/apportable/ui/Label$LabelView;

    move-result-object v0

    iget-boolean v1, p0, Lcom/apportable/ui/Label$7;->val$adjust:Z

    invoke-virtual {v0, v1}, Lcom/apportable/ui/Label$LabelView;->adjustsFontSizeToFitWidth(Z)V

    .line 329
    return-void
.end method

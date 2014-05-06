.class Lcom/apportable/ui/Button$4;
.super Ljava/lang/Object;
.source "Button.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Button;->setText(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Button;

.field final synthetic val$text:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/apportable/ui/Button;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 154
    iput-object p1, p0, Lcom/apportable/ui/Button$4;->this$0:Lcom/apportable/ui/Button;

    iput-object p2, p0, Lcom/apportable/ui/Button$4;->val$text:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 157
    iget-object v0, p0, Lcom/apportable/ui/Button$4;->this$0:Lcom/apportable/ui/Button;

    #getter for: Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;
    invoke-static {v0}, Lcom/apportable/ui/Button;->access$000(Lcom/apportable/ui/Button;)Landroid/widget/Button;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/Button$4;->val$text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 158
    return-void
.end method

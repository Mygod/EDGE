.class Lcom/apportable/ui/Switch$3;
.super Ljava/lang/Object;
.source "Switch.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Switch;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Switch;


# direct methods
.method constructor <init>(Lcom/apportable/ui/Switch;)V
    .locals 0
    .parameter

    .prologue
    .line 69
    iput-object p1, p0, Lcom/apportable/ui/Switch$3;->this$0:Lcom/apportable/ui/Switch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 71
    iget-object v1, p0, Lcom/apportable/ui/Switch$3;->this$0:Lcom/apportable/ui/Switch;

    #getter for: Lcom/apportable/ui/Switch;->mSwitch:Landroid/widget/CheckBox;
    invoke-static {v1}, Lcom/apportable/ui/Switch;->access$000(Lcom/apportable/ui/Switch;)Landroid/widget/CheckBox;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    .line 72
    .local v0, isChecked:Z
    iget-object v1, p0, Lcom/apportable/ui/Switch$3;->this$0:Lcom/apportable/ui/Switch;

    #getter for: Lcom/apportable/ui/Switch;->mChecked:Z
    invoke-static {v1}, Lcom/apportable/ui/Switch;->access$100(Lcom/apportable/ui/Switch;)Z

    move-result v1

    if-eq v1, v0, :cond_0

    .line 73
    iget-object v1, p0, Lcom/apportable/ui/Switch$3;->this$0:Lcom/apportable/ui/Switch;

    #setter for: Lcom/apportable/ui/Switch;->mChecked:Z
    invoke-static {v1, v0}, Lcom/apportable/ui/Switch;->access$102(Lcom/apportable/ui/Switch;Z)Z

    .line 74
    iget-object v1, p0, Lcom/apportable/ui/Switch$3;->this$0:Lcom/apportable/ui/Switch;

    const/16 v2, 0x1000

    invoke-virtual {v1, v2}, Lcom/apportable/ui/Switch;->sendEvent(I)V

    .line 76
    :cond_0
    return-void
.end method

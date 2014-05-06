.class Lcom/apportable/ui/Switch$4;
.super Ljava/lang/Object;
.source "Switch.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Switch;->setChecked(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Switch;

.field final synthetic val$yesOrNo:Z


# direct methods
.method constructor <init>(Lcom/apportable/ui/Switch;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 100
    iput-object p1, p0, Lcom/apportable/ui/Switch$4;->this$0:Lcom/apportable/ui/Switch;

    iput-boolean p2, p0, Lcom/apportable/ui/Switch$4;->val$yesOrNo:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 103
    iget-object v0, p0, Lcom/apportable/ui/Switch$4;->this$0:Lcom/apportable/ui/Switch;

    #getter for: Lcom/apportable/ui/Switch;->mSwitch:Landroid/widget/CheckBox;
    invoke-static {v0}, Lcom/apportable/ui/Switch;->access$000(Lcom/apportable/ui/Switch;)Landroid/widget/CheckBox;

    move-result-object v0

    iget-boolean v1, p0, Lcom/apportable/ui/Switch$4;->val$yesOrNo:Z

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 104
    return-void
.end method

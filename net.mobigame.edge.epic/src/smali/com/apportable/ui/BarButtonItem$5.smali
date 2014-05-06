.class Lcom/apportable/ui/BarButtonItem$5;
.super Ljava/lang/Object;
.source "BarButtonItem.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/BarButtonItem;->setWidth(F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/BarButtonItem;


# direct methods
.method constructor <init>(Lcom/apportable/ui/BarButtonItem;)V
    .locals 0
    .parameter

    .prologue
    .line 250
    iput-object p1, p0, Lcom/apportable/ui/BarButtonItem$5;->this$0:Lcom/apportable/ui/BarButtonItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 253
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem$5;->this$0:Lcom/apportable/ui/BarButtonItem;

    iget-object v0, v0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/apportable/ui/BarButtonItem$5;->this$0:Lcom/apportable/ui/BarButtonItem;

    invoke-virtual {v1}, Lcom/apportable/ui/BarButtonItem;->getLayout()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 254
    return-void
.end method

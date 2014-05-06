.class Lcom/apportable/ui/BarButtonItem$3;
.super Ljava/lang/Object;
.source "BarButtonItem.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/BarButtonItem;->setTitle(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/BarButtonItem;

.field final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/apportable/ui/BarButtonItem;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 227
    iput-object p1, p0, Lcom/apportable/ui/BarButtonItem$3;->this$0:Lcom/apportable/ui/BarButtonItem;

    iput-object p2, p0, Lcom/apportable/ui/BarButtonItem$3;->val$title:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 230
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem$3;->this$0:Lcom/apportable/ui/BarButtonItem;

    iget-object v0, v0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/apportable/ui/BarButtonItem$3;->val$title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 231
    return-void
.end method

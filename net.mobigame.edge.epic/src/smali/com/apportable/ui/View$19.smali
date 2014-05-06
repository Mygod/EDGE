.class Lcom/apportable/ui/View$19;
.super Ljava/lang/Object;
.source "View.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/View;->setClipsToBounds(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/View;

.field final synthetic val$clips:Z


# direct methods
.method constructor <init>(Lcom/apportable/ui/View;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 634
    iput-object p1, p0, Lcom/apportable/ui/View$19;->this$0:Lcom/apportable/ui/View;

    iput-boolean p2, p0, Lcom/apportable/ui/View$19;->val$clips:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 637
    iget-object v0, p0, Lcom/apportable/ui/View$19;->this$0:Lcom/apportable/ui/View;

    iget-boolean v1, p0, Lcom/apportable/ui/View$19;->val$clips:Z

    invoke-virtual {v0, v1}, Lcom/apportable/ui/View;->_setClipChildren(Z)V

    .line 638
    return-void
.end method

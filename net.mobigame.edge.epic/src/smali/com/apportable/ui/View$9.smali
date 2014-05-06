.class Lcom/apportable/ui/View$9;
.super Ljava/lang/Object;
.source "View.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/View;->bringSubviewToFront(Lcom/apportable/ui/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/View;

.field final synthetic val$view:Lcom/apportable/ui/View;


# direct methods
.method constructor <init>(Lcom/apportable/ui/View;Lcom/apportable/ui/View;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 369
    iput-object p1, p0, Lcom/apportable/ui/View$9;->this$0:Lcom/apportable/ui/View;

    iput-object p2, p0, Lcom/apportable/ui/View$9;->val$view:Lcom/apportable/ui/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 372
    iget-object v0, p0, Lcom/apportable/ui/View$9;->this$0:Lcom/apportable/ui/View;

    iget-object v1, p0, Lcom/apportable/ui/View$9;->val$view:Lcom/apportable/ui/View;

    #calls: Lcom/apportable/ui/View;->_bringSubviewToFront(Lcom/apportable/ui/View;)V
    invoke-static {v0, v1}, Lcom/apportable/ui/View;->access$400(Lcom/apportable/ui/View;Lcom/apportable/ui/View;)V

    .line 373
    return-void
.end method

.class Lcom/apportable/ui/View$11;
.super Ljava/lang/Object;
.source "View.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/View;->removeFromSuperview()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/View;


# direct methods
.method constructor <init>(Lcom/apportable/ui/View;)V
    .locals 0
    .parameter

    .prologue
    .line 407
    iput-object p1, p0, Lcom/apportable/ui/View$11;->this$0:Lcom/apportable/ui/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 410
    iget-object v0, p0, Lcom/apportable/ui/View$11;->this$0:Lcom/apportable/ui/View;

    #calls: Lcom/apportable/ui/View;->_removeFromSuperview()V
    invoke-static {v0}, Lcom/apportable/ui/View;->access$600(Lcom/apportable/ui/View;)V

    .line 411
    return-void
.end method

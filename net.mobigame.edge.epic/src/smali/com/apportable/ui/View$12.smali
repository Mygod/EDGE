.class Lcom/apportable/ui/View$12;
.super Ljava/lang/Object;
.source "View.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/View;->insertView(Lcom/apportable/ui/View;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/View;

.field final synthetic val$index:I

.field final synthetic val$view:Lcom/apportable/ui/View;


# direct methods
.method constructor <init>(Lcom/apportable/ui/View;Lcom/apportable/ui/View;I)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 424
    iput-object p1, p0, Lcom/apportable/ui/View$12;->this$0:Lcom/apportable/ui/View;

    iput-object p2, p0, Lcom/apportable/ui/View$12;->val$view:Lcom/apportable/ui/View;

    iput p3, p0, Lcom/apportable/ui/View$12;->val$index:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 427
    iget-object v0, p0, Lcom/apportable/ui/View$12;->this$0:Lcom/apportable/ui/View;

    iget-object v1, p0, Lcom/apportable/ui/View$12;->val$view:Lcom/apportable/ui/View;

    iget v2, p0, Lcom/apportable/ui/View$12;->val$index:I

    invoke-virtual {v0, v1, v2}, Lcom/apportable/ui/View;->_insertView(Lcom/apportable/ui/View;I)V

    .line 428
    return-void
.end method

.class Lcom/apportable/ui/View$22;
.super Ljava/lang/Object;
.source "View.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/View;->getTag()Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/View;

.field final synthetic val$tag:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method constructor <init>(Lcom/apportable/ui/View;Ljava/util/concurrent/atomic/AtomicReference;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 974
    iput-object p1, p0, Lcom/apportable/ui/View$22;->this$0:Lcom/apportable/ui/View;

    iput-object p2, p0, Lcom/apportable/ui/View$22;->val$tag:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 977
    iget-object v0, p0, Lcom/apportable/ui/View$22;->val$tag:Ljava/util/concurrent/atomic/AtomicReference;

    iget-object v1, p0, Lcom/apportable/ui/View$22;->this$0:Lcom/apportable/ui/View;

    iget-object v2, p0, Lcom/apportable/ui/View$22;->this$0:Lcom/apportable/ui/View;

    iget v2, v2, Lcom/apportable/ui/View;->mObject:I

    #calls: Lcom/apportable/ui/View;->getDescription(I)Ljava/lang/String;
    invoke-static {v1, v2}, Lcom/apportable/ui/View;->access$1000(Lcom/apportable/ui/View;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 978
    return-void
.end method

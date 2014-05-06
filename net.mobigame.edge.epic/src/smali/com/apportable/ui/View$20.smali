.class Lcom/apportable/ui/View$20;
.super Ljava/lang/Object;
.source "View.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/View;->onAttachedToWindow()V
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
    .line 671
    iput-object p1, p0, Lcom/apportable/ui/View$20;->this$0:Lcom/apportable/ui/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 674
    iget-object v0, p0, Lcom/apportable/ui/View$20;->this$0:Lcom/apportable/ui/View;

    iget-object v1, p0, Lcom/apportable/ui/View$20;->this$0:Lcom/apportable/ui/View;

    iget v1, v1, Lcom/apportable/ui/View;->mObject:I

    #calls: Lcom/apportable/ui/View;->callDrawRect(I)V
    invoke-static {v0, v1}, Lcom/apportable/ui/View;->access$900(Lcom/apportable/ui/View;I)V

    .line 675
    return-void
.end method

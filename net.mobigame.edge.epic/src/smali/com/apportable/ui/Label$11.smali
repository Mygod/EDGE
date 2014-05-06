.class Lcom/apportable/ui/Label$11;
.super Ljava/lang/Object;
.source "Label.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Label;->setHighlighted(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Label;


# direct methods
.method constructor <init>(Lcom/apportable/ui/Label;)V
    .locals 0
    .parameter

    .prologue
    .line 411
    iput-object p1, p0, Lcom/apportable/ui/Label$11;->this$0:Lcom/apportable/ui/Label;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 414
    iget-object v0, p0, Lcom/apportable/ui/Label$11;->this$0:Lcom/apportable/ui/Label;

    #calls: Lcom/apportable/ui/Label;->updateHighlight()V
    invoke-static {v0}, Lcom/apportable/ui/Label;->access$100(Lcom/apportable/ui/Label;)V

    .line 415
    return-void
.end method

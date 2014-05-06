.class Lcom/apportable/ui/Button$7;
.super Ljava/lang/Object;
.source "Button.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Button;->setHighlighted(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Button;

.field final synthetic val$highlighted:Z


# direct methods
.method constructor <init>(Lcom/apportable/ui/Button;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 252
    iput-object p1, p0, Lcom/apportable/ui/Button$7;->this$0:Lcom/apportable/ui/Button;

    iput-boolean p2, p0, Lcom/apportable/ui/Button$7;->val$highlighted:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 255
    iget-object v0, p0, Lcom/apportable/ui/Button$7;->this$0:Lcom/apportable/ui/Button;

    iget-boolean v1, p0, Lcom/apportable/ui/Button$7;->val$highlighted:Z

    invoke-virtual {v0, v1}, Lcom/apportable/ui/Button;->_setHighlighted(Z)V

    .line 256
    return-void
.end method

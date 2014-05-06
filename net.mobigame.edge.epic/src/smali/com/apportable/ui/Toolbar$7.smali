.class Lcom/apportable/ui/Toolbar$7;
.super Ljava/lang/Object;
.source "Toolbar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Toolbar;->setStyle(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Toolbar;

.field final synthetic val$style:I


# direct methods
.method constructor <init>(Lcom/apportable/ui/Toolbar;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 166
    iput-object p1, p0, Lcom/apportable/ui/Toolbar$7;->this$0:Lcom/apportable/ui/Toolbar;

    iput p2, p0, Lcom/apportable/ui/Toolbar$7;->val$style:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 169
    iget-object v0, p0, Lcom/apportable/ui/Toolbar$7;->this$0:Lcom/apportable/ui/Toolbar;

    iget v1, p0, Lcom/apportable/ui/Toolbar$7;->val$style:I

    #calls: Lcom/apportable/ui/Toolbar;->_setStyle(I)V
    invoke-static {v0, v1}, Lcom/apportable/ui/Toolbar;->access$100(Lcom/apportable/ui/Toolbar;I)V

    .line 170
    return-void
.end method

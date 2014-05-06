.class Lcom/apportable/ui/BarButtonItem$4;
.super Ljava/lang/Object;
.source "BarButtonItem.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/BarButtonItem;->setStyle(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/BarButtonItem;

.field final synthetic val$style:I


# direct methods
.method constructor <init>(Lcom/apportable/ui/BarButtonItem;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 237
    iput-object p1, p0, Lcom/apportable/ui/BarButtonItem$4;->this$0:Lcom/apportable/ui/BarButtonItem;

    iput p2, p0, Lcom/apportable/ui/BarButtonItem$4;->val$style:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 240
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem$4;->this$0:Lcom/apportable/ui/BarButtonItem;

    iget v1, p0, Lcom/apportable/ui/BarButtonItem$4;->val$style:I

    #calls: Lcom/apportable/ui/BarButtonItem;->_setStyle(I)V
    invoke-static {v0, v1}, Lcom/apportable/ui/BarButtonItem;->access$000(Lcom/apportable/ui/BarButtonItem;I)V

    .line 241
    return-void
.end method

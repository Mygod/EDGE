.class Lcom/apportable/ui/TableView$4;
.super Ljava/lang/Object;
.source "TableView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/TableView;->scrollToRow(IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/TableView;

.field final synthetic val$row:I


# direct methods
.method constructor <init>(Lcom/apportable/ui/TableView;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 197
    iput-object p1, p0, Lcom/apportable/ui/TableView$4;->this$0:Lcom/apportable/ui/TableView;

    iput p2, p0, Lcom/apportable/ui/TableView$4;->val$row:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 200
    iget-object v0, p0, Lcom/apportable/ui/TableView$4;->this$0:Lcom/apportable/ui/TableView;

    #getter for: Lcom/apportable/ui/TableView;->mListView:Landroid/widget/ListView;
    invoke-static {v0}, Lcom/apportable/ui/TableView;->access$200(Lcom/apportable/ui/TableView;)Landroid/widget/ListView;

    move-result-object v0

    iget v1, p0, Lcom/apportable/ui/TableView$4;->val$row:I

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->smoothScrollToPosition(I)V

    .line 201
    return-void
.end method

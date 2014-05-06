.class Lcom/apportable/ui/TableView$3;
.super Ljava/lang/Object;
.source "TableView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/TableView;->reloadData(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/TableView;


# direct methods
.method constructor <init>(Lcom/apportable/ui/TableView;)V
    .locals 0
    .parameter

    .prologue
    .line 186
    iput-object p1, p0, Lcom/apportable/ui/TableView$3;->this$0:Lcom/apportable/ui/TableView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 189
    iget-object v0, p0, Lcom/apportable/ui/TableView$3;->this$0:Lcom/apportable/ui/TableView;

    #getter for: Lcom/apportable/ui/TableView;->mListView:Landroid/widget/ListView;
    invoke-static {v0}, Lcom/apportable/ui/TableView;->access$200(Lcom/apportable/ui/TableView;)Landroid/widget/ListView;

    move-result-object v0

    new-instance v1, Lcom/apportable/ui/TableView$TableViewAdapter;

    iget-object v2, p0, Lcom/apportable/ui/TableView$3;->this$0:Lcom/apportable/ui/TableView;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/apportable/ui/TableView$TableViewAdapter;-><init>(Lcom/apportable/ui/TableView;Lcom/apportable/ui/TableView$1;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 190
    return-void
.end method

.class Lcom/apportable/ui/TableView$5;
.super Ljava/lang/Object;
.source "TableView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/TableView;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/TableView;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/apportable/ui/TableView;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 230
    iput-object p1, p0, Lcom/apportable/ui/TableView$5;->this$0:Lcom/apportable/ui/TableView;

    iput p2, p0, Lcom/apportable/ui/TableView$5;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 233
    iget-object v0, p0, Lcom/apportable/ui/TableView$5;->this$0:Lcom/apportable/ui/TableView;

    iget-object v1, p0, Lcom/apportable/ui/TableView$5;->this$0:Lcom/apportable/ui/TableView;

    iget v1, v1, Lcom/apportable/ui/TableView;->mObject:I

    iget v2, p0, Lcom/apportable/ui/TableView$5;->val$position:I

    #calls: Lcom/apportable/ui/TableView;->cellClicked(II)V
    invoke-static {v0, v1, v2}, Lcom/apportable/ui/TableView;->access$300(Lcom/apportable/ui/TableView;II)V

    .line 234
    return-void
.end method

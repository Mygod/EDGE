.class Lcom/apportable/ui/TableView$TableViewAdapter$1;
.super Ljava/lang/Object;
.source "TableView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/TableView$TableViewAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/apportable/ui/TableView$TableViewAdapter;

.field final synthetic val$cellRef:Lcom/apportable/ui/TableViewCell;


# direct methods
.method constructor <init>(Lcom/apportable/ui/TableView$TableViewAdapter;Lcom/apportable/ui/TableViewCell;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 84
    iput-object p1, p0, Lcom/apportable/ui/TableView$TableViewAdapter$1;->this$1:Lcom/apportable/ui/TableView$TableViewAdapter;

    iput-object p2, p0, Lcom/apportable/ui/TableView$TableViewAdapter$1;->val$cellRef:Lcom/apportable/ui/TableViewCell;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lcom/apportable/ui/TableView$TableViewAdapter$1;->val$cellRef:Lcom/apportable/ui/TableViewCell;

    invoke-virtual {v0}, Lcom/apportable/ui/TableViewCell;->loadView()V

    .line 88
    return-void
.end method

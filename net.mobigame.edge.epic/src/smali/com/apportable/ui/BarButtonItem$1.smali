.class Lcom/apportable/ui/BarButtonItem$1;
.super Ljava/lang/Object;
.source "BarButtonItem.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/BarButtonItem;-><init>(Landroid/content/Context;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/BarButtonItem;


# direct methods
.method constructor <init>(Lcom/apportable/ui/BarButtonItem;)V
    .locals 0
    .parameter

    .prologue
    .line 77
    iput-object p1, p0, Lcom/apportable/ui/BarButtonItem$1;->this$0:Lcom/apportable/ui/BarButtonItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 80
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem$1;->this$0:Lcom/apportable/ui/BarButtonItem;

    iget-object v1, p0, Lcom/apportable/ui/BarButtonItem$1;->this$0:Lcom/apportable/ui/BarButtonItem;

    iget v1, v1, Lcom/apportable/ui/BarButtonItem;->mObject:I

    invoke-virtual {v0, v1}, Lcom/apportable/ui/BarButtonItem;->click(I)V

    .line 81
    return-void
.end method

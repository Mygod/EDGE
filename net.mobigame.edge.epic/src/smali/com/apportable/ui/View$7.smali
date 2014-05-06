.class Lcom/apportable/ui/View$7;
.super Ljava/lang/Object;
.source "View.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/View;->setTransform(Landroid/graphics/Matrix;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/View;

.field final synthetic val$transform:Landroid/graphics/Matrix;


# direct methods
.method constructor <init>(Lcom/apportable/ui/View;Landroid/graphics/Matrix;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 300
    iput-object p1, p0, Lcom/apportable/ui/View$7;->this$0:Lcom/apportable/ui/View;

    iput-object p2, p0, Lcom/apportable/ui/View$7;->val$transform:Landroid/graphics/Matrix;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 303
    iget-object v0, p0, Lcom/apportable/ui/View$7;->this$0:Lcom/apportable/ui/View;

    iget-object v1, p0, Lcom/apportable/ui/View$7;->val$transform:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Lcom/apportable/ui/View;->_setTransform(Landroid/graphics/Matrix;)V

    .line 304
    return-void
.end method

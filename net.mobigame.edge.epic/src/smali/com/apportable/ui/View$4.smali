.class Lcom/apportable/ui/View$4;
.super Ljava/lang/Object;
.source "View.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/View;->setFrame(Landroid/graphics/RectF;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/View;

.field final synthetic val$frame:Landroid/graphics/RectF;


# direct methods
.method constructor <init>(Lcom/apportable/ui/View;Landroid/graphics/RectF;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 219
    iput-object p1, p0, Lcom/apportable/ui/View$4;->this$0:Lcom/apportable/ui/View;

    iput-object p2, p0, Lcom/apportable/ui/View$4;->val$frame:Landroid/graphics/RectF;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 222
    iget-object v0, p0, Lcom/apportable/ui/View$4;->this$0:Lcom/apportable/ui/View;

    iget-object v1, p0, Lcom/apportable/ui/View$4;->val$frame:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Lcom/apportable/ui/View;->_setFrame(Landroid/graphics/RectF;)V

    .line 223
    return-void
.end method

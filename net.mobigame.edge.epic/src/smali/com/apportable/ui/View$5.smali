.class Lcom/apportable/ui/View$5;
.super Ljava/lang/Object;
.source "View.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/View;->setBounds(Landroid/graphics/RectF;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/View;

.field final synthetic val$bounds:Landroid/graphics/RectF;


# direct methods
.method constructor <init>(Lcom/apportable/ui/View;Landroid/graphics/RectF;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 243
    iput-object p1, p0, Lcom/apportable/ui/View$5;->this$0:Lcom/apportable/ui/View;

    iput-object p2, p0, Lcom/apportable/ui/View$5;->val$bounds:Landroid/graphics/RectF;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 246
    iget-object v0, p0, Lcom/apportable/ui/View$5;->this$0:Lcom/apportable/ui/View;

    iget-object v1, p0, Lcom/apportable/ui/View$5;->val$bounds:Landroid/graphics/RectF;

    #calls: Lcom/apportable/ui/View;->_setBounds(Landroid/graphics/RectF;)V
    invoke-static {v0, v1}, Lcom/apportable/ui/View;->access$100(Lcom/apportable/ui/View;Landroid/graphics/RectF;)V

    .line 247
    return-void
.end method

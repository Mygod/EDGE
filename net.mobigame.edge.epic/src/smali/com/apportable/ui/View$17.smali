.class Lcom/apportable/ui/View$17;
.super Ljava/lang/Object;
.source "View.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/View;->_setAlpha(F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/View;

.field final synthetic val$alpha:F


# direct methods
.method constructor <init>(Lcom/apportable/ui/View;F)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 603
    iput-object p1, p0, Lcom/apportable/ui/View$17;->this$0:Lcom/apportable/ui/View;

    iput p2, p0, Lcom/apportable/ui/View$17;->val$alpha:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 606
    iget-object v0, p0, Lcom/apportable/ui/View$17;->this$0:Lcom/apportable/ui/View;

    iget v1, p0, Lcom/apportable/ui/View$17;->val$alpha:F

    invoke-virtual {v0, v1}, Lcom/apportable/ui/View;->applyAlpha(F)V

    .line 607
    return-void
.end method

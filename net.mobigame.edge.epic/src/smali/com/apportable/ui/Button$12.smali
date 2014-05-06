.class Lcom/apportable/ui/Button$12;
.super Ljava/lang/Object;
.source "Button.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Button;->updateShadow(IFF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Button;

.field final synthetic val$color:I

.field final synthetic val$x:F

.field final synthetic val$y:F


# direct methods
.method constructor <init>(Lcom/apportable/ui/Button;FFI)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 361
    iput-object p1, p0, Lcom/apportable/ui/Button$12;->this$0:Lcom/apportable/ui/Button;

    iput p2, p0, Lcom/apportable/ui/Button$12;->val$x:F

    iput p3, p0, Lcom/apportable/ui/Button$12;->val$y:F

    iput p4, p0, Lcom/apportable/ui/Button$12;->val$color:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 364
    iget-object v0, p0, Lcom/apportable/ui/Button$12;->this$0:Lcom/apportable/ui/Button;

    #getter for: Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;
    invoke-static {v0}, Lcom/apportable/ui/Button;->access$000(Lcom/apportable/ui/Button;)Landroid/widget/Button;

    move-result-object v0

    const/high16 v1, 0x3f80

    iget v2, p0, Lcom/apportable/ui/Button$12;->val$x:F

    iget v3, p0, Lcom/apportable/ui/Button$12;->val$y:F

    iget v4, p0, Lcom/apportable/ui/Button$12;->val$color:I

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/Button;->setShadowLayer(FFFI)V

    .line 365
    return-void
.end method

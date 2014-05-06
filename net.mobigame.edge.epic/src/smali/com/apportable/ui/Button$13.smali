.class Lcom/apportable/ui/Button$13;
.super Ljava/lang/Object;
.source "Button.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Button;->setFont(Landroid/graphics/Typeface;F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Button;

.field final synthetic val$font:Landroid/graphics/Typeface;

.field final synthetic val$size:F


# direct methods
.method constructor <init>(Lcom/apportable/ui/Button;Landroid/graphics/Typeface;F)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 394
    iput-object p1, p0, Lcom/apportable/ui/Button$13;->this$0:Lcom/apportable/ui/Button;

    iput-object p2, p0, Lcom/apportable/ui/Button$13;->val$font:Landroid/graphics/Typeface;

    iput p3, p0, Lcom/apportable/ui/Button$13;->val$size:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 397
    iget-object v0, p0, Lcom/apportable/ui/Button$13;->this$0:Lcom/apportable/ui/Button;

    #getter for: Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;
    invoke-static {v0}, Lcom/apportable/ui/Button;->access$000(Lcom/apportable/ui/Button;)Landroid/widget/Button;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/Button$13;->val$font:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    .line 398
    iget-object v0, p0, Lcom/apportable/ui/Button$13;->this$0:Lcom/apportable/ui/Button;

    #getter for: Lcom/apportable/ui/Button;->mButton:Landroid/widget/Button;
    invoke-static {v0}, Lcom/apportable/ui/Button;->access$000(Lcom/apportable/ui/Button;)Landroid/widget/Button;

    move-result-object v0

    iget v1, p0, Lcom/apportable/ui/Button$13;->val$size:F

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 399
    return-void
.end method

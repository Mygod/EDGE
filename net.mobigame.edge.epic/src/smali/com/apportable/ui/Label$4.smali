.class Lcom/apportable/ui/Label$4;
.super Ljava/lang/Object;
.source "Label.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Label;->setFont(Landroid/graphics/Typeface;F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Label;

.field final synthetic val$font:Landroid/graphics/Typeface;

.field final synthetic val$size:F


# direct methods
.method constructor <init>(Lcom/apportable/ui/Label;Landroid/graphics/Typeface;F)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 236
    iput-object p1, p0, Lcom/apportable/ui/Label$4;->this$0:Lcom/apportable/ui/Label;

    iput-object p2, p0, Lcom/apportable/ui/Label$4;->val$font:Landroid/graphics/Typeface;

    iput p3, p0, Lcom/apportable/ui/Label$4;->val$size:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 239
    iget-object v0, p0, Lcom/apportable/ui/Label$4;->this$0:Lcom/apportable/ui/Label;

    #getter for: Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;
    invoke-static {v0}, Lcom/apportable/ui/Label;->access$000(Lcom/apportable/ui/Label;)Lcom/apportable/ui/Label$LabelView;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/Label$4;->val$font:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Lcom/apportable/ui/Label$LabelView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 240
    iget-object v0, p0, Lcom/apportable/ui/Label$4;->this$0:Lcom/apportable/ui/Label;

    #getter for: Lcom/apportable/ui/Label;->mTextView:Lcom/apportable/ui/Label$LabelView;
    invoke-static {v0}, Lcom/apportable/ui/Label;->access$000(Lcom/apportable/ui/Label;)Lcom/apportable/ui/Label$LabelView;

    move-result-object v0

    const/4 v1, 0x0

    iget v2, p0, Lcom/apportable/ui/Label$4;->val$size:F

    invoke-virtual {v0, v1, v2}, Lcom/apportable/ui/Label$LabelView;->setTextSize(IF)V

    .line 242
    return-void
.end method

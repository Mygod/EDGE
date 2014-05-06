.class Lcom/apportable/ui/TextView$5;
.super Ljava/lang/Object;
.source "TextView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/TextView;->setFont(Landroid/graphics/Typeface;F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/TextView;

.field final synthetic val$font:Landroid/graphics/Typeface;

.field final synthetic val$size:F


# direct methods
.method constructor <init>(Lcom/apportable/ui/TextView;Landroid/graphics/Typeface;F)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 163
    iput-object p1, p0, Lcom/apportable/ui/TextView$5;->this$0:Lcom/apportable/ui/TextView;

    iput-object p2, p0, Lcom/apportable/ui/TextView$5;->val$font:Landroid/graphics/Typeface;

    iput p3, p0, Lcom/apportable/ui/TextView$5;->val$size:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 166
    iget-object v0, p0, Lcom/apportable/ui/TextView$5;->this$0:Lcom/apportable/ui/TextView;

    #getter for: Lcom/apportable/ui/TextView;->mTextView:Lcom/apportable/ui/TextView$EditText;
    invoke-static {v0}, Lcom/apportable/ui/TextView;->access$200(Lcom/apportable/ui/TextView;)Lcom/apportable/ui/TextView$EditText;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/TextView$5;->val$font:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Lcom/apportable/ui/TextView$EditText;->setTypeface(Landroid/graphics/Typeface;)V

    .line 167
    iget-object v0, p0, Lcom/apportable/ui/TextView$5;->this$0:Lcom/apportable/ui/TextView;

    #getter for: Lcom/apportable/ui/TextView;->mTextView:Lcom/apportable/ui/TextView$EditText;
    invoke-static {v0}, Lcom/apportable/ui/TextView;->access$200(Lcom/apportable/ui/TextView;)Lcom/apportable/ui/TextView$EditText;

    move-result-object v0

    iget v1, p0, Lcom/apportable/ui/TextView$5;->val$size:F

    invoke-virtual {v0, v1}, Lcom/apportable/ui/TextView$EditText;->setTextSize(F)V

    .line 168
    return-void
.end method

.class Lcom/apportable/ui/Slider$3;
.super Ljava/lang/Object;
.source "Slider.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Slider;->setValue(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Slider;

.field final synthetic val$value:I


# direct methods
.method constructor <init>(Lcom/apportable/ui/Slider;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 79
    iput-object p1, p0, Lcom/apportable/ui/Slider$3;->this$0:Lcom/apportable/ui/Slider;

    iput p2, p0, Lcom/apportable/ui/Slider$3;->val$value:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 82
    iget-object v0, p0, Lcom/apportable/ui/Slider$3;->this$0:Lcom/apportable/ui/Slider;

    #getter for: Lcom/apportable/ui/Slider;->mProgressImage:Landroid/graphics/drawable/ClipDrawable;
    invoke-static {v0}, Lcom/apportable/ui/Slider;->access$000(Lcom/apportable/ui/Slider;)Landroid/graphics/drawable/ClipDrawable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/apportable/ui/Slider$3;->this$0:Lcom/apportable/ui/Slider;

    #getter for: Lcom/apportable/ui/Slider;->mProgressImage:Landroid/graphics/drawable/ClipDrawable;
    invoke-static {v0}, Lcom/apportable/ui/Slider;->access$000(Lcom/apportable/ui/Slider;)Landroid/graphics/drawable/ClipDrawable;

    move-result-object v0

    iget v1, p0, Lcom/apportable/ui/Slider$3;->val$value:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/ClipDrawable;->setLevel(I)Z

    .line 85
    :cond_0
    iget-object v0, p0, Lcom/apportable/ui/Slider$3;->this$0:Lcom/apportable/ui/Slider;

    #getter for: Lcom/apportable/ui/Slider;->mSlider:Landroid/widget/SeekBar;
    invoke-static {v0}, Lcom/apportable/ui/Slider;->access$100(Lcom/apportable/ui/Slider;)Landroid/widget/SeekBar;

    move-result-object v0

    iget v1, p0, Lcom/apportable/ui/Slider$3;->val$value:I

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 86
    return-void
.end method

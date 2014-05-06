.class Lcom/apportable/ui/ImageView$3;
.super Ljava/lang/Object;
.source "ImageView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/ImageView;->setBitmapDrawable(Landroid/graphics/Bitmap;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/ImageView;

.field final synthetic val$drawable:Landroid/graphics/drawable/BitmapDrawable;


# direct methods
.method constructor <init>(Lcom/apportable/ui/ImageView;Landroid/graphics/drawable/BitmapDrawable;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 107
    iput-object p1, p0, Lcom/apportable/ui/ImageView$3;->this$0:Lcom/apportable/ui/ImageView;

    iput-object p2, p0, Lcom/apportable/ui/ImageView$3;->val$drawable:Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 110
    iget-object v0, p0, Lcom/apportable/ui/ImageView$3;->this$0:Lcom/apportable/ui/ImageView;

    #getter for: Lcom/apportable/ui/ImageView;->mImageView:Landroid/widget/ImageView;
    invoke-static {v0}, Lcom/apportable/ui/ImageView;->access$000(Lcom/apportable/ui/ImageView;)Landroid/widget/ImageView;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/ui/ImageView$3;->val$drawable:Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 111
    return-void
.end method

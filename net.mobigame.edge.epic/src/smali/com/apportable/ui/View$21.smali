.class Lcom/apportable/ui/View$21;
.super Ljava/lang/Object;
.source "View.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/View;->setCustomBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/View;

.field final synthetic val$drawable:Landroid/graphics/drawable/Drawable;


# direct methods
.method constructor <init>(Lcom/apportable/ui/View;Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 695
    iput-object p1, p0, Lcom/apportable/ui/View$21;->this$0:Lcom/apportable/ui/View;

    iput-object p2, p0, Lcom/apportable/ui/View$21;->val$drawable:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 698
    iget-object v0, p0, Lcom/apportable/ui/View$21;->this$0:Lcom/apportable/ui/View;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/apportable/ui/View;->mIsCustomBackgroundDrawableSet:Z

    .line 699
    iget-object v0, p0, Lcom/apportable/ui/View$21;->this$0:Lcom/apportable/ui/View;

    iget-object v1, p0, Lcom/apportable/ui/View$21;->val$drawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Lcom/apportable/ui/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 700
    return-void
.end method

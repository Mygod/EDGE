.class Lcom/apportable/ui/ImageView$6;
.super Ljava/lang/Object;
.source "ImageView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/ImageView;->setContentMode(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/ImageView;


# direct methods
.method constructor <init>(Lcom/apportable/ui/ImageView;)V
    .locals 0
    .parameter

    .prologue
    .line 252
    iput-object p1, p0, Lcom/apportable/ui/ImageView$6;->this$0:Lcom/apportable/ui/ImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 255
    iget-object v0, p0, Lcom/apportable/ui/ImageView$6;->this$0:Lcom/apportable/ui/ImageView;

    iget-object v1, p0, Lcom/apportable/ui/ImageView$6;->this$0:Lcom/apportable/ui/ImageView;

    #getter for: Lcom/apportable/ui/ImageView;->mContentMode:I
    invoke-static {v1}, Lcom/apportable/ui/ImageView;->access$300(Lcom/apportable/ui/ImageView;)I

    move-result v1

    #calls: Lcom/apportable/ui/ImageView;->_setContentMode(I)V
    invoke-static {v0, v1}, Lcom/apportable/ui/ImageView;->access$400(Lcom/apportable/ui/ImageView;I)V

    .line 256
    return-void
.end method

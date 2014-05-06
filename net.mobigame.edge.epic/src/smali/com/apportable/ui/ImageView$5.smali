.class Lcom/apportable/ui/ImageView$5;
.super Ljava/lang/Object;
.source "ImageView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/ImageView;->setBitmapDrawableFromPath(Ljava/lang/String;)V
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
    .line 136
    iput-object p1, p0, Lcom/apportable/ui/ImageView$5;->this$0:Lcom/apportable/ui/ImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 139
    iget-object v0, p0, Lcom/apportable/ui/ImageView$5;->this$0:Lcom/apportable/ui/ImageView;

    iget-object v1, p0, Lcom/apportable/ui/ImageView$5;->this$0:Lcom/apportable/ui/ImageView;

    #getter for: Lcom/apportable/ui/ImageView;->mPathStore:Ljava/lang/String;
    invoke-static {v1}, Lcom/apportable/ui/ImageView;->access$100(Lcom/apportable/ui/ImageView;)Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/apportable/ui/ImageView;->_setBitmapDrawableFromPath(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/apportable/ui/ImageView;->access$200(Lcom/apportable/ui/ImageView;Ljava/lang/String;)V

    .line 140
    return-void
.end method

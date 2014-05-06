.class Lcom/apportable/ui/View$3;
.super Ljava/lang/Object;
.source "View.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/View;->setAsyncDraw(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/View;

.field final synthetic val$async:Z


# direct methods
.method constructor <init>(Lcom/apportable/ui/View;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 168
    iput-object p1, p0, Lcom/apportable/ui/View$3;->this$0:Lcom/apportable/ui/View;

    iput-boolean p2, p0, Lcom/apportable/ui/View$3;->val$async:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 171
    iget-boolean v0, p0, Lcom/apportable/ui/View$3;->val$async:Z

    if-eqz v0, :cond_0

    .line 172
    iget-object v0, p0, Lcom/apportable/ui/View$3;->this$0:Lcom/apportable/ui/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/apportable/ui/View;->setWillNotDraw(Z)V

    .line 173
    iget-object v0, p0, Lcom/apportable/ui/View$3;->this$0:Lcom/apportable/ui/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/apportable/ui/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 178
    :goto_0
    return-void

    .line 175
    :cond_0
    iget-object v0, p0, Lcom/apportable/ui/View$3;->this$0:Lcom/apportable/ui/View;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/apportable/ui/View;->setWillNotDraw(Z)V

    .line 176
    iget-object v0, p0, Lcom/apportable/ui/View$3;->this$0:Lcom/apportable/ui/View;

    iget-object v1, p0, Lcom/apportable/ui/View$3;->this$0:Lcom/apportable/ui/View;

    #getter for: Lcom/apportable/ui/View;->mBackgroundColor:I
    invoke-static {v1}, Lcom/apportable/ui/View;->access$000(Lcom/apportable/ui/View;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/apportable/ui/View;->__setBackgroundColor(I)V

    goto :goto_0
.end method

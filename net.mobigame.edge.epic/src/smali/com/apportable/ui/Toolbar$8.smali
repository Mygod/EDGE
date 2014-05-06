.class Lcom/apportable/ui/Toolbar$8;
.super Ljava/lang/Object;
.source "Toolbar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Toolbar;->setTintColor(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Toolbar;

.field final synthetic val$tint:I


# direct methods
.method constructor <init>(Lcom/apportable/ui/Toolbar;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 182
    iput-object p1, p0, Lcom/apportable/ui/Toolbar$8;->this$0:Lcom/apportable/ui/Toolbar;

    iput p2, p0, Lcom/apportable/ui/Toolbar$8;->val$tint:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 185
    iget-object v0, p0, Lcom/apportable/ui/Toolbar$8;->this$0:Lcom/apportable/ui/Toolbar;

    #getter for: Lcom/apportable/ui/Toolbar;->mToolbar:Landroid/widget/LinearLayout;
    invoke-static {v0}, Lcom/apportable/ui/Toolbar;->access$000(Lcom/apportable/ui/Toolbar;)Landroid/widget/LinearLayout;

    move-result-object v0

    iget v1, p0, Lcom/apportable/ui/Toolbar$8;->val$tint:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 186
    return-void
.end method

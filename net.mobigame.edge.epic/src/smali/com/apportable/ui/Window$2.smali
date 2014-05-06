.class Lcom/apportable/ui/Window$2;
.super Ljava/lang/Object;
.source "Window.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Window;->makeKeyAndOrderFront()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Window;


# direct methods
.method constructor <init>(Lcom/apportable/ui/Window;)V
    .locals 0
    .parameter

    .prologue
    .line 56
    iput-object p1, p0, Lcom/apportable/ui/Window$2;->this$0:Lcom/apportable/ui/Window;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 59
    invoke-static {}, Lcom/apportable/activity/VerdeActivity;->getActivity()Lcom/apportable/activity/VerdeActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/apportable/activity/VerdeActivity;->primaryContainer()Landroid/widget/FrameLayout;

    move-result-object v0

    .line 60
    .local v0, view:Landroid/widget/FrameLayout;
    iget-object v1, p0, Lcom/apportable/ui/Window$2;->this$0:Lcom/apportable/ui/Window;

    invoke-virtual {v1}, Lcom/apportable/ui/Window;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-nez v1, :cond_0

    .line 62
    iget-object v1, p0, Lcom/apportable/ui/Window$2;->this$0:Lcom/apportable/ui/Window;

    iget-object v2, p0, Lcom/apportable/ui/Window$2;->this$0:Lcom/apportable/ui/Window;

    iget-object v3, p0, Lcom/apportable/ui/Window$2;->this$0:Lcom/apportable/ui/Window;

    invoke-virtual {v3}, Lcom/apportable/ui/Window;->getFrame()Landroid/graphics/RectF;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/apportable/ui/Window;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 64
    :cond_0
    iget-object v1, p0, Lcom/apportable/ui/Window$2;->this$0:Lcom/apportable/ui/Window;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->bringChildToFront(Landroid/view/View;)V

    .line 65
    return-void
.end method

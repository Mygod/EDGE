.class Lcom/apportable/ui/Button$3;
.super Ljava/lang/Object;
.source "Button.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Button;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Button;


# direct methods
.method constructor <init>(Lcom/apportable/ui/Button;)V
    .locals 0
    .parameter

    .prologue
    .line 99
    iput-object p1, p0, Lcom/apportable/ui/Button$3;->this$0:Lcom/apportable/ui/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 5
    .parameter "v"
    .parameter "event"

    .prologue
    .line 102
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    .line 103
    .local v1, x:F
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    .line 104
    .local v2, y:F
    iget-object v3, p0, Lcom/apportable/ui/Button$3;->this$0:Lcom/apportable/ui/Button;

    invoke-virtual {v3}, Lcom/apportable/ui/Button;->getBounds()Landroid/graphics/RectF;

    move-result-object v0

    .line 105
    .local v0, bounds:Landroid/graphics/RectF;
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    and-int/lit16 v3, v3, 0xff

    packed-switch v3, :pswitch_data_0

    .line 127
    :goto_0
    :pswitch_0
    const/4 v3, 0x0

    return v3

    .line 109
    :pswitch_1
    iget-object v3, p0, Lcom/apportable/ui/Button$3;->this$0:Lcom/apportable/ui/Button;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/apportable/ui/Button;->sendEvent(I)V

    goto :goto_0

    .line 115
    :pswitch_2
    iget v3, v0, Landroid/graphics/RectF;->left:F

    cmpg-float v3, v3, v1

    if-gtz v3, :cond_0

    iget v3, v0, Landroid/graphics/RectF;->right:F

    cmpg-float v3, v1, v3

    if-gtz v3, :cond_0

    iget v3, v0, Landroid/graphics/RectF;->top:F

    cmpg-float v3, v3, v2

    if-gtz v3, :cond_0

    iget v3, v0, Landroid/graphics/RectF;->bottom:F

    cmpg-float v3, v2, v3

    if-gtz v3, :cond_0

    .line 117
    iget-object v3, p0, Lcom/apportable/ui/Button$3;->this$0:Lcom/apportable/ui/Button;

    const/16 v4, 0x40

    invoke-virtual {v3, v4}, Lcom/apportable/ui/Button;->sendEvent(I)V

    goto :goto_0

    .line 119
    :cond_0
    iget-object v3, p0, Lcom/apportable/ui/Button$3;->this$0:Lcom/apportable/ui/Button;

    const/16 v4, 0x80

    invoke-virtual {v3, v4}, Lcom/apportable/ui/Button;->sendEvent(I)V

    goto :goto_0

    .line 122
    :pswitch_3
    iget-object v3, p0, Lcom/apportable/ui/Button$3;->this$0:Lcom/apportable/ui/Button;

    const/16 v4, 0x100

    invoke-virtual {v3, v4}, Lcom/apportable/ui/Button;->sendEvent(I)V

    goto :goto_0

    .line 105
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

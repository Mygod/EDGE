.class public Lcom/apportable/WebViewTouchEventHandler;
.super Lcom/apportable/ViewTouchEventHandler;
.source "WebViewTouchEventHandler.java"


# direct methods
.method public constructor <init>(J)V
    .locals 0
    .parameter "context"

    .prologue
    .line 9
    invoke-direct {p0, p1, p2}, Lcom/apportable/ViewTouchEventHandler;-><init>(J)V

    .line 10
    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "v"
    .parameter "event"

    .prologue
    .line 14
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 22
    :cond_0
    :goto_0
    const/4 v0, 0x0

    return v0

    .line 17
    :pswitch_0
    invoke-virtual {p1}, Landroid/view/View;->hasFocus()Z

    move-result v0

    if-nez v0, :cond_0

    .line 18
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    goto :goto_0

    .line 14
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

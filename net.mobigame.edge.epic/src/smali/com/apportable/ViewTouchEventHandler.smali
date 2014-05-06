.class public Lcom/apportable/ViewTouchEventHandler;
.super Ljava/lang/Object;
.source "ViewTouchEventHandler.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;
.implements Landroid/view/View$OnClickListener;


# instance fields
.field protected context:J


# direct methods
.method public constructor <init>(J)V
    .locals 0
    .parameter "context"

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-wide p1, p0, Lcom/apportable/ViewTouchEventHandler;->context:J

    .line 16
    return-void
.end method

.method protected static native nativeOnClick(JLandroid/view/View;)V
.end method

.method protected static native nativeOnTouch(JLandroid/view/View;Landroid/view/MotionEvent;)Z
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 26
    iget-wide v0, p0, Lcom/apportable/ViewTouchEventHandler;->context:J

    invoke-static {v0, v1, p1}, Lcom/apportable/ViewTouchEventHandler;->nativeOnClick(JLandroid/view/View;)V

    .line 27
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2
    .parameter "v"
    .parameter "event"

    .prologue
    .line 21
    iget-wide v0, p0, Lcom/apportable/ViewTouchEventHandler;->context:J

    invoke-static {v0, v1, p1, p2}, Lcom/apportable/ViewTouchEventHandler;->nativeOnTouch(JLandroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.class public Lcom/apportable/KeyHandler;
.super Ljava/lang/Object;
.source "KeyHandler.java"

# interfaces
.implements Landroid/text/method/KeyListener;


# instance fields
.field protected mDelegate:J

.field protected mInputType:I


# direct methods
.method public constructor <init>(J)V
    .locals 1
    .parameter "delegate"

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const v0, 0x1c001

    iput v0, p0, Lcom/apportable/KeyHandler;->mInputType:I

    .line 28
    iput-wide p1, p0, Lcom/apportable/KeyHandler;->mDelegate:J

    .line 29
    return-void
.end method

.method protected static native nativeClearMetaKeyState(JLandroid/view/View;Landroid/text/Editable;I)V
.end method

.method protected static native nativeOnKeyDown(JLandroid/view/View;Landroid/text/Editable;ILandroid/view/KeyEvent;)Z
.end method

.method protected static native nativeOnKeyOther(JLandroid/view/View;Landroid/text/Editable;Landroid/view/KeyEvent;)Z
.end method

.method protected static native nativeOnKeyUp(JLandroid/view/View;Landroid/text/Editable;ILandroid/view/KeyEvent;)Z
.end method


# virtual methods
.method public clearMetaKeyState(Landroid/view/View;Landroid/text/Editable;I)V
    .locals 2
    .parameter "view"
    .parameter "content"
    .parameter "states"

    .prologue
    .line 33
    iget-wide v0, p0, Lcom/apportable/KeyHandler;->mDelegate:J

    invoke-static {v0, v1, p1, p2, p3}, Lcom/apportable/KeyHandler;->nativeClearMetaKeyState(JLandroid/view/View;Landroid/text/Editable;I)V

    .line 34
    return-void
.end method

.method public getInputType()I
    .locals 1

    .prologue
    .line 42
    iget v0, p0, Lcom/apportable/KeyHandler;->mInputType:I

    return v0
.end method

.method public onKeyDown(Landroid/view/View;Landroid/text/Editable;ILandroid/view/KeyEvent;)Z
    .locals 6
    .parameter "view"
    .parameter "text"
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 47
    iget-wide v0, p0, Lcom/apportable/KeyHandler;->mDelegate:J

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lcom/apportable/KeyHandler;->nativeOnKeyDown(JLandroid/view/View;Landroid/text/Editable;ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onKeyOther(Landroid/view/View;Landroid/text/Editable;Landroid/view/KeyEvent;)Z
    .locals 2
    .parameter "view"
    .parameter "text"
    .parameter "event"

    .prologue
    .line 52
    iget-wide v0, p0, Lcom/apportable/KeyHandler;->mDelegate:J

    invoke-static {v0, v1, p1, p2, p3}, Lcom/apportable/KeyHandler;->nativeOnKeyOther(JLandroid/view/View;Landroid/text/Editable;Landroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onKeyUp(Landroid/view/View;Landroid/text/Editable;ILandroid/view/KeyEvent;)Z
    .locals 6
    .parameter "view"
    .parameter "text"
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 57
    iget-wide v0, p0, Lcom/apportable/KeyHandler;->mDelegate:J

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lcom/apportable/KeyHandler;->nativeOnKeyUp(JLandroid/view/View;Landroid/text/Editable;ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public setInputType(I)V
    .locals 0
    .parameter "inputType"

    .prologue
    .line 37
    iput p1, p0, Lcom/apportable/KeyHandler;->mInputType:I

    .line 38
    return-void
.end method

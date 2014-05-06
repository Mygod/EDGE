.class public Lcom/apportable/TextChangeHandler;
.super Ljava/lang/Object;
.source "TextChangeHandler.java"

# interfaces
.implements Landroid/text/TextWatcher;


# instance fields
.field private context:J


# direct methods
.method public constructor <init>(J)V
    .locals 0
    .parameter "context"

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-wide p1, p0, Lcom/apportable/TextChangeHandler;->context:J

    .line 17
    return-void
.end method

.method private static native AndroidTextChangeEvent(JLjava/lang/CharSequence;III)V
.end method

.method private static native AndroidTextDidChangeEvent(J)V
.end method

.method private static native AndroidTextWillChangeEvent(JLjava/lang/CharSequence;III)V
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2
    .parameter "s"

    .prologue
    .line 22
    iget-wide v0, p0, Lcom/apportable/TextChangeHandler;->context:J

    invoke-static {v0, v1}, Lcom/apportable/TextChangeHandler;->AndroidTextDidChangeEvent(J)V

    .line 23
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 6
    .parameter "s"
    .parameter "start"
    .parameter "count"
    .parameter "after"

    .prologue
    .line 28
    iget-wide v0, p0, Lcom/apportable/TextChangeHandler;->context:J

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/apportable/TextChangeHandler;->AndroidTextWillChangeEvent(JLjava/lang/CharSequence;III)V

    .line 29
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 6
    .parameter "s"
    .parameter "start"
    .parameter "before"
    .parameter "count"

    .prologue
    .line 33
    iget-wide v0, p0, Lcom/apportable/TextChangeHandler;->context:J

    move-object v2, p1

    move v3, p2

    move v4, p4

    move v5, p3

    invoke-static/range {v0 .. v5}, Lcom/apportable/TextChangeHandler;->AndroidTextChangeEvent(JLjava/lang/CharSequence;III)V

    .line 34
    return-void
.end method

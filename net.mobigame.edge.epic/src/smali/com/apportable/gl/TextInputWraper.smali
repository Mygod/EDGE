.class Lcom/apportable/gl/TextInputWraper;
.super Ljava/lang/Object;
.source "VerdeSurfaceView.java"

# interfaces
.implements Landroid/text/TextWatcher;
.implements Landroid/widget/TextView$OnEditorActionListener;


# static fields
.field private static final debug:Ljava/lang/Boolean;


# instance fields
.field private mMainView:Lcom/apportable/gl/VerdeSurfaceView;

.field private mOriginText:Ljava/lang/String;

.field private mText:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/apportable/gl/TextInputWraper;->debug:Ljava/lang/Boolean;

    return-void
.end method

.method public constructor <init>(Lcom/apportable/gl/VerdeSurfaceView;)V
    .locals 0
    .parameter "view"

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/apportable/gl/TextInputWraper;->mMainView:Lcom/apportable/gl/VerdeSurfaceView;

    .line 45
    return-void
.end method

.method private LogD(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 31
    sget-object v0, Lcom/apportable/gl/TextInputWraper;->debug:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "TextInputFilter"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    :cond_0
    return-void
.end method

.method private isFullScreenEdit()Ljava/lang/Boolean;
    .locals 3

    .prologue
    .line 39
    iget-object v1, p0, Lcom/apportable/gl/TextInputWraper;->mMainView:Lcom/apportable/gl/VerdeSurfaceView;

    invoke-virtual {v1}, Lcom/apportable/gl/VerdeSurfaceView;->getTextField()Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 40
    .local v0, imm:Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {v0}, Landroid/view/inputmethod/InputMethodManager;->isFullscreenMode()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 4
    .parameter "s"

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/apportable/gl/TextInputWraper;->isFullScreenEdit()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 71
    :goto_0
    return-void

    .line 57
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "afterTextChanged: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/apportable/gl/TextInputWraper;->LogD(Ljava/lang/String;)V

    .line 58
    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v2

    iget-object v3, p0, Lcom/apportable/gl/TextInputWraper;->mText:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    sub-int v1, v2, v3

    .line 59
    .local v1, nModified:I
    if-lez v1, :cond_2

    .line 60
    iget-object v2, p0, Lcom/apportable/gl/TextInputWraper;->mText:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v3

    invoke-interface {p1, v2, v3}, Landroid/text/Editable;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 61
    .local v0, insertText:Ljava/lang/String;
    iget-object v2, p0, Lcom/apportable/gl/TextInputWraper;->mMainView:Lcom/apportable/gl/VerdeSurfaceView;

    invoke-virtual {v2, v0}, Lcom/apportable/gl/VerdeSurfaceView;->insertText(Ljava/lang/String;)V

    .line 62
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "insertText("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/apportable/gl/TextInputWraper;->LogD(Ljava/lang/String;)V

    .line 70
    .end local v0           #insertText:Ljava/lang/String;
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/apportable/gl/TextInputWraper;->mText:Ljava/lang/String;

    goto :goto_0

    .line 65
    :cond_2
    :goto_1
    if-gez v1, :cond_1

    .line 66
    iget-object v2, p0, Lcom/apportable/gl/TextInputWraper;->mMainView:Lcom/apportable/gl/VerdeSurfaceView;

    invoke-virtual {v2}, Lcom/apportable/gl/VerdeSurfaceView;->deleteBackward()V

    .line 67
    const-string v2, "deleteBackward"

    invoke-direct {p0, v2}, Lcom/apportable/gl/TextInputWraper;->LogD(Ljava/lang/String;)V

    .line 65
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 2
    .parameter "s"
    .parameter "start"
    .parameter "count"
    .parameter "after"

    .prologue
    .line 76
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "beforeTextChanged("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")start: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",count: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",after: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/apportable/gl/TextInputWraper;->LogD(Ljava/lang/String;)V

    .line 77
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/apportable/gl/TextInputWraper;->mText:Ljava/lang/String;

    .line 78
    return-void
.end method

.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 5
    .parameter "v"
    .parameter "actionId"
    .parameter "event"

    .prologue
    const/16 v4, 0xa

    .line 86
    iget-object v3, p0, Lcom/apportable/gl/TextInputWraper;->mMainView:Lcom/apportable/gl/VerdeSurfaceView;

    invoke-virtual {v3}, Lcom/apportable/gl/VerdeSurfaceView;->getTextField()Landroid/widget/TextView;

    move-result-object v3

    if-ne v3, p1, :cond_3

    invoke-direct {p0}, Lcom/apportable/gl/TextInputWraper;->isFullScreenEdit()Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 88
    iget-object v3, p0, Lcom/apportable/gl/TextInputWraper;->mOriginText:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v0

    .local v0, i:I
    :goto_0
    if-lez v0, :cond_0

    .line 89
    iget-object v3, p0, Lcom/apportable/gl/TextInputWraper;->mMainView:Lcom/apportable/gl/VerdeSurfaceView;

    invoke-virtual {v3}, Lcom/apportable/gl/VerdeSurfaceView;->deleteBackward()V

    .line 90
    const-string v3, "deleteBackward"

    invoke-direct {p0, v3}, Lcom/apportable/gl/TextInputWraper;->LogD(Ljava/lang/String;)V

    .line 88
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 92
    :cond_0
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 97
    .local v2, text:Ljava/lang/String;
    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_1

    .line 98
    const-string v2, "\n"

    .line 101
    :cond_1
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v4, v3, :cond_2

    .line 102
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 105
    :cond_2
    move-object v1, v2

    .line 106
    .local v1, insertText:Ljava/lang/String;
    iget-object v3, p0, Lcom/apportable/gl/TextInputWraper;->mMainView:Lcom/apportable/gl/VerdeSurfaceView;

    invoke-virtual {v3, v1}, Lcom/apportable/gl/VerdeSurfaceView;->insertText(Ljava/lang/String;)V

    .line 107
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "insertText("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/apportable/gl/TextInputWraper;->LogD(Ljava/lang/String;)V

    .line 109
    .end local v0           #i:I
    .end local v1           #insertText:Ljava/lang/String;
    .end local v2           #text:Ljava/lang/String;
    :cond_3
    const/4 v3, 0x0

    return v3
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "s"
    .parameter "start"
    .parameter "before"
    .parameter "count"

    .prologue
    .line 82
    return-void
.end method

.method public setOriginText(Ljava/lang/String;)V
    .locals 0
    .parameter "text"

    .prologue
    .line 48
    iput-object p1, p0, Lcom/apportable/gl/TextInputWraper;->mOriginText:Ljava/lang/String;

    .line 49
    return-void
.end method

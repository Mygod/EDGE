.class Lcom/apportable/ui/TextField;
.super Lcom/apportable/ui/Control;
.source "TextField.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;
.implements Landroid/view/View$OnFocusChangeListener;
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/apportable/ui/TextField$BackEditText;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "TextField"


# instance fields
.field private imeText:Ljava/lang/String;

.field private mTextField:Lcom/apportable/ui/TextField$BackEditText;


# direct methods
.method protected constructor <init>(Landroid/content/Context;I)V
    .locals 3
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 186
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/Control;-><init>(Landroid/content/Context;I)V

    .line 40
    const-string v0, ""

    iput-object v0, p0, Lcom/apportable/ui/TextField;->imeText:Ljava/lang/String;

    .line 187
    new-instance v0, Lcom/apportable/ui/TextField$BackEditText;

    invoke-direct {v0, p0, p1, p0}, Lcom/apportable/ui/TextField$BackEditText;-><init>(Lcom/apportable/ui/TextField;Landroid/content/Context;Lcom/apportable/ui/TextField;)V

    iput-object v0, p0, Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;

    .line 189
    invoke-direct {p0}, Lcom/apportable/ui/TextField;->init()V

    .line 190
    iget-object v0, p0, Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;

    new-instance v1, Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/apportable/ui/TextField;->getFrame()Landroid/graphics/RectF;

    move-result-object v2

    invoke-static {v2}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/apportable/ui/TextField;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/TextField;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 191
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;ILandroid/graphics/RectF;)V
    .locals 3
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 194
    invoke-direct {p0, p1, p2, p3}, Lcom/apportable/ui/Control;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 40
    const-string v0, ""

    iput-object v0, p0, Lcom/apportable/ui/TextField;->imeText:Ljava/lang/String;

    .line 195
    new-instance v0, Lcom/apportable/ui/TextField$BackEditText;

    invoke-direct {v0, p0, p1, p0}, Lcom/apportable/ui/TextField$BackEditText;-><init>(Lcom/apportable/ui/TextField;Landroid/content/Context;Lcom/apportable/ui/TextField;)V

    iput-object v0, p0, Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;

    .line 197
    invoke-direct {p0}, Lcom/apportable/ui/TextField;->init()V

    .line 198
    iget-object v0, p0, Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;

    new-instance v1, Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/apportable/ui/TextField;->getFrame()Landroid/graphics/RectF;

    move-result-object v2

    invoke-static {v2}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/apportable/ui/TextField;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/TextField;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 199
    return-void
.end method

.method static synthetic access$000(Lcom/apportable/ui/TextField;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/apportable/ui/TextField;->finish()V

    return-void
.end method

.method static synthetic access$100(Lcom/apportable/ui/TextField;)Lcom/apportable/ui/TextField$BackEditText;
    .locals 1
    .parameter "x0"

    .prologue
    .line 31
    iget-object v0, p0, Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;

    return-object v0
.end method

.method static synthetic access$200(Lcom/apportable/ui/TextField;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/apportable/ui/TextField;->nativeTextFieldShouldEndEditing(I)V

    return-void
.end method

.method static synthetic access$300(Lcom/apportable/ui/TextField;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/apportable/ui/TextField;->nativeTextFieldDidEndEditing(I)V

    return-void
.end method

.method public static create(Landroid/content/Context;I)Lcom/apportable/ui/TextField;
    .locals 2
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 73
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 74
    new-instance v1, Lcom/apportable/ui/TextField;

    invoke-direct {v1, p0, p1}, Lcom/apportable/ui/TextField;-><init>(Landroid/content/Context;I)V

    .line 93
    :goto_0
    return-object v1

    .line 76
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 77
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/TextField;>;"
    new-instance v1, Lcom/apportable/ui/TextField$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/apportable/ui/TextField$1;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;I)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 86
    monitor-enter p0

    .line 87
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 89
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 90
    :catch_0
    move-exception v1

    goto :goto_1

    .line 92
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 93
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/TextField;

    goto :goto_0

    .line 92
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public static create(Landroid/content/Context;ILandroid/graphics/RectF;)Lcom/apportable/ui/TextField;
    .locals 2
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 98
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 99
    new-instance v1, Lcom/apportable/ui/TextField;

    invoke-direct {v1, p0, p1, p2}, Lcom/apportable/ui/TextField;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 118
    :goto_0
    return-object v1

    .line 101
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 102
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/TextField;>;"
    new-instance v1, Lcom/apportable/ui/TextField$2;

    invoke-direct {v1, p0, v0, p1, p2}, Lcom/apportable/ui/TextField$2;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;ILandroid/graphics/RectF;)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 111
    monitor-enter p0

    .line 112
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 114
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 115
    :catch_0
    move-exception v1

    goto :goto_1

    .line 117
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 118
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/TextField;

    goto :goto_0

    .line 117
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method private finish()V
    .locals 2

    .prologue
    .line 131
    new-instance v0, Lcom/apportable/ui/TextField$3;

    invoke-direct {v0, p0}, Lcom/apportable/ui/TextField$3;-><init>(Lcom/apportable/ui/TextField;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/TextField;->runOnGlThread(Ljava/lang/Runnable;Z)V

    .line 139
    return-void
.end method

.method private init()V
    .locals 2

    .prologue
    .line 123
    iget-object v0, p0, Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/apportable/ui/TextField$BackEditText;->setInputType(I)V

    .line 124
    iget-object v0, p0, Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;

    const v1, 0x40000002

    invoke-virtual {v0, v1}, Lcom/apportable/ui/TextField$BackEditText;->setImeOptions(I)V

    .line 125
    iget-object v0, p0, Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;

    invoke-virtual {v0, p0}, Lcom/apportable/ui/TextField$BackEditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 126
    iget-object v0, p0, Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;

    invoke-virtual {v0, p0}, Lcom/apportable/ui/TextField$BackEditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 127
    iget-object v0, p0, Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;

    invoke-virtual {v0, p0}, Lcom/apportable/ui/TextField$BackEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 128
    return-void
.end method

.method private native nativeTextFieldDidBeginEditing(I)V
.end method

.method private native nativeTextFieldDidEndEditing(I)V
.end method

.method private native nativeTextFieldShouldBeginEditing(I)V
.end method

.method private native nativeTextFieldShouldChangeCharactersInRange(ILjava/lang/String;)V
.end method

.method private native nativeTextFieldShouldClear(I)V
.end method

.method private native nativeTextFieldShouldEndEditing(I)V
.end method

.method private native nativeTextFieldShouldReturn(I)Z
.end method

.method private showKeyboardWithEditDialog()V
    .locals 3

    .prologue
    .line 292
    iget-object v0, p0, Lcom/apportable/ui/TextField;->imeText:Ljava/lang/String;

    .line 293
    .local v0, det:Ljava/lang/String;
    new-instance v1, Lcom/apportable/ui/TextField$7;

    invoke-direct {v1, p0, v0}, Lcom/apportable/ui/TextField$7;-><init>(Lcom/apportable/ui/TextField;Ljava/lang/String;)V

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/apportable/ui/TextField;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 354
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1
    .parameter "s"

    .prologue
    .line 175
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/apportable/ui/TextField;->imeText:Ljava/lang/String;

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .parameter "s"
    .parameter "start"
    .parameter "count"
    .parameter "after"

    .prologue
    .line 172
    return-void
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 230
    iget-object v0, p0, Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;

    invoke-virtual {v0}, Lcom/apportable/ui/TextField$BackEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hideKeyboard()V
    .locals 2

    .prologue
    .line 275
    invoke-static {}, Lcom/apportable/utils/MetaData;->getMetaData()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "apportable.ui.texteditdialog"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 289
    :goto_0
    return-void

    .line 280
    :cond_0
    new-instance v0, Lcom/apportable/ui/TextField$6;

    invoke-direct {v0, p0}, Lcom/apportable/ui/TextField$6;-><init>(Lcom/apportable/ui/TextField;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/TextField;->runOnUiThread(Ljava/lang/Runnable;Z)V

    goto :goto_0
.end method

.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 4
    .parameter "textView"
    .parameter "actionId"
    .parameter "event"

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 143
    if-nez p2, :cond_0

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    const/16 v3, 0x42

    if-ne v2, v3, :cond_0

    .line 144
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v2

    if-ne v2, v1, :cond_2

    .line 145
    iget-object v2, p0, Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;

    invoke-virtual {v2}, Lcom/apportable/ui/TextField$BackEditText;->getTextField()Lcom/apportable/ui/TextField;

    move-result-object v2

    iget v3, p0, Lcom/apportable/ui/TextField;->mObject:I

    invoke-direct {v2, v3}, Lcom/apportable/ui/TextField;->nativeTextFieldShouldReturn(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 146
    invoke-direct {p0}, Lcom/apportable/ui/TextField;->finish()V

    .line 156
    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    .line 149
    goto :goto_0

    :cond_2
    move v0, v1

    .line 153
    goto :goto_0
.end method

.method public onFocusChange(Landroid/view/View;Z)V
    .locals 1
    .parameter "v"
    .parameter "hasFocus"

    .prologue
    .line 179
    if-eqz p2, :cond_0

    .line 180
    iget v0, p0, Lcom/apportable/ui/TextField;->mObject:I

    invoke-direct {p0, v0}, Lcom/apportable/ui/TextField;->nativeTextFieldShouldBeginEditing(I)V

    .line 181
    iget v0, p0, Lcom/apportable/ui/TextField;->mObject:I

    invoke-direct {p0, v0}, Lcom/apportable/ui/TextField;->nativeTextFieldDidBeginEditing(I)V

    .line 183
    :cond_0
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 4
    .parameter "s"
    .parameter "start"
    .parameter "before"
    .parameter "count"

    .prologue
    .line 161
    if-ge p4, p3, :cond_0

    .line 165
    iget v0, p0, Lcom/apportable/ui/TextField;->mObject:I

    const-string v1, ""

    invoke-direct {p0, v0, v1}, Lcom/apportable/ui/TextField;->nativeTextFieldShouldChangeCharactersInRange(ILjava/lang/String;)V

    .line 169
    :goto_0
    return-void

    .line 167
    :cond_0
    iget v0, p0, Lcom/apportable/ui/TextField;->mObject:I

    iget-object v1, p0, Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;

    invoke-virtual {v1}, Lcom/apportable/ui/TextField$BackEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    add-int v2, p2, p3

    add-int v3, p2, p4

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/apportable/ui/TextField;->nativeTextFieldShouldChangeCharactersInRange(ILjava/lang/String;)V

    goto :goto_0
.end method

.method public setAutocorrectionType(I)V
    .locals 3
    .parameter "autoCorrectionType"

    .prologue
    .line 207
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 208
    iget-object v0, p0, Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;

    const v1, 0x80091

    invoke-virtual {v0, v1}, Lcom/apportable/ui/TextField$BackEditText;->setInputType(I)V

    .line 213
    :goto_0
    return-void

    .line 210
    :cond_0
    iget-object v0, p0, Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;

    iget-object v1, p0, Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;

    invoke-virtual {v1}, Lcom/apportable/ui/TextField$BackEditText;->getInputType()I

    move-result v1

    and-int/lit16 v1, v1, -0x91

    const v2, -0x80001

    and-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/apportable/ui/TextField$BackEditText;->setInputType(I)V

    goto :goto_0
.end method

.method public setHint(Ljava/lang/String;)V
    .locals 1
    .parameter "hint"

    .prologue
    .line 234
    iget-object v0, p0, Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;

    invoke-virtual {v0, p1}, Lcom/apportable/ui/TextField$BackEditText;->setHint(Ljava/lang/CharSequence;)V

    .line 235
    return-void
.end method

.method public setMaxLength(I)V
    .locals 3
    .parameter "length"

    .prologue
    .line 238
    const/4 v1, 0x1

    new-array v0, v1, [Landroid/text/InputFilter;

    .line 239
    .local v0, FilterArray:[Landroid/text/InputFilter;
    const/4 v1, 0x0

    new-instance v2, Landroid/text/InputFilter$LengthFilter;

    invoke-direct {v2, p1}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v2, v0, v1

    .line 240
    iget-object v1, p0, Lcom/apportable/ui/TextField;->mTextField:Lcom/apportable/ui/TextField$BackEditText;

    invoke-virtual {v1, v0}, Lcom/apportable/ui/TextField$BackEditText;->setFilters([Landroid/text/InputFilter;)V

    .line 241
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 2
    .parameter "text"

    .prologue
    .line 216
    iput-object p1, p0, Lcom/apportable/ui/TextField;->imeText:Ljava/lang/String;

    .line 217
    new-instance v0, Lcom/apportable/ui/TextField$4;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/TextField$4;-><init>(Lcom/apportable/ui/TextField;Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/TextField;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 227
    return-void
.end method

.method public showKeyboard()V
    .locals 2

    .prologue
    .line 245
    invoke-static {}, Lcom/apportable/utils/MetaData;->getMetaData()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "apportable.ui.texteditdialog"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 246
    invoke-direct {p0}, Lcom/apportable/ui/TextField;->showKeyboardWithEditDialog()V

    .line 271
    :goto_0
    return-void

    .line 250
    :cond_0
    new-instance v0, Lcom/apportable/ui/TextField$5;

    invoke-direct {v0, p0}, Lcom/apportable/ui/TextField$5;-><init>(Lcom/apportable/ui/TextField;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/TextField;->runOnUiThread(Ljava/lang/Runnable;Z)V

    goto :goto_0
.end method

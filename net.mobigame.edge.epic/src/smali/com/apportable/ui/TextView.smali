.class Lcom/apportable/ui/TextView;
.super Lcom/apportable/ui/View;
.source "TextView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/apportable/ui/TextView$EditText;
    }
.end annotation


# instance fields
.field private mFontSize:F

.field private mText:Ljava/lang/String;

.field private mTextColor:I

.field private mTextView:Lcom/apportable/ui/TextView$EditText;

.field private mTypeface:Landroid/graphics/Typeface;


# direct methods
.method protected constructor <init>(Landroid/content/Context;I)V
    .locals 1
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 133
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;I)V

    .line 43
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    iput-object v0, p0, Lcom/apportable/ui/TextView;->mTypeface:Landroid/graphics/Typeface;

    .line 44
    const/high16 v0, 0x4188

    iput v0, p0, Lcom/apportable/ui/TextView;->mFontSize:F

    .line 45
    const/high16 v0, -0x100

    iput v0, p0, Lcom/apportable/ui/TextView;->mTextColor:I

    .line 134
    invoke-direct {p0}, Lcom/apportable/ui/TextView;->init()V

    .line 135
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;ILandroid/graphics/RectF;)V
    .locals 1
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 138
    invoke-direct {p0, p1, p2, p3}, Lcom/apportable/ui/View;-><init>(Landroid/content/Context;ILandroid/graphics/RectF;)V

    .line 43
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    iput-object v0, p0, Lcom/apportable/ui/TextView;->mTypeface:Landroid/graphics/Typeface;

    .line 44
    const/high16 v0, 0x4188

    iput v0, p0, Lcom/apportable/ui/TextView;->mFontSize:F

    .line 45
    const/high16 v0, -0x100

    iput v0, p0, Lcom/apportable/ui/TextView;->mTextColor:I

    .line 139
    invoke-direct {p0}, Lcom/apportable/ui/TextView;->init()V

    .line 140
    return-void
.end method

.method static synthetic access$000(Lcom/apportable/ui/TextView;III)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 17
    invoke-direct {p0, p1, p2, p3}, Lcom/apportable/ui/TextView;->selectionChange(III)V

    return-void
.end method

.method static synthetic access$100(Lcom/apportable/ui/TextView;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 17
    iget-object v0, p0, Lcom/apportable/ui/TextView;->mText:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$102(Lcom/apportable/ui/TextView;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 17
    iput-object p1, p0, Lcom/apportable/ui/TextView;->mText:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lcom/apportable/ui/TextView;)Lcom/apportable/ui/TextView$EditText;
    .locals 1
    .parameter "x0"

    .prologue
    .line 17
    iget-object v0, p0, Lcom/apportable/ui/TextView;->mTextView:Lcom/apportable/ui/TextView$EditText;

    return-object v0
.end method

.method static synthetic access$300(Lcom/apportable/ui/TextView;ILjava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 17
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/TextView;->textDidChange(ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/apportable/ui/TextView;ILjava/lang/String;III)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .parameter "x5"

    .prologue
    .line 17
    invoke-direct/range {p0 .. p5}, Lcom/apportable/ui/TextView;->textWillChange(ILjava/lang/String;III)V

    return-void
.end method

.method static synthetic access$500(Lcom/apportable/ui/TextView;ILjava/lang/String;II)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"

    .prologue
    .line 17
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/apportable/ui/TextView;->textChange(ILjava/lang/String;II)V

    return-void
.end method

.method public static create(Landroid/content/Context;I)Lcom/apportable/ui/TextView;
    .locals 2
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 48
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 49
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/TextView;>;"
    new-instance v1, Lcom/apportable/ui/TextView$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/apportable/ui/TextView$1;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;I)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 58
    monitor-enter p0

    .line 59
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_0

    .line 61
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 62
    :catch_0
    move-exception v1

    goto :goto_0

    .line 64
    :cond_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 65
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/TextView;

    return-object v1

    .line 64
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public static create(Landroid/content/Context;ILandroid/graphics/RectF;)Lcom/apportable/ui/TextView;
    .locals 2
    .parameter "ctx"
    .parameter "object"
    .parameter "frame"

    .prologue
    .line 69
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 70
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/TextView;>;"
    new-instance v1, Lcom/apportable/ui/TextView$2;

    invoke-direct {v1, p0, v0, p1, p2}, Lcom/apportable/ui/TextView$2;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;ILandroid/graphics/RectF;)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 79
    monitor-enter p0

    .line 80
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_0

    .line 82
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 83
    :catch_0
    move-exception v1

    goto :goto_0

    .line 85
    :cond_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 86
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/TextView;

    return-object v1

    .line 85
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method private init()V
    .locals 3

    .prologue
    .line 90
    new-instance v0, Lcom/apportable/ui/TextView$EditText;

    invoke-virtual {p0}, Lcom/apportable/ui/TextView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1, p0}, Lcom/apportable/ui/TextView$EditText;-><init>(Lcom/apportable/ui/TextView;Landroid/content/Context;Lcom/apportable/ui/TextView;)V

    iput-object v0, p0, Lcom/apportable/ui/TextView;->mTextView:Lcom/apportable/ui/TextView$EditText;

    .line 92
    iget-object v0, p0, Lcom/apportable/ui/TextView;->mTextView:Lcom/apportable/ui/TextView$EditText;

    const/16 v1, 0x33

    invoke-virtual {v0, v1}, Lcom/apportable/ui/TextView$EditText;->setGravity(I)V

    .line 93
    iget-object v0, p0, Lcom/apportable/ui/TextView;->mTextView:Lcom/apportable/ui/TextView$EditText;

    new-instance v1, Lcom/apportable/ui/TextView$3;

    invoke-direct {v1, p0}, Lcom/apportable/ui/TextView$3;-><init>(Lcom/apportable/ui/TextView;)V

    invoke-virtual {v0, v1}, Lcom/apportable/ui/TextView$EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 128
    iget-object v0, p0, Lcom/apportable/ui/TextView;->mTextView:Lcom/apportable/ui/TextView$EditText;

    new-instance v1, Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/apportable/ui/TextView;->getFrame()Landroid/graphics/RectF;

    move-result-object v2

    invoke-static {v2}, Lcom/apportable/ui/View;->boundsFromFrame(Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/apportable/ui/TextView;->layoutParameters(Landroid/graphics/RectF;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/AbsoluteLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/TextView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 130
    return-void
.end method

.method private native selectionChange(III)V
.end method

.method private native textChange(ILjava/lang/String;II)V
.end method

.method private native textDidChange(ILjava/lang/String;)V
.end method

.method private native textWillChange(ILjava/lang/String;III)V
.end method


# virtual methods
.method protected __setBackgroundColor(I)V
    .locals 1
    .parameter "color"

    .prologue
    .line 174
    iget-object v0, p0, Lcom/apportable/ui/TextView;->mTextView:Lcom/apportable/ui/TextView$EditText;

    invoke-virtual {v0, p1}, Lcom/apportable/ui/TextView$EditText;->setBackgroundColor(I)V

    .line 175
    return-void
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lcom/apportable/ui/TextView;->mTextView:Lcom/apportable/ui/TextView$EditText;

    invoke-virtual {v0}, Lcom/apportable/ui/TextView$EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTextColor()I
    .locals 1

    .prologue
    .line 199
    iget v0, p0, Lcom/apportable/ui/TextView;->mTextColor:I

    return v0
.end method

.method public isEditable()Z
    .locals 1

    .prologue
    .line 212
    iget-object v0, p0, Lcom/apportable/ui/TextView;->mTextView:Lcom/apportable/ui/TextView$EditText;

    invoke-virtual {v0}, Lcom/apportable/ui/TextView$EditText;->getKeyListener()Landroid/text/method/KeyListener;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onAttachedToWindow()V
    .locals 2

    .prologue
    .line 217
    invoke-super {p0}, Lcom/apportable/ui/View;->onAttachedToWindow()V

    .line 218
    iget-object v0, p0, Lcom/apportable/ui/TextView;->mTextView:Lcom/apportable/ui/TextView$EditText;

    iget-object v1, p0, Lcom/apportable/ui/TextView;->mText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/apportable/ui/TextView$EditText;->setText(Ljava/lang/CharSequence;)V

    .line 219
    iget-object v0, p0, Lcom/apportable/ui/TextView;->mTextView:Lcom/apportable/ui/TextView$EditText;

    iget-object v1, p0, Lcom/apportable/ui/TextView;->mTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Lcom/apportable/ui/TextView$EditText;->setTypeface(Landroid/graphics/Typeface;)V

    .line 220
    iget-object v0, p0, Lcom/apportable/ui/TextView;->mTextView:Lcom/apportable/ui/TextView$EditText;

    iget v1, p0, Lcom/apportable/ui/TextView;->mFontSize:F

    invoke-virtual {v0, v1}, Lcom/apportable/ui/TextView$EditText;->setTextSize(F)V

    .line 221
    iget-object v0, p0, Lcom/apportable/ui/TextView;->mTextView:Lcom/apportable/ui/TextView$EditText;

    iget v1, p0, Lcom/apportable/ui/TextView;->mTextColor:I

    invoke-virtual {v0, v1}, Lcom/apportable/ui/TextView$EditText;->setTextColor(I)V

    .line 222
    return-void
.end method

.method public setEditable(Z)V
    .locals 2
    .parameter "editable"

    .prologue
    .line 203
    new-instance v0, Lcom/apportable/ui/TextView$8;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/TextView$8;-><init>(Lcom/apportable/ui/TextView;Z)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/TextView;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 209
    return-void
.end method

.method public setFont(Landroid/graphics/Typeface;F)V
    .locals 2
    .parameter "font"
    .parameter "size"

    .prologue
    .line 160
    iput-object p1, p0, Lcom/apportable/ui/TextView;->mTypeface:Landroid/graphics/Typeface;

    .line 161
    iput p2, p0, Lcom/apportable/ui/TextView;->mFontSize:F

    .line 162
    iget-boolean v0, p0, Lcom/apportable/ui/TextView;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 163
    new-instance v0, Lcom/apportable/ui/TextView$5;

    invoke-direct {v0, p0, p1, p2}, Lcom/apportable/ui/TextView$5;-><init>(Lcom/apportable/ui/TextView;Landroid/graphics/Typeface;F)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/TextView;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 171
    :cond_0
    return-void
.end method

.method protected setMaxLines(I)V
    .locals 1
    .parameter "maxLines"

    .prologue
    .line 225
    iget-object v0, p0, Lcom/apportable/ui/TextView;->mTextView:Lcom/apportable/ui/TextView$EditText;

    invoke-virtual {v0, p1}, Lcom/apportable/ui/TextView$EditText;->setMaxLines(I)V

    .line 226
    return-void
.end method

.method public setSelection(II)V
    .locals 2
    .parameter "start"
    .parameter "stop"

    .prologue
    .line 178
    new-instance v0, Lcom/apportable/ui/TextView$6;

    invoke-direct {v0, p0, p1, p2}, Lcom/apportable/ui/TextView$6;-><init>(Lcom/apportable/ui/TextView;II)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/TextView;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 184
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 2
    .parameter "textToSet"

    .prologue
    .line 144
    iput-object p1, p0, Lcom/apportable/ui/TextView;->mText:Ljava/lang/String;

    .line 145
    iget-boolean v0, p0, Lcom/apportable/ui/TextView;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 146
    new-instance v0, Lcom/apportable/ui/TextView$4;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/TextView$4;-><init>(Lcom/apportable/ui/TextView;Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/TextView;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 153
    :cond_0
    return-void
.end method

.method public setTextColor(I)V
    .locals 2
    .parameter "color"

    .prologue
    .line 187
    iput p1, p0, Lcom/apportable/ui/TextView;->mTextColor:I

    .line 188
    iget-boolean v0, p0, Lcom/apportable/ui/TextView;->mInWindow:Z

    if-eqz v0, :cond_0

    .line 189
    new-instance v0, Lcom/apportable/ui/TextView$7;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/TextView$7;-><init>(Lcom/apportable/ui/TextView;I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/TextView;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 196
    :cond_0
    return-void
.end method

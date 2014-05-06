.class public Lcom/apportable/ui/BarButtonItem;
.super Lcom/apportable/ui/BarItem;
.source "BarButtonItem.java"


# static fields
.field public static final ACTION:I = 0x9

.field public static final ADD:I = 0x4

.field public static final BOOKMARKS:I = 0xb

.field public static final CAMERA:I = 0xf

.field public static final CANCEL:I = 0x1

.field public static final COMPOSE:I = 0x7

.field public static final CUSTOM:I = -0x1

.field public static final DONE:I = 0x0

.field public static final EDIT:I = 0x2

.field public static final FASTFORWARD:I = 0x14

.field public static final FIXED_SPACE:I = 0x6

.field public static final FLEXIBLE_SPACE:I = 0x5

.field public static final ORGANIZE:I = 0xa

.field public static final PAGECURL:I = 0x17

.field public static final PAUSE:I = 0x12

.field public static final PLAY:I = 0x11

.field public static final REDO:I = 0x16

.field public static final REFRESH:I = 0xd

.field public static final REPLY:I = 0x8

.field public static final REWIND:I = 0x13

.field public static final SAVE:I = 0x3

.field public static final SEARCH:I = 0xc

.field public static final STOP:I = 0xe

.field public static final TRASH:I = 0x10

.field public static final UNDO:I = 0x15


# instance fields
.field protected mButton:Landroid/widget/Button;

.field private mStyle:I

.field private mTitle:Ljava/lang/String;

.field private mWidth:F


# direct methods
.method protected constructor <init>(Landroid/content/Context;I)V
    .locals 8
    .parameter "ctx"
    .parameter "object"

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 55
    invoke-direct {p0, p1, p2}, Lcom/apportable/ui/BarItem;-><init>(Landroid/content/Context;I)V

    .line 48
    const-string v0, ""

    iput-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mTitle:Ljava/lang/String;

    .line 49
    const/high16 v0, -0x4000

    iput v0, p0, Lcom/apportable/ui/BarButtonItem;->mWidth:F

    .line 50
    const/4 v0, -0x1

    iput v0, p0, Lcom/apportable/ui/BarButtonItem;->mStyle:I

    .line 56
    iput p2, p0, Lcom/apportable/ui/BarButtonItem;->mObject:I

    .line 57
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    .line 58
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    invoke-virtual {v0, v6}, Landroid/widget/Button;->setSingleLine(Z)V

    .line 59
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 60
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const/16 v1, 0x96

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMaxWidth(I)V

    .line 61
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 62
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    new-instance v1, Landroid/content/res/ColorStateList;

    new-array v2, v7, [[I

    new-array v3, v6, [I

    const v4, 0x10100a7

    aput v4, v3, v5

    aput-object v3, v2, v5

    new-array v3, v6, [I

    aput v5, v3, v5

    aput-object v3, v2, v6

    new-array v3, v7, [I

    fill-array-data v3, :array_0

    invoke-direct {v1, v2, v3}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 74
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const/high16 v1, 0x4188

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 75
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    .line 77
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    new-instance v1, Lcom/apportable/ui/BarButtonItem$1;

    invoke-direct {v1, p0}, Lcom/apportable/ui/BarButtonItem$1;-><init>(Lcom/apportable/ui/BarButtonItem;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 83
    return-void

    .line 62
    :array_0
    .array-data 0x4
        0xfft 0xfft 0xfft 0xcct
        0xfft 0xfft 0xfft 0xfft
    .end array-data
.end method

.method private _setStyle(I)V
    .locals 3
    .parameter "style"

    .prologue
    const/4 v2, 0x0

    .line 111
    packed-switch p1, :pswitch_data_0

    .line 214
    :goto_0
    :pswitch_0
    return-void

    .line 115
    :pswitch_1
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 116
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, "Done"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 119
    :pswitch_2
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 120
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, "Cancel"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 123
    :pswitch_3
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 124
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, "Edit"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 127
    :pswitch_4
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 128
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, "Save"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 131
    :pswitch_5
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 132
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const v1, 0x1080033

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    goto :goto_0

    .line 135
    :pswitch_6
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 136
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 139
    :pswitch_7
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 140
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 143
    :pswitch_8
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 145
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 148
    :pswitch_9
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 149
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const v1, 0x1080050

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    goto :goto_0

    .line 152
    :pswitch_a
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 153
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const v1, 0x1080051

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 156
    :pswitch_b
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 158
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 161
    :pswitch_c
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 162
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const v1, 0x1080045

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 165
    :pswitch_d
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 166
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const v1, 0x108004f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 169
    :pswitch_e
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 171
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 174
    :pswitch_f
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 175
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const v1, 0x1080038

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 178
    :pswitch_10
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 179
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const v1, 0x1080037

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 182
    :pswitch_11
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 183
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const v1, 0x108003c

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 186
    :pswitch_12
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 187
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const v1, 0x1080024

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 190
    :pswitch_13
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 191
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const v1, 0x1080023

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 194
    :pswitch_14
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 195
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const v1, 0x1080025

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 198
    :pswitch_15
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 199
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const v1, 0x1080022

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 202
    :pswitch_16
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 203
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, "Undo"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 206
    :pswitch_17
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 207
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, "Redo"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 210
    :pswitch_18
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 211
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 111
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_16
        :pswitch_17
        :pswitch_18
    .end packed-switch
.end method

.method static synthetic access$000(Lcom/apportable/ui/BarButtonItem;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/apportable/ui/BarButtonItem;->_setStyle(I)V

    return-void
.end method

.method public static create(Landroid/content/Context;I)Lcom/apportable/ui/BarButtonItem;
    .locals 2
    .parameter "ctx"
    .parameter "object"

    .prologue
    .line 86
    invoke-static {}, Lcom/apportable/utils/ThreadUtils;->runningOnUiThread()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 87
    new-instance v1, Lcom/apportable/ui/BarButtonItem;

    invoke-direct {v1, p0, p1}, Lcom/apportable/ui/BarButtonItem;-><init>(Landroid/content/Context;I)V

    .line 106
    :goto_0
    return-object v1

    .line 89
    :cond_0
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 90
    .local v0, view:Ljava/util/concurrent/atomic/AtomicReference;,"Ljava/util/concurrent/atomic/AtomicReference<Lcom/apportable/ui/BarButtonItem;>;"
    new-instance v1, Lcom/apportable/ui/BarButtonItem$2;

    invoke-direct {v1, p0, v0, p1}, Lcom/apportable/ui/BarButtonItem$2;-><init>(Landroid/content/Context;Ljava/util/concurrent/atomic/AtomicReference;I)V

    invoke-static {v1}, Lcom/apportable/utils/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 99
    monitor-enter p0

    .line 100
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    if-nez v1, :cond_1

    .line 102
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 103
    :catch_0
    move-exception v1

    goto :goto_1

    .line 105
    :cond_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 106
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apportable/ui/BarButtonItem;

    goto :goto_0

    .line 105
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method


# virtual methods
.method protected native click(I)V
.end method

.method getLayout()Landroid/widget/LinearLayout$LayoutParams;
    .locals 3

    .prologue
    .line 222
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    iget v1, p0, Lcom/apportable/ui/BarButtonItem;->mWidth:F

    float-to-int v1, v1

    const/4 v2, -0x1

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method getView()Landroid/view/View;
    .locals 1

    .prologue
    .line 218
    iget-object v0, p0, Lcom/apportable/ui/BarButtonItem;->mButton:Landroid/widget/Button;

    return-object v0
.end method

.method public setStyle(I)V
    .locals 2
    .parameter "style"

    .prologue
    .line 236
    iput p1, p0, Lcom/apportable/ui/BarButtonItem;->mStyle:I

    .line 237
    new-instance v0, Lcom/apportable/ui/BarButtonItem$4;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/BarButtonItem$4;-><init>(Lcom/apportable/ui/BarButtonItem;I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/BarButtonItem;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 243
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 2
    .parameter "title"

    .prologue
    .line 226
    iput-object p1, p0, Lcom/apportable/ui/BarButtonItem;->mTitle:Ljava/lang/String;

    .line 227
    new-instance v0, Lcom/apportable/ui/BarButtonItem$3;

    invoke-direct {v0, p0, p1}, Lcom/apportable/ui/BarButtonItem$3;-><init>(Lcom/apportable/ui/BarButtonItem;Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/BarButtonItem;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 233
    return-void
.end method

.method public setWidth(F)V
    .locals 2
    .parameter "width"

    .prologue
    .line 246
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    .line 247
    const/high16 v0, -0x4000

    iput v0, p0, Lcom/apportable/ui/BarButtonItem;->mWidth:F

    .line 250
    :goto_0
    new-instance v0, Lcom/apportable/ui/BarButtonItem$5;

    invoke-direct {v0, p0}, Lcom/apportable/ui/BarButtonItem$5;-><init>(Lcom/apportable/ui/BarButtonItem;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/ui/BarButtonItem;->runOnUiThread(Ljava/lang/Runnable;Z)V

    .line 256
    return-void

    .line 249
    :cond_0
    iput p1, p0, Lcom/apportable/ui/BarButtonItem;->mWidth:F

    goto :goto_0
.end method

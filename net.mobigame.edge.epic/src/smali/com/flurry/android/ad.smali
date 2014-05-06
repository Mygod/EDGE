.class final Lcom/flurry/android/ad;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field private synthetic a:Landroid/widget/TextView;

.field private synthetic b:Lcom/flurry/android/ac;


# direct methods
.method constructor <init>(Lcom/flurry/android/ac;Landroid/widget/TextView;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 245
    iput-object p1, p0, Lcom/flurry/android/ad;->b:Lcom/flurry/android/ac;

    iput-object p2, p0, Lcom/flurry/android/ad;->a:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onFocusChange(Landroid/view/View;Z)V
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 249
    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/flurry/android/ad;->b:Lcom/flurry/android/ac;

    invoke-static {v0}, Lcom/flurry/android/ac;->a(Lcom/flurry/android/ac;)Landroid/text/SpannedString;

    move-result-object v0

    .line 250
    :goto_0
    iget-object v1, p0, Lcom/flurry/android/ad;->a:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 251
    return-void

    .line 249
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/ad;->b:Lcom/flurry/android/ac;

    invoke-static {v0}, Lcom/flurry/android/ac;->b(Lcom/flurry/android/ac;)Landroid/text/SpannedString;

    move-result-object v0

    goto :goto_0
.end method

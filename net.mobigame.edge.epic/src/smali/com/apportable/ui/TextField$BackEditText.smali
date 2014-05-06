.class Lcom/apportable/ui/TextField$BackEditText;
.super Landroid/widget/EditText;
.source "TextField.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/apportable/ui/TextField;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "BackEditText"
.end annotation


# instance fields
.field private innerTextField:Lcom/apportable/ui/TextField;

.field final synthetic this$0:Lcom/apportable/ui/TextField;


# direct methods
.method public constructor <init>(Lcom/apportable/ui/TextField;Landroid/content/Context;Lcom/apportable/ui/TextField;)V
    .locals 0
    .parameter
    .parameter "context"
    .parameter "outer"

    .prologue
    .line 47
    iput-object p1, p0, Lcom/apportable/ui/TextField$BackEditText;->this$0:Lcom/apportable/ui/TextField;

    .line 48
    invoke-direct {p0, p2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 49
    iput-object p3, p0, Lcom/apportable/ui/TextField$BackEditText;->innerTextField:Lcom/apportable/ui/TextField;

    .line 50
    return-void
.end method


# virtual methods
.method public getTextField()Lcom/apportable/ui/TextField;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/apportable/ui/TextField$BackEditText;->innerTextField:Lcom/apportable/ui/TextField;

    return-object v0
.end method

.method public onKeyPreIme(ILandroid/view/KeyEvent;)Z
    .locals 2
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 53
    invoke-static {}, Lcom/apportable/utils/MetaData;->getMetaData()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "apportable.ui.texteditdialog"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 54
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 55
    iget-object v0, p0, Lcom/apportable/ui/TextField$BackEditText;->innerTextField:Lcom/apportable/ui/TextField;

    #calls: Lcom/apportable/ui/TextField;->finish()V
    invoke-static {v0}, Lcom/apportable/ui/TextField;->access$000(Lcom/apportable/ui/TextField;)V

    .line 56
    const/4 v0, 0x1

    .line 59
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p2}, Landroid/widget/EditText;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.class Lcom/apportable/ui/AlertView$3;
.super Ljava/lang/Object;
.source "AlertView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/AlertView;->show()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/AlertView;


# direct methods
.method constructor <init>(Lcom/apportable/ui/AlertView;)V
    .locals 0
    .parameter

    .prologue
    .line 128
    iput-object p1, p0, Lcom/apportable/ui/AlertView$3;->this$0:Lcom/apportable/ui/AlertView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/4 v7, -0x2

    .line 131
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v4, p0, Lcom/apportable/ui/AlertView$3;->this$0:Lcom/apportable/ui/AlertView;

    invoke-virtual {v4}, Lcom/apportable/ui/AlertView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v0, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 132
    .local v0, builder:Landroid/app/AlertDialog$Builder;
    iget-object v4, p0, Lcom/apportable/ui/AlertView$3;->this$0:Lcom/apportable/ui/AlertView;

    #getter for: Lcom/apportable/ui/AlertView;->mTitle:Ljava/lang/String;
    invoke-static {v4}, Lcom/apportable/ui/AlertView;->access$000(Lcom/apportable/ui/AlertView;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 133
    iget-object v4, p0, Lcom/apportable/ui/AlertView$3;->this$0:Lcom/apportable/ui/AlertView;

    #getter for: Lcom/apportable/ui/AlertView;->mMessage:Ljava/lang/String;
    invoke-static {v4}, Lcom/apportable/ui/AlertView;->access$100(Lcom/apportable/ui/AlertView;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 134
    iget-object v4, p0, Lcom/apportable/ui/AlertView$3;->this$0:Lcom/apportable/ui/AlertView;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v5

    #setter for: Lcom/apportable/ui/AlertView;->mDialog:Landroid/app/AlertDialog;
    invoke-static {v4, v5}, Lcom/apportable/ui/AlertView;->access$202(Lcom/apportable/ui/AlertView;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    .line 135
    iget-object v4, p0, Lcom/apportable/ui/AlertView$3;->this$0:Lcom/apportable/ui/AlertView;

    #getter for: Lcom/apportable/ui/AlertView;->mDialog:Landroid/app/AlertDialog;
    invoke-static {v4}, Lcom/apportable/ui/AlertView;->access$200(Lcom/apportable/ui/AlertView;)Landroid/app/AlertDialog;

    move-result-object v4

    iget-object v5, p0, Lcom/apportable/ui/AlertView$3;->this$0:Lcom/apportable/ui/AlertView;

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 136
    iget-object v4, p0, Lcom/apportable/ui/AlertView$3;->this$0:Lcom/apportable/ui/AlertView;

    #getter for: Lcom/apportable/ui/AlertView;->mDialog:Landroid/app/AlertDialog;
    invoke-static {v4}, Lcom/apportable/ui/AlertView;->access$200(Lcom/apportable/ui/AlertView;)Landroid/app/AlertDialog;

    move-result-object v4

    iget-object v5, p0, Lcom/apportable/ui/AlertView$3;->this$0:Lcom/apportable/ui/AlertView;

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 137
    iget-object v4, p0, Lcom/apportable/ui/AlertView$3;->this$0:Lcom/apportable/ui/AlertView;

    #getter for: Lcom/apportable/ui/AlertView;->mButtonTitles:Ljava/util/HashMap;
    invoke-static {v4}, Lcom/apportable/ui/AlertView;->access$300(Lcom/apportable/ui/AlertView;)Ljava/util/HashMap;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 138
    .local v1, buttonTitles:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/CharSequence;>;"
    const/4 v2, 0x0

    .line 139
    .local v2, hasButtonTitles:Z
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 140
    const/4 v2, 0x1

    .line 141
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    .line 142
    .local v3, title:Ljava/lang/CharSequence;
    iget-object v4, p0, Lcom/apportable/ui/AlertView$3;->this$0:Lcom/apportable/ui/AlertView;

    #getter for: Lcom/apportable/ui/AlertView;->mDialog:Landroid/app/AlertDialog;
    invoke-static {v4}, Lcom/apportable/ui/AlertView;->access$200(Lcom/apportable/ui/AlertView;)Landroid/app/AlertDialog;

    move-result-object v4

    const/4 v5, -0x1

    iget-object v6, p0, Lcom/apportable/ui/AlertView$3;->this$0:Lcom/apportable/ui/AlertView;

    invoke-virtual {v4, v5, v3, v6}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 143
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 144
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .end local v3           #title:Ljava/lang/CharSequence;
    check-cast v3, Ljava/lang/CharSequence;

    .line 145
    .restart local v3       #title:Ljava/lang/CharSequence;
    iget-object v4, p0, Lcom/apportable/ui/AlertView$3;->this$0:Lcom/apportable/ui/AlertView;

    #getter for: Lcom/apportable/ui/AlertView;->mDialog:Landroid/app/AlertDialog;
    invoke-static {v4}, Lcom/apportable/ui/AlertView;->access$200(Lcom/apportable/ui/AlertView;)Landroid/app/AlertDialog;

    move-result-object v4

    const/4 v5, -0x3

    iget-object v6, p0, Lcom/apportable/ui/AlertView$3;->this$0:Lcom/apportable/ui/AlertView;

    invoke-virtual {v4, v5, v3, v6}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 148
    .end local v3           #title:Ljava/lang/CharSequence;
    :cond_0
    iget-object v4, p0, Lcom/apportable/ui/AlertView$3;->this$0:Lcom/apportable/ui/AlertView;

    #getter for: Lcom/apportable/ui/AlertView;->mCancelTitle:Ljava/lang/String;
    invoke-static {v4}, Lcom/apportable/ui/AlertView;->access$400(Lcom/apportable/ui/AlertView;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 149
    iget-object v4, p0, Lcom/apportable/ui/AlertView$3;->this$0:Lcom/apportable/ui/AlertView;

    #getter for: Lcom/apportable/ui/AlertView;->mDialog:Landroid/app/AlertDialog;
    invoke-static {v4}, Lcom/apportable/ui/AlertView;->access$200(Lcom/apportable/ui/AlertView;)Landroid/app/AlertDialog;

    move-result-object v4

    iget-object v5, p0, Lcom/apportable/ui/AlertView$3;->this$0:Lcom/apportable/ui/AlertView;

    #getter for: Lcom/apportable/ui/AlertView;->mCancelTitle:Ljava/lang/String;
    invoke-static {v5}, Lcom/apportable/ui/AlertView;->access$400(Lcom/apportable/ui/AlertView;)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/apportable/ui/AlertView$3;->this$0:Lcom/apportable/ui/AlertView;

    invoke-virtual {v4, v7, v5, v6}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 154
    :cond_1
    :goto_0
    iget-object v4, p0, Lcom/apportable/ui/AlertView$3;->this$0:Lcom/apportable/ui/AlertView;

    #getter for: Lcom/apportable/ui/AlertView;->mDialog:Landroid/app/AlertDialog;
    invoke-static {v4}, Lcom/apportable/ui/AlertView;->access$200(Lcom/apportable/ui/AlertView;)Landroid/app/AlertDialog;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/AlertDialog;->show()V

    .line 155
    return-void

    .line 150
    :cond_2
    if-nez v2, :cond_1

    .line 151
    iget-object v4, p0, Lcom/apportable/ui/AlertView$3;->this$0:Lcom/apportable/ui/AlertView;

    #getter for: Lcom/apportable/ui/AlertView;->mDialog:Landroid/app/AlertDialog;
    invoke-static {v4}, Lcom/apportable/ui/AlertView;->access$200(Lcom/apportable/ui/AlertView;)Landroid/app/AlertDialog;

    move-result-object v4

    const-string v5, "Ok"

    iget-object v6, p0, Lcom/apportable/ui/AlertView$3;->this$0:Lcom/apportable/ui/AlertView;

    invoke-virtual {v4, v7, v5, v6}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    goto :goto_0
.end method

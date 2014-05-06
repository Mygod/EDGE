.class Lcom/apportable/ui/AlertView$4;
.super Ljava/lang/Object;
.source "AlertView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/AlertView;->dismiss()V
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
    .line 162
    iput-object p1, p0, Lcom/apportable/ui/AlertView$4;->this$0:Lcom/apportable/ui/AlertView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 165
    iget-object v0, p0, Lcom/apportable/ui/AlertView$4;->this$0:Lcom/apportable/ui/AlertView;

    #getter for: Lcom/apportable/ui/AlertView;->mDialog:Landroid/app/AlertDialog;
    invoke-static {v0}, Lcom/apportable/ui/AlertView;->access$200(Lcom/apportable/ui/AlertView;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 166
    return-void
.end method

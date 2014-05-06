.class Lcom/apportable/ui/AlertView$6;
.super Ljava/lang/Object;
.source "AlertView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/AlertView;->onDismiss(Landroid/content/DialogInterface;)V
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
    .line 196
    iput-object p1, p0, Lcom/apportable/ui/AlertView$6;->this$0:Lcom/apportable/ui/AlertView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 199
    iget-object v0, p0, Lcom/apportable/ui/AlertView$6;->this$0:Lcom/apportable/ui/AlertView;

    iget-object v1, p0, Lcom/apportable/ui/AlertView$6;->this$0:Lcom/apportable/ui/AlertView;

    iget v1, v1, Lcom/apportable/ui/AlertView;->mObject:I

    #calls: Lcom/apportable/ui/AlertView;->nativeOnDismiss(I)V
    invoke-static {v0, v1}, Lcom/apportable/ui/AlertView;->access$700(Lcom/apportable/ui/AlertView;I)V

    .line 200
    return-void
.end method

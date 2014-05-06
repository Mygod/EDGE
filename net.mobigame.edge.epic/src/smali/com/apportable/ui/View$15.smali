.class Lcom/apportable/ui/View$15;
.super Ljava/lang/Object;
.source "View.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/View;->_setBackgroundColor(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/View;

.field final synthetic val$color:I


# direct methods
.method constructor <init>(Lcom/apportable/ui/View;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 548
    iput-object p1, p0, Lcom/apportable/ui/View$15;->this$0:Lcom/apportable/ui/View;

    iput p2, p0, Lcom/apportable/ui/View$15;->val$color:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 551
    iget-object v0, p0, Lcom/apportable/ui/View$15;->this$0:Lcom/apportable/ui/View;

    iget v1, p0, Lcom/apportable/ui/View$15;->val$color:I

    invoke-virtual {v0, v1}, Lcom/apportable/ui/View;->__setBackgroundColor(I)V

    .line 552
    return-void
.end method

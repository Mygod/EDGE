.class Lcom/apportable/ui/Control$3;
.super Ljava/lang/Object;
.source "Control.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Control;->sendEvent(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Control;

.field final synthetic val$e:I


# direct methods
.method constructor <init>(Lcom/apportable/ui/Control;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 94
    iput-object p1, p0, Lcom/apportable/ui/Control$3;->this$0:Lcom/apportable/ui/Control;

    iput p2, p0, Lcom/apportable/ui/Control$3;->val$e:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 97
    iget-object v0, p0, Lcom/apportable/ui/Control$3;->this$0:Lcom/apportable/ui/Control;

    iget-object v1, p0, Lcom/apportable/ui/Control$3;->this$0:Lcom/apportable/ui/Control;

    iget v1, v1, Lcom/apportable/ui/Control;->mObject:I

    iget v2, p0, Lcom/apportable/ui/Control$3;->val$e:I

    invoke-virtual {v0, v1, v2}, Lcom/apportable/ui/Control;->event(II)V

    .line 98
    return-void
.end method

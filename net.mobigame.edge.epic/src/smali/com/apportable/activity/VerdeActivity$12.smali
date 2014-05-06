.class Lcom/apportable/activity/VerdeActivity$12;
.super Ljava/lang/Object;
.source "VerdeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/activity/VerdeActivity;->onNewIntent(Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/activity/VerdeActivity;

.field final synthetic val$intent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lcom/apportable/activity/VerdeActivity;Landroid/content/Intent;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1015
    iput-object p1, p0, Lcom/apportable/activity/VerdeActivity$12;->this$0:Lcom/apportable/activity/VerdeActivity;

    iput-object p2, p0, Lcom/apportable/activity/VerdeActivity$12;->val$intent:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 1018
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity$12;->val$intent:Landroid/content/Intent;

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1019
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity$12;->val$intent:Landroid/content/Intent;

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    #calls: Lcom/apportable/activity/VerdeActivity;->nativeHandleUri(Ljava/lang/String;)V
    invoke-static {v0}, Lcom/apportable/activity/VerdeActivity;->access$1200(Ljava/lang/String;)V

    .line 1021
    :cond_0
    return-void
.end method

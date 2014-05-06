.class Lcom/apportable/activity/VerdeActivity$11;
.super Ljava/lang/Object;
.source "VerdeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/activity/VerdeActivity;->onActivityResult(IILandroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/activity/VerdeActivity;

.field final synthetic val$data:Landroid/content/Intent;

.field final synthetic val$requestCode:I

.field final synthetic val$resultCode:I


# direct methods
.method constructor <init>(Lcom/apportable/activity/VerdeActivity;IILandroid/content/Intent;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 984
    iput-object p1, p0, Lcom/apportable/activity/VerdeActivity$11;->this$0:Lcom/apportable/activity/VerdeActivity;

    iput p2, p0, Lcom/apportable/activity/VerdeActivity$11;->val$requestCode:I

    iput p3, p0, Lcom/apportable/activity/VerdeActivity$11;->val$resultCode:I

    iput-object p4, p0, Lcom/apportable/activity/VerdeActivity$11;->val$data:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 987
    iget v0, p0, Lcom/apportable/activity/VerdeActivity$11;->val$requestCode:I

    iget v1, p0, Lcom/apportable/activity/VerdeActivity$11;->val$resultCode:I

    iget-object v2, p0, Lcom/apportable/activity/VerdeActivity$11;->val$data:Landroid/content/Intent;

    #calls: Lcom/apportable/activity/VerdeActivity;->nativeOnActivityResult(IILandroid/content/Intent;)V
    invoke-static {v0, v1, v2}, Lcom/apportable/activity/VerdeActivity;->access$1100(IILandroid/content/Intent;)V

    .line 988
    return-void
.end method

.class Lcom/apportable/activity/VerdeActivity$8;
.super Ljava/lang/Object;
.source "VerdeActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/activity/VerdeActivity;->initializeDownloadUI()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/activity/VerdeActivity;


# direct methods
.method constructor <init>(Lcom/apportable/activity/VerdeActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 784
    iput-object p1, p0, Lcom/apportable/activity/VerdeActivity$8;->this$0:Lcom/apportable/activity/VerdeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 787
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity$8;->this$0:Lcom/apportable/activity/VerdeActivity;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.WIFI_SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/apportable/activity/VerdeActivity;->startActivity(Landroid/content/Intent;)V

    .line 788
    return-void
.end method

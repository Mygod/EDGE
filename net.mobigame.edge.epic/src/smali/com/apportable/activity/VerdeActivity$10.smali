.class Lcom/apportable/activity/VerdeActivity$10;
.super Ljava/lang/Object;
.source "VerdeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/activity/VerdeActivity;->expansionFileDownloadCompleted()V
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
    .line 827
    iput-object p1, p0, Lcom/apportable/activity/VerdeActivity$10;->this$0:Lcom/apportable/activity/VerdeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 829
    invoke-static {}, Lcom/apportable/activity/VerdeActivity;->getActivity()Lcom/apportable/activity/VerdeActivity;

    move-result-object v1

    const-string v2, "alarm"

    invoke-virtual {v1, v2}, Lcom/apportable/activity/VerdeActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 830
    .local v0, mgr:Landroid/app/AlarmManager;
    const/4 v1, 0x1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    add-long/2addr v2, v4

    iget-object v4, p0, Lcom/apportable/activity/VerdeActivity$10;->this$0:Lcom/apportable/activity/VerdeActivity;

    #getter for: Lcom/apportable/activity/VerdeActivity;->mRestartIntent:Landroid/app/PendingIntent;
    invoke-static {v4}, Lcom/apportable/activity/VerdeActivity;->access$1000(Lcom/apportable/activity/VerdeActivity;)Landroid/app/PendingIntent;

    move-result-object v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 831
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    .line 832
    return-void
.end method

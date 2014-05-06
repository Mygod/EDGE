.class Lcom/apportable/activity/VerdeActivity$7;
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
    .line 770
    iput-object p1, p0, Lcom/apportable/activity/VerdeActivity$7;->this$0:Lcom/apportable/activity/VerdeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 773
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity$7;->this$0:Lcom/apportable/activity/VerdeActivity;

    #getter for: Lcom/apportable/activity/VerdeActivity;->mRemoteService:Lcom/google/android/vending/expansion/downloader/IDownloaderService;
    invoke-static {v0}, Lcom/apportable/activity/VerdeActivity;->access$500(Lcom/apportable/activity/VerdeActivity;)Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 774
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity$7;->this$0:Lcom/apportable/activity/VerdeActivity;

    #getter for: Lcom/apportable/activity/VerdeActivity;->mDownloadStatePaused:Z
    invoke-static {v0}, Lcom/apportable/activity/VerdeActivity;->access$600(Lcom/apportable/activity/VerdeActivity;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 775
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity$7;->this$0:Lcom/apportable/activity/VerdeActivity;

    #getter for: Lcom/apportable/activity/VerdeActivity;->mRemoteService:Lcom/google/android/vending/expansion/downloader/IDownloaderService;
    invoke-static {v0}, Lcom/apportable/activity/VerdeActivity;->access$500(Lcom/apportable/activity/VerdeActivity;)Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/vending/expansion/downloader/IDownloaderService;->requestContinueDownload()V

    .line 779
    :goto_0
    iget-object v1, p0, Lcom/apportable/activity/VerdeActivity$7;->this$0:Lcom/apportable/activity/VerdeActivity;

    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity$7;->this$0:Lcom/apportable/activity/VerdeActivity;

    #getter for: Lcom/apportable/activity/VerdeActivity;->mDownloadStatePaused:Z
    invoke-static {v0}, Lcom/apportable/activity/VerdeActivity;->access$600(Lcom/apportable/activity/VerdeActivity;)Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x1

    :goto_1
    #calls: Lcom/apportable/activity/VerdeActivity;->setButtonPausedState(Z)V
    invoke-static {v1, v0}, Lcom/apportable/activity/VerdeActivity;->access$700(Lcom/apportable/activity/VerdeActivity;Z)V

    .line 781
    :cond_0
    return-void

    .line 777
    :cond_1
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity$7;->this$0:Lcom/apportable/activity/VerdeActivity;

    #getter for: Lcom/apportable/activity/VerdeActivity;->mRemoteService:Lcom/google/android/vending/expansion/downloader/IDownloaderService;
    invoke-static {v0}, Lcom/apportable/activity/VerdeActivity;->access$500(Lcom/apportable/activity/VerdeActivity;)Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/vending/expansion/downloader/IDownloaderService;->requestPauseDownload()V

    goto :goto_0

    .line 779
    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

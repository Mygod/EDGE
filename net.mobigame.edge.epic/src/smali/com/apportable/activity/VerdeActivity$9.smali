.class Lcom/apportable/activity/VerdeActivity$9;
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
    .line 792
    iput-object p1, p0, Lcom/apportable/activity/VerdeActivity$9;->this$0:Lcom/apportable/activity/VerdeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 795
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity$9;->this$0:Lcom/apportable/activity/VerdeActivity;

    #getter for: Lcom/apportable/activity/VerdeActivity;->mRemoteService:Lcom/google/android/vending/expansion/downloader/IDownloaderService;
    invoke-static {v0}, Lcom/apportable/activity/VerdeActivity;->access$500(Lcom/apportable/activity/VerdeActivity;)Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/google/android/vending/expansion/downloader/IDownloaderService;->setDownloadFlags(I)V

    .line 796
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity$9;->this$0:Lcom/apportable/activity/VerdeActivity;

    #getter for: Lcom/apportable/activity/VerdeActivity;->mRemoteService:Lcom/google/android/vending/expansion/downloader/IDownloaderService;
    invoke-static {v0}, Lcom/apportable/activity/VerdeActivity;->access$500(Lcom/apportable/activity/VerdeActivity;)Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/vending/expansion/downloader/IDownloaderService;->requestContinueDownload()V

    .line 797
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity$9;->this$0:Lcom/apportable/activity/VerdeActivity;

    #getter for: Lcom/apportable/activity/VerdeActivity;->mApproveCellular:Landroid/widget/ScrollView;
    invoke-static {v0}, Lcom/apportable/activity/VerdeActivity;->access$800(Lcom/apportable/activity/VerdeActivity;)Landroid/widget/ScrollView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setVisibility(I)V

    .line 798
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity$9;->this$0:Lcom/apportable/activity/VerdeActivity;

    #getter for: Lcom/apportable/activity/VerdeActivity;->mProgressView:Landroid/widget/ScrollView;
    invoke-static {v0}, Lcom/apportable/activity/VerdeActivity;->access$900(Lcom/apportable/activity/VerdeActivity;)Landroid/widget/ScrollView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setVisibility(I)V

    .line 799
    return-void
.end method

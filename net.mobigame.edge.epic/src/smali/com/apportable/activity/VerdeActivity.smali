.class public Lcom/apportable/activity/VerdeActivity;
.super Lcom/apportable/activity/AccelerometerActivity;
.source "VerdeActivity.java"

# interfaces
.implements Lcom/google/android/vending/expansion/downloader/IDownloaderClient;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/apportable/activity/VerdeActivity$XAPKFile;
    }
.end annotation


# static fields
.field private static TAG:Ljava/lang/String;

.field private static theVerdeActivity:Lcom/apportable/activity/VerdeActivity;


# instance fields
.field private handler:Landroid/os/Handler;

.field private heightDiff:I

.field private mAppReady:Z

.field private mApproveCellular:Landroid/widget/ScrollView;

.field private mAverageSpeed:Landroid/widget/TextView;

.field private mCurrentSplashPath:Ljava/lang/String;

.field private mDashboard:Landroid/view/View;

.field private mDownloadState:I

.field private mDownloadStatePaused:Z

.field private mDownloaderClientStub:Lcom/google/android/vending/expansion/downloader/IStub;

.field private mPB:Landroid/widget/ProgressBar;

.field private mPauseButton:Landroid/widget/Button;

.field private mPaused:Z

.field private mProgressFraction:Landroid/widget/TextView;

.field private mProgressPercent:Landroid/widget/TextView;

.field private mProgressView:Landroid/widget/ScrollView;

.field private mRemoteService:Lcom/google/android/vending/expansion/downloader/IDownloaderService;

.field private mRequestedOrientation:I

.field private mRestartIntent:Landroid/app/PendingIntent;

.field private mResumeOnCell:Landroid/widget/Button;

.field private mStatusText:Landroid/widget/TextView;

.field private mTimeRemaining:Landroid/widget/TextView;

.field private mWiFiSettingsButton:Landroid/widget/Button;

.field private rootOfAllEvil:Landroid/widget/FrameLayout;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 74
    const-string v0, "VerdeActivity"

    sput-object v0, Lcom/apportable/activity/VerdeActivity;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 132
    invoke-direct {p0}, Lcom/apportable/activity/AccelerometerActivity;-><init>()V

    .line 103
    iput-boolean v0, p0, Lcom/apportable/activity/VerdeActivity;->mPaused:Z

    .line 104
    iput v0, p0, Lcom/apportable/activity/VerdeActivity;->heightDiff:I

    .line 133
    sput-object p0, Lcom/apportable/activity/VerdeActivity;->theVerdeActivity:Lcom/apportable/activity/VerdeActivity;

    .line 136
    iput-boolean v0, p0, Lcom/apportable/activity/VerdeActivity;->mAppReady:Z

    .line 137
    return-void
.end method

.method static synthetic access$000(Lcom/apportable/activity/VerdeActivity;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 73
    iget v0, p0, Lcom/apportable/activity/VerdeActivity;->heightDiff:I

    return v0
.end method

.method static synthetic access$002(Lcom/apportable/activity/VerdeActivity;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 73
    iput p1, p0, Lcom/apportable/activity/VerdeActivity;->heightDiff:I

    return p1
.end method

.method static synthetic access$100(Landroid/content/res/Configuration;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 73
    invoke-static {p0}, Lcom/apportable/activity/VerdeActivity;->nativeOnConfigurationChanged(Landroid/content/res/Configuration;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/apportable/activity/VerdeActivity;)Landroid/app/PendingIntent;
    .locals 1
    .parameter "x0"

    .prologue
    .line 73
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity;->mRestartIntent:Landroid/app/PendingIntent;

    return-object v0
.end method

.method static synthetic access$1100(IILandroid/content/Intent;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 73
    invoke-static {p0, p1, p2}, Lcom/apportable/activity/VerdeActivity;->nativeOnActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$1200(Ljava/lang/String;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 73
    invoke-static {p0}, Lcom/apportable/activity/VerdeActivity;->nativeHandleUri(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    sget-object v0, Lcom/apportable/activity/VerdeActivity;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/apportable/activity/VerdeActivity;)Landroid/widget/FrameLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 73
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity;->rootOfAllEvil:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$400(Lcom/apportable/activity/VerdeActivity;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 73
    iget v0, p0, Lcom/apportable/activity/VerdeActivity;->mRequestedOrientation:I

    return v0
.end method

.method static synthetic access$402(Lcom/apportable/activity/VerdeActivity;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 73
    iput p1, p0, Lcom/apportable/activity/VerdeActivity;->mRequestedOrientation:I

    return p1
.end method

.method static synthetic access$500(Lcom/apportable/activity/VerdeActivity;)Lcom/google/android/vending/expansion/downloader/IDownloaderService;
    .locals 1
    .parameter "x0"

    .prologue
    .line 73
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity;->mRemoteService:Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    return-object v0
.end method

.method static synthetic access$600(Lcom/apportable/activity/VerdeActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 73
    iget-boolean v0, p0, Lcom/apportable/activity/VerdeActivity;->mDownloadStatePaused:Z

    return v0
.end method

.method static synthetic access$700(Lcom/apportable/activity/VerdeActivity;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 73
    invoke-direct {p0, p1}, Lcom/apportable/activity/VerdeActivity;->setButtonPausedState(Z)V

    return-void
.end method

.method static synthetic access$800(Lcom/apportable/activity/VerdeActivity;)Landroid/widget/ScrollView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 73
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity;->mApproveCellular:Landroid/widget/ScrollView;

    return-object v0
.end method

.method static synthetic access$900(Lcom/apportable/activity/VerdeActivity;)Landroid/widget/ScrollView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 73
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity;->mProgressView:Landroid/widget/ScrollView;

    return-object v0
.end method

.method private expansionFileDownloadCompleted()V
    .locals 4

    .prologue
    .line 826
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 827
    .local v0, handler:Landroid/os/Handler;
    new-instance v1, Lcom/apportable/activity/VerdeActivity$10;

    invoke-direct {v1, p0}, Lcom/apportable/activity/VerdeActivity$10;-><init>(Lcom/apportable/activity/VerdeActivity;)V

    .line 834
    .local v1, wrapUpDownload:Ljava/lang/Runnable;
    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 835
    return-void
.end method

.method public static getActivity()Lcom/apportable/activity/VerdeActivity;
    .locals 1

    .prologue
    .line 140
    sget-object v0, Lcom/apportable/activity/VerdeActivity;->theVerdeActivity:Lcom/apportable/activity/VerdeActivity;

    return-object v0
.end method

.method private initializeDownloadUI()V
    .locals 14

    .prologue
    const v13, 0x106000f

    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 682
    sget-object v7, Lcom/apportable/activity/VerdeActivity;->TAG:Ljava/lang/String;

    const-string v8, ">initializeDownloadUI"

    invoke-static {v7, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 683
    invoke-virtual {p0}, Lcom/apportable/activity/VerdeActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v7

    new-instance v8, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/apportable/activity/VerdeActivity;->getIntent()Landroid/content/Intent;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    invoke-virtual {p0}, Lcom/apportable/activity/VerdeActivity;->getIntent()Landroid/content/Intent;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Intent;->getFlags()I

    move-result v9

    invoke-static {v7, v11, v8, v9}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v7

    iput-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mRestartIntent:Landroid/app/PendingIntent;

    .line 685
    const-class v7, Lcom/apportable/expansion/downloader/ExpansionFileDownloaderService;

    invoke-static {p0, v7}, Lcom/google/android/vending/expansion/downloader/DownloaderClientMarshaller;->CreateStub(Lcom/google/android/vending/expansion/downloader/IDownloaderClient;Ljava/lang/Class;)Lcom/google/android/vending/expansion/downloader/IStub;

    move-result-object v7

    iput-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mDownloaderClientStub:Lcom/google/android/vending/expansion/downloader/IStub;

    .line 687
    new-instance v7, Landroid/widget/ScrollView;

    invoke-direct {v7, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mProgressView:Landroid/widget/ScrollView;

    .line 688
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 689
    .local v5, ll:Landroid/widget/LinearLayout;
    invoke-virtual {v5, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 697
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mProgressView:Landroid/widget/ScrollView;

    invoke-virtual {v7, v13}, Landroid/widget/ScrollView;->setBackgroundResource(I)V

    .line 698
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mProgressView:Landroid/widget/ScrollView;

    invoke-virtual {v7, v5}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 700
    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 701
    .local v0, appIcon:Landroid/widget/ImageView;
    invoke-virtual {p0}, Lcom/apportable/activity/VerdeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const-string v8, "icon"

    const-string v9, "drawable"

    invoke-virtual {p0}, Lcom/apportable/activity/VerdeActivity;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v8, v9, v10}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    .line 702
    .local v4, drawableId:I
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 703
    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 705
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mStatusText:Landroid/widget/TextView;

    .line 706
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mStatusText:Landroid/widget/TextView;

    const-string v8, "Downloading..."

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 707
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mStatusText:Landroid/widget/TextView;

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 709
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mProgressPercent:Landroid/widget/TextView;

    .line 710
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mProgressPercent:Landroid/widget/TextView;

    const-string v8, ""

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 711
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mProgressPercent:Landroid/widget/TextView;

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 713
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mAverageSpeed:Landroid/widget/TextView;

    .line 714
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mAverageSpeed:Landroid/widget/TextView;

    const-string v8, ""

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 715
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mAverageSpeed:Landroid/widget/TextView;

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 717
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mTimeRemaining:Landroid/widget/TextView;

    .line 718
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mTimeRemaining:Landroid/widget/TextView;

    const-string v8, ""

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 719
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mTimeRemaining:Landroid/widget/TextView;

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 721
    new-instance v7, Landroid/widget/ProgressBar;

    const/4 v8, 0x0

    const v9, 0x1010078

    invoke-direct {v7, p0, v8, v9}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mPB:Landroid/widget/ProgressBar;

    .line 722
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mPB:Landroid/widget/ProgressBar;

    const/16 v8, 0xff

    invoke-virtual {v7, v8}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 723
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mPB:Landroid/widget/ProgressBar;

    invoke-virtual {v7, v11}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 724
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mPB:Landroid/widget/ProgressBar;

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 726
    new-instance v7, Landroid/widget/Button;

    invoke-direct {v7, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mPauseButton:Landroid/widget/Button;

    .line 727
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mPauseButton:Landroid/widget/Button;

    const-string v8, "Pause"

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 728
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mPauseButton:Landroid/widget/Button;

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 730
    new-instance v7, Landroid/widget/ScrollView;

    invoke-direct {v7, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mApproveCellular:Landroid/widget/ScrollView;

    .line 731
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mApproveCellular:Landroid/widget/ScrollView;

    invoke-virtual {v7, v13}, Landroid/widget/ScrollView;->setBackgroundResource(I)V

    .line 732
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 733
    .local v2, approveCellularLayout:Landroid/widget/LinearLayout;
    invoke-virtual {v2, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 734
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mApproveCellular:Landroid/widget/ScrollView;

    const/16 v8, 0x8

    invoke-virtual {v7, v8}, Landroid/widget/ScrollView;->setVisibility(I)V

    .line 736
    new-instance v1, Landroid/widget/ImageView;

    invoke-direct {v1, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 737
    .local v1, appIcon2:Landroid/widget/ImageView;
    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 738
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 740
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 741
    .local v3, approveCellularText:Landroid/widget/TextView;
    const-string v7, "Please approve downloading application resources via cellular network, or connect to a Wifi network"

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 742
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 744
    new-instance v7, Landroid/widget/Button;

    invoke-direct {v7, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mWiFiSettingsButton:Landroid/widget/Button;

    .line 745
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mWiFiSettingsButton:Landroid/widget/Button;

    const-string v8, "Wifi Settings"

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 746
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mWiFiSettingsButton:Landroid/widget/Button;

    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 748
    new-instance v6, Landroid/widget/Button;

    invoke-direct {v6, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 749
    .local v6, mResumeOnCell:Landroid/widget/Button;
    const-string v7, "Resume over Cellular Network"

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 750
    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 752
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mApproveCellular:Landroid/widget/ScrollView;

    invoke-virtual {v7, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 754
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->rootOfAllEvil:Landroid/widget/FrameLayout;

    iget-object v8, p0, Lcom/apportable/activity/VerdeActivity;->mProgressView:Landroid/widget/ScrollView;

    invoke-virtual {v7, v8}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 755
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->rootOfAllEvil:Landroid/widget/FrameLayout;

    iget-object v8, p0, Lcom/apportable/activity/VerdeActivity;->mApproveCellular:Landroid/widget/ScrollView;

    invoke-virtual {v7, v8}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 770
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mPauseButton:Landroid/widget/Button;

    new-instance v8, Lcom/apportable/activity/VerdeActivity$7;

    invoke-direct {v8, p0}, Lcom/apportable/activity/VerdeActivity$7;-><init>(Lcom/apportable/activity/VerdeActivity;)V

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 784
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mWiFiSettingsButton:Landroid/widget/Button;

    new-instance v8, Lcom/apportable/activity/VerdeActivity$8;

    invoke-direct {v8, p0}, Lcom/apportable/activity/VerdeActivity$8;-><init>(Lcom/apportable/activity/VerdeActivity;)V

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 792
    new-instance v7, Lcom/apportable/activity/VerdeActivity$9;

    invoke-direct {v7, p0}, Lcom/apportable/activity/VerdeActivity$9;-><init>(Lcom/apportable/activity/VerdeActivity;)V

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 802
    return-void
.end method

.method private static native nativeHandleUri(Ljava/lang/String;)V
.end method

.method private static native nativeOnActivityResult(IILandroid/content/Intent;)V
.end method

.method private static native nativeOnConfigurationChanged(Landroid/content/res/Configuration;)V
.end method

.method private static native nativeOnCreate(Ljava/lang/String;)V
.end method

.method private static native nativeOnDestroy()V
.end method

.method private static native nativeOnLowMemory()V
.end method

.method private static native nativeOnRestart()V
.end method

.method private static native nativeOnStart()V
.end method

.method private static native nativeOnStop()V
.end method

.method private static native nativeSetActivityObject(Lcom/apportable/activity/VerdeActivity;)V
.end method

.method private static native nativeSetAssetManager(Landroid/content/res/AssetManager;)V
.end method

.method private static native nativeSetExpansionFilePath(ILjava/lang/String;)V
.end method

.method private prefsUuid()Ljava/lang/String;
    .locals 5

    .prologue
    .line 465
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/apportable/activity/VerdeActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 466
    .local v1, prefs:Landroid/content/SharedPreferences;
    const-string v2, ""

    .line 467
    .local v2, uuid:Ljava/lang/String;
    const-string v3, "_uuid_"

    invoke-interface {v1, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 468
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 469
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    .line 470
    const-string v3, "_uuid_"

    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 471
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 475
    .end local v0           #editor:Landroid/content/SharedPreferences$Editor;
    :goto_0
    return-object v2

    .line 473
    :cond_0
    const-string v3, "_uuid_"

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method private setButtonPausedState(Z)V
    .locals 2
    .parameter "paused"

    .prologue
    .line 935
    iput-boolean p1, p0, Lcom/apportable/activity/VerdeActivity;->mDownloadStatePaused:Z

    .line 936
    if-eqz p1, :cond_0

    const-string v0, "Resume"

    .line 937
    .local v0, newString:Ljava/lang/String;
    :goto_0
    iget-object v1, p0, Lcom/apportable/activity/VerdeActivity;->mPauseButton:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 938
    return-void

    .line 936
    .end local v0           #newString:Ljava/lang/String;
    :cond_0
    const-string v0, "Pause"

    goto :goto_0
.end method

.method private setDownloadState(I)V
    .locals 2
    .parameter "newState"

    .prologue
    .line 928
    iget v0, p0, Lcom/apportable/activity/VerdeActivity;->mDownloadState:I

    if-eq v0, p1, :cond_0

    .line 929
    iput p1, p0, Lcom/apportable/activity/VerdeActivity;->mDownloadState:I

    .line 930
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity;->mStatusText:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/google/android/vending/expansion/downloader/Helpers;->getDownloaderStringResourceIDFromState(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 932
    :cond_0
    return-void
.end method

.method private setPaths(Ljava/lang/String;)V
    .locals 12
    .parameter "packageName"

    .prologue
    const/4 v11, 0x0

    .line 146
    iget-boolean v9, p0, Lcom/apportable/activity/VerdeActivity;->mAppReady:Z

    if-nez v9, :cond_1

    .line 196
    :cond_0
    :goto_0
    return-void

    .line 150
    :cond_1
    const-string v0, ""

    .line 151
    .local v0, apkFilePath:Ljava/lang/String;
    const/4 v1, 0x0

    .line 153
    .local v1, appInfo:Landroid/content/pm/ApplicationInfo;
    :try_start_0
    invoke-virtual {p0}, Lcom/apportable/activity/VerdeActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, p1, v10}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 158
    iget-object v0, v1, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 159
    const-string v9, "APK path"

    invoke-static {v9, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    invoke-static {v11, v0}, Lcom/apportable/activity/VerdeActivity;->nativeSetExpansionFilePath(ILjava/lang/String;)V

    .line 164
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v5

    .line 167
    .local v5, externalStorageDirectory:Ljava/io/File;
    if-eqz v5, :cond_0

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 168
    new-instance v3, Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Android/obb/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v3, v5, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 170
    .local v3, expansionFileDir:Ljava/io/File;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 171
    invoke-virtual {v3}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    .line 172
    .local v4, expansionFileDirEntries:[Ljava/io/File;
    const/4 v7, 0x0

    .line 173
    .local v7, mainExpansionFile:Ljava/io/File;
    const/4 v8, 0x0

    .line 174
    .local v8, patchExpansionFile:Ljava/io/File;
    const/4 v6, 0x0

    .local v6, i:I
    :goto_1
    array-length v9, v4

    if-ge v6, v9, :cond_4

    .line 175
    aget-object v9, v4, v6

    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    const-string v10, "main."

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 176
    const-string v9, "Main expansion file found"

    aget-object v10, v4, v6

    invoke-virtual {v10}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    aget-object v7, v4, v6

    .line 179
    :cond_2
    aget-object v9, v4, v6

    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    const-string v10, "patch."

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 180
    const-string v9, "Patch expansion file found"

    aget-object v10, v4, v6

    invoke-virtual {v10}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    aget-object v8, v4, v6

    .line 174
    :cond_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 154
    .end local v3           #expansionFileDir:Ljava/io/File;
    .end local v4           #expansionFileDirEntries:[Ljava/io/File;
    .end local v5           #externalStorageDirectory:Ljava/io/File;
    .end local v6           #i:I
    .end local v7           #mainExpansionFile:Ljava/io/File;
    .end local v8           #patchExpansionFile:Ljava/io/File;
    :catch_0
    move-exception v2

    .line 155
    .local v2, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v2}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 156
    new-instance v9, Ljava/lang/RuntimeException;

    const-string v10, "Unable to locate assets, aborting..."

    invoke-direct {v9, v10}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 185
    .end local v2           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v3       #expansionFileDir:Ljava/io/File;
    .restart local v4       #expansionFileDirEntries:[Ljava/io/File;
    .restart local v5       #externalStorageDirectory:Ljava/io/File;
    .restart local v6       #i:I
    .restart local v7       #mainExpansionFile:Ljava/io/File;
    .restart local v8       #patchExpansionFile:Ljava/io/File;
    :cond_4
    if-eqz v7, :cond_5

    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_5

    .line 186
    const-string v9, "Main Expansion File path"

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    const/4 v9, 0x1

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/apportable/activity/VerdeActivity;->nativeSetExpansionFilePath(ILjava/lang/String;)V

    .line 190
    :cond_5
    if-eqz v8, :cond_0

    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 191
    const-string v9, "Patch Expansion File path"

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    const/4 v9, 0x2

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/apportable/activity/VerdeActivity;->nativeSetExpansionFilePath(ILjava/lang/String;)V

    goto/16 :goto_0
.end method


# virtual methods
.method public _cacheDir()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1026
    invoke-virtual {p0}, Lcom/apportable/activity/VerdeActivity;->getCacheDir()Ljava/io/File;

    move-result-object v0

    .line 1027
    .local v0, dir:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public _getRequestedOrientation()I
    .locals 1

    .prologue
    .line 597
    invoke-virtual {p0}, Lcom/apportable/activity/VerdeActivity;->getRequestedOrientation()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 607
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 599
    :sswitch_0
    const/4 v0, 0x1

    goto :goto_0

    .line 601
    :sswitch_1
    const/4 v0, 0x2

    goto :goto_0

    .line 603
    :sswitch_2
    const/4 v0, 0x3

    goto :goto_0

    .line 605
    :sswitch_3
    const/4 v0, 0x4

    goto :goto_0

    .line 597
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_2
        0x1 -> :sswitch_0
        0x8 -> :sswitch_3
        0x9 -> :sswitch_1
    .end sparse-switch
.end method

.method public _setRequestedOrientation(I)V
    .locals 2
    .parameter "orientation"

    .prologue
    .line 612
    new-instance v0, Lcom/apportable/activity/VerdeActivity$6;

    invoke-direct {v0, p0, p1}, Lcom/apportable/activity/VerdeActivity$6;-><init>(Lcom/apportable/activity/VerdeActivity;I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/apportable/activity/VerdeActivity;->runOnThread(Ljava/lang/Runnable;I)V

    .line 638
    return-void
.end method

.method public createSharedContext(ILjavax/microedition/khronos/egl/EGLContext;)Ljavax/microedition/khronos/egl/EGLContext;
    .locals 1
    .parameter "api"
    .parameter "ctx"

    .prologue
    .line 1001
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/apportable/app/VerdeApplication;->getSurface()Lcom/apportable/gl/VerdeSurfaceView;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/apportable/gl/VerdeSurfaceView;->createSharedContext(ILjavax/microedition/khronos/egl/EGLContext;)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v0

    return-object v0
.end method

.method public destroyContext(Ljavax/microedition/khronos/egl/EGLContext;)Z
    .locals 1
    .parameter "ctx"

    .prologue
    .line 1005
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/apportable/app/VerdeApplication;->getSurface()Lcom/apportable/gl/VerdeSurfaceView;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/apportable/gl/VerdeSurfaceView;->destroyContext(Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v0

    return v0
.end method

.method public display()Ljavax/microedition/khronos/egl/EGLDisplay;
    .locals 1

    .prologue
    .line 507
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/apportable/app/VerdeApplication;->getSurface()Lcom/apportable/gl/VerdeSurfaceView;

    move-result-object v0

    iget-object v0, v0, Lcom/apportable/gl/VerdeSurfaceView;->mDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    return-object v0
.end method

.method expansionFilesDelivered()Z
    .locals 12

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 662
    sget-object v8, Lcom/apportable/activity/VerdeActivity;->TAG:Ljava/lang/String;

    const-string v9, ">expansionFilesDelivered"

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 663
    new-array v4, v7, [Lcom/apportable/activity/VerdeActivity$XAPKFile;

    new-instance v8, Lcom/apportable/activity/VerdeActivity$XAPKFile;

    invoke-static {}, Lcom/apportable/utils/MetaData;->getMetaData()Landroid/os/Bundle;

    move-result-object v9

    const-string v10, "apportable.expansion.main.version"

    invoke-virtual {v9, v10}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v9

    invoke-static {}, Lcom/apportable/utils/MetaData;->getMetaData()Landroid/os/Bundle;

    move-result-object v10

    const-string v11, "apportable.expansion.main.size"

    invoke-virtual {v10, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v10

    int-to-long v10, v10

    invoke-direct {v8, v7, v9, v10, v11}, Lcom/apportable/activity/VerdeActivity$XAPKFile;-><init>(ZIJ)V

    aput-object v8, v4, v6

    .line 667
    .local v4, xAPKS:[Lcom/apportable/activity/VerdeActivity$XAPKFile;
    move-object v0, v4

    .local v0, arr$:[Lcom/apportable/activity/VerdeActivity$XAPKFile;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v5, v0, v2

    .line 668
    .local v5, xf:Lcom/apportable/activity/VerdeActivity$XAPKFile;
    iget-boolean v8, v5, Lcom/apportable/activity/VerdeActivity$XAPKFile;->mIsMain:Z

    iget v9, v5, Lcom/apportable/activity/VerdeActivity$XAPKFile;->mFileVersion:I

    invoke-static {p0, v8, v9}, Lcom/google/android/vending/expansion/downloader/Helpers;->getExpansionAPKFileName(Landroid/content/Context;ZI)Ljava/lang/String;

    move-result-object v1

    .line 669
    .local v1, fileName:Ljava/lang/String;
    iget-wide v8, v5, Lcom/apportable/activity/VerdeActivity$XAPKFile;->mFileSize:J

    invoke-static {p0, v1, v8, v9, v6}, Lcom/google/android/vending/expansion/downloader/Helpers;->doesFileExist(Landroid/content/Context;Ljava/lang/String;JZ)Z

    move-result v8

    if-nez v8, :cond_0

    .line 670
    sget-object v7, Lcom/apportable/activity/VerdeActivity;->TAG:Ljava/lang/String;

    const-string v8, "<expansionFilesDelivered false"

    invoke-static {v7, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 675
    .end local v1           #fileName:Ljava/lang/String;
    .end local v5           #xf:Lcom/apportable/activity/VerdeActivity$XAPKFile;
    :goto_1
    return v6

    .line 667
    .restart local v1       #fileName:Ljava/lang/String;
    .restart local v5       #xf:Lcom/apportable/activity/VerdeActivity$XAPKFile;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 674
    .end local v1           #fileName:Ljava/lang/String;
    .end local v5           #xf:Lcom/apportable/activity/VerdeActivity$XAPKFile;
    :cond_1
    sget-object v6, Lcom/apportable/activity/VerdeActivity;->TAG:Ljava/lang/String;

    const-string v8, "<expansionFilesDelivered true"

    invoke-static {v6, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    move v6, v7

    .line 675
    goto :goto_1
.end method

.method public flushMetrics()V
    .locals 0

    .prologue
    .line 515
    invoke-static {}, Lcom/apportable/CrashReporter;->flushMetrics()V

    .line 516
    return-void
.end method

.method public gc()V
    .locals 0

    .prologue
    .line 496
    return-void
.end method

.method public getPrimaryContext()Ljavax/microedition/khronos/egl/EGLContext;
    .locals 1

    .prologue
    .line 993
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/apportable/app/VerdeApplication;->getSurface()Lcom/apportable/gl/VerdeSurfaceView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/apportable/gl/VerdeSurfaceView;->getPrimaryContext()Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v0

    return-object v0
.end method

.method public hasActivityForAction(Ljava/lang/String;)Z
    .locals 4
    .parameter "action"

    .prologue
    .line 566
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 567
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/apportable/activity/VerdeActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/high16 v3, 0x1

    invoke-virtual {v2, v0, v3}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    .line 568
    .local v1, list:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method hasExpansionFiles()Z
    .locals 2

    .prologue
    .line 653
    invoke-static {}, Lcom/apportable/utils/MetaData;->getMetaData()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "apportable.expansion.main.size"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_0

    .line 654
    sget-object v0, Lcom/apportable/activity/VerdeActivity;->TAG:Ljava/lang/String;

    const-string v1, "App has Expansion Files"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 655
    const/4 v0, 0x1

    .line 658
    :goto_0
    return v0

    .line 657
    :cond_0
    sget-object v0, Lcom/apportable/activity/VerdeActivity;->TAG:Ljava/lang/String;

    const-string v1, "App has no Expansion Files"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 658
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasSystemFeature(Ljava/lang/String;)I
    .locals 1
    .parameter "name"

    .prologue
    .line 557
    invoke-virtual {p0}, Lcom/apportable/activity/VerdeActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 558
    const/4 v0, 0x1

    .line 560
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hideSplashScreen()V
    .locals 1

    .prologue
    .line 588
    new-instance v0, Lcom/apportable/activity/VerdeActivity$5;

    invoke-direct {v0, p0}, Lcom/apportable/activity/VerdeActivity$5;-><init>(Lcom/apportable/activity/VerdeActivity;)V

    invoke-virtual {p0, v0}, Lcom/apportable/activity/VerdeActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 594
    return-void
.end method

.method public makeCurrentContext(Ljavax/microedition/khronos/egl/EGLContext;)Z
    .locals 1
    .parameter "ctx"

    .prologue
    .line 997
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/apportable/app/VerdeApplication;->getSurface()Lcom/apportable/gl/VerdeSurfaceView;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/apportable/gl/VerdeSurfaceView;->makeCurrentContext(Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v0

    return v0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 984
    new-instance v0, Lcom/apportable/activity/VerdeActivity$11;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/apportable/activity/VerdeActivity$11;-><init>(Lcom/apportable/activity/VerdeActivity;IILandroid/content/Intent;)V

    invoke-static {v0}, Lcom/apportable/utils/ThreadUtils;->runOnGlThread(Ljava/lang/Runnable;)V

    .line 990
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .parameter "newConfig"

    .prologue
    .line 451
    iget-boolean v0, p0, Lcom/apportable/activity/VerdeActivity;->mAppReady:Z

    if-eqz v0, :cond_0

    .line 452
    iget v0, p0, Lcom/apportable/activity/VerdeActivity;->mRequestedOrientation:I

    invoke-virtual {p0, v0}, Lcom/apportable/activity/VerdeActivity;->setRequestedOrientation(I)V

    .line 453
    new-instance v0, Lcom/apportable/activity/VerdeActivity$3;

    invoke-direct {v0, p0, p1}, Lcom/apportable/activity/VerdeActivity$3;-><init>(Lcom/apportable/activity/VerdeActivity;Landroid/content/res/Configuration;)V

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/apportable/activity/VerdeActivity;->runOnThread(Ljava/lang/Runnable;I)V

    .line 460
    :cond_0
    invoke-super {p0, p1}, Lcom/apportable/activity/AccelerometerActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 462
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 24
    .parameter "savedInstanceState"

    .prologue
    .line 201
    invoke-super/range {p0 .. p1}, Lcom/apportable/activity/AccelerometerActivity;->onCreate(Landroid/os/Bundle;)V

    .line 202
    new-instance v19, Landroid/os/Handler;

    invoke-direct/range {v19 .. v19}, Landroid/os/Handler;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/apportable/activity/VerdeActivity;->handler:Landroid/os/Handler;

    .line 205
    invoke-virtual/range {p0 .. p0}, Lcom/apportable/activity/VerdeActivity;->getWindow()Landroid/view/Window;

    move-result-object v19

    const/16 v20, 0x1

    invoke-virtual/range {v19 .. v20}, Landroid/view/Window;->requestFeature(I)Z

    .line 206
    invoke-virtual/range {p0 .. p0}, Lcom/apportable/activity/VerdeActivity;->getWindow()Landroid/view/Window;

    move-result-object v19

    const/16 v20, 0x400

    const/16 v21, 0x400

    invoke-virtual/range {v19 .. v21}, Landroid/view/Window;->setFlags(II)V

    .line 208
    new-instance v19, Landroid/widget/FrameLayout;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/apportable/activity/VerdeActivity;->rootOfAllEvil:Landroid/widget/FrameLayout;

    .line 209
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/activity/VerdeActivity;->rootOfAllEvil:Landroid/widget/FrameLayout;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/apportable/activity/VerdeActivity;->setContentView(Landroid/view/View;)V

    .line 211
    const v19, 0x1020002

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/apportable/activity/VerdeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v19

    check-cast v19, Landroid/view/ViewGroup;

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 212
    .local v3, activityRootView:Landroid/view/View;
    invoke-static {}, Lcom/apportable/utils/MetaData;->getMetaData()Landroid/os/Bundle;

    move-result-object v19

    const-string v20, "apportable.ui.resizeOnKeyboard"

    invoke-virtual/range {v19 .. v20}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_0

    .line 213
    invoke-virtual {v3}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v19

    new-instance v20, Lcom/apportable/activity/VerdeActivity$1;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v3}, Lcom/apportable/activity/VerdeActivity$1;-><init>(Lcom/apportable/activity/VerdeActivity;Landroid/view/View;)V

    invoke-virtual/range {v19 .. v20}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 234
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/activity/VerdeActivity;->rootOfAllEvil:Landroid/widget/FrameLayout;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/apportable/app/SplashScreen;->show(Landroid/widget/FrameLayout;)V

    .line 236
    invoke-static/range {p0 .. p0}, Lcom/android/ViewServer;->get(Landroid/content/Context;)Lcom/android/ViewServer;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/android/ViewServer;->addWindow(Landroid/app/Activity;)V

    .line 238
    invoke-static {}, Lcom/apportable/LibraryManager;->loadLibraries()V

    .line 239
    invoke-virtual/range {p0 .. p0}, Lcom/apportable/activity/VerdeActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/apportable/activity/VerdeActivity;->nativeSetAssetManager(Landroid/content/res/AssetManager;)V

    .line 240
    invoke-static/range {p0 .. p0}, Lcom/apportable/activity/VerdeActivity;->nativeSetActivityObject(Lcom/apportable/activity/VerdeActivity;)V

    .line 246
    invoke-virtual/range {p0 .. p0}, Lcom/apportable/activity/VerdeActivity;->getApplication()Landroid/app/Application;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v13

    .line 247
    .local v13, packageName:Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/apportable/activity/VerdeActivity;->hasExpansionFiles()Z

    move-result v19

    if-eqz v19, :cond_6

    .line 248
    invoke-virtual/range {p0 .. p0}, Lcom/apportable/activity/VerdeActivity;->expansionFilesDelivered()Z

    move-result v19

    if-eqz v19, :cond_1

    .line 249
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/apportable/activity/VerdeActivity;->mAppReady:Z

    .line 250
    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/apportable/activity/VerdeActivity;->setPaths(Ljava/lang/String;)V

    .line 257
    :cond_1
    :goto_0
    invoke-static {}, Lcom/apportable/CrashReporter;->setupTracking()V

    .line 259
    invoke-virtual/range {p0 .. p0}, Lcom/apportable/activity/VerdeActivity;->hasExpansionFiles()Z

    move-result v19

    if-eqz v19, :cond_7

    invoke-virtual/range {p0 .. p0}, Lcom/apportable/activity/VerdeActivity;->expansionFilesDelivered()Z

    move-result v19

    if-nez v19, :cond_7

    .line 260
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/apportable/activity/VerdeActivity;->mAppReady:Z

    .line 265
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/apportable/activity/VerdeActivity;->mAppReady:Z

    move/from16 v19, v0

    if-eqz v19, :cond_2

    .line 266
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/apportable/app/VerdeApplication;->getSurface()Lcom/apportable/gl/VerdeSurfaceView;

    move-result-object v8

    .line 268
    .local v8, glView:Lcom/apportable/gl/VerdeSurfaceView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/activity/VerdeActivity;->rootOfAllEvil:Landroid/widget/FrameLayout;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v0, v8, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 271
    new-instance v19, Lcom/apportable/activity/VerdeActivity$2;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v8}, Lcom/apportable/activity/VerdeActivity$2;-><init>(Lcom/apportable/activity/VerdeActivity;Lcom/apportable/gl/VerdeSurfaceView;)V

    move-object/from16 v0, v19

    invoke-virtual {v8, v0}, Lcom/apportable/gl/VerdeSurfaceView;->post(Ljava/lang/Runnable;)Z

    .line 280
    .end local v8           #glView:Lcom/apportable/gl/VerdeSurfaceView;
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/apportable/activity/VerdeActivity;->getWindow()Landroid/view/Window;

    move-result-object v19

    const/16 v20, 0x80

    invoke-virtual/range {v19 .. v20}, Landroid/view/Window;->addFlags(I)V

    .line 281
    sget v19, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v20, 0xb

    move/from16 v0, v19

    move/from16 v1, v20

    if-le v0, v1, :cond_3

    .line 282
    invoke-virtual/range {p0 .. p0}, Lcom/apportable/activity/VerdeActivity;->getWindow()Landroid/view/Window;

    move-result-object v19

    const/high16 v20, 0x100

    invoke-virtual/range {v19 .. v20}, Landroid/view/Window;->addFlags(I)V

    .line 284
    :cond_3
    invoke-static {}, Lcom/apportable/utils/MetaData;->getMetaData()Landroid/os/Bundle;

    move-result-object v12

    .line 285
    .local v12, metaData:Landroid/os/Bundle;
    const/16 v18, 0x0

    .line 286
    .local v18, updaterClassName:Ljava/lang/String;
    const-string v19, "apportable.updater"

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_4

    .line 287
    const-string v19, "apportable.updater"

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 290
    :cond_4
    if-eqz v18, :cond_8

    .line 293
    :try_start_0
    invoke-static/range {v18 .. v18}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v17

    .line 295
    .local v17, updaterClass:Ljava/lang/Class;
    const/16 v19, 0x0

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v19, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    .line 296
    .local v5, constructor:Ljava/lang/reflect/Constructor;,"Ljava/lang/reflect/Constructor<Landroid/os/AsyncTask<Landroid/app/Activity;Ljava/lang/Void;Ljava/lang/Void;>;>;"
    const/16 v19, 0x0

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Landroid/os/AsyncTask;

    .line 297
    .local v16, updater:Landroid/os/AsyncTask;,"Landroid/os/AsyncTask<Landroid/app/Activity;Ljava/lang/Void;Ljava/lang/Void;>;"
    sget-object v19, Lcom/apportable/activity/VerdeActivity;->TAG:Ljava/lang/String;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Updater "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " will now check for updates."

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 298
    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Landroid/app/Activity;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput-object p0, v19, v20

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 308
    .end local v5           #constructor:Ljava/lang/reflect/Constructor;,"Ljava/lang/reflect/Constructor<Landroid/os/AsyncTask<Landroid/app/Activity;Ljava/lang/Void;Ljava/lang/Void;>;>;"
    .end local v16           #updater:Landroid/os/AsyncTask;,"Landroid/os/AsyncTask<Landroid/app/Activity;Ljava/lang/Void;Ljava/lang/Void;>;"
    .end local v17           #updaterClass:Ljava/lang/Class;
    :goto_2
    invoke-virtual/range {p0 .. p0}, Lcom/apportable/activity/VerdeActivity;->hasExpansionFiles()Z

    move-result v19

    if-eqz v19, :cond_5

    invoke-virtual/range {p0 .. p0}, Lcom/apportable/activity/VerdeActivity;->expansionFilesDelivered()Z

    move-result v19

    if-nez v19, :cond_5

    .line 310
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lcom/apportable/activity/VerdeActivity;->getIntent()Landroid/content/Intent;

    move-result-object v11

    .line 311
    .local v11, launchIntent:Landroid/content/Intent;
    new-instance v10, Landroid/content/Intent;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v10, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 312
    .local v10, intentToLaunchThisActivityFromNotification:Landroid/content/Intent;
    const/high16 v19, 0x2

    move/from16 v0, v19

    invoke-virtual {v10, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 313
    invoke-virtual {v11}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 315
    invoke-virtual {v11}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    move-result-object v19

    if-eqz v19, :cond_9

    .line 316
    invoke-virtual {v11}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, i$:Ljava/util/Iterator;
    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_9

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 317
    .local v4, category:Ljava/lang/String;
    invoke-virtual {v10, v4}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    .line 331
    .end local v4           #category:Ljava/lang/String;
    .end local v9           #i$:Ljava/util/Iterator;
    .end local v10           #intentToLaunchThisActivityFromNotification:Landroid/content/Intent;
    .end local v11           #launchIntent:Landroid/content/Intent;
    :catch_0
    move-exception v6

    .line 332
    .local v6, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v19, Lcom/apportable/activity/VerdeActivity;->TAG:Ljava/lang/String;

    const-string v20, "Cannot find own package! MAYDAY!"

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 333
    invoke-virtual {v6}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 336
    .end local v6           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_5
    new-instance v19, Ljava/io/File;

    invoke-virtual/range {p0 .. p0}, Lcom/apportable/activity/VerdeActivity;->getFilesDir()Ljava/io/File;

    move-result-object v20

    const-string v21, "crash_reports"

    invoke-direct/range {v19 .. v21}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/apportable/activity/VerdeActivity;->nativeOnCreate(Ljava/lang/String;)V

    .line 338
    :goto_4
    return-void

    .line 253
    .end local v12           #metaData:Landroid/os/Bundle;
    .end local v18           #updaterClassName:Ljava/lang/String;
    :cond_6
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/apportable/activity/VerdeActivity;->mAppReady:Z

    .line 254
    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/apportable/activity/VerdeActivity;->setPaths(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 262
    :cond_7
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/apportable/activity/VerdeActivity;->mAppReady:Z

    goto/16 :goto_1

    .line 299
    .restart local v12       #metaData:Landroid/os/Bundle;
    .restart local v18       #updaterClassName:Ljava/lang/String;
    :catch_1
    move-exception v7

    .line 300
    .local v7, ex:Ljava/lang/Exception;
    sget-object v19, Lcom/apportable/activity/VerdeActivity;->TAG:Ljava/lang/String;

    const-string v20, "Exception while creating updater object.  Will continue without update!"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_2

    .line 303
    .end local v7           #ex:Ljava/lang/Exception;
    :cond_8
    sget-object v19, Lcom/apportable/activity/VerdeActivity;->TAG:Ljava/lang/String;

    const-string v20, "No updater."

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 322
    .restart local v10       #intentToLaunchThisActivityFromNotification:Landroid/content/Intent;
    .restart local v11       #launchIntent:Landroid/content/Intent;
    :cond_9
    const/16 v19, 0x0

    const/high16 v20, 0x800

    :try_start_2
    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-static {v0, v1, v10, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v14

    .line 324
    .local v14, pendingIntent:Landroid/app/PendingIntent;
    const-class v19, Lcom/apportable/expansion/downloader/ExpansionFileDownloaderService;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-static {v0, v14, v1}, Lcom/google/android/vending/expansion/downloader/DownloaderClientMarshaller;->startDownloadServiceIfRequired(Landroid/content/Context;Landroid/app/PendingIntent;Ljava/lang/Class;)I

    move-result v15

    .line 325
    .local v15, startResult:I
    sget-object v19, Lcom/apportable/activity/VerdeActivity;->TAG:Ljava/lang/String;

    const-string v20, "Intent start result %d"

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v20 .. v21}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    if-eqz v15, :cond_5

    .line 328
    invoke-direct/range {p0 .. p0}, Lcom/apportable/activity/VerdeActivity;->initializeDownloadUI()V
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_4
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 429
    invoke-static {p0}, Lcom/android/ViewServer;->get(Landroid/content/Context;)Lcom/android/ViewServer;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/ViewServer;->removeWindow(Landroid/app/Activity;)V

    .line 430
    invoke-static {}, Lcom/apportable/activity/VerdeActivity;->nativeOnDestroy()V

    .line 431
    invoke-static {}, Lcom/apportable/CrashReporter;->onDestroy()V

    .line 432
    invoke-super {p0}, Lcom/apportable/activity/AccelerometerActivity;->onDestroy()V

    .line 434
    return-void
.end method

.method public onDownloadProgress(Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;)V
    .locals 7
    .parameter "progress"

    .prologue
    const/16 v6, 0x8

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 809
    sget-object v0, Lcom/apportable/activity/VerdeActivity;->TAG:Ljava/lang/String;

    const-string v1, ">onDownloadProgress"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 810
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity;->mAverageSpeed:Landroid/widget/TextView;

    const-string v1, "%1$s KB/s"

    new-array v2, v4, [Ljava/lang/Object;

    iget v3, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mCurrentSpeed:F

    invoke-static {v3}, Lcom/google/android/vending/expansion/downloader/Helpers;->getSpeedString(F)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 811
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity;->mTimeRemaining:Landroid/widget/TextView;

    const-string v1, "Time remaining: %1$s"

    new-array v2, v4, [Ljava/lang/Object;

    iget-wide v3, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mTimeRemaining:J

    invoke-static {v3, v4}, Lcom/google/android/vending/expansion/downloader/Helpers;->getTimeRemaining(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 813
    iget-wide v0, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mOverallTotal:J

    iput-wide v0, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mOverallTotal:J

    .line 814
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity;->mPB:Landroid/widget/ProgressBar;

    iget-wide v1, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mOverallTotal:J

    shr-long/2addr v1, v6

    long-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 815
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity;->mPB:Landroid/widget/ProgressBar;

    iget-wide v1, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mOverallProgress:J

    shr-long/2addr v1, v6

    long-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 816
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity;->mProgressPercent:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v2, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mOverallProgress:J

    const-wide/16 v4, 0x64

    mul-long/2addr v2, v4

    iget-wide v4, p1, Lcom/google/android/vending/expansion/downloader/DownloadProgressInfo;->mOverallTotal:J

    div-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "%"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 820
    return-void
.end method

.method public onDownloadStateChanged(I)V
    .locals 10
    .parameter "newState"

    .prologue
    const/16 v6, 0x8

    const/4 v5, 0x0

    .line 842
    sget-object v7, Lcom/apportable/activity/VerdeActivity;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, ">onDownloadStateChanged:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 843
    invoke-direct {p0, p1}, Lcom/apportable/activity/VerdeActivity;->setDownloadState(I)V

    .line 845
    const/4 v4, 0x1

    .line 846
    .local v4, showDashboard:Z
    const/4 v3, 0x0

    .line 850
    .local v3, showCellMessage:Z
    sget-object v7, Lcom/apportable/activity/VerdeActivity;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Download state:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 851
    packed-switch p1, :pswitch_data_0

    .line 910
    :pswitch_0
    const/4 v2, 0x1

    .line 911
    .local v2, paused:Z
    const/4 v1, 0x1

    .line 912
    .local v1, indeterminate:Z
    const/4 v4, 0x1

    .line 918
    :goto_0
    if-eqz v3, :cond_1

    move v0, v5

    .line 919
    .local v0, cellMessageVisibility:I
    :goto_1
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mApproveCellular:Landroid/widget/ScrollView;

    invoke-virtual {v7}, Landroid/widget/ScrollView;->getVisibility()I

    move-result v7

    if-eq v7, v0, :cond_0

    .line 920
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mApproveCellular:Landroid/widget/ScrollView;

    invoke-virtual {v7, v0}, Landroid/widget/ScrollView;->setVisibility(I)V

    .line 921
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mProgressView:Landroid/widget/ScrollView;

    if-eqz v3, :cond_2

    :goto_2
    invoke-virtual {v7, v6}, Landroid/widget/ScrollView;->setVisibility(I)V

    .line 923
    :cond_0
    iget-object v5, p0, Lcom/apportable/activity/VerdeActivity;->mPB:Landroid/widget/ProgressBar;

    invoke-virtual {v5, v1}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 924
    invoke-direct {p0, v2}, Lcom/apportable/activity/VerdeActivity;->setButtonPausedState(Z)V

    .line 925
    .end local v0           #cellMessageVisibility:I
    :goto_3
    return-void

    .line 855
    .end local v1           #indeterminate:Z
    .end local v2           #paused:Z
    :pswitch_1
    const/4 v2, 0x0

    .line 856
    .restart local v2       #paused:Z
    const/4 v1, 0x1

    .line 857
    .restart local v1       #indeterminate:Z
    goto :goto_0

    .line 860
    .end local v1           #indeterminate:Z
    .end local v2           #paused:Z
    :pswitch_2
    const/4 v4, 0x1

    .line 861
    const/4 v2, 0x0

    .line 862
    .restart local v2       #paused:Z
    const/4 v1, 0x1

    .line 863
    .restart local v1       #indeterminate:Z
    goto :goto_0

    .line 865
    .end local v1           #indeterminate:Z
    .end local v2           #paused:Z
    :pswitch_3
    const/4 v2, 0x0

    .line 866
    .restart local v2       #paused:Z
    const/4 v4, 0x1

    .line 867
    const/4 v1, 0x0

    .line 868
    .restart local v1       #indeterminate:Z
    goto :goto_0

    .line 874
    .end local v1           #indeterminate:Z
    .end local v2           #paused:Z
    :pswitch_4
    const/4 v2, 0x1

    .line 875
    .restart local v2       #paused:Z
    const/4 v4, 0x0

    .line 876
    const/4 v1, 0x0

    .line 877
    .restart local v1       #indeterminate:Z
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mTimeRemaining:Landroid/widget/TextView;

    const-string v8, "Download Failed"

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 881
    .end local v1           #indeterminate:Z
    .end local v2           #paused:Z
    :pswitch_5
    const/4 v4, 0x0

    .line 882
    const/4 v2, 0x1

    .line 883
    .restart local v2       #paused:Z
    const/4 v1, 0x0

    .line 884
    .restart local v1       #indeterminate:Z
    const/4 v3, 0x1

    .line 886
    goto :goto_0

    .line 888
    .end local v1           #indeterminate:Z
    .end local v2           #paused:Z
    :pswitch_6
    const/4 v2, 0x1

    .line 889
    .restart local v2       #paused:Z
    const/4 v1, 0x0

    .line 890
    .restart local v1       #indeterminate:Z
    goto :goto_0

    .line 892
    .end local v1           #indeterminate:Z
    .end local v2           #paused:Z
    :pswitch_7
    const/4 v2, 0x1

    .line 893
    .restart local v2       #paused:Z
    const/4 v1, 0x0

    .line 894
    .restart local v1       #indeterminate:Z
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mTimeRemaining:Landroid/widget/TextView;

    const-string v8, "Cannot download while roaming"

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 897
    .end local v1           #indeterminate:Z
    .end local v2           #paused:Z
    :pswitch_8
    const/4 v2, 0x1

    .line 898
    .restart local v2       #paused:Z
    const/4 v1, 0x0

    .line 899
    .restart local v1       #indeterminate:Z
    iget-object v7, p0, Lcom/apportable/activity/VerdeActivity;->mTimeRemaining:Landroid/widget/TextView;

    const-string v8, "Cannot download, SD card unavailable"

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 902
    .end local v1           #indeterminate:Z
    .end local v2           #paused:Z
    :pswitch_9
    const/4 v4, 0x0

    .line 903
    const/4 v2, 0x0

    .line 904
    .restart local v2       #paused:Z
    const/4 v1, 0x0

    .line 906
    .restart local v1       #indeterminate:Z
    iget-object v5, p0, Lcom/apportable/activity/VerdeActivity;->mTimeRemaining:Landroid/widget/TextView;

    const-string v6, "Download Complete"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 907
    invoke-direct {p0}, Lcom/apportable/activity/VerdeActivity;->expansionFileDownloadCompleted()V

    goto :goto_3

    :cond_1
    move v0, v6

    .line 918
    goto :goto_1

    .restart local v0       #cellMessageVisibility:I
    :cond_2
    move v6, v5

    .line 921
    goto :goto_2

    .line 851
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_9
        :pswitch_0
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_7
        :pswitch_0
        :pswitch_8
        :pswitch_4
        :pswitch_4
        :pswitch_0
        :pswitch_4
        :pswitch_4
    .end packed-switch
.end method

.method public onLowMemory()V
    .locals 1

    .prologue
    .line 438
    iget-boolean v0, p0, Lcom/apportable/activity/VerdeActivity;->mAppReady:Z

    if-nez v0, :cond_0

    .line 446
    :goto_0
    return-void

    .line 443
    :cond_0
    invoke-static {}, Lcom/apportable/activity/VerdeActivity;->nativeOnLowMemory()V

    .line 444
    invoke-super {p0}, Lcom/apportable/activity/AccelerometerActivity;->onLowMemory()V

    goto :goto_0
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 2
    .parameter "intent"

    .prologue
    .line 1015
    new-instance v0, Lcom/apportable/activity/VerdeActivity$12;

    invoke-direct {v0, p0, p1}, Lcom/apportable/activity/VerdeActivity$12;-><init>(Lcom/apportable/activity/VerdeActivity;Landroid/content/Intent;)V

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/apportable/activity/VerdeActivity;->runOnThread(Ljava/lang/Runnable;I)V

    .line 1023
    return-void
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 382
    invoke-super {p0}, Lcom/apportable/activity/AccelerometerActivity;->onPause()V

    .line 384
    iget-boolean v0, p0, Lcom/apportable/activity/VerdeActivity;->mAppReady:Z

    if-nez v0, :cond_0

    .line 392
    :goto_0
    return-void

    .line 388
    :cond_0
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/apportable/app/VerdeApplication;->getSurface()Lcom/apportable/gl/VerdeSurfaceView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/apportable/gl/VerdeSurfaceView;->onPause()V

    goto :goto_0
.end method

.method protected onRestart()V
    .locals 1

    .prologue
    .line 414
    invoke-super {p0}, Lcom/apportable/activity/AccelerometerActivity;->onRestart()V

    .line 416
    iget-boolean v0, p0, Lcom/apportable/activity/VerdeActivity;->mAppReady:Z

    if-nez v0, :cond_0

    .line 423
    :goto_0
    return-void

    .line 421
    :cond_0
    invoke-static {}, Lcom/apportable/activity/VerdeActivity;->nativeOnRestart()V

    goto :goto_0
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 364
    invoke-super {p0}, Lcom/apportable/activity/AccelerometerActivity;->onResume()V

    .line 366
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity;->mDownloaderClientStub:Lcom/google/android/vending/expansion/downloader/IStub;

    if-eqz v0, :cond_0

    .line 367
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity;->mDownloaderClientStub:Lcom/google/android/vending/expansion/downloader/IStub;

    invoke-interface {v0, p0}, Lcom/google/android/vending/expansion/downloader/IStub;->connect(Landroid/content/Context;)V

    .line 370
    :cond_0
    invoke-static {p0}, Lcom/android/ViewServer;->get(Landroid/content/Context;)Lcom/android/ViewServer;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/ViewServer;->setFocusedWindow(Landroid/app/Activity;)V

    .line 372
    iget-boolean v0, p0, Lcom/apportable/activity/VerdeActivity;->mAppReady:Z

    if-nez v0, :cond_1

    .line 377
    :goto_0
    return-void

    .line 375
    :cond_1
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/apportable/app/VerdeApplication;->getSurface()Lcom/apportable/gl/VerdeSurfaceView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/apportable/gl/VerdeSurfaceView;->onResume()V

    goto :goto_0
.end method

.method public onServiceConnected(Landroid/os/Messenger;)V
    .locals 3
    .parameter "m"

    .prologue
    .line 945
    sget-object v0, Lcom/apportable/activity/VerdeActivity;->TAG:Ljava/lang/String;

    const-string v1, ">onServiceConnected"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 946
    invoke-static {p1}, Lcom/google/android/vending/expansion/downloader/DownloaderServiceMarshaller;->CreateProxy(Landroid/os/Messenger;)Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    move-result-object v0

    iput-object v0, p0, Lcom/apportable/activity/VerdeActivity;->mRemoteService:Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    .line 947
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity;->mRemoteService:Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    iget-object v1, p0, Lcom/apportable/activity/VerdeActivity;->mDownloaderClientStub:Lcom/google/android/vending/expansion/downloader/IStub;

    invoke-interface {v1}, Lcom/google/android/vending/expansion/downloader/IStub;->getMessenger()Landroid/os/Messenger;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/vending/expansion/downloader/IDownloaderService;->onClientUpdated(Landroid/os/Messenger;)V

    .line 948
    sget-object v0, Lcom/apportable/activity/VerdeActivity;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<onServiceConnected:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apportable/activity/VerdeActivity;->mRemoteService:Lcom/google/android/vending/expansion/downloader/IDownloaderService;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 949
    return-void
.end method

.method protected onStart()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 342
    invoke-super {p0}, Lcom/apportable/activity/AccelerometerActivity;->onStart()V

    .line 343
    iget-boolean v0, p0, Lcom/apportable/activity/VerdeActivity;->mPaused:Z

    if-eqz v0, :cond_0

    .line 345
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity;->rootOfAllEvil:Landroid/widget/FrameLayout;

    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v1

    invoke-virtual {v1}, Lcom/apportable/app/VerdeApplication;->getSurface()Lcom/apportable/gl/VerdeSurfaceView;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 346
    iput-boolean v2, p0, Lcom/apportable/activity/VerdeActivity;->mPaused:Z

    .line 351
    :cond_0
    new-instance v0, Lcom/apportable/SocialShareManager;

    invoke-direct {v0, p0}, Lcom/apportable/SocialShareManager;-><init>(Landroid/content/Context;)V

    .line 353
    iget-boolean v0, p0, Lcom/apportable/activity/VerdeActivity;->mAppReady:Z

    if-nez v0, :cond_1

    .line 359
    :goto_0
    return-void

    .line 356
    :cond_1
    invoke-static {}, Lcom/apportable/activity/VerdeActivity;->nativeOnStart()V

    .line 357
    invoke-static {}, Lcom/apportable/CrashReporter;->onStart()V

    goto :goto_0
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 396
    invoke-super {p0}, Lcom/apportable/activity/AccelerometerActivity;->onStop()V

    .line 398
    iget-boolean v0, p0, Lcom/apportable/activity/VerdeActivity;->mAppReady:Z

    if-nez v0, :cond_0

    .line 410
    :goto_0
    return-void

    .line 403
    :cond_0
    iget-boolean v0, p0, Lcom/apportable/activity/VerdeActivity;->mPaused:Z

    if-nez v0, :cond_1

    .line 404
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/apportable/activity/VerdeActivity;->mPaused:Z

    .line 405
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/apportable/app/VerdeApplication;->getSurface()Lcom/apportable/gl/VerdeSurfaceView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/apportable/gl/VerdeSurfaceView;->loopForSurface()V

    .line 406
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity;->rootOfAllEvil:Landroid/widget/FrameLayout;

    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v1

    invoke-virtual {v1}, Lcom/apportable/app/VerdeApplication;->getSurface()Lcom/apportable/gl/VerdeSurfaceView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 408
    :cond_1
    invoke-static {}, Lcom/apportable/activity/VerdeActivity;->nativeOnStop()V

    goto :goto_0
.end method

.method public primaryContainer()Landroid/widget/FrameLayout;
    .locals 1

    .prologue
    .line 572
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity;->rootOfAllEvil:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 0
    .parameter "r"

    .prologue
    .line 1009
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 1010
    return-void
.end method

.method public runOnThread(Ljava/lang/Runnable;I)V
    .locals 1
    .parameter "r"
    .parameter "tid"

    .prologue
    .line 576
    packed-switch p2, :pswitch_data_0

    .line 585
    :goto_0
    return-void

    .line 578
    :pswitch_0
    invoke-virtual {p0, p1}, Lcom/apportable/activity/VerdeActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 581
    :pswitch_1
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/apportable/app/VerdeApplication;->getSurface()Lcom/apportable/gl/VerdeSurfaceView;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/apportable/gl/VerdeSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 576
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public sendEmail(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[B)V
    .locals 7
    .parameter "filename"
    .parameter "subject"
    .parameter "body"
    .parameter "mimeType"
    .parameter "bytes"

    .prologue
    .line 952
    const/4 v1, 0x0

    .line 953
    .local v1, file:Ljava/io/File;
    if-eqz p1, :cond_1

    .line 954
    const-string v5, "mounted"

    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 980
    :goto_0
    return-void

    .line 957
    :cond_0
    :try_start_0
    const-string v5, "file"

    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Lcom/apportable/activity/VerdeActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v6

    invoke-static {v5, p1, v6}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v1

    .line 958
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 959
    .local v2, fos:Ljava/io/FileOutputStream;
    const/4 v5, 0x0

    array-length v6, p5

    invoke-virtual {v2, p5, v5, v6}, Ljava/io/FileOutputStream;->write([BII)V

    .line 960
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 966
    .end local v2           #fos:Ljava/io/FileOutputStream;
    :cond_1
    new-instance v3, Landroid/content/Intent;

    const-string v5, "android.intent.action.SEND"

    invoke-direct {v3, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 967
    .local v3, mailIntent:Landroid/content/Intent;
    if-eqz v1, :cond_2

    .line 968
    invoke-virtual {v3, p4}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 969
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v4

    .line 970
    .local v4, uri:Landroid/net/Uri;
    const-string v5, "android.intent.extra.STREAM"

    invoke-virtual {v3, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 972
    .end local v4           #uri:Landroid/net/Uri;
    :cond_2
    if-eqz p4, :cond_3

    move-object v5, p4

    :goto_1
    invoke-virtual {v3, v5}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 973
    const-string v5, "android.intent.extra.SUBJECT"

    invoke-virtual {v3, v5, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 974
    const-string v5, "text/html"

    invoke-virtual {p4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 975
    const-string v5, "android.intent.extra.TEXT"

    invoke-static {p3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 979
    :goto_2
    const-string v5, "Send"

    invoke-static {v3, v5}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/apportable/activity/VerdeActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 961
    .end local v3           #mailIntent:Landroid/content/Intent;
    :catch_0
    move-exception v0

    .line 962
    .local v0, e:Ljava/io/IOException;
    goto :goto_0

    .line 972
    .end local v0           #e:Ljava/io/IOException;
    .restart local v3       #mailIntent:Landroid/content/Intent;
    :cond_3
    const-string v5, "text/plain"

    goto :goto_1

    .line 977
    :cond_4
    const-string v5, "android.intent.extra.TEXT"

    invoke-virtual {v3, v5, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_2
.end method

.method public setCrashDumpsEnabled(Z)V
    .locals 0
    .parameter "enabled"

    .prologue
    .line 523
    invoke-static {p1}, Lcom/apportable/CrashReporter;->setCrashDumpsEnabled(Z)V

    .line 524
    return-void
.end method

.method public setSystemUiVisibility(I)V
    .locals 1
    .parameter "value"

    .prologue
    .line 527
    new-instance v0, Lcom/apportable/activity/VerdeActivity$4;

    invoke-direct {v0, p0, p1}, Lcom/apportable/activity/VerdeActivity$4;-><init>(Lcom/apportable/activity/VerdeActivity;I)V

    invoke-virtual {p0, v0}, Lcom/apportable/activity/VerdeActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 543
    return-void
.end method

.method public setTrackingEnabled(Z)V
    .locals 0
    .parameter "enabled"

    .prologue
    .line 519
    invoke-static {p1}, Lcom/apportable/CrashReporter;->setTrackingEnabled(Z)V

    .line 520
    return-void
.end method

.method public swapBuffers()V
    .locals 1

    .prologue
    .line 499
    iget-boolean v0, p0, Lcom/apportable/activity/VerdeActivity;->mAppReady:Z

    if-nez v0, :cond_0

    .line 504
    :goto_0
    return-void

    .line 503
    :cond_0
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/apportable/app/VerdeApplication;->getSurface()Lcom/apportable/gl/VerdeSurfaceView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/apportable/gl/VerdeSurfaceView;->swapBuffers()V

    goto :goto_0
.end method

.method public trackEvent(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0
    .parameter "event"
    .parameter "propertiesBundle"

    .prologue
    .line 511
    invoke-static {p1, p2}, Lcom/apportable/CrashReporter;->trackEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 512
    return-void
.end method

.method public uuid()Ljava/lang/String;
    .locals 6

    .prologue
    .line 479
    const/4 v2, -0x1

    invoke-virtual {p0}, Lcom/apportable/activity/VerdeActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const-string v4, "android.permission.GET_ACCOUNTS"

    invoke-virtual {p0}, Lcom/apportable/activity/VerdeActivity;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    if-ne v2, v3, :cond_0

    .line 480
    invoke-direct {p0}, Lcom/apportable/activity/VerdeActivity;->prefsUuid()Ljava/lang/String;

    move-result-object v2

    .line 490
    :goto_0
    return-object v2

    .line 482
    :cond_0
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v1

    .line 483
    .local v1, am:Landroid/accounts/AccountManager;
    if-nez v1, :cond_1

    .line 484
    invoke-direct {p0}, Lcom/apportable/activity/VerdeActivity;->prefsUuid()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 486
    :cond_1
    const-string v2, "com.google"

    invoke-virtual {v1, v2}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v0

    .line 487
    .local v0, accounts:[Landroid/accounts/Account;
    array-length v2, v0

    if-nez v2, :cond_2

    .line 488
    invoke-direct {p0}, Lcom/apportable/activity/VerdeActivity;->prefsUuid()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 490
    :cond_2
    const/4 v2, 0x0

    aget-object v2, v0, v2

    iget-object v2, v2, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-static {v2}, Ljava/util/UUID;->nameUUIDFromBytes([B)Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

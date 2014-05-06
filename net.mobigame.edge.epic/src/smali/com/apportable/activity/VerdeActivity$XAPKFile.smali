.class Lcom/apportable/activity/VerdeActivity$XAPKFile;
.super Ljava/lang/Object;
.source "VerdeActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/apportable/activity/VerdeActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "XAPKFile"
.end annotation


# instance fields
.field public final mFileSize:J

.field public final mFileVersion:I

.field public final mIsMain:Z


# direct methods
.method constructor <init>(ZIJ)V
    .locals 0
    .parameter "isMain"
    .parameter "fileVersion"
    .parameter "fileSize"

    .prologue
    .line 645
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 646
    iput-boolean p1, p0, Lcom/apportable/activity/VerdeActivity$XAPKFile;->mIsMain:Z

    .line 647
    iput p2, p0, Lcom/apportable/activity/VerdeActivity$XAPKFile;->mFileVersion:I

    .line 648
    iput-wide p3, p0, Lcom/apportable/activity/VerdeActivity$XAPKFile;->mFileSize:J

    .line 649
    return-void
.end method

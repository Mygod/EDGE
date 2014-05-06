.class public Lcom/mixpanel/android/mpmetrics/MPConfig;
.super Ljava/lang/Object;
.source "MPConfig.java"


# static fields
.field public static BASE_ENDPOINT:Ljava/lang/String;

.field public static BULK_UPLOAD_LIMIT:I

.field public static DATA_EXPIRATION:I

.field public static DEBUG:Z

.field public static FLUSH_RATE:J

.field public static SUBMIT_THREAD_TTL:I

.field public static TEST_MODE:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 9
    const/16 v0, 0x28

    sput v0, Lcom/mixpanel/android/mpmetrics/MPConfig;->BULK_UPLOAD_LIMIT:I

    .line 12
    const-wide/32 v0, 0xea60

    sput-wide v0, Lcom/mixpanel/android/mpmetrics/MPConfig;->FLUSH_RATE:J

    .line 17
    const v0, 0xa4cb800

    sput v0, Lcom/mixpanel/android/mpmetrics/MPConfig;->DATA_EXPIRATION:I

    .line 21
    const-string v0, "http://api.mixpanel.com"

    sput-object v0, Lcom/mixpanel/android/mpmetrics/MPConfig;->BASE_ENDPOINT:Ljava/lang/String;

    .line 25
    const v0, 0x2bf20

    sput v0, Lcom/mixpanel/android/mpmetrics/MPConfig;->SUBMIT_THREAD_TTL:I

    .line 28
    sput-boolean v2, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    .line 31
    sput-boolean v2, Lcom/mixpanel/android/mpmetrics/MPConfig;->TEST_MODE:Z

    .line 7
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

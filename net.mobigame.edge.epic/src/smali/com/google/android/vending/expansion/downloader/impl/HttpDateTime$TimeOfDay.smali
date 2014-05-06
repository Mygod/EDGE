.class Lcom/google/android/vending/expansion/downloader/impl/HttpDateTime$TimeOfDay;
.super Ljava/lang/Object;
.source "HttpDateTime.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/vending/expansion/downloader/impl/HttpDateTime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TimeOfDay"
.end annotation


# instance fields
.field hour:I

.field minute:I

.field second:I


# direct methods
.method constructor <init>(III)V
    .locals 0
    .parameter "h"
    .parameter "m"
    .parameter "s"

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    iput p1, p0, Lcom/google/android/vending/expansion/downloader/impl/HttpDateTime$TimeOfDay;->hour:I

    .line 74
    iput p2, p0, Lcom/google/android/vending/expansion/downloader/impl/HttpDateTime$TimeOfDay;->minute:I

    .line 75
    iput p3, p0, Lcom/google/android/vending/expansion/downloader/impl/HttpDateTime$TimeOfDay;->second:I

    .line 76
    return-void
.end method

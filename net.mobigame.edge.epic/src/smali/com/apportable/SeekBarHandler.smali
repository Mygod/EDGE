.class public Lcom/apportable/SeekBarHandler;
.super Ljava/lang/Object;
.source "SeekBarHandler.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# instance fields
.field private context:J


# direct methods
.method public constructor <init>(J)V
    .locals 0
    .parameter "context"

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-wide p1, p0, Lcom/apportable/SeekBarHandler;->context:J

    .line 14
    return-void
.end method

.method private static native AndroidSeekBarEvent(JLandroid/widget/SeekBar;IIZ)V
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 6
    .parameter "seekBar"
    .parameter "progress"
    .parameter "fromUser"

    .prologue
    .line 18
    iget-wide v0, p0, Lcom/apportable/SeekBarHandler;->context:J

    const/4 v3, 0x0

    move-object v2, p1

    move v4, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lcom/apportable/SeekBarHandler;->AndroidSeekBarEvent(JLandroid/widget/SeekBar;IIZ)V

    .line 19
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 6
    .parameter "seekBar"

    .prologue
    const/4 v3, 0x1

    .line 23
    iget-wide v0, p0, Lcom/apportable/SeekBarHandler;->context:J

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v4

    move-object v2, p1

    move v5, v3

    invoke-static/range {v0 .. v5}, Lcom/apportable/SeekBarHandler;->AndroidSeekBarEvent(JLandroid/widget/SeekBar;IIZ)V

    .line 24
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 6
    .parameter "seekBar"

    .prologue
    .line 28
    iget-wide v0, p0, Lcom/apportable/SeekBarHandler;->context:J

    const/4 v3, -0x1

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v4

    const/4 v5, 0x1

    move-object v2, p1

    invoke-static/range {v0 .. v5}, Lcom/apportable/SeekBarHandler;->AndroidSeekBarEvent(JLandroid/widget/SeekBar;IIZ)V

    .line 29
    return-void
.end method

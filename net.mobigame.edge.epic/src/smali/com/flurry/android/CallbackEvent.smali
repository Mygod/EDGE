.class public final Lcom/flurry/android/CallbackEvent;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ADS_LOADED_FROM_CACHE:I = 0xc9

.field public static final ADS_UPDATED:I = 0xca

.field public static final ERROR_MARKET_LAUNCH:I = 0x65


# instance fields
.field private a:I

.field private b:J

.field private c:Ljava/lang/String;


# direct methods
.method constructor <init>(I)V
    .locals 2
    .parameter

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput p1, p0, Lcom/flurry/android/CallbackEvent;->a:I

    .line 22
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flurry/android/CallbackEvent;->b:J

    .line 23
    return-void
.end method


# virtual methods
.method public final getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/flurry/android/CallbackEvent;->c:Ljava/lang/String;

    return-object v0
.end method

.method public final getTimestamp()J
    .locals 2

    .prologue
    .line 51
    iget-wide v0, p0, Lcom/flurry/android/CallbackEvent;->b:J

    return-wide v0
.end method

.method public final getType()I
    .locals 1

    .prologue
    .line 30
    iget v0, p0, Lcom/flurry/android/CallbackEvent;->a:I

    return v0
.end method

.method public final setMessage(Ljava/lang/String;)V
    .locals 0
    .parameter

    .prologue
    .line 43
    iput-object p1, p0, Lcom/flurry/android/CallbackEvent;->c:Ljava/lang/String;

    .line 44
    return-void
.end method

.method public final setTimestamp(J)V
    .locals 0
    .parameter

    .prologue
    .line 56
    iput-wide p1, p0, Lcom/flurry/android/CallbackEvent;->b:J

    .line 57
    return-void
.end method

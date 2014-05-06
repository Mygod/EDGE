.class public final Lcom/flurry/android/AdImage;
.super Lcom/flurry/android/ak;
.source "SourceFile"


# instance fields
.field a:J

.field b:I

.field c:I

.field d:Ljava/lang/String;

.field e:[B


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Lcom/flurry/android/ak;-><init>()V

    return-void
.end method

.method constructor <init>(Ljava/io/DataInput;)V
    .locals 0
    .parameter

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/flurry/android/ak;-><init>()V

    .line 17
    invoke-virtual {p0, p1}, Lcom/flurry/android/AdImage;->a(Ljava/io/DataInput;)V

    .line 18
    return-void
.end method


# virtual methods
.method final a(Ljava/io/DataInput;)V
    .locals 2
    .parameter

    .prologue
    .line 48
    invoke-interface {p1}, Ljava/io/DataInput;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flurry/android/AdImage;->a:J

    .line 49
    invoke-interface {p1}, Ljava/io/DataInput;->readInt()I

    move-result v0

    iput v0, p0, Lcom/flurry/android/AdImage;->b:I

    .line 50
    invoke-interface {p1}, Ljava/io/DataInput;->readInt()I

    move-result v0

    iput v0, p0, Lcom/flurry/android/AdImage;->c:I

    .line 51
    invoke-interface {p1}, Ljava/io/DataInput;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/flurry/android/AdImage;->d:Ljava/lang/String;

    .line 53
    invoke-interface {p1}, Ljava/io/DataInput;->readInt()I

    move-result v0

    .line 54
    new-array v0, v0, [B

    iput-object v0, p0, Lcom/flurry/android/AdImage;->e:[B

    .line 55
    iget-object v0, p0, Lcom/flurry/android/AdImage;->e:[B

    invoke-interface {p1, v0}, Ljava/io/DataInput;->readFully([B)V

    .line 56
    return-void
.end method

.method public final getHeight()I
    .locals 1

    .prologue
    .line 32
    iget v0, p0, Lcom/flurry/android/AdImage;->c:I

    return v0
.end method

.method public final getId()J
    .locals 2

    .prologue
    .line 22
    iget-wide v0, p0, Lcom/flurry/android/AdImage;->a:J

    return-wide v0
.end method

.method public final getImageData()[B
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/flurry/android/AdImage;->e:[B

    return-object v0
.end method

.method public final getMimeType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/flurry/android/AdImage;->d:Ljava/lang/String;

    return-object v0
.end method

.method public final getWidth()I
    .locals 1

    .prologue
    .line 27
    iget v0, p0, Lcom/flurry/android/AdImage;->b:I

    return v0
.end method

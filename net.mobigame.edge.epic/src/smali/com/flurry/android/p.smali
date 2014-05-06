.class final Lcom/flurry/android/p;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field final a:Ljava/lang/String;

.field b:I

.field c:Lcom/flurry/android/w;

.field d:J

.field e:Ljava/util/List;

.field private f:B

.field private g:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method constructor <init>(Lcom/flurry/android/p;J)V
    .locals 2
    .parameter
    .parameter

    .prologue
    .line 27
    iget-object v0, p1, Lcom/flurry/android/p;->a:Ljava/lang/String;

    iget-byte v1, p1, Lcom/flurry/android/p;->f:B

    invoke-direct {p0, v0, v1, p2, p3}, Lcom/flurry/android/p;-><init>(Ljava/lang/String;BJ)V

    .line 28
    iget-object v0, p1, Lcom/flurry/android/p;->c:Lcom/flurry/android/w;

    iput-object v0, p0, Lcom/flurry/android/p;->c:Lcom/flurry/android/w;

    .line 29
    iget-wide v0, p1, Lcom/flurry/android/p;->d:J

    iput-wide v0, p0, Lcom/flurry/android/p;->d:J

    .line 30
    return-void
.end method

.method constructor <init>(Ljava/lang/String;BJ)V
    .locals 3
    .parameter
    .parameter
    .parameter

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/p;->e:Ljava/util/List;

    .line 23
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/flurry/android/p;->g:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 34
    iget-object v0, p0, Lcom/flurry/android/p;->g:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    iput v0, p0, Lcom/flurry/android/p;->b:I

    .line 35
    iput-object p1, p0, Lcom/flurry/android/p;->a:Ljava/lang/String;

    .line 36
    iput-byte p2, p0, Lcom/flurry/android/p;->f:B

    .line 38
    iget-object v0, p0, Lcom/flurry/android/p;->e:Ljava/util/List;

    new-instance v1, Lcom/flurry/android/f;

    const/4 v2, 0x1

    invoke-direct {v1, v2, p3, p4}, Lcom/flurry/android/f;-><init>(BJ)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    return-void
.end method


# virtual methods
.method final a()J
    .locals 2

    .prologue
    .line 54
    iget-object v0, p0, Lcom/flurry/android/p;->e:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/f;

    iget-wide v0, v0, Lcom/flurry/android/f;->b:J

    return-wide v0
.end method

.method final a(Lcom/flurry/android/f;)V
    .locals 1
    .parameter

    .prologue
    .line 43
    iget-object v0, p0, Lcom/flurry/android/p;->e:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    return-void
.end method

.method final a(Ljava/io/DataOutput;)V
    .locals 4
    .parameter

    .prologue
    const-wide/16 v1, 0x0

    .line 64
    iget v0, p0, Lcom/flurry/android/p;->b:I

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->writeShort(I)V

    .line 65
    iget-object v0, p0, Lcom/flurry/android/p;->a:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->writeUTF(Ljava/lang/String;)V

    .line 66
    iget-byte v0, p0, Lcom/flurry/android/p;->f:B

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->writeByte(I)V

    .line 68
    iget-object v0, p0, Lcom/flurry/android/p;->c:Lcom/flurry/android/w;

    if-nez v0, :cond_0

    .line 70
    invoke-interface {p1, v1, v2}, Ljava/io/DataOutput;->writeLong(J)V

    .line 71
    invoke-interface {p1, v1, v2}, Ljava/io/DataOutput;->writeLong(J)V

    .line 72
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->writeByte(I)V

    .line 83
    :goto_0
    iget-object v0, p0, Lcom/flurry/android/p;->e:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p1, v0}, Ljava/io/DataOutput;->writeShort(I)V

    .line 84
    iget-object v0, p0, Lcom/flurry/android/p;->e:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/f;

    .line 86
    iget-byte v2, v0, Lcom/flurry/android/f;->a:B

    invoke-interface {p1, v2}, Ljava/io/DataOutput;->writeByte(I)V

    .line 87
    iget-wide v2, v0, Lcom/flurry/android/f;->b:J

    invoke-interface {p1, v2, v3}, Ljava/io/DataOutput;->writeLong(J)V

    goto :goto_1

    .line 76
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/p;->c:Lcom/flurry/android/w;

    iget-wide v0, v0, Lcom/flurry/android/w;->a:J

    invoke-interface {p1, v0, v1}, Ljava/io/DataOutput;->writeLong(J)V

    .line 77
    iget-object v0, p0, Lcom/flurry/android/p;->c:Lcom/flurry/android/w;

    iget-wide v0, v0, Lcom/flurry/android/w;->e:J

    invoke-interface {p1, v0, v1}, Ljava/io/DataOutput;->writeLong(J)V

    .line 78
    iget-object v0, p0, Lcom/flurry/android/p;->c:Lcom/flurry/android/w;

    iget-object v0, v0, Lcom/flurry/android/w;->g:[B

    .line 79
    array-length v1, v0

    invoke-interface {p1, v1}, Ljava/io/DataOutput;->writeByte(I)V

    .line 80
    invoke-interface {p1, v0}, Ljava/io/DataOutput;->write([B)V

    goto :goto_0

    .line 89
    :cond_1
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 94
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "{hook: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/flurry/android/p;->a:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", ad: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/flurry/android/p;->c:Lcom/flurry/android/w;

    iget-object v2, v2, Lcom/flurry/android/w;->d:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", transitions: ["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    iget-object v0, p0, Lcom/flurry/android/p;->e:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/f;

    .line 98
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 99
    const-string v0, ","

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 101
    :cond_0
    const-string v0, "]}"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

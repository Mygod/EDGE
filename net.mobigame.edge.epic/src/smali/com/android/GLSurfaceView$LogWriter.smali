.class Lcom/android/GLSurfaceView$LogWriter;
.super Ljava/io/Writer;
.source "GLSurfaceView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/GLSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "LogWriter"
.end annotation


# instance fields
.field private mBuilder:Ljava/lang/StringBuilder;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 1988
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    .line 2017
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/android/GLSurfaceView$LogWriter;->mBuilder:Ljava/lang/StringBuilder;

    return-void
.end method

.method private flushBuilder()V
    .locals 3

    .prologue
    .line 2011
    iget-object v0, p0, Lcom/android/GLSurfaceView$LogWriter;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 2012
    const-string v0, "GLSurfaceView"

    iget-object v1, p0, Lcom/android/GLSurfaceView$LogWriter;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2013
    iget-object v0, p0, Lcom/android/GLSurfaceView$LogWriter;->mBuilder:Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/android/GLSurfaceView$LogWriter;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 2015
    :cond_0
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    .prologue
    .line 1991
    invoke-direct {p0}, Lcom/android/GLSurfaceView$LogWriter;->flushBuilder()V

    .line 1992
    return-void
.end method

.method public flush()V
    .locals 0

    .prologue
    .line 1995
    invoke-direct {p0}, Lcom/android/GLSurfaceView$LogWriter;->flushBuilder()V

    .line 1996
    return-void
.end method

.method public write([CII)V
    .locals 3
    .parameter "buf"
    .parameter "offset"
    .parameter "count"

    .prologue
    .line 1999
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, p3, :cond_1

    .line 2000
    add-int v2, p2, v1

    aget-char v0, p1, v2

    .line 2001
    .local v0, c:C
    const/16 v2, 0xa

    if-ne v0, v2, :cond_0

    .line 2002
    invoke-direct {p0}, Lcom/android/GLSurfaceView$LogWriter;->flushBuilder()V

    .line 1999
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2005
    :cond_0
    iget-object v2, p0, Lcom/android/GLSurfaceView$LogWriter;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 2008
    .end local v0           #c:C
    :cond_1
    return-void
.end method

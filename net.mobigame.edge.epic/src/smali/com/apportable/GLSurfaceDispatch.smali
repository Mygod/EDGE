.class public Lcom/apportable/GLSurfaceDispatch;
.super Ljava/lang/Object;
.source "GLSurfaceDispatch.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private context:J


# direct methods
.method public constructor <init>(J)V
    .locals 0
    .parameter "context"

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-wide p1, p0, Lcom/apportable/GLSurfaceDispatch;->context:J

    .line 12
    return-void
.end method

.method private static native AndroidGLSurfaceBindThread(J)V
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 17
    iget-wide v0, p0, Lcom/apportable/GLSurfaceDispatch;->context:J

    invoke-static {v0, v1}, Lcom/apportable/GLSurfaceDispatch;->AndroidGLSurfaceBindThread(J)V

    .line 18
    return-void
.end method

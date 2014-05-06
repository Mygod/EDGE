.class Lcom/apportable/gl/VerdeSurfaceView$2;
.super Ljava/lang/Object;
.source "VerdeSurfaceView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/gl/VerdeSurfaceView;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/gl/VerdeSurfaceView;


# direct methods
.method constructor <init>(Lcom/apportable/gl/VerdeSurfaceView;)V
    .locals 0
    .parameter

    .prologue
    .line 262
    iput-object p1, p0, Lcom/apportable/gl/VerdeSurfaceView$2;->this$0:Lcom/apportable/gl/VerdeSurfaceView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 265
    iget-object v0, p0, Lcom/apportable/gl/VerdeSurfaceView$2;->this$0:Lcom/apportable/gl/VerdeSurfaceView;

    #getter for: Lcom/apportable/gl/VerdeSurfaceView;->mRenderer:Lcom/apportable/gl/VerdeRenderer;
    invoke-static {v0}, Lcom/apportable/gl/VerdeSurfaceView;->access$300(Lcom/apportable/gl/VerdeSurfaceView;)Lcom/apportable/gl/VerdeRenderer;

    move-result-object v0

    iget-object v0, v0, Lcom/apportable/gl/VerdeRenderer;->mCanDispatchDraw:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 266
    return-void
.end method

.class Lcom/apportable/gl/VerdeSurfaceView$4;
.super Ljava/lang/Object;
.source "VerdeSurfaceView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/gl/VerdeSurfaceView;->deleteBackward()V
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
    .line 358
    iput-object p1, p0, Lcom/apportable/gl/VerdeSurfaceView$4;->this$0:Lcom/apportable/gl/VerdeSurfaceView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 361
    iget-object v0, p0, Lcom/apportable/gl/VerdeSurfaceView$4;->this$0:Lcom/apportable/gl/VerdeSurfaceView;

    #getter for: Lcom/apportable/gl/VerdeSurfaceView;->mRenderer:Lcom/apportable/gl/VerdeRenderer;
    invoke-static {v0}, Lcom/apportable/gl/VerdeSurfaceView;->access$300(Lcom/apportable/gl/VerdeSurfaceView;)Lcom/apportable/gl/VerdeRenderer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/apportable/gl/VerdeRenderer;->handleDeleteBackward()V

    .line 362
    return-void
.end method

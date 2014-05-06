.class Lcom/apportable/gl/VerdeSurfaceView$3;
.super Ljava/lang/Object;
.source "VerdeSurfaceView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/gl/VerdeSurfaceView;->insertText(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/gl/VerdeSurfaceView;

.field final synthetic val$text:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/apportable/gl/VerdeSurfaceView;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 349
    iput-object p1, p0, Lcom/apportable/gl/VerdeSurfaceView$3;->this$0:Lcom/apportable/gl/VerdeSurfaceView;

    iput-object p2, p0, Lcom/apportable/gl/VerdeSurfaceView$3;->val$text:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 352
    iget-object v0, p0, Lcom/apportable/gl/VerdeSurfaceView$3;->this$0:Lcom/apportable/gl/VerdeSurfaceView;

    #getter for: Lcom/apportable/gl/VerdeSurfaceView;->mRenderer:Lcom/apportable/gl/VerdeRenderer;
    invoke-static {v0}, Lcom/apportable/gl/VerdeSurfaceView;->access$300(Lcom/apportable/gl/VerdeSurfaceView;)Lcom/apportable/gl/VerdeRenderer;

    move-result-object v0

    iget-object v1, p0, Lcom/apportable/gl/VerdeSurfaceView$3;->val$text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/apportable/gl/VerdeRenderer;->handleInsertText(Ljava/lang/String;)V

    .line 353
    return-void
.end method

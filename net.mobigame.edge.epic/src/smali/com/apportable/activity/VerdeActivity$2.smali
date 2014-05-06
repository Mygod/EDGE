.class Lcom/apportable/activity/VerdeActivity$2;
.super Ljava/lang/Object;
.source "VerdeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/activity/VerdeActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/activity/VerdeActivity;

.field final synthetic val$glView:Lcom/apportable/gl/VerdeSurfaceView;


# direct methods
.method constructor <init>(Lcom/apportable/activity/VerdeActivity;Lcom/apportable/gl/VerdeSurfaceView;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 271
    iput-object p1, p0, Lcom/apportable/activity/VerdeActivity$2;->this$0:Lcom/apportable/activity/VerdeActivity;

    iput-object p2, p0, Lcom/apportable/activity/VerdeActivity$2;->val$glView:Lcom/apportable/gl/VerdeSurfaceView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 274
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity$2;->val$glView:Lcom/apportable/gl/VerdeSurfaceView;

    invoke-virtual {v0}, Lcom/apportable/gl/VerdeSurfaceView;->getHeight()I

    move-result v0

    sput v0, Lcom/apportable/gl/VerdeRenderer;->screenHeight:I

    .line 275
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity$2;->val$glView:Lcom/apportable/gl/VerdeSurfaceView;

    invoke-virtual {v0}, Lcom/apportable/gl/VerdeSurfaceView;->getWidth()I

    move-result v0

    sput v0, Lcom/apportable/gl/VerdeRenderer;->screenWidth:I

    .line 276
    return-void
.end method

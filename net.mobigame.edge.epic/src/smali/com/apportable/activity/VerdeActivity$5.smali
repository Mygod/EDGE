.class Lcom/apportable/activity/VerdeActivity$5;
.super Ljava/lang/Object;
.source "VerdeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/activity/VerdeActivity;->hideSplashScreen()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/activity/VerdeActivity;


# direct methods
.method constructor <init>(Lcom/apportable/activity/VerdeActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 588
    iput-object p1, p0, Lcom/apportable/activity/VerdeActivity$5;->this$0:Lcom/apportable/activity/VerdeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 591
    iget-object v0, p0, Lcom/apportable/activity/VerdeActivity$5;->this$0:Lcom/apportable/activity/VerdeActivity;

    #getter for: Lcom/apportable/activity/VerdeActivity;->rootOfAllEvil:Landroid/widget/FrameLayout;
    invoke-static {v0}, Lcom/apportable/activity/VerdeActivity;->access$300(Lcom/apportable/activity/VerdeActivity;)Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-static {v0}, Lcom/apportable/app/SplashScreen;->hide(Landroid/widget/FrameLayout;)V

    .line 592
    return-void
.end method

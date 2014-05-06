.class Lcom/apportable/activity/VerdeActivity$4;
.super Ljava/lang/Object;
.source "VerdeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/activity/VerdeActivity;->setSystemUiVisibility(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/activity/VerdeActivity;

.field final synthetic val$value:I


# direct methods
.method constructor <init>(Lcom/apportable/activity/VerdeActivity;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 527
    iput-object p1, p0, Lcom/apportable/activity/VerdeActivity$4;->this$0:Lcom/apportable/activity/VerdeActivity;

    iput p2, p0, Lcom/apportable/activity/VerdeActivity$4;->val$value:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    .line 532
    :try_start_0
    invoke-static {}, Lcom/apportable/activity/VerdeActivity;->getActivity()Lcom/apportable/activity/VerdeActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/apportable/activity/VerdeActivity;->getWindow()Landroid/view/Window;

    move-result-object v4

    .line 533
    .local v4, window:Landroid/view/Window;
    invoke-virtual {v4}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v5

    const v6, 0x1020002

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 534
    .local v3, view:Landroid/view/View;
    const-string v5, "android.view.View"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 535
    .local v0, classView:Ljava/lang/Class;
    const-string v5, "setSystemUiVisibility"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    invoke-virtual {v0, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 536
    .local v2, method:Ljava/lang/reflect/Method;
    if-eqz v2, :cond_0

    .line 537
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget v7, p0, Lcom/apportable/activity/VerdeActivity$4;->val$value:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v2, v3, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 541
    .end local v0           #classView:Ljava/lang/Class;
    .end local v2           #method:Ljava/lang/reflect/Method;
    .end local v3           #view:Landroid/view/View;
    .end local v4           #window:Landroid/view/Window;
    :cond_0
    :goto_0
    return-void

    .line 538
    :catch_0
    move-exception v1

    .line 539
    .local v1, e:Ljava/lang/Exception;
    invoke-static {}, Lcom/apportable/activity/VerdeActivity;->access$200()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Device does not support lights-out mode"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

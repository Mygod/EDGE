.class Lcom/apportable/ui/FullScreen$FullScreenRunner;
.super Ljava/lang/Object;
.source "FullScreen.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/apportable/ui/FullScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FullScreenRunner"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/FullScreen;

.field private value:I


# direct methods
.method public constructor <init>(Lcom/apportable/ui/FullScreen;I)V
    .locals 0
    .parameter
    .parameter "value"

    .prologue
    .line 32
    iput-object p1, p0, Lcom/apportable/ui/FullScreen$FullScreenRunner;->this$0:Lcom/apportable/ui/FullScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput p2, p0, Lcom/apportable/ui/FullScreen$FullScreenRunner;->value:I

    .line 34
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    .line 39
    :try_start_0
    invoke-static {}, Lcom/apportable/activity/VerdeActivity;->getActivity()Lcom/apportable/activity/VerdeActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/apportable/activity/VerdeActivity;->getWindow()Landroid/view/Window;

    move-result-object v4

    .line 40
    .local v4, window:Landroid/view/Window;
    invoke-virtual {v4}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v5

    const v6, 0x1020002

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 41
    .local v3, view:Landroid/view/View;
    const-string v5, "android.view.View"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 42
    .local v0, classView:Ljava/lang/Class;
    const-string v5, "setSystemUiVisibility"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    invoke-virtual {v0, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 43
    .local v2, method:Ljava/lang/reflect/Method;
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget v7, p0, Lcom/apportable/ui/FullScreen$FullScreenRunner;->value:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v2, v3, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    invoke-static {}, Lcom/apportable/ui/FullScreen;->access$000()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Set full screen to "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p0, Lcom/apportable/ui/FullScreen$FullScreenRunner;->value:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .end local v0           #classView:Ljava/lang/Class;
    .end local v2           #method:Ljava/lang/reflect/Method;
    .end local v3           #view:Landroid/view/View;
    .end local v4           #window:Landroid/view/Window;
    :goto_0
    return-void

    .line 45
    :catch_0
    move-exception v1

    .line 46
    .local v1, ex:Ljava/lang/Exception;
    invoke-static {}, Lcom/apportable/ui/FullScreen;->access$000()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Device does not support full screen"

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.class public Lcom/apportable/app/VerdeApplication;
.super Landroid/app/Application;
.source "VerdeApplication.java"


# static fields
.field private static sApp:Lcom/apportable/app/VerdeApplication;


# instance fields
.field private mGLView:Lcom/apportable/gl/VerdeSurfaceView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    .line 14
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/apportable/app/VerdeApplication;->mGLView:Lcom/apportable/gl/VerdeSurfaceView;

    .line 17
    sput-object p0, Lcom/apportable/app/VerdeApplication;->sApp:Lcom/apportable/app/VerdeApplication;

    .line 18
    return-void
.end method

.method public static getApplication()Lcom/apportable/app/VerdeApplication;
    .locals 1

    .prologue
    .line 21
    sget-object v0, Lcom/apportable/app/VerdeApplication;->sApp:Lcom/apportable/app/VerdeApplication;

    return-object v0
.end method


# virtual methods
.method public getSurface()Lcom/apportable/gl/VerdeSurfaceView;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/apportable/app/VerdeApplication;->mGLView:Lcom/apportable/gl/VerdeSurfaceView;

    if-nez v0, :cond_0

    .line 48
    new-instance v0, Lcom/apportable/gl/VerdeSurfaceView;

    invoke-direct {v0, p0}, Lcom/apportable/gl/VerdeSurfaceView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/apportable/app/VerdeApplication;->mGLView:Lcom/apportable/gl/VerdeSurfaceView;

    .line 50
    :cond_0
    iget-object v0, p0, Lcom/apportable/app/VerdeApplication;->mGLView:Lcom/apportable/gl/VerdeSurfaceView;

    return-object v0
.end method

.method public getWindowManager()Landroid/view/WindowManager;
    .locals 1

    .prologue
    .line 54
    const-string v0, "window"

    invoke-virtual {p0, v0}, Lcom/apportable/app/VerdeApplication;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    return-object v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .parameter "newConfig"

    .prologue
    .line 32
    invoke-super {p0, p1}, Landroid/app/Application;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 33
    return-void
.end method

.method public onCreate()V
    .locals 2

    .prologue
    .line 26
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 27
    const-string v0, "VerdeApplication"

    const-string v1, "onCreate"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    return-void
.end method

.method public onLowMemory()V
    .locals 0

    .prologue
    .line 37
    invoke-super {p0}, Landroid/app/Application;->onLowMemory()V

    .line 38
    return-void
.end method

.method public onTerminate()V
    .locals 2

    .prologue
    .line 42
    const-string v0, "VerdeApplication"

    const-string v1, "onTerminate"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    invoke-super {p0}, Landroid/app/Application;->onTerminate()V

    .line 44
    return-void
.end method

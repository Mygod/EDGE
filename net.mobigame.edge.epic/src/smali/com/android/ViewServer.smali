.class public Lcom/android/ViewServer;
.super Ljava/lang/Object;
.source "ViewServer.java"


# static fields
.field private static sServer:Lcom/android/ViewServer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get(Landroid/content/Context;)Lcom/android/ViewServer;
    .locals 1
    .parameter "context"

    .prologue
    .line 13
    sget-object v0, Lcom/android/ViewServer;->sServer:Lcom/android/ViewServer;

    if-nez v0, :cond_0

    .line 14
    new-instance v0, Lcom/android/ViewServer;

    invoke-direct {v0}, Lcom/android/ViewServer;-><init>()V

    sput-object v0, Lcom/android/ViewServer;->sServer:Lcom/android/ViewServer;

    .line 15
    :cond_0
    sget-object v0, Lcom/android/ViewServer;->sServer:Lcom/android/ViewServer;

    return-object v0
.end method


# virtual methods
.method public addWindow(Landroid/app/Activity;)V
    .locals 0
    .parameter "activity"

    .prologue
    .line 20
    return-void
.end method

.method public removeWindow(Landroid/app/Activity;)V
    .locals 0
    .parameter "activity"

    .prologue
    .line 24
    return-void
.end method

.method public setFocusedWindow(Landroid/app/Activity;)V
    .locals 0
    .parameter "activity"

    .prologue
    .line 28
    return-void
.end method

.class public Lcom/apportable/DialogInterfaceOnCancelListener;
.super Ljava/lang/Object;
.source "DialogInterfaceOnCancelListener.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field private mDelegate:J


# direct methods
.method public constructor <init>(J)V
    .locals 0
    .parameter "delegate"

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-wide p1, p0, Lcom/apportable/DialogInterfaceOnCancelListener;->mDelegate:J

    .line 20
    return-void
.end method

.method private static native nativeOnCancel(J)V
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 2
    .parameter "dialog"

    .prologue
    .line 23
    iget-wide v0, p0, Lcom/apportable/DialogInterfaceOnCancelListener;->mDelegate:J

    invoke-static {v0, v1}, Lcom/apportable/DialogInterfaceOnCancelListener;->nativeOnCancel(J)V

    .line 24
    return-void
.end method

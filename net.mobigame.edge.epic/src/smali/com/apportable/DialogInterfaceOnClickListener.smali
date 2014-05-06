.class public Lcom/apportable/DialogInterfaceOnClickListener;
.super Ljava/lang/Object;
.source "DialogInterfaceOnClickListener.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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
    iput-wide p1, p0, Lcom/apportable/DialogInterfaceOnClickListener;->mDelegate:J

    .line 20
    return-void
.end method

.method private static native nativeOnClick(JI)V
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 23
    iget-wide v0, p0, Lcom/apportable/DialogInterfaceOnClickListener;->mDelegate:J

    invoke-static {v0, v1, p2}, Lcom/apportable/DialogInterfaceOnClickListener;->nativeOnClick(JI)V

    .line 24
    return-void
.end method

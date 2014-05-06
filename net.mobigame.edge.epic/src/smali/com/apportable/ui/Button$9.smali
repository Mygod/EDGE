.class Lcom/apportable/ui/Button$9;
.super Ljava/lang/Object;
.source "Button.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/Button;->useSystemUi(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/Button;

.field final synthetic val$systemTheme:Z


# direct methods
.method constructor <init>(Lcom/apportable/ui/Button;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 301
    iput-object p1, p0, Lcom/apportable/ui/Button$9;->this$0:Lcom/apportable/ui/Button;

    iput-boolean p2, p0, Lcom/apportable/ui/Button$9;->val$systemTheme:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 304
    iget-object v0, p0, Lcom/apportable/ui/Button$9;->this$0:Lcom/apportable/ui/Button;

    iget-boolean v1, p0, Lcom/apportable/ui/Button$9;->val$systemTheme:Z

    #calls: Lcom/apportable/ui/Button;->_useSystemUi(Z)V
    invoke-static {v0, v1}, Lcom/apportable/ui/Button;->access$300(Lcom/apportable/ui/Button;Z)V

    .line 305
    return-void
.end method

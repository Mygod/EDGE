.class Lcom/apportable/ui/NavigationBar$12;
.super Ljava/lang/Object;
.source "NavigationBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/NavigationBar;->setTitle(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/NavigationBar;

.field final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/apportable/ui/NavigationBar;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 280
    iput-object p1, p0, Lcom/apportable/ui/NavigationBar$12;->this$0:Lcom/apportable/ui/NavigationBar;

    iput-object p2, p0, Lcom/apportable/ui/NavigationBar$12;->val$title:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 283
    iget-object v0, p0, Lcom/apportable/ui/NavigationBar$12;->this$0:Lcom/apportable/ui/NavigationBar;

    iget-object v1, p0, Lcom/apportable/ui/NavigationBar$12;->val$title:Ljava/lang/String;

    #calls: Lcom/apportable/ui/NavigationBar;->_setTitle(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/apportable/ui/NavigationBar;->access$500(Lcom/apportable/ui/NavigationBar;Ljava/lang/String;)V

    .line 284
    return-void
.end method

.class Lcom/apportable/ui/NavigationBar$10;
.super Ljava/lang/Object;
.source "NavigationBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/ui/NavigationBar;->setStyle(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/apportable/ui/NavigationBar;

.field final synthetic val$style:I


# direct methods
.method constructor <init>(Lcom/apportable/ui/NavigationBar;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 238
    iput-object p1, p0, Lcom/apportable/ui/NavigationBar$10;->this$0:Lcom/apportable/ui/NavigationBar;

    iput p2, p0, Lcom/apportable/ui/NavigationBar$10;->val$style:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 241
    iget-object v0, p0, Lcom/apportable/ui/NavigationBar$10;->this$0:Lcom/apportable/ui/NavigationBar;

    iget v1, p0, Lcom/apportable/ui/NavigationBar$10;->val$style:I

    #calls: Lcom/apportable/ui/NavigationBar;->_setStyle(I)V
    invoke-static {v0, v1}, Lcom/apportable/ui/NavigationBar;->access$300(Lcom/apportable/ui/NavigationBar;I)V

    .line 242
    return-void
.end method

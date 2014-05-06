.class public Lcom/apportable/SocialShareManager;
.super Ljava/lang/Object;
.source "SocialShareManager.java"


# static fields
.field public static instance:Lcom/apportable/SocialShareManager;


# instance fields
.field private context:Landroid/content/Context;

.field private images:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private initialText:Ljava/lang/String;

.field private urls:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 15
    const/4 v0, 0x0

    sput-object v0, Lcom/apportable/SocialShareManager;->instance:Lcom/apportable/SocialShareManager;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    const/4 v1, 0x0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/apportable/SocialShareManager;->urls:Ljava/util/List;

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/apportable/SocialShareManager;->images:Ljava/util/ArrayList;

    .line 23
    iput-object v1, p0, Lcom/apportable/SocialShareManager;->initialText:Ljava/lang/String;

    .line 25
    iput-object v1, p0, Lcom/apportable/SocialShareManager;->context:Landroid/content/Context;

    .line 28
    sget-object v0, Lcom/apportable/SocialShareManager;->instance:Lcom/apportable/SocialShareManager;

    if-eqz v0, :cond_0

    .line 33
    :goto_0
    return-void

    .line 31
    :cond_0
    sput-object p0, Lcom/apportable/SocialShareManager;->instance:Lcom/apportable/SocialShareManager;

    .line 32
    iput-object p1, p0, Lcom/apportable/SocialShareManager;->context:Landroid/content/Context;

    goto :goto_0
.end method

.method public static getInstance()Lcom/apportable/SocialShareManager;
    .locals 1

    .prologue
    .line 18
    sget-object v0, Lcom/apportable/SocialShareManager;->instance:Lcom/apportable/SocialShareManager;

    return-object v0
.end method

.method private saveAndReturnShareData([BLjava/lang/String;Ljava/lang/String;)Landroid/net/Uri;
    .locals 7
    .parameter "bytes"
    .parameter "filename"
    .parameter "mime"

    .prologue
    const/4 v3, 0x0

    .line 58
    const-string v4, "mounted"

    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 69
    :goto_0
    return-object v3

    .line 60
    :cond_0
    const/4 v1, 0x0

    .line 62
    .local v1, file:Ljava/io/File;
    :try_start_0
    const-string v4, "image"

    iget-object v5, p0, Lcom/apportable/SocialShareManager;->context:Landroid/content/Context;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    invoke-static {v4, p2, v5}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v1

    .line 63
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 64
    .local v2, fos:Ljava/io/FileOutputStream;
    const/4 v4, 0x0

    array-length v5, p1

    invoke-virtual {v2, p1, v4, v5}, Ljava/io/FileOutputStream;->write([BII)V

    .line 65
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    goto :goto_0

    .line 66
    .end local v2           #fos:Ljava/io/FileOutputStream;
    :catch_0
    move-exception v0

    .line 67
    .local v0, e:Ljava/io/IOException;
    goto :goto_0
.end method


# virtual methods
.method public addImage([BLjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "data"
    .parameter "filename"
    .parameter "mime"

    .prologue
    .line 48
    const/4 v0, 0x0

    .line 49
    .local v0, uri:Landroid/net/Uri;
    invoke-direct {p0, p1, p2, p3}, Lcom/apportable/SocialShareManager;->saveAndReturnShareData([BLjava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 50
    iget-object v1, p0, Lcom/apportable/SocialShareManager;->images:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    :cond_0
    return-void
.end method

.method public addInitialText(Ljava/lang/String;)V
    .locals 0
    .parameter "text"

    .prologue
    .line 36
    iput-object p1, p0, Lcom/apportable/SocialShareManager;->initialText:Ljava/lang/String;

    .line 37
    return-void
.end method

.method public addURL(Ljava/lang/String;)V
    .locals 1
    .parameter "url"

    .prologue
    .line 40
    iget-object v0, p0, Lcom/apportable/SocialShareManager;->urls:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    return-void
.end method

.method public removeAllImages()V
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/apportable/SocialShareManager;->images:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 55
    return-void
.end method

.method public removeAllURLs()V
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/apportable/SocialShareManager;->urls:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 45
    return-void
.end method

.method public sendShare()V
    .locals 6

    .prologue
    .line 73
    new-instance v1, Landroid/content/Intent;

    const-string v4, "android.intent.action.SEND_MULTIPLE"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 74
    .local v1, intent:Landroid/content/Intent;
    const-string v4, "text/plain"

    invoke-virtual {v1, v4}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 76
    new-instance v2, Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/apportable/SocialShareManager;->initialText:Ljava/lang/String;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/apportable/SocialShareManager;->initialText:Ljava/lang/String;

    :goto_0
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .local v2, text:Ljava/lang/StringBuilder;
    iget-object v4, p0, Lcom/apportable/SocialShareManager;->urls:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 78
    .local v3, url:Ljava/lang/String;
    const-string v4, " "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 76
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v2           #text:Ljava/lang/StringBuilder;
    .end local v3           #url:Ljava/lang/String;
    :cond_0
    const-string v4, ""

    goto :goto_0

    .line 80
    .restart local v0       #i$:Ljava/util/Iterator;
    .restart local v2       #text:Ljava/lang/StringBuilder;
    :cond_1
    const-string v4, "android.intent.extra.TEXT"

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 81
    const-string v4, "android.intent.extra.STREAM"

    iget-object v5, p0, Lcom/apportable/SocialShareManager;->images:Ljava/util/ArrayList;

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 82
    iget-object v4, p0, Lcom/apportable/SocialShareManager;->context:Landroid/content/Context;

    const-string v5, "Share"

    invoke-static {v1, v5}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 84
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/apportable/SocialShareManager;->initialText:Ljava/lang/String;

    .line 85
    invoke-virtual {p0}, Lcom/apportable/SocialShareManager;->removeAllImages()V

    .line 86
    invoke-virtual {p0}, Lcom/apportable/SocialShareManager;->removeAllURLs()V

    .line 87
    return-void
.end method

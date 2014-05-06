.class final Lcom/flurry/android/t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic a:Ljava/util/Map;

.field private synthetic b:Lcom/flurry/android/InstallReceiver;


# direct methods
.method constructor <init>(Lcom/flurry/android/InstallReceiver;Ljava/util/Map;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 128
    iput-object p1, p0, Lcom/flurry/android/t;->b:Lcom/flurry/android/InstallReceiver;

    iput-object p2, p0, Lcom/flurry/android/t;->a:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .prologue
    const/4 v2, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 132
    .line 136
    :try_start_0
    iget-object v1, p0, Lcom/flurry/android/t;->b:Lcom/flurry/android/InstallReceiver;

    invoke-static {v1}, Lcom/flurry/android/InstallReceiver;->a(Lcom/flurry/android/InstallReceiver;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 137
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v3

    .line 138
    if-nez v3, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 141
    const-string v3, "InstallReceiver"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to create persistent dir: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 167
    invoke-static {v2}, Lcom/flurry/android/r;->a(Ljava/io/Closeable;)V

    .line 168
    :goto_0
    return-void

    .line 144
    :cond_0
    :try_start_1
    new-instance v1, Ljava/io/FileOutputStream;

    iget-object v3, p0, Lcom/flurry/android/t;->b:Lcom/flurry/android/InstallReceiver;

    invoke-static {v3}, Lcom/flurry/android/InstallReceiver;->a(Lcom/flurry/android/InstallReceiver;)Ljava/io/File;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 145
    new-instance v3, Ljava/io/DataOutputStream;

    invoke-direct {v3, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 149
    :try_start_2
    iget-object v1, p0, Lcom/flurry/android/t;->a:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move v4, v5

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Ljava/util/Map$Entry;

    move-object v2, v0

    .line 150
    if-ne v4, v5, :cond_1

    move v4, v6

    .line 155
    :goto_2
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 156
    const-string v1, "="

    invoke-virtual {v3, v1}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 157
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    .line 161
    :catch_0
    move-exception v1

    move-object v2, v3

    .line 163
    :goto_3
    :try_start_3
    const-string v3, "InstallReceiver"

    const-string v4, ""

    invoke-static {v3, v4, v1}, Lcom/flurry/android/ai;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 167
    invoke-static {v2}, Lcom/flurry/android/r;->a(Ljava/io/Closeable;)V

    goto :goto_0

    .line 153
    :cond_1
    :try_start_4
    const-string v1, "&"

    invoke-virtual {v3, v1}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_2

    .line 167
    :catchall_0
    move-exception v1

    move-object v2, v3

    :goto_4
    invoke-static {v2}, Lcom/flurry/android/r;->a(Ljava/io/Closeable;)V

    throw v1

    .line 159
    :cond_2
    const/4 v1, 0x0

    :try_start_5
    invoke-virtual {v3, v1}, Ljava/io/DataOutputStream;->writeShort(I)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_0

    .line 167
    invoke-static {v3}, Lcom/flurry/android/r;->a(Ljava/io/Closeable;)V

    goto :goto_0

    :catchall_1
    move-exception v1

    goto :goto_4

    .line 161
    :catch_1
    move-exception v1

    goto :goto_3
.end method

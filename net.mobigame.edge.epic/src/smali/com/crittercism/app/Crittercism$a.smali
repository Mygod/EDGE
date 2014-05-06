.class final Lcom/crittercism/app/Crittercism$a;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/crittercism/app/Crittercism;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/crittercism/app/Crittercism;

.field private b:Ljava/lang/Thread$UncaughtExceptionHandler;


# direct methods
.method public constructor <init>(Lcom/crittercism/app/Crittercism;Ljava/lang/Thread$UncaughtExceptionHandler;)V
    .locals 0

    iput-object p1, p0, Lcom/crittercism/app/Crittercism$a;->a:Lcom/crittercism/app/Crittercism;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/crittercism/app/Crittercism$a;->b:Ljava/lang/Thread$UncaughtExceptionHandler;

    return-void
.end method


# virtual methods
.method public final uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 4

    :try_start_0
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {p2, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    invoke-static {}, Lcom/crittercism/app/Crittercism;->getOptOutStatus()Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "Crittercism"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4

    :cond_0
    :goto_0
    :try_start_1
    invoke-static {}, Lcom/crittercism/app/Crittercism;->a()Lcom/crittercism/app/Crittercism;

    move-result-object v0

    if-nez v0, :cond_2

    new-instance v0, Ljava/lang/Exception;

    const-string v1, "Failed to log error to Crittercism."

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    move-exception v0

    :try_start_2
    const-string v1, "Crittercism"

    const-string v2, "Failed to log error with Crittercism.  Please contact us at support@crittercism.com."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Did not log error to Crittercism.  EXCEPTION: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    iget-object v0, p0, Lcom/crittercism/app/Crittercism$a;->b:Ljava/lang/Thread$UncaughtExceptionHandler;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/crittercism/app/Crittercism$a;->b:Ljava/lang/Thread$UncaughtExceptionHandler;

    instance-of v0, v0, Lcom/crittercism/app/Crittercism$a;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/crittercism/app/Crittercism$a;->b:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v0, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    :cond_1
    :goto_1
    return-void

    :cond_2
    :try_start_3
    invoke-static {}, Lcom/crittercism/app/Crittercism;->getOptOutStatus()Z

    move-result v0

    if-nez v0, :cond_5

    invoke-static {}, Lcom/crittercism/app/Crittercism;->u()V

    invoke-static {}, Lcom/crittercism/app/Crittercism;->a()Lcom/crittercism/app/Crittercism;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/crittercism/app/Crittercism;->a(Ljava/lang/Throwable;)Z

    invoke-static {}, Lcom/crittercism/app/Crittercism;->a()Lcom/crittercism/app/Crittercism;

    move-result-object v0

    invoke-virtual {v0}, Lcom/crittercism/app/Crittercism;->f()Z

    invoke-static {}, Lcom/crittercism/app/Crittercism;->a()Lcom/crittercism/app/Crittercism;

    move-result-object v0

    invoke-virtual {v0}, Lcom/crittercism/app/Crittercism;->m()Lcrittercism/android/i;

    move-result-object v0

    invoke-virtual {v0}, Lcrittercism/android/i;->e()Ljava/util/Vector;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-lez v0, :cond_3

    invoke-static {}, Lcrittercism/android/i;->d()Lcrittercism/android/i;

    move-result-object v0

    invoke-static {}, Lcom/crittercism/app/Crittercism;->a()Lcom/crittercism/app/Crittercism;

    move-result-object v1

    invoke-virtual {v1}, Lcom/crittercism/app/Crittercism;->m()Lcrittercism/android/i;

    move-result-object v1

    invoke-virtual {v1}, Lcrittercism/android/i;->e()Ljava/util/Vector;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcrittercism/android/i;->a(Ljava/util/Vector;)V

    invoke-static {}, Lcom/crittercism/app/Crittercism;->a()Lcom/crittercism/app/Crittercism;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/crittercism/app/Crittercism;->a(Lcrittercism/android/i;)V

    invoke-static {}, Lcom/crittercism/app/Crittercism;->a()Lcom/crittercism/app/Crittercism;

    move-result-object v0

    invoke-virtual {v0}, Lcom/crittercism/app/Crittercism;->m()Lcrittercism/android/i;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v0

    :try_start_4
    invoke-static {}, Lcom/crittercism/app/Crittercism;->a()Lcom/crittercism/app/Crittercism;

    move-result-object v1

    invoke-virtual {v1}, Lcom/crittercism/app/Crittercism;->k()Landroid/content/Context;

    move-result-object v1

    const-string v2, "com.crittercism.loads"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-static {}, Lcrittercism/android/i;->a()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-static {}, Lcrittercism/android/i;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcrittercism/android/i;->c()Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    if-nez v0, :cond_3

    new-instance v0, Ljava/lang/Exception;

    const-string v1, "commit failed"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    :catch_1
    move-exception v0

    :cond_3
    :try_start_5
    invoke-static {}, Lcom/crittercism/app/Crittercism;->a()Lcom/crittercism/app/Crittercism;

    move-result-object v0

    invoke-virtual {v0}, Lcom/crittercism/app/Crittercism;->n()Lcrittercism/android/m;

    move-result-object v0

    invoke-virtual {v0}, Lcrittercism/android/m;->e()Ljava/util/Vector;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-lez v0, :cond_4

    invoke-static {}, Lcom/crittercism/app/Crittercism;->a()Lcom/crittercism/app/Crittercism;

    move-result-object v0

    invoke-virtual {v0}, Lcom/crittercism/app/Crittercism;->n()Lcrittercism/android/m;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    move-result-object v0

    :try_start_6
    invoke-static {}, Lcom/crittercism/app/Crittercism;->a()Lcom/crittercism/app/Crittercism;

    move-result-object v1

    invoke-virtual {v1}, Lcom/crittercism/app/Crittercism;->k()Landroid/content/Context;

    move-result-object v1

    const-string v2, "com.crittercism.crashes"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-static {}, Lcrittercism/android/m;->a()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-static {}, Lcrittercism/android/m;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcrittercism/android/m;->b()Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    if-nez v0, :cond_4

    new-instance v0, Ljava/lang/Exception;

    const-string v1, "commit failed"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    :catch_2
    move-exception v0

    :cond_4
    :try_start_7
    invoke-static {}, Lcom/crittercism/app/Crittercism;->a()Lcom/crittercism/app/Crittercism;

    move-result-object v0

    invoke-virtual {v0}, Lcom/crittercism/app/Crittercism;->o()Lcrittercism/android/k;

    move-result-object v0

    invoke-virtual {v0}, Lcrittercism/android/k;->e()Ljava/util/Vector;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-lez v0, :cond_5

    invoke-static {}, Lcom/crittercism/app/Crittercism;->a()Lcom/crittercism/app/Crittercism;

    move-result-object v0

    invoke-virtual {v0}, Lcom/crittercism/app/Crittercism;->o()Lcrittercism/android/k;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0

    move-result-object v0

    :try_start_8
    invoke-static {}, Lcom/crittercism/app/Crittercism;->a()Lcom/crittercism/app/Crittercism;

    move-result-object v1

    invoke-virtual {v1}, Lcom/crittercism/app/Crittercism;->k()Landroid/content/Context;

    move-result-object v1

    const-string v2, "com.crittercism.exceptions"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-static {}, Lcrittercism/android/k;->a()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-static {}, Lcrittercism/android/k;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcrittercism/android/k;->b()Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    if-nez v0, :cond_5

    new-instance v0, Ljava/lang/Exception;

    const-string v1, "commit failed"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3

    :catch_3
    move-exception v0

    :cond_5
    iget-object v0, p0, Lcom/crittercism/app/Crittercism$a;->b:Ljava/lang/Thread$UncaughtExceptionHandler;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/crittercism/app/Crittercism$a;->b:Ljava/lang/Thread$UncaughtExceptionHandler;

    instance-of v0, v0, Lcom/crittercism/app/Crittercism$a;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/crittercism/app/Crittercism$a;->b:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v0, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    goto/16 :goto_1

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/crittercism/app/Crittercism$a;->b:Ljava/lang/Thread$UncaughtExceptionHandler;

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/crittercism/app/Crittercism$a;->b:Ljava/lang/Thread$UncaughtExceptionHandler;

    instance-of v1, v1, Lcom/crittercism/app/Crittercism$a;

    if-nez v1, :cond_6

    iget-object v1, p0, Lcom/crittercism/app/Crittercism$a;->b:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v1, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    :cond_6
    throw v0

    :catch_4
    move-exception v0

    goto/16 :goto_0
.end method

.class final Lcom/crittercism/app/Crittercism$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/crittercism/app/Crittercism;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/crittercism/app/Crittercism;


# direct methods
.method constructor <init>(Lcom/crittercism/app/Crittercism;)V
    .locals 0

    iput-object p1, p0, Lcom/crittercism/app/Crittercism$1;->a:Lcom/crittercism/app/Crittercism;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    :try_start_0
    invoke-static {}, Lcom/crittercism/app/Crittercism;->a()Lcom/crittercism/app/Crittercism;

    move-result-object v0

    invoke-virtual {v0}, Lcom/crittercism/app/Crittercism;->k()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/crittercism/app/Crittercism$1;->a:Lcom/crittercism/app/Crittercism;

    invoke-static {v1}, Lcom/crittercism/app/Crittercism;->a(Lcom/crittercism/app/Crittercism;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/crittercism/app/CrittercismNDK;->installNdkLib(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Exception installing ndk library: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    goto :goto_0
.end method

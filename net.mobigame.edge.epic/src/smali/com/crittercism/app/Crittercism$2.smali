.class final Lcom/crittercism/app/Crittercism$2;
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
.field final synthetic a:Lorg/json/JSONObject;

.field final synthetic b:Lcom/crittercism/app/Crittercism;


# direct methods
.method constructor <init>(Lcom/crittercism/app/Crittercism;Lorg/json/JSONObject;)V
    .locals 0

    iput-object p1, p0, Lcom/crittercism/app/Crittercism$2;->b:Lcom/crittercism/app/Crittercism;

    iput-object p2, p0, Lcom/crittercism/app/Crittercism$2;->a:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/crittercism/app/Crittercism$2;->b:Lcom/crittercism/app/Crittercism;

    invoke-static {v0}, Lcom/crittercism/app/Crittercism;->c(Lcom/crittercism/app/Crittercism;)Lcrittercism/android/b;

    move-result-object v0

    iget-object v1, p0, Lcom/crittercism/app/Crittercism$2;->a:Lorg/json/JSONObject;

    invoke-virtual {v0, v1}, Lcrittercism/android/b;->b(Lorg/json/JSONObject;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

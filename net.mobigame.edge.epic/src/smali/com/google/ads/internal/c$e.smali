.class Lcom/google/ads/internal/c$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/ads/internal/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "e"
.end annotation


# instance fields
.field private final a:Lcom/google/ads/internal/d;

.field private final b:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final c:I

.field private final d:Z

.field private final e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/ads/internal/d;Ljava/util/LinkedList;IZLjava/lang/String;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/internal/d;",
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/String;",
            ">;IZ",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 172
    iput-object p1, p0, Lcom/google/ads/internal/c$e;->a:Lcom/google/ads/internal/d;

    .line 173
    iput-object p2, p0, Lcom/google/ads/internal/c$e;->b:Ljava/util/LinkedList;

    .line 174
    iput p3, p0, Lcom/google/ads/internal/c$e;->c:I

    .line 175
    iput-boolean p4, p0, Lcom/google/ads/internal/c$e;->d:Z

    .line 176
    iput-object p5, p0, Lcom/google/ads/internal/c$e;->e:Ljava/lang/String;

    .line 177
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 181
    iget-object v0, p0, Lcom/google/ads/internal/c$e;->a:Lcom/google/ads/internal/d;

    iget-object v1, p0, Lcom/google/ads/internal/c$e;->b:Ljava/util/LinkedList;

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/d;->a(Ljava/util/LinkedList;)V

    .line 182
    iget-object v0, p0, Lcom/google/ads/internal/c$e;->a:Lcom/google/ads/internal/d;

    iget v1, p0, Lcom/google/ads/internal/c$e;->c:I

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/d;->a(I)V

    .line 183
    iget-object v0, p0, Lcom/google/ads/internal/c$e;->a:Lcom/google/ads/internal/d;

    iget-boolean v1, p0, Lcom/google/ads/internal/c$e;->d:Z

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/d;->a(Z)V

    .line 184
    iget-object v0, p0, Lcom/google/ads/internal/c$e;->e:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 185
    iget-object v0, p0, Lcom/google/ads/internal/c$e;->a:Lcom/google/ads/internal/d;

    iget-object v1, p0, Lcom/google/ads/internal/c$e;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/ads/internal/d;->a(Ljava/lang/String;)V

    .line 187
    :cond_0
    iget-object v0, p0, Lcom/google/ads/internal/c$e;->a:Lcom/google/ads/internal/d;

    invoke-virtual {v0}, Lcom/google/ads/internal/d;->B()V

    .line 188
    return-void
.end method

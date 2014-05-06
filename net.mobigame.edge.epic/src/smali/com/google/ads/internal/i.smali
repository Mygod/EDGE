.class public Lcom/google/ads/internal/i;
.super Landroid/webkit/WebViewClient;
.source "SourceFile"


# static fields
.field private static final c:Lcom/google/ads/internal/a;


# instance fields
.field protected a:Lcom/google/ads/internal/d;

.field protected b:Z

.field private d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/ads/n;",
            ">;"
        }
    .end annotation
.end field

.field private e:Z

.field private f:Z

.field private g:Z

.field private h:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    sget-object v0, Lcom/google/ads/internal/a;->a:Lcom/google/ads/util/f;

    invoke-interface {v0}, Lcom/google/ads/util/f;->b()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/ads/internal/a;

    sput-object v0, Lcom/google/ads/internal/i;->c:Lcom/google/ads/internal/a;

    return-void
.end method

.method protected constructor <init>(Lcom/google/ads/internal/d;Ljava/util/Map;ZZ)V
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/internal/d;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/ads/n;",
            ">;ZZ)V"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 76
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 77
    iput-object p1, p0, Lcom/google/ads/internal/i;->a:Lcom/google/ads/internal/d;

    .line 78
    iput-object p2, p0, Lcom/google/ads/internal/i;->d:Ljava/util/Map;

    .line 79
    iput-boolean p3, p0, Lcom/google/ads/internal/i;->e:Z

    .line 80
    iput-boolean p4, p0, Lcom/google/ads/internal/i;->f:Z

    .line 81
    iput-boolean v0, p0, Lcom/google/ads/internal/i;->b:Z

    .line 82
    iput-boolean v0, p0, Lcom/google/ads/internal/i;->g:Z

    .line 83
    iput-boolean v0, p0, Lcom/google/ads/internal/i;->h:Z

    .line 84
    return-void
.end method

.method public static a(Lcom/google/ads/internal/d;Ljava/util/Map;ZZ)Lcom/google/ads/internal/i;
    .locals 2
    .parameter
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/internal/d;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/ads/n;",
            ">;ZZ)",
            "Lcom/google/ads/internal/i;"
        }
    .end annotation

    .prologue
    .line 92
    sget v0, Lcom/google/ads/util/AdUtil;->a:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 93
    new-instance v0, Lcom/google/ads/util/g$b;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/google/ads/util/g$b;-><init>(Lcom/google/ads/internal/d;Ljava/util/Map;ZZ)V

    .line 96
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/google/ads/internal/i;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/google/ads/internal/i;-><init>(Lcom/google/ads/internal/d;Ljava/util/Map;ZZ)V

    goto :goto_0
.end method


# virtual methods
.method public a(Z)V
    .locals 0
    .parameter

    .prologue
    .line 186
    iput-boolean p1, p0, Lcom/google/ads/internal/i;->b:Z

    .line 187
    return-void
.end method

.method public b(Z)V
    .locals 0
    .parameter

    .prologue
    .line 194
    iput-boolean p1, p0, Lcom/google/ads/internal/i;->f:Z

    .line 195
    return-void
.end method

.method public c(Z)V
    .locals 0
    .parameter

    .prologue
    .line 205
    iput-boolean p1, p0, Lcom/google/ads/internal/i;->g:Z

    .line 206
    return-void
.end method

.method public d(Z)V
    .locals 0
    .parameter

    .prologue
    .line 216
    iput-boolean p1, p0, Lcom/google/ads/internal/i;->h:Z

    .line 217
    return-void
.end method

.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2
    .parameter "view"
    .parameter "url"

    .prologue
    const/4 v1, 0x0

    .line 163
    iget-boolean v0, p0, Lcom/google/ads/internal/i;->g:Z

    if-eqz v0, :cond_0

    .line 167
    iget-object v0, p0, Lcom/google/ads/internal/i;->a:Lcom/google/ads/internal/d;

    invoke-virtual {v0}, Lcom/google/ads/internal/d;->i()Lcom/google/ads/internal/c;

    move-result-object v0

    .line 168
    if-eqz v0, :cond_2

    .line 169
    invoke-virtual {v0}, Lcom/google/ads/internal/c;->c()V

    .line 173
    :goto_0
    iput-boolean v1, p0, Lcom/google/ads/internal/i;->g:Z

    .line 176
    :cond_0
    iget-boolean v0, p0, Lcom/google/ads/internal/i;->h:Z

    if-eqz v0, :cond_1

    .line 177
    sget-object v0, Lcom/google/ads/internal/i;->c:Lcom/google/ads/internal/a;

    invoke-virtual {v0, p1}, Lcom/google/ads/internal/a;->a(Landroid/webkit/WebView;)V

    .line 178
    iput-boolean v1, p0, Lcom/google/ads/internal/i;->h:Z

    .line 180
    :cond_1
    return-void

    .line 171
    :cond_2
    const-string v0, "adLoader was null while trying to setFinishedLoadingHtml()."

    invoke-static {v0}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 5
    .parameter "webView"
    .parameter "url"

    .prologue
    const/4 v1, 0x1

    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "shouldOverrideUrlLoading(\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    .line 111
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 115
    invoke-static {v2}, Lcom/google/ads/util/AdUtil;->b(Landroid/net/Uri;)Ljava/util/HashMap;

    move-result-object v0

    .line 116
    if-eqz v0, :cond_0

    .line 117
    const-string v3, "ai"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 118
    if-eqz v0, :cond_0

    .line 119
    iget-object v3, p0, Lcom/google/ads/internal/i;->a:Lcom/google/ads/internal/d;

    invoke-virtual {v3}, Lcom/google/ads/internal/d;->l()Lcom/google/ads/internal/g;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/google/ads/internal/g;->a(Ljava/lang/String;)V

    .line 124
    :cond_0
    sget-object v0, Lcom/google/ads/internal/i;->c:Lcom/google/ads/internal/a;

    invoke-virtual {v0, v2}, Lcom/google/ads/internal/a;->a(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 125
    sget-object v0, Lcom/google/ads/internal/i;->c:Lcom/google/ads/internal/a;

    iget-object v3, p0, Lcom/google/ads/internal/i;->a:Lcom/google/ads/internal/d;

    iget-object v4, p0, Lcom/google/ads/internal/i;->d:Ljava/util/Map;

    invoke-virtual {v0, v3, v4, v2, p1}, Lcom/google/ads/internal/a;->a(Lcom/google/ads/internal/d;Ljava/util/Map;Landroid/net/Uri;Landroid/webkit/WebView;)V

    move v0, v1

    .line 153
    :goto_0
    return v0

    .line 127
    :cond_1
    iget-boolean v0, p0, Lcom/google/ads/internal/i;->f:Z

    if-eqz v0, :cond_3

    .line 129
    invoke-static {v2}, Lcom/google/ads/util/AdUtil;->a(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 132
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result v0

    goto :goto_0

    .line 135
    :cond_2
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 136
    const-string v2, "u"

    invoke-virtual {v0, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    iget-object v2, p0, Lcom/google/ads/internal/i;->a:Lcom/google/ads/internal/d;

    new-instance v3, Lcom/google/ads/internal/e;

    const-string v4, "intent"

    invoke-direct {v3, v4, v0}, Lcom/google/ads/internal/e;-><init>(Ljava/lang/String;Ljava/util/HashMap;)V

    invoke-static {v2, v3}, Lcom/google/ads/AdActivity;->launchAdActivity(Lcom/google/ads/internal/d;Lcom/google/ads/internal/e;)V

    move v0, v1

    .line 140
    goto :goto_0

    .line 142
    :cond_3
    iget-boolean v0, p0, Lcom/google/ads/internal/i;->e:Z

    if-eqz v0, :cond_4

    .line 144
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 145
    const-string v3, "u"

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    iget-object v2, p0, Lcom/google/ads/internal/i;->a:Lcom/google/ads/internal/d;

    new-instance v3, Lcom/google/ads/internal/e;

    const-string v4, "intent"

    invoke-direct {v3, v4, v0}, Lcom/google/ads/internal/e;-><init>(Ljava/lang/String;Ljava/util/HashMap;)V

    invoke-static {v2, v3}, Lcom/google/ads/AdActivity;->launchAdActivity(Lcom/google/ads/internal/d;Lcom/google/ads/internal/e;)V

    move v0, v1

    .line 148
    goto :goto_0

    .line 150
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "URL is not a GMSG and can\'t handle URL: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->e(Ljava/lang/String;)V

    move v0, v1

    .line 153
    goto :goto_0
.end method

.class public Lcom/google/ads/searchads/SearchAdRequest;
.super Lcom/google/ads/AdRequest;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/ads/searchads/SearchAdRequest$BorderType;
    }
.end annotation


# instance fields
.field private a:Ljava/lang/String;

.field private b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:I

.field private h:Ljava/lang/String;

.field private i:I

.field private j:I

.field private k:Lcom/google/ads/searchads/SearchAdRequest$BorderType;

.field private l:I

.field private m:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/google/ads/AdRequest;-><init>()V

    .line 21
    return-void
.end method

.method private a(I)Ljava/lang/String;
    .locals 4
    .parameter

    .prologue
    .line 283
    const-string v0, "#%06x"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const v3, 0xffffff

    and-int/2addr v3, p1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getRequestMap(Landroid/content/Context;)Ljava/util/Map;
    .locals 5
    .parameter "context"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v4, 0xff

    .line 219
    const-class v0, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;

    invoke-virtual {p0, v0}, Lcom/google/ads/searchads/SearchAdRequest;->getNetworkExtras(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;

    .line 221
    if-nez v0, :cond_0

    .line 222
    new-instance v0, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;

    invoke-direct {v0}, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;-><init>()V

    .line 223
    invoke-virtual {p0, v0}, Lcom/google/ads/searchads/SearchAdRequest;->setNetworkExtras(Lcom/google/ads/mediation/NetworkExtras;)Lcom/google/ads/AdRequest;

    .line 226
    :cond_0
    iget-object v1, p0, Lcom/google/ads/searchads/SearchAdRequest;->a:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 227
    invoke-virtual {v0}, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->getExtras()Ljava/util/Map;

    move-result-object v1

    const-string v2, "q"

    iget-object v3, p0, Lcom/google/ads/searchads/SearchAdRequest;->a:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    :cond_1
    iget v1, p0, Lcom/google/ads/searchads/SearchAdRequest;->b:I

    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    if-eqz v1, :cond_2

    .line 231
    invoke-virtual {v0}, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->getExtras()Ljava/util/Map;

    move-result-object v1

    const-string v2, "bgcolor"

    iget v3, p0, Lcom/google/ads/searchads/SearchAdRequest;->b:I

    invoke-direct {p0, v3}, Lcom/google/ads/searchads/SearchAdRequest;->a(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    :cond_2
    iget v1, p0, Lcom/google/ads/searchads/SearchAdRequest;->c:I

    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    if-ne v1, v4, :cond_3

    iget v1, p0, Lcom/google/ads/searchads/SearchAdRequest;->d:I

    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    if-ne v1, v4, :cond_3

    .line 236
    invoke-virtual {v0}, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->getExtras()Ljava/util/Map;

    move-result-object v1

    const-string v2, "gradientfrom"

    iget v3, p0, Lcom/google/ads/searchads/SearchAdRequest;->c:I

    invoke-direct {p0, v3}, Lcom/google/ads/searchads/SearchAdRequest;->a(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    invoke-virtual {v0}, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->getExtras()Ljava/util/Map;

    move-result-object v1

    const-string v2, "gradientto"

    iget v3, p0, Lcom/google/ads/searchads/SearchAdRequest;->d:I

    invoke-direct {p0, v3}, Lcom/google/ads/searchads/SearchAdRequest;->a(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    :cond_3
    iget v1, p0, Lcom/google/ads/searchads/SearchAdRequest;->e:I

    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    if-eqz v1, :cond_4

    .line 241
    invoke-virtual {v0}, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->getExtras()Ljava/util/Map;

    move-result-object v1

    const-string v2, "hcolor"

    iget v3, p0, Lcom/google/ads/searchads/SearchAdRequest;->e:I

    invoke-direct {p0, v3}, Lcom/google/ads/searchads/SearchAdRequest;->a(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    :cond_4
    iget v1, p0, Lcom/google/ads/searchads/SearchAdRequest;->f:I

    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    if-eqz v1, :cond_5

    .line 245
    invoke-virtual {v0}, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->getExtras()Ljava/util/Map;

    move-result-object v1

    const-string v2, "dcolor"

    iget v3, p0, Lcom/google/ads/searchads/SearchAdRequest;->f:I

    invoke-direct {p0, v3}, Lcom/google/ads/searchads/SearchAdRequest;->a(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    :cond_5
    iget v1, p0, Lcom/google/ads/searchads/SearchAdRequest;->g:I

    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    if-eqz v1, :cond_6

    .line 250
    invoke-virtual {v0}, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->getExtras()Ljava/util/Map;

    move-result-object v1

    const-string v2, "acolor"

    iget v3, p0, Lcom/google/ads/searchads/SearchAdRequest;->g:I

    invoke-direct {p0, v3}, Lcom/google/ads/searchads/SearchAdRequest;->a(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    :cond_6
    iget-object v1, p0, Lcom/google/ads/searchads/SearchAdRequest;->h:Ljava/lang/String;

    if-eqz v1, :cond_7

    .line 254
    invoke-virtual {v0}, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->getExtras()Ljava/util/Map;

    move-result-object v1

    const-string v2, "font"

    iget-object v3, p0, Lcom/google/ads/searchads/SearchAdRequest;->h:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    :cond_7
    invoke-virtual {v0}, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->getExtras()Ljava/util/Map;

    move-result-object v1

    const-string v2, "headersize"

    iget v3, p0, Lcom/google/ads/searchads/SearchAdRequest;->i:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    iget v1, p0, Lcom/google/ads/searchads/SearchAdRequest;->j:I

    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    if-eqz v1, :cond_8

    .line 260
    invoke-virtual {v0}, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->getExtras()Ljava/util/Map;

    move-result-object v1

    const-string v2, "bcolor"

    iget v3, p0, Lcom/google/ads/searchads/SearchAdRequest;->j:I

    invoke-direct {p0, v3}, Lcom/google/ads/searchads/SearchAdRequest;->a(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    :cond_8
    iget-object v1, p0, Lcom/google/ads/searchads/SearchAdRequest;->k:Lcom/google/ads/searchads/SearchAdRequest$BorderType;

    if-eqz v1, :cond_9

    .line 264
    invoke-virtual {v0}, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->getExtras()Ljava/util/Map;

    move-result-object v1

    const-string v2, "btype"

    iget-object v3, p0, Lcom/google/ads/searchads/SearchAdRequest;->k:Lcom/google/ads/searchads/SearchAdRequest$BorderType;

    invoke-virtual {v3}, Lcom/google/ads/searchads/SearchAdRequest$BorderType;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    :cond_9
    invoke-virtual {v0}, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->getExtras()Ljava/util/Map;

    move-result-object v1

    const-string v2, "bthick"

    iget v3, p0, Lcom/google/ads/searchads/SearchAdRequest;->l:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 269
    iget-object v1, p0, Lcom/google/ads/searchads/SearchAdRequest;->m:Ljava/lang/String;

    if-eqz v1, :cond_a

    .line 270
    invoke-virtual {v0}, Lcom/google/ads/mediation/admob/AdMobAdapterExtras;->getExtras()Ljava/util/Map;

    move-result-object v0

    const-string v1, "channel"

    iget-object v2, p0, Lcom/google/ads/searchads/SearchAdRequest;->m:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    :cond_a
    invoke-super {p0, p1}, Lcom/google/ads/AdRequest;->getRequestMap(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public setAnchorTextColor(I)V
    .locals 0
    .parameter "anchorTextColor"

    .prologue
    .line 158
    iput p1, p0, Lcom/google/ads/searchads/SearchAdRequest;->g:I

    .line 159
    return-void
.end method

.method public setBackgroundColor(I)V
    .locals 3
    .parameter "backgroundColor"

    .prologue
    const/4 v2, 0x0

    .line 100
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    const/16 v1, 0xff

    if-ne v0, v1, :cond_0

    .line 101
    iput p1, p0, Lcom/google/ads/searchads/SearchAdRequest;->b:I

    .line 102
    iput v2, p0, Lcom/google/ads/searchads/SearchAdRequest;->c:I

    .line 103
    iput v2, p0, Lcom/google/ads/searchads/SearchAdRequest;->d:I

    .line 107
    :cond_0
    return-void
.end method

.method public setBackgroundGradient(II)V
    .locals 3
    .parameter "from"
    .parameter "to"

    .prologue
    const/16 v2, 0xff

    const/4 v1, 0x0

    .line 119
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    if-ne v0, v2, :cond_0

    invoke-static {p2}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    if-ne v0, v2, :cond_0

    .line 120
    invoke-static {v1, v1, v1, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    iput v0, p0, Lcom/google/ads/searchads/SearchAdRequest;->b:I

    .line 121
    iput p1, p0, Lcom/google/ads/searchads/SearchAdRequest;->c:I

    .line 122
    iput p2, p0, Lcom/google/ads/searchads/SearchAdRequest;->d:I

    .line 126
    :cond_0
    return-void
.end method

.method public setBorderColor(I)V
    .locals 0
    .parameter "borderColor"

    .prologue
    .line 188
    iput p1, p0, Lcom/google/ads/searchads/SearchAdRequest;->j:I

    .line 189
    return-void
.end method

.method public setBorderThickness(I)V
    .locals 0
    .parameter "borderThickness"

    .prologue
    .line 206
    iput p1, p0, Lcom/google/ads/searchads/SearchAdRequest;->l:I

    .line 207
    return-void
.end method

.method public setBorderType(Lcom/google/ads/searchads/SearchAdRequest$BorderType;)V
    .locals 0
    .parameter "borderType"

    .prologue
    .line 196
    iput-object p1, p0, Lcom/google/ads/searchads/SearchAdRequest;->k:Lcom/google/ads/searchads/SearchAdRequest$BorderType;

    .line 197
    return-void
.end method

.method public setCustomChannels(Ljava/lang/String;)V
    .locals 0
    .parameter "channelIds"

    .prologue
    .line 214
    iput-object p1, p0, Lcom/google/ads/searchads/SearchAdRequest;->m:Ljava/lang/String;

    .line 215
    return-void
.end method

.method public setDescriptionTextColor(I)V
    .locals 0
    .parameter "descriptionTextColor"

    .prologue
    .line 147
    iput p1, p0, Lcom/google/ads/searchads/SearchAdRequest;->f:I

    .line 148
    return-void
.end method

.method public setFontFace(Ljava/lang/String;)V
    .locals 0
    .parameter "fontFace"

    .prologue
    .line 167
    iput-object p1, p0, Lcom/google/ads/searchads/SearchAdRequest;->h:Ljava/lang/String;

    .line 168
    return-void
.end method

.method public setHeaderTextColor(I)V
    .locals 0
    .parameter "headerTextColor"

    .prologue
    .line 136
    iput p1, p0, Lcom/google/ads/searchads/SearchAdRequest;->e:I

    .line 137
    return-void
.end method

.method public setHeaderTextSize(I)V
    .locals 0
    .parameter "headerTextSize"

    .prologue
    .line 177
    iput p1, p0, Lcom/google/ads/searchads/SearchAdRequest;->i:I

    .line 178
    return-void
.end method

.method public setQuery(Ljava/lang/String;)V
    .locals 0
    .parameter "query"

    .prologue
    .line 90
    iput-object p1, p0, Lcom/google/ads/searchads/SearchAdRequest;->a:Ljava/lang/String;

    .line 91
    return-void
.end method

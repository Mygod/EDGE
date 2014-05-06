.class Lcom/android/vending/licensing/ResponseData;
.super Ljava/lang/Object;
.source "ResponseData.java"


# instance fields
.field public extra:Ljava/lang/String;

.field public nonce:I

.field public packageName:Ljava/lang/String;

.field public responseCode:I

.field public timestamp:J

.field public userId:Ljava/lang/String;

.field public versionCode:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parse(Ljava/lang/String;)Lcom/android/vending/licensing/ResponseData;
    .locals 8
    .parameter "responseData"

    .prologue
    .line 47
    new-instance v5, Landroid/text/TextUtils$SimpleStringSplitter;

    const/16 v6, 0x3a

    invoke-direct {v5, v6}, Landroid/text/TextUtils$SimpleStringSplitter;-><init>(C)V

    .line 48
    .local v5, splitter:Landroid/text/TextUtils$StringSplitter;
    invoke-interface {v5, p0}, Landroid/text/TextUtils$StringSplitter;->setString(Ljava/lang/String;)V

    .line 49
    invoke-interface {v5}, Landroid/text/TextUtils$StringSplitter;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 50
    .local v3, it:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_0

    .line 51
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "Blank response."

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 53
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 56
    .local v4, mainData:Ljava/lang/String;
    const-string v1, ""

    .line 57
    .local v1, extraData:Ljava/lang/String;
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 58
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .end local v1           #extraData:Ljava/lang/String;
    check-cast v1, Ljava/lang/String;

    .line 61
    .restart local v1       #extraData:Ljava/lang/String;
    :cond_1
    const-string v6, "|"

    invoke-static {v6}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 62
    .local v2, fields:[Ljava/lang/String;
    array-length v6, v2

    const/4 v7, 0x6

    if-ge v6, v7, :cond_2

    .line 63
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "Wrong number of fields."

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 66
    :cond_2
    new-instance v0, Lcom/android/vending/licensing/ResponseData;

    invoke-direct {v0}, Lcom/android/vending/licensing/ResponseData;-><init>()V

    .line 67
    .local v0, data:Lcom/android/vending/licensing/ResponseData;
    iput-object v1, v0, Lcom/android/vending/licensing/ResponseData;->extra:Ljava/lang/String;

    .line 68
    const/4 v6, 0x0

    aget-object v6, v2, v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    iput v6, v0, Lcom/android/vending/licensing/ResponseData;->responseCode:I

    .line 69
    const/4 v6, 0x1

    aget-object v6, v2, v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    iput v6, v0, Lcom/android/vending/licensing/ResponseData;->nonce:I

    .line 70
    const/4 v6, 0x2

    aget-object v6, v2, v6

    iput-object v6, v0, Lcom/android/vending/licensing/ResponseData;->packageName:Ljava/lang/String;

    .line 71
    const/4 v6, 0x3

    aget-object v6, v2, v6

    iput-object v6, v0, Lcom/android/vending/licensing/ResponseData;->versionCode:Ljava/lang/String;

    .line 73
    const/4 v6, 0x4

    aget-object v6, v2, v6

    iput-object v6, v0, Lcom/android/vending/licensing/ResponseData;->userId:Ljava/lang/String;

    .line 74
    const/4 v6, 0x5

    aget-object v6, v2, v6

    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    iput-wide v6, v0, Lcom/android/vending/licensing/ResponseData;->timestamp:J

    .line 76
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 81
    const-string v0, "|"

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/android/vending/licensing/ResponseData;->responseCode:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget v3, p0, Lcom/android/vending/licensing/ResponseData;->nonce:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/android/vending/licensing/ResponseData;->packageName:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/android/vending/licensing/ResponseData;->versionCode:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x4

    iget-object v3, p0, Lcom/android/vending/licensing/ResponseData;->userId:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x5

    iget-wide v3, p0, Lcom/android/vending/licensing/ResponseData;->timestamp:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

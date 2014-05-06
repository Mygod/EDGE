.class public Lcom/apportable/objcproxy/CallbackPayload;
.super Ljava/lang/Object;
.source "CallbackPayload.java"


# instance fields
.field private item1:Ljava/lang/Object;

.field private item2:Ljava/lang/Object;

.field private item3:Ljava/lang/Object;

.field private item4:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 12
    invoke-direct {p0, v0, v0, v0, v0}, Lcom/apportable/objcproxy/CallbackPayload;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .parameter "p1"

    .prologue
    const/4 v0, 0x0

    .line 16
    invoke-direct {p0, p1, v0, v0, v0}, Lcom/apportable/objcproxy/CallbackPayload;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1
    .parameter "p1"
    .parameter "p2"

    .prologue
    const/4 v0, 0x0

    .line 20
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/apportable/objcproxy/CallbackPayload;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 21
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1
    .parameter "p1"
    .parameter "p2"
    .parameter "p3"

    .prologue
    .line 24
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/apportable/objcproxy/CallbackPayload;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 25
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .parameter "p1"
    .parameter "p2"
    .parameter "p3"
    .parameter "p4"

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/apportable/objcproxy/CallbackPayload;->item1:Ljava/lang/Object;

    .line 29
    iput-object p2, p0, Lcom/apportable/objcproxy/CallbackPayload;->item2:Ljava/lang/Object;

    .line 30
    iput-object p3, p0, Lcom/apportable/objcproxy/CallbackPayload;->item3:Ljava/lang/Object;

    .line 31
    iput-object p4, p0, Lcom/apportable/objcproxy/CallbackPayload;->item4:Ljava/lang/Object;

    .line 32
    return-void
.end method


# virtual methods
.method public getItem1()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/apportable/objcproxy/CallbackPayload;->item1:Ljava/lang/Object;

    return-object v0
.end method

.method public getItem2()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/apportable/objcproxy/CallbackPayload;->item1:Ljava/lang/Object;

    return-object v0
.end method

.method public getItem3()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/apportable/objcproxy/CallbackPayload;->item1:Ljava/lang/Object;

    return-object v0
.end method

.method public getItem4()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/apportable/objcproxy/CallbackPayload;->item4:Ljava/lang/Object;

    return-object v0
.end method

.method public setItem1(Ljava/lang/Object;)V
    .locals 0
    .parameter "item"

    .prologue
    .line 51
    iput-object p1, p0, Lcom/apportable/objcproxy/CallbackPayload;->item1:Ljava/lang/Object;

    .line 52
    return-void
.end method

.method public setItem2(Ljava/lang/Object;)V
    .locals 0
    .parameter "item"

    .prologue
    .line 55
    iput-object p1, p0, Lcom/apportable/objcproxy/CallbackPayload;->item2:Ljava/lang/Object;

    .line 56
    return-void
.end method

.method public setItem3(Ljava/lang/Object;)V
    .locals 0
    .parameter "item"

    .prologue
    .line 59
    iput-object p1, p0, Lcom/apportable/objcproxy/CallbackPayload;->item3:Ljava/lang/Object;

    .line 60
    return-void
.end method

.method public setItem4(Ljava/lang/Object;)V
    .locals 0
    .parameter "item"

    .prologue
    .line 63
    iput-object p1, p0, Lcom/apportable/objcproxy/CallbackPayload;->item4:Ljava/lang/Object;

    .line 64
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 67
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 68
    .local v0, array:Lorg/json/JSONArray;
    iget-object v1, p0, Lcom/apportable/objcproxy/CallbackPayload;->item1:Ljava/lang/Object;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/apportable/objcproxy/CallbackPayload;->item1:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 69
    :cond_0
    iget-object v1, p0, Lcom/apportable/objcproxy/CallbackPayload;->item2:Ljava/lang/Object;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/apportable/objcproxy/CallbackPayload;->item2:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 70
    :cond_1
    iget-object v1, p0, Lcom/apportable/objcproxy/CallbackPayload;->item3:Ljava/lang/Object;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/apportable/objcproxy/CallbackPayload;->item3:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 71
    :cond_2
    iget-object v1, p0, Lcom/apportable/objcproxy/CallbackPayload;->item4:Ljava/lang/Object;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/apportable/objcproxy/CallbackPayload;->item4:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 72
    :cond_3
    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

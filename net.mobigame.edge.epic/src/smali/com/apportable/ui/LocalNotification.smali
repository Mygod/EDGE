.class public Lcom/apportable/ui/LocalNotification;
.super Ljava/lang/Object;
.source "LocalNotification.java"

# interfaces
.implements Ljava/lang/Comparable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/apportable/ui/LocalNotification;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static TAG:Ljava/lang/String;

.field private static final serialPersistentFields:[Ljava/io/ObjectStreamField;


# instance fields
.field private alertAction:Ljava/lang/String;

.field private alertBody:Ljava/lang/String;

.field private alertLaunchImage:Ljava/lang/String;

.field private applicationIconBadgeNumber:J

.field private fireDate:D

.field private hasAction:Z

.field private soundName:Ljava/lang/String;

.field private timeZone:J

.field private userInfo:Landroid/os/Bundle;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 16
    const-string v0, "LocalNotification"

    sput-object v0, Lcom/apportable/ui/LocalNotification;->TAG:Ljava/lang/String;

    .line 19
    const/16 v0, 0x9

    new-array v0, v0, [Ljava/io/ObjectStreamField;

    const/4 v1, 0x0

    new-instance v2, Ljava/io/ObjectStreamField;

    const-string v3, "fireDate"

    sget-object v4, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-direct {v2, v3, v4}, Ljava/io/ObjectStreamField;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Ljava/io/ObjectStreamField;

    const-string v3, "alertBody"

    const-class v4, Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Ljava/io/ObjectStreamField;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    aput-object v2, v0, v1

    const/4 v1, 0x2

    new-instance v2, Ljava/io/ObjectStreamField;

    const-string v3, "hasAction"

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-direct {v2, v3, v4}, Ljava/io/ObjectStreamField;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    aput-object v2, v0, v1

    const/4 v1, 0x3

    new-instance v2, Ljava/io/ObjectStreamField;

    const-string v3, "alertAction"

    const-class v4, Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Ljava/io/ObjectStreamField;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    aput-object v2, v0, v1

    const/4 v1, 0x4

    new-instance v2, Ljava/io/ObjectStreamField;

    const-string v3, "alertLaunchImage"

    const-class v4, Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Ljava/io/ObjectStreamField;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    aput-object v2, v0, v1

    const/4 v1, 0x5

    new-instance v2, Ljava/io/ObjectStreamField;

    const-string v3, "soundName"

    const-class v4, Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Ljava/io/ObjectStreamField;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    aput-object v2, v0, v1

    const/4 v1, 0x6

    new-instance v2, Ljava/io/ObjectStreamField;

    const-string v3, "applicationIconBadgeNumber"

    sget-object v4, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-direct {v2, v3, v4}, Ljava/io/ObjectStreamField;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    aput-object v2, v0, v1

    const/4 v1, 0x7

    new-instance v2, Ljava/io/ObjectStreamField;

    const-string v3, "userInfoParcelBytes"

    const-class v4, [B

    invoke-direct {v2, v3, v4}, Ljava/io/ObjectStreamField;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    aput-object v2, v0, v1

    const/16 v1, 0x8

    new-instance v2, Ljava/io/ObjectStreamField;

    const-string v3, "timeZone"

    sget-object v4, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-direct {v2, v3, v4}, Ljava/io/ObjectStreamField;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    aput-object v2, v0, v1

    sput-object v0, Lcom/apportable/ui/LocalNotification;->serialPersistentFields:[Ljava/io/ObjectStreamField;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 5
    .parameter "object"

    .prologue
    const-wide/16 v3, 0x0

    const/4 v2, 0x0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/apportable/ui/LocalNotification;->fireDate:D

    .line 43
    iput-object v2, p0, Lcom/apportable/ui/LocalNotification;->alertBody:Ljava/lang/String;

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/apportable/ui/LocalNotification;->hasAction:Z

    .line 45
    iput-object v2, p0, Lcom/apportable/ui/LocalNotification;->alertAction:Ljava/lang/String;

    .line 46
    iput-object v2, p0, Lcom/apportable/ui/LocalNotification;->alertLaunchImage:Ljava/lang/String;

    .line 47
    iput-object v2, p0, Lcom/apportable/ui/LocalNotification;->soundName:Ljava/lang/String;

    .line 48
    iput-wide v3, p0, Lcom/apportable/ui/LocalNotification;->applicationIconBadgeNumber:J

    .line 49
    iput-object v2, p0, Lcom/apportable/ui/LocalNotification;->userInfo:Landroid/os/Bundle;

    .line 50
    iput-wide v3, p0, Lcom/apportable/ui/LocalNotification;->timeZone:J

    .line 51
    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 10
    .parameter "ois"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0x0

    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 146
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readFields()Ljava/io/ObjectInputStream$GetField;

    move-result-object v0

    .line 147
    .local v0, fields:Ljava/io/ObjectInputStream$GetField;
    const-string v3, "userInfoParcelBytes"

    invoke-virtual {v0, v3, v6}, Ljava/io/ObjectInputStream$GetField;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    move-object v2, v3

    check-cast v2, [B

    .line 149
    .local v2, parcelBytes:[B
    if-eqz v2, :cond_0

    .line 150
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 151
    .local v1, parcel:Landroid/os/Parcel;
    array-length v3, v2

    invoke-virtual {v1, v2, v7, v3}, Landroid/os/Parcel;->unmarshall([BII)V

    .line 152
    invoke-virtual {v1, v7}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 153
    invoke-virtual {v1}, Landroid/os/Parcel;->readBundle()Landroid/os/Bundle;

    move-result-object v3

    iput-object v3, p0, Lcom/apportable/ui/LocalNotification;->userInfo:Landroid/os/Bundle;

    .line 158
    .end local v1           #parcel:Landroid/os/Parcel;
    :goto_0
    const-string v3, "fireDate"

    const-wide/16 v4, 0x0

    invoke-virtual {v0, v3, v4, v5}, Ljava/io/ObjectInputStream$GetField;->get(Ljava/lang/String;D)D

    move-result-wide v3

    iput-wide v3, p0, Lcom/apportable/ui/LocalNotification;->fireDate:D

    .line 159
    const-string v3, "alertBody"

    invoke-virtual {v0, v3, v6}, Ljava/io/ObjectInputStream$GetField;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/apportable/ui/LocalNotification;->alertBody:Ljava/lang/String;

    .line 160
    const-string v3, "hasAction"

    invoke-virtual {v0, v3, v7}, Ljava/io/ObjectInputStream$GetField;->get(Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, p0, Lcom/apportable/ui/LocalNotification;->hasAction:Z

    .line 161
    const-string v3, "alertAction"

    invoke-virtual {v0, v3, v6}, Ljava/io/ObjectInputStream$GetField;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/apportable/ui/LocalNotification;->alertAction:Ljava/lang/String;

    .line 162
    const-string v3, "alertLaunchImage"

    invoke-virtual {v0, v3, v6}, Ljava/io/ObjectInputStream$GetField;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/apportable/ui/LocalNotification;->alertLaunchImage:Ljava/lang/String;

    .line 163
    const-string v3, "soundName"

    invoke-virtual {v0, v3, v6}, Ljava/io/ObjectInputStream$GetField;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/apportable/ui/LocalNotification;->soundName:Ljava/lang/String;

    .line 164
    const-string v3, "applicationIconBadgeNumber"

    invoke-virtual {v0, v3, v8, v9}, Ljava/io/ObjectInputStream$GetField;->get(Ljava/lang/String;J)J

    move-result-wide v3

    iput-wide v3, p0, Lcom/apportable/ui/LocalNotification;->applicationIconBadgeNumber:J

    .line 165
    const-string v3, "timeZone"

    invoke-virtual {v0, v3, v8, v9}, Ljava/io/ObjectInputStream$GetField;->get(Ljava/lang/String;J)J

    move-result-wide v3

    iput-wide v3, p0, Lcom/apportable/ui/LocalNotification;->timeZone:J

    .line 166
    return-void

    .line 155
    :cond_0
    iput-object v6, p0, Lcom/apportable/ui/LocalNotification;->userInfo:Landroid/os/Bundle;

    goto :goto_0
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 5
    .parameter "oos"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 172
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->putFields()Ljava/io/ObjectOutputStream$PutField;

    move-result-object v0

    .line 174
    .local v0, fields:Ljava/io/ObjectOutputStream$PutField;
    const-string v2, "fireDate"

    iget-wide v3, p0, Lcom/apportable/ui/LocalNotification;->fireDate:D

    invoke-virtual {v0, v2, v3, v4}, Ljava/io/ObjectOutputStream$PutField;->put(Ljava/lang/String;D)V

    .line 175
    const-string v2, "alertBody"

    iget-object v3, p0, Lcom/apportable/ui/LocalNotification;->alertBody:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Ljava/io/ObjectOutputStream$PutField;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 176
    const-string v2, "hasAction"

    iget-boolean v3, p0, Lcom/apportable/ui/LocalNotification;->hasAction:Z

    invoke-virtual {v0, v2, v3}, Ljava/io/ObjectOutputStream$PutField;->put(Ljava/lang/String;Z)V

    .line 177
    const-string v2, "alertAction"

    iget-object v3, p0, Lcom/apportable/ui/LocalNotification;->alertAction:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Ljava/io/ObjectOutputStream$PutField;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 178
    const-string v2, "alertLaunchImage"

    iget-object v3, p0, Lcom/apportable/ui/LocalNotification;->alertLaunchImage:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Ljava/io/ObjectOutputStream$PutField;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 179
    const-string v2, "soundName"

    iget-object v3, p0, Lcom/apportable/ui/LocalNotification;->soundName:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Ljava/io/ObjectOutputStream$PutField;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 180
    const-string v2, "applicationIconBadgeNumber"

    iget-wide v3, p0, Lcom/apportable/ui/LocalNotification;->applicationIconBadgeNumber:J

    invoke-virtual {v0, v2, v3, v4}, Ljava/io/ObjectOutputStream$PutField;->put(Ljava/lang/String;J)V

    .line 181
    const-string v2, "timeZone"

    iget-wide v3, p0, Lcom/apportable/ui/LocalNotification;->timeZone:J

    invoke-virtual {v0, v2, v3, v4}, Ljava/io/ObjectOutputStream$PutField;->put(Ljava/lang/String;J)V

    .line 183
    iget-object v2, p0, Lcom/apportable/ui/LocalNotification;->userInfo:Landroid/os/Bundle;

    if-nez v2, :cond_0

    .line 184
    const-string v2, "userInfoParcelBytes"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Ljava/io/ObjectOutputStream$PutField;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 191
    :goto_0
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->writeFields()V

    .line 192
    return-void

    .line 186
    :cond_0
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 187
    .local v1, parcel:Landroid/os/Parcel;
    iget-object v2, p0, Lcom/apportable/ui/LocalNotification;->userInfo:Landroid/os/Bundle;

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Landroid/os/Bundle;->writeToParcel(Landroid/os/Parcel;I)V

    .line 188
    const-string v2, "userInfoParcelBytes"

    invoke-virtual {v1}, Landroid/os/Parcel;->marshall()[B

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/io/ObjectOutputStream$PutField;->put(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method


# virtual methods
.method public compareTo(Lcom/apportable/ui/LocalNotification;)I
    .locals 8
    .parameter "comp"

    .prologue
    .line 130
    iget-wide v4, p0, Lcom/apportable/ui/LocalNotification;->fireDate:D

    iget-wide v6, p0, Lcom/apportable/ui/LocalNotification;->timeZone:J

    long-to-double v6, v6

    add-double v2, v4, v6

    .line 131
    .local v2, myAdjustedFireDate:D
    invoke-virtual {p1}, Lcom/apportable/ui/LocalNotification;->getFireDate()D

    move-result-wide v4

    invoke-virtual {p1}, Lcom/apportable/ui/LocalNotification;->getTimeZone()J

    move-result-wide v6

    long-to-double v6, v6

    add-double v0, v4, v6

    .line 132
    .local v0, compAdjustedFireDate:D
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Double;->compare(DD)I

    move-result v4

    return v4
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 14
    check-cast p1, Lcom/apportable/ui/LocalNotification;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/apportable/ui/LocalNotification;->compareTo(Lcom/apportable/ui/LocalNotification;)I

    move-result v0

    return v0
.end method

.method public getAlertAction()Ljava/lang/String;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/apportable/ui/LocalNotification;->alertAction:Ljava/lang/String;

    return-object v0
.end method

.method public getAlertBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/apportable/ui/LocalNotification;->alertBody:Ljava/lang/String;

    return-object v0
.end method

.method public getAlertLaunchImage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/apportable/ui/LocalNotification;->alertLaunchImage:Ljava/lang/String;

    return-object v0
.end method

.method public getApplicationIconBadgeNumber()J
    .locals 2

    .prologue
    .line 78
    iget-wide v0, p0, Lcom/apportable/ui/LocalNotification;->applicationIconBadgeNumber:J

    return-wide v0
.end method

.method public getFireDate()D
    .locals 2

    .prologue
    .line 54
    iget-wide v0, p0, Lcom/apportable/ui/LocalNotification;->fireDate:D

    return-wide v0
.end method

.method public getSoundName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/apportable/ui/LocalNotification;->soundName:Ljava/lang/String;

    return-object v0
.end method

.method public getTimeZone()J
    .locals 2

    .prologue
    .line 86
    iget-wide v0, p0, Lcom/apportable/ui/LocalNotification;->timeZone:J

    return-wide v0
.end method

.method public getUserInfo()Landroid/os/Bundle;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/apportable/ui/LocalNotification;->userInfo:Landroid/os/Bundle;

    return-object v0
.end method

.method public hasAction()Z
    .locals 1

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/apportable/ui/LocalNotification;->hasAction:Z

    return v0
.end method

.method public setAlertAction(Ljava/lang/String;)V
    .locals 0
    .parameter "aa"

    .prologue
    .line 102
    iput-object p1, p0, Lcom/apportable/ui/LocalNotification;->alertAction:Ljava/lang/String;

    .line 103
    return-void
.end method

.method public setAlertBody(Ljava/lang/String;)V
    .locals 0
    .parameter "ab"

    .prologue
    .line 94
    iput-object p1, p0, Lcom/apportable/ui/LocalNotification;->alertBody:Ljava/lang/String;

    .line 95
    return-void
.end method

.method public setAlertLaunchImage(Ljava/lang/String;)V
    .locals 0
    .parameter "ali"

    .prologue
    .line 106
    iput-object p1, p0, Lcom/apportable/ui/LocalNotification;->alertLaunchImage:Ljava/lang/String;

    .line 107
    return-void
.end method

.method public setApplicationIconBadgeNumber(J)V
    .locals 0
    .parameter "aibn"

    .prologue
    .line 114
    iput-wide p1, p0, Lcom/apportable/ui/LocalNotification;->applicationIconBadgeNumber:J

    .line 115
    return-void
.end method

.method public setFireDate(D)V
    .locals 0
    .parameter "fd"

    .prologue
    .line 90
    iput-wide p1, p0, Lcom/apportable/ui/LocalNotification;->fireDate:D

    .line 91
    return-void
.end method

.method public setHasAction(Z)V
    .locals 0
    .parameter "ha"

    .prologue
    .line 98
    iput-boolean p1, p0, Lcom/apportable/ui/LocalNotification;->hasAction:Z

    .line 99
    return-void
.end method

.method public setSoundName(Ljava/lang/String;)V
    .locals 0
    .parameter "sn"

    .prologue
    .line 110
    iput-object p1, p0, Lcom/apportable/ui/LocalNotification;->soundName:Ljava/lang/String;

    .line 111
    return-void
.end method

.method public setTimeZone(J)V
    .locals 0
    .parameter "tz"

    .prologue
    .line 122
    iput-wide p1, p0, Lcom/apportable/ui/LocalNotification;->timeZone:J

    .line 123
    return-void
.end method

.method public setUserInfo(Landroid/os/Bundle;)V
    .locals 0
    .parameter "ui"

    .prologue
    .line 118
    iput-object p1, p0, Lcom/apportable/ui/LocalNotification;->userInfo:Landroid/os/Bundle;

    .line 119
    return-void
.end method

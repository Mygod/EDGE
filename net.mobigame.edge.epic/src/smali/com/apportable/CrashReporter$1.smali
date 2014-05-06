.class final Lcom/apportable/CrashReporter$1;
.super Ljava/lang/Object;
.source "CrashReporter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/apportable/CrashReporter;->sendCrashReports()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$crashReportDir:Ljava/io/File;


# direct methods
.method constructor <init>(Ljava/io/File;)V
    .locals 0
    .parameter

    .prologue
    .line 191
    iput-object p1, p0, Lcom/apportable/CrashReporter$1;->val$crashReportDir:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 27

    .prologue
    .line 194
    invoke-static {}, Lcom/apportable/utils/MetaData;->getMetaData()Landroid/os/Bundle;

    move-result-object v16

    .line 195
    .local v16, metaData:Landroid/os/Bundle;
    const-string v24, "apportable.crashdump.app_id"

    move-object/from16 v0, v16

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 196
    .local v4, app_id:Ljava/lang/String;
    const-string v24, "apportable.crashdump.secret"

    move-object/from16 v0, v16

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 198
    .local v5, app_secret:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/apportable/CrashReporter$1;->val$crashReportDir:Ljava/io/File;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v6

    .local v6, arr$:[Ljava/io/File;
    array-length v14, v6

    .local v14, len$:I
    const/4 v13, 0x0

    .local v13, i$:I
    :goto_0
    if-ge v13, v14, :cond_2

    aget-object v9, v6, v13

    .line 199
    .local v9, crashReport:Ljava/io/File;
    const-string v24, "CrashReporter"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "Found a crash report:"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    if-eqz v4, :cond_0

    if-eqz v5, :cond_0

    const-string v24, ""

    move-object/from16 v0, v24

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_0

    const-string v24, ""

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_1

    .line 201
    :cond_0
    const-string v24, "CrashReporter"

    const-string v25, "Deleting crash report without sending it"

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 198
    :goto_1
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    .line 206
    :cond_1
    :try_start_0
    invoke-static {}, Lcom/apportable/app/VerdeApplication;->getApplication()Lcom/apportable/app/VerdeApplication;

    move-result-object v3

    .line 207
    .local v3, app:Lcom/apportable/app/VerdeApplication;
    invoke-virtual {v3}, Lcom/apportable/app/VerdeApplication;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v24

    invoke-virtual {v3}, Lcom/apportable/app/VerdeApplication;->getPackageName()Ljava/lang/String;

    move-result-object v25

    const/16 v26, 0x0

    invoke-virtual/range {v24 .. v26}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v17

    .line 208
    .local v17, pi:Landroid/content/pm/PackageInfo;
    move-object/from16 v0, v17

    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    move/from16 v24, v0

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v23

    .line 209
    .local v23, version_code:Ljava/lang/String;
    invoke-static {v3}, Lcom/apportable/Installation;->id(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v11

    .line 211
    .local v11, distinctID:Ljava/lang/String;
    const-string v24, "CrashReporter"

    const-string v25, "Attempting to read crash report"

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    new-instance v21, Ljava/io/FileInputStream;

    move-object/from16 v0, v21

    invoke-direct {v0, v9}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 213
    .local v21, stream:Ljava/io/FileInputStream;
    invoke-virtual {v9}, Ljava/io/File;->length()J

    move-result-wide v24

    move-wide/from16 v0, v24

    long-to-int v0, v0

    move/from16 v24, v0

    move/from16 v0, v24

    new-array v8, v0, [B

    .line 214
    .local v8, contents:[B
    move-object/from16 v0, v21

    invoke-virtual {v0, v8}, Ljava/io/FileInputStream;->read([B)I

    .line 215
    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v24

    const-string v25, "\\."

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v24

    const/16 v25, 0x0

    aget-object v10, v24, v25

    .line 218
    .local v10, crash_id:Ljava/lang/String;
    #calls: Lcom/apportable/CrashReporter;->getTrackingProperties()Lorg/json/JSONObject;
    invoke-static {}, Lcom/apportable/CrashReporter;->access$000()Lorg/json/JSONObject;

    move-result-object v22

    .line 219
    .local v22, superProperties:Lorg/json/JSONObject;
    const-string v24, "crashdump"

    const/16 v25, 0x0

    move/from16 v0, v25

    invoke-static {v8, v0}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 220
    invoke-virtual/range {v22 .. v22}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/String;->getBytes()[B

    move-result-object v19

    .line 223
    .local v19, req_body:[B
    const-string v24, "sha-1"

    invoke-static/range {v24 .. v24}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v15

    .line 224
    .local v15, md:Ljava/security/MessageDigest;
    const-string v24, "UTF8"

    move-object/from16 v0, v24

    invoke-virtual {v4, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v15, v0}, Ljava/security/MessageDigest;->update([B)V

    .line 225
    const-string v24, "UTF8"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v15, v0}, Ljava/security/MessageDigest;->update([B)V

    .line 226
    const-string v24, "UTF8"

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v15, v0}, Ljava/security/MessageDigest;->update([B)V

    .line 228
    const-string v24, "UTF8"

    move-object/from16 v0, v24

    invoke-virtual {v11, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v15, v0}, Ljava/security/MessageDigest;->update([B)V

    .line 229
    const-string v24, "UTF8"

    move-object/from16 v0, v24

    invoke-virtual {v10, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v15, v0}, Ljava/security/MessageDigest;->update([B)V

    .line 230
    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Ljava/security/MessageDigest;->update([B)V

    .line 231
    invoke-virtual {v15}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v24

    const/16 v25, 0xb

    invoke-static/range {v24 .. v25}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v20

    .line 232
    .local v20, sig_string:Ljava/lang/String;
    new-instance v18, Lorg/apache/http/client/methods/HttpPost;

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "http://breakpad.apportable.com:8000/v2/reportcrash.json?app_id="

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "&version="

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "&sig="

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "&installation="

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "&crash_id="

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 233
    .local v18, reporter:Lorg/apache/http/client/methods/HttpPost;
    new-instance v24, Lorg/apache/http/entity/ByteArrayEntity;

    move-object/from16 v0, v24

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/apache/http/entity/ByteArrayEntity;-><init>([B)V

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 234
    new-instance v7, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v7}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 235
    .local v7, client:Lorg/apache/http/impl/client/DefaultHttpClient;
    move-object/from16 v0, v18

    invoke-virtual {v7, v0}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    .line 236
    invoke-virtual {v9}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_1

    .line 237
    .end local v3           #app:Lcom/apportable/app/VerdeApplication;
    .end local v7           #client:Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v8           #contents:[B
    .end local v10           #crash_id:Ljava/lang/String;
    .end local v11           #distinctID:Ljava/lang/String;
    .end local v15           #md:Ljava/security/MessageDigest;
    .end local v17           #pi:Landroid/content/pm/PackageInfo;
    .end local v18           #reporter:Lorg/apache/http/client/methods/HttpPost;
    .end local v19           #req_body:[B
    .end local v20           #sig_string:Ljava/lang/String;
    .end local v21           #stream:Ljava/io/FileInputStream;
    .end local v22           #superProperties:Lorg/json/JSONObject;
    .end local v23           #version_code:Ljava/lang/String;
    :catch_0
    move-exception v12

    .line 238
    .local v12, e:Ljava/lang/Exception;
    invoke-virtual {v12}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1

    .line 242
    .end local v9           #crashReport:Ljava/io/File;
    .end local v12           #e:Ljava/lang/Exception;
    :cond_2
    return-void
.end method

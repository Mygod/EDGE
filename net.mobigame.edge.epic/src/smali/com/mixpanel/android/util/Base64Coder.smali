.class public Lcom/mixpanel/android/util/Base64Coder;
.super Ljava/lang/Object;
.source "Base64Coder.java"


# static fields
.field private static map1:[C

.field private static map2:[B


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/16 v6, 0x40

    .line 6
    new-array v3, v6, [C

    sput-object v3, Lcom/mixpanel/android/util/Base64Coder;->map1:[C

    .line 8
    const/4 v1, 0x0

    .line 9
    .local v1, i:I
    const/16 v0, 0x41

    .local v0, c:C
    move v2, v1

    .end local v1           #i:I
    .local v2, i:I
    :goto_0
    const/16 v3, 0x5a

    if-le v0, v3, :cond_0

    .line 10
    const/16 v0, 0x61

    :goto_1
    const/16 v3, 0x7a

    if-le v0, v3, :cond_1

    .line 11
    const/16 v0, 0x30

    :goto_2
    const/16 v3, 0x39

    if-le v0, v3, :cond_2

    .line 12
    sget-object v3, Lcom/mixpanel/android/util/Base64Coder;->map1:[C

    add-int/lit8 v1, v2, 0x1

    .end local v2           #i:I
    .restart local v1       #i:I
    const/16 v4, 0x2b

    aput-char v4, v3, v2

    sget-object v3, Lcom/mixpanel/android/util/Base64Coder;->map1:[C

    add-int/lit8 v2, v1, 0x1

    .end local v1           #i:I
    .restart local v2       #i:I
    const/16 v4, 0x2f

    aput-char v4, v3, v1

    .line 15
    const/16 v3, 0x80

    new-array v3, v3, [B

    sput-object v3, Lcom/mixpanel/android/util/Base64Coder;->map2:[B

    .line 17
    const/4 v1, 0x0

    .end local v2           #i:I
    .restart local v1       #i:I
    :goto_3
    sget-object v3, Lcom/mixpanel/android/util/Base64Coder;->map2:[B

    array-length v3, v3

    if-lt v1, v3, :cond_3

    .line 18
    const/4 v1, 0x0

    :goto_4
    if-lt v1, v6, :cond_4

    .line 3
    return-void

    .line 9
    .end local v1           #i:I
    .restart local v2       #i:I
    :cond_0
    sget-object v3, Lcom/mixpanel/android/util/Base64Coder;->map1:[C

    add-int/lit8 v1, v2, 0x1

    .end local v2           #i:I
    .restart local v1       #i:I
    aput-char v0, v3, v2

    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    move v2, v1

    .end local v1           #i:I
    .restart local v2       #i:I
    goto :goto_0

    .line 10
    :cond_1
    sget-object v3, Lcom/mixpanel/android/util/Base64Coder;->map1:[C

    add-int/lit8 v1, v2, 0x1

    .end local v2           #i:I
    .restart local v1       #i:I
    aput-char v0, v3, v2

    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    move v2, v1

    .end local v1           #i:I
    .restart local v2       #i:I
    goto :goto_1

    .line 11
    :cond_2
    sget-object v3, Lcom/mixpanel/android/util/Base64Coder;->map1:[C

    add-int/lit8 v1, v2, 0x1

    .end local v2           #i:I
    .restart local v1       #i:I
    aput-char v0, v3, v2

    add-int/lit8 v3, v0, 0x1

    int-to-char v0, v3

    move v2, v1

    .end local v1           #i:I
    .restart local v2       #i:I
    goto :goto_2

    .line 17
    .end local v2           #i:I
    .restart local v1       #i:I
    :cond_3
    sget-object v3, Lcom/mixpanel/android/util/Base64Coder;->map2:[B

    const/4 v4, -0x1

    aput-byte v4, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 18
    :cond_4
    sget-object v3, Lcom/mixpanel/android/util/Base64Coder;->map2:[B

    sget-object v4, Lcom/mixpanel/android/util/Base64Coder;->map1:[C

    aget-char v4, v4, v1

    int-to-byte v5, v1

    aput-byte v5, v3, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_4
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decode(Ljava/lang/String;)[B
    .locals 1
    .parameter "s"

    .prologue
    .line 81
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    invoke-static {v0}, Lcom/mixpanel/android/util/Base64Coder;->decode([C)[B

    move-result-object v0

    return-object v0
.end method

.method public static decode([C)[B
    .locals 22
    .parameter "in"

    .prologue
    .line 91
    move-object/from16 v0, p0

    array-length v10, v0

    .line 92
    .local v10, iLen:I
    rem-int/lit8 v20, v10, 0x4

    if-eqz v20, :cond_1

    new-instance v20, Ljava/lang/IllegalArgumentException;

    const-string v21, "Length of Base64 encoded input string is not a multiple of 4."

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 93
    :cond_0
    add-int/lit8 v10, v10, -0x1

    :cond_1
    if-lez v10, :cond_2

    add-int/lit8 v20, v10, -0x1

    aget-char v20, p0, v20

    const/16 v21, 0x3d

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_0

    .line 94
    :cond_2
    mul-int/lit8 v20, v10, 0x3

    div-int/lit8 v16, v20, 0x4

    .line 95
    .local v16, oLen:I
    move/from16 v0, v16

    new-array v0, v0, [B

    move-object/from16 v19, v0

    .line 96
    .local v19, out:[B
    const/4 v11, 0x0

    .line 97
    .local v11, ip:I
    const/16 v17, 0x0

    .local v17, op:I
    move/from16 v18, v17

    .end local v17           #op:I
    .local v18, op:I
    move v12, v11

    .line 98
    .end local v11           #ip:I
    .local v12, ip:I
    :goto_0
    if-lt v12, v10, :cond_3

    .line 117
    return-object v19

    .line 99
    :cond_3
    add-int/lit8 v11, v12, 0x1

    .end local v12           #ip:I
    .restart local v11       #ip:I
    aget-char v6, p0, v12

    .line 100
    .local v6, i0:I
    add-int/lit8 v12, v11, 0x1

    .end local v11           #ip:I
    .restart local v12       #ip:I
    aget-char v7, p0, v11

    .line 101
    .local v7, i1:I
    if-ge v12, v10, :cond_5

    add-int/lit8 v11, v12, 0x1

    .end local v12           #ip:I
    .restart local v11       #ip:I
    aget-char v8, p0, v12

    move v12, v11

    .line 102
    .end local v11           #ip:I
    .local v8, i2:I
    .restart local v12       #ip:I
    :goto_1
    if-ge v12, v10, :cond_6

    add-int/lit8 v11, v12, 0x1

    .end local v12           #ip:I
    .restart local v11       #ip:I
    aget-char v9, p0, v12

    .line 103
    .local v9, i3:I
    :goto_2
    const/16 v20, 0x7f

    move/from16 v0, v20

    if-gt v6, v0, :cond_4

    const/16 v20, 0x7f

    move/from16 v0, v20

    if-gt v7, v0, :cond_4

    const/16 v20, 0x7f

    move/from16 v0, v20

    if-gt v8, v0, :cond_4

    const/16 v20, 0x7f

    move/from16 v0, v20

    if-le v9, v0, :cond_7

    .line 104
    :cond_4
    new-instance v20, Ljava/lang/IllegalArgumentException;

    const-string v21, "Illegal character in Base64 encoded data."

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 101
    .end local v8           #i2:I
    .end local v9           #i3:I
    .end local v11           #ip:I
    .restart local v12       #ip:I
    :cond_5
    const/16 v8, 0x41

    goto :goto_1

    .line 102
    .restart local v8       #i2:I
    :cond_6
    const/16 v9, 0x41

    move v11, v12

    .end local v12           #ip:I
    .restart local v11       #ip:I
    goto :goto_2

    .line 105
    .restart local v9       #i3:I
    :cond_7
    sget-object v20, Lcom/mixpanel/android/util/Base64Coder;->map2:[B

    aget-byte v2, v20, v6

    .line 106
    .local v2, b0:I
    sget-object v20, Lcom/mixpanel/android/util/Base64Coder;->map2:[B

    aget-byte v3, v20, v7

    .line 107
    .local v3, b1:I
    sget-object v20, Lcom/mixpanel/android/util/Base64Coder;->map2:[B

    aget-byte v4, v20, v8

    .line 108
    .local v4, b2:I
    sget-object v20, Lcom/mixpanel/android/util/Base64Coder;->map2:[B

    aget-byte v5, v20, v9

    .line 109
    .local v5, b3:I
    if-ltz v2, :cond_8

    if-ltz v3, :cond_8

    if-ltz v4, :cond_8

    if-gez v5, :cond_9

    .line 110
    :cond_8
    new-instance v20, Ljava/lang/IllegalArgumentException;

    const-string v21, "Illegal character in Base64 encoded data."

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 111
    :cond_9
    shl-int/lit8 v20, v2, 0x2

    ushr-int/lit8 v21, v3, 0x4

    or-int v13, v20, v21

    .line 112
    .local v13, o0:I
    and-int/lit8 v20, v3, 0xf

    shl-int/lit8 v20, v20, 0x4

    ushr-int/lit8 v21, v4, 0x2

    or-int v14, v20, v21

    .line 113
    .local v14, o1:I
    and-int/lit8 v20, v4, 0x3

    shl-int/lit8 v20, v20, 0x6

    or-int v15, v20, v5

    .line 114
    .local v15, o2:I
    add-int/lit8 v17, v18, 0x1

    .end local v18           #op:I
    .restart local v17       #op:I
    int-to-byte v0, v13

    move/from16 v20, v0

    aput-byte v20, v19, v18

    .line 115
    move/from16 v0, v17

    move/from16 v1, v16

    if-ge v0, v1, :cond_b

    add-int/lit8 v18, v17, 0x1

    .end local v17           #op:I
    .restart local v18       #op:I
    int-to-byte v0, v14

    move/from16 v20, v0

    aput-byte v20, v19, v17

    .line 116
    :goto_3
    move/from16 v0, v18

    move/from16 v1, v16

    if-ge v0, v1, :cond_a

    add-int/lit8 v17, v18, 0x1

    .end local v18           #op:I
    .restart local v17       #op:I
    int-to-byte v0, v15

    move/from16 v20, v0

    aput-byte v20, v19, v18

    move/from16 v18, v17

    .end local v17           #op:I
    .restart local v18       #op:I
    move v12, v11

    .end local v11           #ip:I
    .restart local v12       #ip:I
    goto/16 :goto_0

    .end local v12           #ip:I
    .restart local v11       #ip:I
    :cond_a
    move v12, v11

    .end local v11           #ip:I
    .restart local v12       #ip:I
    goto/16 :goto_0

    .end local v12           #ip:I
    .end local v18           #op:I
    .restart local v11       #ip:I
    .restart local v17       #op:I
    :cond_b
    move/from16 v18, v17

    .end local v17           #op:I
    .restart local v18       #op:I
    goto :goto_3
.end method

.method public static decodeString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "s"

    .prologue
    .line 72
    new-instance v0, Ljava/lang/String;

    invoke-static {p0}, Lcom/mixpanel/android/util/Base64Coder;->decode(Ljava/lang/String;)[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    return-object v0
.end method

.method public static encode([B)[C
    .locals 1
    .parameter "in"

    .prologue
    .line 36
    array-length v0, p0

    invoke-static {p0, v0}, Lcom/mixpanel/android/util/Base64Coder;->encode([BI)[C

    move-result-object v0

    return-object v0
.end method

.method public static encode([BI)[C
    .locals 17
    .parameter "in"
    .parameter "iLen"

    .prologue
    .line 46
    mul-int/lit8 v15, p1, 0x4

    add-int/lit8 v15, v15, 0x2

    div-int/lit8 v10, v15, 0x3

    .line 47
    .local v10, oDataLen:I
    add-int/lit8 v15, p1, 0x2

    div-int/lit8 v15, v15, 0x3

    mul-int/lit8 v11, v15, 0x4

    .line 48
    .local v11, oLen:I
    new-array v14, v11, [C

    .line 49
    .local v14, out:[C
    const/4 v4, 0x0

    .line 50
    .local v4, ip:I
    const/4 v12, 0x0

    .local v12, op:I
    move v13, v12

    .end local v12           #op:I
    .local v13, op:I
    move v5, v4

    .line 51
    .end local v4           #ip:I
    .local v5, ip:I
    :goto_0
    move/from16 v0, p1

    if-lt v5, v0, :cond_0

    .line 63
    return-object v14

    .line 52
    :cond_0
    add-int/lit8 v4, v5, 0x1

    .end local v5           #ip:I
    .restart local v4       #ip:I
    aget-byte v15, p0, v5

    and-int/lit16 v1, v15, 0xff

    .line 53
    .local v1, i0:I
    move/from16 v0, p1

    if-ge v4, v0, :cond_1

    add-int/lit8 v5, v4, 0x1

    .end local v4           #ip:I
    .restart local v5       #ip:I
    aget-byte v15, p0, v4

    and-int/lit16 v2, v15, 0xff

    .line 54
    .local v2, i1:I
    :goto_1
    move/from16 v0, p1

    if-ge v5, v0, :cond_2

    add-int/lit8 v4, v5, 0x1

    .end local v5           #ip:I
    .restart local v4       #ip:I
    aget-byte v15, p0, v5

    and-int/lit16 v3, v15, 0xff

    .line 55
    .local v3, i2:I
    :goto_2
    ushr-int/lit8 v6, v1, 0x2

    .line 56
    .local v6, o0:I
    and-int/lit8 v15, v1, 0x3

    shl-int/lit8 v15, v15, 0x4

    ushr-int/lit8 v16, v2, 0x4

    or-int v7, v15, v16

    .line 57
    .local v7, o1:I
    and-int/lit8 v15, v2, 0xf

    shl-int/lit8 v15, v15, 0x2

    ushr-int/lit8 v16, v3, 0x6

    or-int v8, v15, v16

    .line 58
    .local v8, o2:I
    and-int/lit8 v9, v3, 0x3f

    .line 59
    .local v9, o3:I
    add-int/lit8 v12, v13, 0x1

    .end local v13           #op:I
    .restart local v12       #op:I
    sget-object v15, Lcom/mixpanel/android/util/Base64Coder;->map1:[C

    aget-char v15, v15, v6

    aput-char v15, v14, v13

    .line 60
    add-int/lit8 v13, v12, 0x1

    .end local v12           #op:I
    .restart local v13       #op:I
    sget-object v15, Lcom/mixpanel/android/util/Base64Coder;->map1:[C

    aget-char v15, v15, v7

    aput-char v15, v14, v12

    .line 61
    if-ge v13, v10, :cond_3

    sget-object v15, Lcom/mixpanel/android/util/Base64Coder;->map1:[C

    aget-char v15, v15, v8

    :goto_3
    aput-char v15, v14, v13

    add-int/lit8 v12, v13, 0x1

    .line 62
    .end local v13           #op:I
    .restart local v12       #op:I
    if-ge v12, v10, :cond_4

    sget-object v15, Lcom/mixpanel/android/util/Base64Coder;->map1:[C

    aget-char v15, v15, v9

    :goto_4
    aput-char v15, v14, v12

    add-int/lit8 v12, v12, 0x1

    move v13, v12

    .end local v12           #op:I
    .restart local v13       #op:I
    move v5, v4

    .end local v4           #ip:I
    .restart local v5       #ip:I
    goto :goto_0

    .line 53
    .end local v2           #i1:I
    .end local v3           #i2:I
    .end local v5           #ip:I
    .end local v6           #o0:I
    .end local v7           #o1:I
    .end local v8           #o2:I
    .end local v9           #o3:I
    .restart local v4       #ip:I
    :cond_1
    const/4 v2, 0x0

    move v5, v4

    .end local v4           #ip:I
    .restart local v5       #ip:I
    goto :goto_1

    .line 54
    .restart local v2       #i1:I
    :cond_2
    const/4 v3, 0x0

    move v4, v5

    .end local v5           #ip:I
    .restart local v4       #ip:I
    goto :goto_2

    .line 61
    .restart local v3       #i2:I
    .restart local v6       #o0:I
    .restart local v7       #o1:I
    .restart local v8       #o2:I
    .restart local v9       #o3:I
    :cond_3
    const/16 v15, 0x3d

    goto :goto_3

    .line 62
    .end local v13           #op:I
    .restart local v12       #op:I
    :cond_4
    const/16 v15, 0x3d

    goto :goto_4
.end method

.method public static encodeString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "s"

    .prologue
    .line 27
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-static {v1}, Lcom/mixpanel/android/util/Base64Coder;->encode([B)[C

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    return-object v0
.end method

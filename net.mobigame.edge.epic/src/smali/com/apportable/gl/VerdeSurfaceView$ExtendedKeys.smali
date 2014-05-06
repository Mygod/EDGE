.class final enum Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;
.super Ljava/lang/Enum;
.source "VerdeSurfaceView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/apportable/gl/VerdeSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "ExtendedKeys"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

.field public static final enum KEYCODE_BUTTON_A:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

.field public static final enum KEYCODE_BUTTON_B:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

.field public static final enum KEYCODE_BUTTON_C:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

.field public static final enum KEYCODE_BUTTON_L1:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

.field public static final enum KEYCODE_BUTTON_L2:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

.field public static final enum KEYCODE_BUTTON_MODE:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

.field public static final enum KEYCODE_BUTTON_R1:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

.field public static final enum KEYCODE_BUTTON_R2:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

.field public static final enum KEYCODE_BUTTON_SELECT:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

.field public static final enum KEYCODE_BUTTON_START:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

.field public static final enum KEYCODE_BUTTON_THUMBL:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

.field public static final enum KEYCODE_BUTTON_THUMBR:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

.field public static final enum KEYCODE_BUTTON_X:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

.field public static final enum KEYCODE_BUTTON_Y:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

.field public static final enum KEYCODE_BUTTON_Z:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;


# instance fields
.field private keyCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 138
    new-instance v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    const-string v1, "KEYCODE_BUTTON_A"

    const/16 v2, 0x60

    invoke-direct {v0, v1, v4, v2}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_A:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    .line 142
    new-instance v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    const-string v1, "KEYCODE_BUTTON_B"

    const/16 v2, 0x61

    invoke-direct {v0, v1, v5, v2}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_B:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    .line 146
    new-instance v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    const-string v1, "KEYCODE_BUTTON_C"

    const/16 v2, 0x62

    invoke-direct {v0, v1, v6, v2}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_C:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    .line 150
    new-instance v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    const-string v1, "KEYCODE_BUTTON_X"

    const/16 v2, 0x63

    invoke-direct {v0, v1, v7, v2}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_X:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    .line 154
    new-instance v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    const-string v1, "KEYCODE_BUTTON_Y"

    const/16 v2, 0x64

    invoke-direct {v0, v1, v8, v2}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_Y:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    .line 158
    new-instance v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    const-string v1, "KEYCODE_BUTTON_Z"

    const/4 v2, 0x5

    const/16 v3, 0x65

    invoke-direct {v0, v1, v2, v3}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_Z:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    .line 162
    new-instance v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    const-string v1, "KEYCODE_BUTTON_L1"

    const/4 v2, 0x6

    const/16 v3, 0x66

    invoke-direct {v0, v1, v2, v3}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_L1:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    .line 166
    new-instance v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    const-string v1, "KEYCODE_BUTTON_R1"

    const/4 v2, 0x7

    const/16 v3, 0x67

    invoke-direct {v0, v1, v2, v3}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_R1:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    .line 170
    new-instance v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    const-string v1, "KEYCODE_BUTTON_L2"

    const/16 v2, 0x8

    const/16 v3, 0x68

    invoke-direct {v0, v1, v2, v3}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_L2:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    .line 174
    new-instance v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    const-string v1, "KEYCODE_BUTTON_R2"

    const/16 v2, 0x9

    const/16 v3, 0x69

    invoke-direct {v0, v1, v2, v3}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_R2:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    .line 178
    new-instance v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    const-string v1, "KEYCODE_BUTTON_THUMBL"

    const/16 v2, 0xa

    const/16 v3, 0x6a

    invoke-direct {v0, v1, v2, v3}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_THUMBL:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    .line 182
    new-instance v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    const-string v1, "KEYCODE_BUTTON_THUMBR"

    const/16 v2, 0xb

    const/16 v3, 0x6b

    invoke-direct {v0, v1, v2, v3}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_THUMBR:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    .line 185
    new-instance v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    const-string v1, "KEYCODE_BUTTON_START"

    const/16 v2, 0xc

    const/16 v3, 0x6c

    invoke-direct {v0, v1, v2, v3}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_START:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    .line 188
    new-instance v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    const-string v1, "KEYCODE_BUTTON_SELECT"

    const/16 v2, 0xd

    const/16 v3, 0x6d

    invoke-direct {v0, v1, v2, v3}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_SELECT:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    .line 191
    new-instance v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    const-string v1, "KEYCODE_BUTTON_MODE"

    const/16 v2, 0xe

    const/16 v3, 0x6e

    invoke-direct {v0, v1, v2, v3}, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_MODE:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    .line 134
    const/16 v0, 0xf

    new-array v0, v0, [Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_A:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    aput-object v1, v0, v4

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_B:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    aput-object v1, v0, v5

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_C:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    aput-object v1, v0, v6

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_X:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    aput-object v1, v0, v7

    sget-object v1, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_Y:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_Z:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_L1:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_R1:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_L2:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_R2:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_THUMBL:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_THUMBR:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_START:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_SELECT:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->KEYCODE_BUTTON_MODE:Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    aput-object v2, v0, v1

    sput-object v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->$VALUES:[Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .parameter
    .parameter
    .parameter "keyCode"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 195
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;
    .locals 1
    .parameter "name"

    .prologue
    .line 134
    const-class v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    return-object v0
.end method

.method public static values()[Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;
    .locals 1

    .prologue
    .line 134
    sget-object v0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->$VALUES:[Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    invoke-virtual {v0}, [Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;

    return-object v0
.end method


# virtual methods
.method public keyCode()I
    .locals 1

    .prologue
    .line 196
    iget v0, p0, Lcom/apportable/gl/VerdeSurfaceView$ExtendedKeys;->keyCode:I

    return v0
.end method

.class public Lcom/google/ads/z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/ads/n;


# static fields
.field private static final a:Lcom/google/ads/internal/a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    sget-object v0, Lcom/google/ads/internal/a;->a:Lcom/google/ads/util/f;

    invoke-interface {v0}, Lcom/google/ads/util/f;->b()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/ads/internal/a;

    sput-object v0, Lcom/google/ads/z;->a:Lcom/google/ads/internal/a;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected a(Ljava/util/HashMap;Ljava/lang/String;ILandroid/util/DisplayMetrics;)I
    .locals 3
    .parameter
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "I",
            "Landroid/util/DisplayMetrics;",
            ")I"
        }
    .end annotation

    .prologue
    .line 50
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 52
    if-eqz v0, :cond_0

    .line 54
    const/4 v1, 0x1

    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    int-to-float v2, v2

    invoke-static {v1, v2, p4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    float-to-int p3, v0

    .line 61
    :cond_0
    :goto_0
    return p3

    .line 57
    :catch_0
    move-exception v1

    .line 58
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not parse \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\" in a video gmsg: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public a(Lcom/google/ads/internal/d;Ljava/util/HashMap;Landroid/webkit/WebView;)V
    .locals 9
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/ads/internal/d;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Landroid/webkit/WebView;",
            ")V"
        }
    .end annotation

    .prologue
    const/4 v7, -0x1

    const/4 v4, 0x0

    .line 72
    const-string v0, "action"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 73
    if-nez v0, :cond_0

    .line 74
    const-string v0, "No \"action\" parameter in a video gmsg."

    invoke-static {v0}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    .line 170
    :goto_0
    return-void

    .line 80
    :cond_0
    instance-of v1, p3, Lcom/google/ads/internal/AdWebView;

    if-eqz v1, :cond_1

    .line 81
    check-cast p3, Lcom/google/ads/internal/AdWebView;

    .line 88
    invoke-virtual {p3}, Lcom/google/ads/internal/AdWebView;->b()Lcom/google/ads/AdActivity;

    move-result-object v1

    .line 89
    if-nez v1, :cond_2

    .line 90
    const-string v0, "Could not get adActivity for a video gmsg."

    invoke-static {v0}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    goto :goto_0

    .line 83
    :cond_1
    const-string v0, "Could not get adWebView for a video gmsg."

    invoke-static {v0}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    goto :goto_0

    .line 95
    :cond_2
    const-string v2, "new"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 96
    const-string v3, "position"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 97
    if-nez v2, :cond_3

    if-eqz v3, :cond_5

    .line 99
    :cond_3
    invoke-static {v1}, Lcom/google/ads/util/AdUtil;->a(Landroid/app/Activity;)Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 100
    const-string v3, "x"

    invoke-virtual {p0, p2, v3, v4, v0}, Lcom/google/ads/z;->a(Ljava/util/HashMap;Ljava/lang/String;ILandroid/util/DisplayMetrics;)I

    move-result v3

    .line 101
    const-string v5, "y"

    invoke-virtual {p0, p2, v5, v4, v0}, Lcom/google/ads/z;->a(Ljava/util/HashMap;Ljava/lang/String;ILandroid/util/DisplayMetrics;)I

    move-result v4

    .line 102
    const-string v5, "w"

    invoke-virtual {p0, p2, v5, v7, v0}, Lcom/google/ads/z;->a(Ljava/util/HashMap;Ljava/lang/String;ILandroid/util/DisplayMetrics;)I

    move-result v5

    .line 103
    const-string v6, "h"

    invoke-virtual {p0, p2, v6, v7, v0}, Lcom/google/ads/z;->a(Ljava/util/HashMap;Ljava/lang/String;ILandroid/util/DisplayMetrics;)I

    move-result v0

    .line 105
    if-eqz v2, :cond_4

    invoke-virtual {v1}, Lcom/google/ads/AdActivity;->getAdVideoView()Lcom/google/ads/internal/AdVideoView;

    move-result-object v2

    if-nez v2, :cond_4

    .line 106
    invoke-virtual {v1, v3, v4, v5, v0}, Lcom/google/ads/AdActivity;->newAdVideoView(IIII)V

    goto :goto_0

    .line 108
    :cond_4
    invoke-virtual {v1, v3, v4, v5, v0}, Lcom/google/ads/AdActivity;->moveAdVideoView(IIII)V

    goto :goto_0

    .line 112
    :cond_5
    invoke-virtual {v1}, Lcom/google/ads/AdActivity;->getAdVideoView()Lcom/google/ads/internal/AdVideoView;

    move-result-object v8

    .line 113
    if-nez v8, :cond_6

    .line 115
    sget-object v0, Lcom/google/ads/z;->a:Lcom/google/ads/internal/a;

    const-string v1, "onVideoEvent"

    const-string v2, "{\'event\': \'error\', \'what\': \'no_video_view\'}"

    invoke-virtual {v0, p3, v1, v2}, Lcom/google/ads/internal/a;->a(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 121
    :cond_6
    const-string v2, "click"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 122
    invoke-static {v1}, Lcom/google/ads/util/AdUtil;->a(Landroid/app/Activity;)Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 123
    const-string v1, "x"

    invoke-virtual {p0, p2, v1, v4, v0}, Lcom/google/ads/z;->a(Ljava/util/HashMap;Ljava/lang/String;ILandroid/util/DisplayMetrics;)I

    move-result v2

    .line 124
    const-string v1, "y"

    invoke-virtual {p0, p2, v1, v4, v0}, Lcom/google/ads/z;->a(Ljava/util/HashMap;Ljava/lang/String;ILandroid/util/DisplayMetrics;)I

    move-result v3

    .line 127
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 128
    int-to-float v5, v2

    int-to-float v6, v3

    move-wide v2, v0

    move v7, v4

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v0

    .line 129
    invoke-virtual {v8, v0}, Lcom/google/ads/internal/AdVideoView;->a(Landroid/view/MotionEvent;)V

    goto/16 :goto_0

    .line 130
    :cond_7
    const-string v1, "controls"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 131
    const-string v0, "enabled"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 132
    if-nez v0, :cond_8

    .line 133
    const-string v0, "No \"enabled\" parameter in a controls video gmsg."

    invoke-static {v0}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 136
    :cond_8
    const-string v1, "true"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 137
    const/4 v0, 0x1

    invoke-virtual {v8, v0}, Lcom/google/ads/internal/AdVideoView;->setMediaControllerEnabled(Z)V

    goto/16 :goto_0

    .line 139
    :cond_9
    invoke-virtual {v8, v4}, Lcom/google/ads/internal/AdVideoView;->setMediaControllerEnabled(Z)V

    goto/16 :goto_0

    .line 141
    :cond_a
    const-string v1, "currentTime"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 142
    const-string v0, "time"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 143
    if-nez v0, :cond_b

    .line 144
    const-string v0, "No \"time\" parameter in a currentTime video gmsg."

    invoke-static {v0}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 148
    :cond_b
    :try_start_0
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    .line 149
    const/high16 v2, 0x447a

    mul-float/2addr v1, v2

    float-to-int v1, v1

    .line 150
    invoke-virtual {v8, v1}, Lcom/google/ads/internal/AdVideoView;->a(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 151
    :catch_0
    move-exception v1

    .line 152
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not parse \"time\" parameter: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 154
    :cond_c
    const-string v1, "hide"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 155
    const/4 v0, 0x4

    invoke-virtual {v8, v0}, Lcom/google/ads/internal/AdVideoView;->setVisibility(I)V

    goto/16 :goto_0

    .line 156
    :cond_d
    const-string v1, "load"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 157
    invoke-virtual {v8}, Lcom/google/ads/internal/AdVideoView;->b()V

    goto/16 :goto_0

    .line 158
    :cond_e
    const-string v1, "pause"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 159
    invoke-virtual {v8}, Lcom/google/ads/internal/AdVideoView;->c()V

    goto/16 :goto_0

    .line 160
    :cond_f
    const-string v1, "play"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 161
    invoke-virtual {v8}, Lcom/google/ads/internal/AdVideoView;->d()V

    goto/16 :goto_0

    .line 162
    :cond_10
    const-string v1, "show"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 163
    invoke-virtual {v8, v4}, Lcom/google/ads/internal/AdVideoView;->setVisibility(I)V

    goto/16 :goto_0

    .line 164
    :cond_11
    const-string v1, "src"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 165
    const-string v0, "src"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v8, v0}, Lcom/google/ads/internal/AdVideoView;->setSrc(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 167
    :cond_12
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown video action: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/ads/util/b;->a(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

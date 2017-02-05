AndroidManifest.xml:
- Removed `android:sharedUserId`; (prevent signature conflicts!)
- Changed `package`.

apktool.yml:
- Changed `apkFilename` to support compile.bat.

lib/armeabi/libcgame.so:
- Changed level pack names;
- Changed credits.

res:
- Add an 192x192px icon.png in drawable; (EDGE EX icon = EDGE icon + 120 hue, EDGE Epic icon = EDGE icon - 120 hue)
- Removed all other icon.png;
- Removed @mipmap/icon from public.xml;
- Changed @string/app_name.


# TODO/Wishlist

Automate these?

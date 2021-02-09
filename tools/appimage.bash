#!/bin/bash

URL_APPIMAGETOOL="https://github.com/probonopd/AppImageKit/releases/download/continuous/appimagetool-`arch`.AppImage"
URL_LINUXDEPLOY="https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-`arch`.AppImage"

APPIMAGETOOL="tools/appimagetool-`arch`.AppImage"
LINUXDEPLOY="tools/linuxdeploy-`arch`.AppImage"

echo "You will need patchelf and wget." \
    "The linuxdeploy and appimagetool dependencies will be downloaded." \
    "Aegisub also needs to be in your path."

WGET=`which wget 2>/dev/null`
[ $? -ne 0 ] && exit 1
echo "wget: $WGET"

PATCHELF=`which patchelf 2>/dev/null`
[ $? -ne 0 ] && exit 1
echo "patchelf: $PATCHELF"

AEGISUB=`which aegisub 2>/dev/null`
[ $? -ne 0 ] && exit 1
echo "Aegisub: $AEGISUB"

# DL
[ -e "$APPIMAGETOOL" ] || { wget "$URL_APPIMAGETOOL" -O "$APPIMAGETOOL" || exit 1; }
[ -e "$LINUXDEPLOY"  ] || { wget "$URL_LINUXDEPLOY"  -O "$LINUXDEPLOY"  || exit 1; }

chmod +x "$APPIMAGETOOL" "$LINUXDEPLOY"

# Setup & deploy
[ -d "AppImage/Aegisub" ] || { mkdir -p "AppImage/Aegisub" || exit 1; }
cp packages/desktop/aegisub.desktop.template.in AppImage/aegisub.desktop || exit 1;
cp packages/desktop/64x64.png AppImage/aegisub.png                       || exit 1;
sed -i -e 's/@AEGISUB_COMMAND@/aegisub/g' AppImage/aegisub.desktop       || exit 1;
rm AppImage/Aegisub/usr/bin/aegisub
$LINUXDEPLOY                                    \
    --appdir AppImage/Aegisub                   \
    --icon-file AppImage/aegisub.png            \
    --desktop-file AppImage/aegisub.desktop     \
    --executable "$AEGISUB" || exit 1;
mkdir -p AppImage/Aegisub/usr/share/aegisub/automation || exit 1;
cp -rv automation/* AppImage/Aegisub/usr/share/aegisub/automation/
$APPIMAGETOOL AppImage/Aegisub

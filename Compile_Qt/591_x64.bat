REM Set up VC14 Tools Command Prompt
CALL "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64

SET ROOT=%CD%
SET QT_SOURCE=%ROOT%\qt-everywhere-opensource-src-5.9.1
SET QT_WORKING=%ROOT%\5.9.1_vc14_64
SET QT_INSTALL=%ROOT%\Qt\Qt5.9.1\5.9.1\msvc2015_64

SET ICU_OPT=%ROOT%\ICU_57\icu
SET ICU_INCLUDE=%ICU_OPT%\include
SET ICU_LIB=%ICU_OPT%\lib64
SET ICU_BIN=%ICU_OPT%\bin64

REM Set perl, ruby and python path, for needing them to build the QtWebKit
SET PATH=C:\Strawberry\c\bin;C:\Strawberry\perl\site\bin;C:\Strawberry\perl\bin;C:\Ruby24-x64\bin;C:\Python27amd64;%PATH%

REM Set icu path, for needing it's dll to build something
SET PATH=%QT_SOURCE%\qtbase\bin;%QT_SOURCE%\gnuwin32\bin;%ICU_BIN%;%PATH%

REM Set the build working directory, so you can build 32/64 at the same time
IF EXIST %QT_WORKING% RD /s /q %QT_WORKING%
MKDIR %QT_WORKING%
CD /d %QT_WORKING%

REM Building Qt, Just build "qtbase" and "qttools"
CALL %QT_SOURCE%\configure.bat -mp -release -shared -confirm-license -platform win32-msvc -opensource -prefix %QT_INSTALL% -icu -I %ICU_INCLUDE% -L %ICU_LIB% ICU_LIBS="icudt.lib icuuc.lib icuin.lib" -opengl desktop -nomake examples -nomake tests -no-dbus -skip qtmacextras -skip qtx11extras -skip qtimageformats -skip qtandroidextras -skip qtserialport -skip qtserialbus -skip qtactiveqt -skip qtxmlpatterns -skip qtsvg -skip qtdeclarative -skip qtremoteobjects -skip qtscxml -skip qtpurchasing -skip qtcanvas3d -skip qtgamepad -skip qt3d -skip qtwayland -skip qtconnectivity -skip qtwebsockets -skip qtwebchannel -skip qtsensors -skip qtmultimedia -skip qtspeech -skip qtdatavis3d -skip qtcharts -skip qtwinextras -skip qtgraphicaleffects -skip qtquickcontrols2 -skip qtquickcontrols -skip qtvirtualkeyboard -skip qtlocation -skip qtwebkit -skip qtscript -skip qtwebengine -skip qtwebview -skip qtnetworkauth -skip qttranslations -skip qtdoc

PAUSE
ECHO ON
nmake && nmake install

REM The current used ICU version is 57.1
COPY /v /y %ICU_BIN%\icudt57.dll %QT_INSTALL%\bin\
COPY /v /y %ICU_BIN%\icuin57.dll %QT_INSTALL%\bin\
COPY /v /y %ICU_BIN%\icuuc57.dll %QT_INSTALL%\bin\

PAUSE
CALL %QT_WORKING%\qtbase\bin\qmake.exe %QT_SOURCE%\qtwebkit\Webkit.pro
nmake && nmake install

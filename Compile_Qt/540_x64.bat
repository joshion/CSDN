REM Set up VC14 Tools Command Prompt
CALL "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64

SET ROOT=%CD%
SET QT_SOURCE=%ROOT%\qt-everywhere-opensource-src-5.4.0
SET QT_WORKING=%ROOT%\5.4.0_vc14_64
SET QT_INSTALL=%ROOT%\Qt\Qt5.4.0\5.4.0\msvc2015_64

REM Set icu path, for needing it's dll to build something
SET PATH=%QT_SOURCE%\qtbase\bin;%QT_SOURCE%\gnuwin32\bin;%PATH%

REM Set the build working directory, so you can build 32/64 at the same time
IF EXIST %QT_WORKING% RD /s /q %QT_WORKING%
MKDIR %QT_WORKING%
CD /d %QT_WORKING%
 
CALL %QT_SOURCE%\configure.bat -mp -debug -shared -confirm-license -platform win32-msvc2013 -opensource -prefix %QT_INSTALL% -opengl desktop -nomake examples -nomake tests -skip qtandroidextras -skip qtmacextras -skip qtx11extras -skip qtsvg -skip qtxmlpatterns -skip qtdeclarative -skip qtquickcontrols -skip qtmultimedia -skip qtwinextras -skip qtactiveqt -skip qtlocation -skip qtsensors -skip qtconnectivity -skip qtwebsockets -skip qtwebchannel -skip qtwebkit -skip qtwebkit-examples -skip qtimageformats -skip qtgraphicaleffects -skip qtscript -skip qttools -skip qtquick1 -skip qtserialport -skip qtenginio -skip qtwebengine -skip qttranslations -skip qtdoc

ECHO ON
nmake && nmake install
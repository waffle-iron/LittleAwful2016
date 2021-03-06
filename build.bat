@echo off
echo == Setting vars...
set projpath=H:\Users\ej\git\LittleAwful2016\
set gamename=Llama_goes_to_Market
set buildname=%1
set basepath=%projpath%Builds\%buildname%\

set buildargs=-projectPath "%projpath%" -batchmode -s ASSERTIONS=1 -logFile "%projpath%build-%gamename%-%buildname%.log" -quit

echo == Making folders...
set winpath=%basepath%win
mkdir "%winpath%32\"
mkdir "%winpath%64\"
set buildargs=-buildWindowsPlayer "%winpath%32\%gamename%.exe" -buildWindows64Player "%winpath%64\%gamename%.exe" %buildargs%

set linuxpath=%basepath%linux\
mkdir "%linuxpath%"
set buildargs=-buildLinuxUniversalPlayer "%linuxpath%%gamename%" %buildargs%

set macpath=%basepath%mac\
mkdir "%macpath%"
set buildargs=-buildOSXUniversalPlayer "%macpath%%gamename%.app" %buildargs%

rem set webpath=%basepath%web
rem mkdir "%webpath%\"
rem mkdir "%webpath%gl\"
rem set buildargs=-buildWebPlayer "%webpath%\%gamename%" -executeMethod WebGLBuild.build "%webpath%gl\%gamename%" %buildargs%

echo == Beginning build...
"C:\Program Files\Unity\Editor\Unity.exe" %buildargs%
echo == Reviewing output...
notepad "%projpath%\build-%gamename%-%buildname%.log"
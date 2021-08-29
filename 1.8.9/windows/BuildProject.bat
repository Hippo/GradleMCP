@echo off
title GradleMCP
setlocal enabledelayedexpansion
:CHECK
IF EXIST src (
	set /P b=Warning! This will clear your current project. Do you want to continue[Y/N]? 
	if /I "!b!" EQU "Y" goto :START
	if /I "!b!" EQU "N" goto :END
	goto :check
)

:START
IF EXIST src powershell -Command "Remove-Item src -Force -Recurse"

IF EXIST .minecraft powershell -Command "Remove-Item .minecraft -Force -Recurse"

IF EXIST temp powershell -Command "Remove-Item temp -Force -Recurse"


echo ^> Creating Temp Directory
mkdir temp
cd temp

echo ^> Downloading 7Zip
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://www.7-zip.org/a/7za920.zip', '7Z.zip');
powershell -Command "Expand-Archive 7Z.zip -Force"
powershell -Command "Copy-Item -Path 7Z/7za.exe -Destination ./"
powershell -Command "Remove-Item 7Z -Force -Recurse"
del 7Z.zip

echo ^> Downloading MCP
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://download856.mediafire.com/ovk4lisqjjeg/w2xhirqwu4s5u0m/MCP_1.8.9.zip', 'mcp.zip');
echo ^> Unzipping MCP
7za x mcp.zip -y -omcp > NUL:
del mcp.zip
cd mcp
echo ^> Running decompile script
echo. 
runtime\bin\python\python_mcp runtime\decompile.py %*
echo. 
echo ^> Arranging source code
cd src

mkdir "main/resources"
ren minecraft java
powershell -Command "Move-Item -Path java -Destination main/"
cd ../../../
powershell -Command "Move-Item -Path temp/mcp/src/ -Destination ./"
mkdir .minecraft
powershell -Command "Copy-Item -Path temp/mcp/jars/* -Destination .minecraft/ -Force -Recurse"
powershell -Command "Remove-Item temp/mcp -Force -Recurse"
powershell -Command "Remove-Item .minecraft/libraries -Force -Recurse"
powershell -Command "Copy-Item .minecraft/versions/1.8.9/1.8.9.jar -Destination temp"

echo ^> Unpacking jar
cd temp

7za x 1.8.9.jar -y -o1.8.9 > NUL:

cd ../

echo ^> Copying assets
powershell -Command "Move-Item -Path temp/1.8.9/assets -Destination src/main/resources/"

echo ^> Complete!

:CHOICE
echo. 
set /P c=Do you want to install Optifine aswell[Y/N]? 
if /I "%c%" EQU "Y" goto :OPTIFINE
if /I "%c%" EQU "N" goto :END
goto :choice

:OPTIFINE
echo. 
cd temp
echo ^> Downloading optifine.zip
powershell -Command "$AllProtocols = [System.Net.SecurityProtocolType]'Ssl3,Tls,Tls11,Tls12'; [System.Net.ServicePointManager]::SecurityProtocol = $AllProtocols; Invoke-WebRequest -Uri https://www.mediafire.com/file/3ae49n16p7wcxfa/optifine.zip/file -OutFile optifine1.zip"
echo ^> Unzipping optifine
7za x optifine.zip -y -ooptifine > NUL:
cd ../
echo ^> Installing optifine
powershell -Command "Copy-Item temp/optifine1/net -Destination src/main/java -Force -Recurse"
powershell -Command "Copy-Item temp/optifine1/javax -Destination src/main/java -Force -Recurse"
powershell -Command "Copy-Item temp/optifine1/assets -Destination src/main/resources -Force -Recurse"

:END

echo. 
echo ____________________________________
echo. 
echo ^> Complete!
echo ^> Windows port by Asyc, GradleMCP by Hippo, 1.8.9 port by clark

PAUSE

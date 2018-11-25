@echo off
title GradleMCP
echo Downloading mcp918.zip
powershell -Command "(New-Object Net.WebClient).DownloadFile('http://www.modcoderpack.com/files/mcp918.zip', 'mcp.zip');
powershell -Command "Expand-Archive mcp.zip -Force"
del mcp.zip
cd mcp
echo Decompiling MCP...
runtime\bin\python\python_mcp runtime\decompile.py %*
echo Arranging project...


mkdir "src/main"
mkdir "src/main/resources"
cd src
ren minecraft java
powershell -Command "Move-Item -Path java -Destination main"

cd ../../
powershell -Command "Move-Item -Path mcp/src ./"

mkdir ".minecraft"
powershell -Command "Move-Item -Path mcp/jars/* -Destination .minecraft"
cd .minecraft
powershell -Command "Remove-Item libraries -Force -Recurse"


mkdir "versions/1.8.8/temp"

cd versions/1.8.8

powershell -Command "Copy-Item 1.8.8.jar -Destination temp"

cd temp
powershell -Command "Rename-Item -Path 1.8.8.jar -NewName 1.8.8.zip"
powershell -Command "Expand-Archive 1.8.8.zip -Force"

cd ../../../../

powershell -Command "Move-Item -Path .minecraft/versions/1.8.8/temp/1.8.8/assets src/main/resources"
powershell -Command "Remove-Item .minecraft/versions/1.8.8/temp -Force -Recurse"
powershell -Command "Remove-Item mcp -Force -Recurse"
echo Complete!

:choice
set /P c=Do you want to install Optifine aswell[Y/N]? 
if /I "%c%" EQU "Y" goto :OPTIFINE
if /I "%c%" EQU "N" goto :END
goto :choice

:OPTIFINE
echo Downloading optifine.zip
powershell -Command "$AllProtocols = [System.Net.SecurityProtocolType]'Ssl3,Tls,Tls11,Tls12'; [System.Net.ServicePointManager]::SecurityProtocol = $AllProtocols; Invoke-WebRequest -Uri https://github.com/Hippah/OptifineSource/raw/master/optifine_1.8.8.zip -OutFile optifine.zip"
echo Installing Optifine
powershell -Command "Expand-Archive optifine.zip -Force"
powershell -Command "Remove-Item optifine.zip"
powershell -Command "Copy-Item optifine/net -Destination src/main/java -Force -Recurse"
powershell -Command "Copy-Item optifine/optfine -Destination src/main/java -Force -Recurse"
powershell -Command "Copy-Item optifine/assets -Destination src/main/resources -Force -Recurse"

powershell -Command "Remove-Item optifine -Force -Recurse"

:END
cls
echo Complete!
echo Windows port by Asyc, GradleMCP by Hippo
PAUSE
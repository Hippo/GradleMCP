@echo off
title GradleMCP
echo "Compiling..."
call gradlew build
cls

SET /P name=Please enter a client name and version (example: Client v1): 

mkdir "%name%"
cd build/libs/
SET NewName=%name%.jar
ren "*.jar" "%NewName%"
move "*.jar" "../../%name%"
cls
cd ../../
echo "Cleaning up"
powershell -command "Remove-Item build -Force -Recurse"
echo "Building JSON"
cd %name%
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://pastebin.com/raw/CQcdJAnQ', 'temp1.json');
echo %name%>> temp1.json
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://pastebin.com/raw/sFNgnuNx', 'temp2.json');
powershell -Command "$path = '%name%.json';$path -replace ' ', '` ';cat temp*.json | sc $path -NoNewline"
del temp1.json
del temp2.json
cls
echo Complete!
echo Windows port by Asyc, GradleMCP by Hippo.
PAUSE

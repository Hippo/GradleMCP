#!/bin/sh

clear

OVERRIDE=false

for file in *; do
	if [ "$file" != "BuildProject.sh" ] && [ "$file" != "CompileClient.sh" ] && [ "$file" != "build.gradle" ] ; then
		OVERRIDE=true
	fi
done


if [ "$OVERRIDE" = true ] ; then
	echo "WARNING You just ran the BuildProject script! This will CLEAR your project, Would you like to continue? [y/n]"
	read input
	if [ "$input" = "y" ] ; then
		for file in *; do
			if [ "$file" != "BuildProject.sh" ] && [ "$file" != "CompileClient.sh" ] && [ "$file" != "build.gradle" ] ; then
				rm -r "$file"
			fi
		done
	else
		exit
	fi
fi

clear
echo "Building a GradleMCP..."

echo "Downloading resources..."
MCP_DOWNLOAD="http://www.modcoderpack.com/files/mcp918.zip"
OPTIFINE_DOWNLOAD="https://github.com/Hippah/OptifineSource/raw/master/optifine_1.8.8.zip"

if [ ! -d "mcp" ] ; then
	mkdir mcp
fi
cd mcp
wget $MCP_DOWNLOAD -O mcp918.zip

echo "Executing..."
unzip mcp918.zip
rm mcp918.zip
python2 runtime/decompile.py "$@"

cd ../
echo "Arranging Project..."

if [ ! -d "src/main/java" ] ; then
	mkdir -p src/main/java
fi

if [ ! -d "src/main/resources" ] ; then
	mkdir -p src/main/resources
fi

mv mcp/src/minecraft/* src/main/java

if [ ! -d ".minecraft" ] ; then
	mkdir .minecraft
fi

mv mcp/jars/* .minecraft
mv mcp/temp/src/minecraft/pack.png src/main/resources
rm -r .minecraft/libraries
rm -r mcp

if [ ! -d ".minecraft/versions/1.8.8/temp" ] ; then
	mkdir .minecraft/versions/1.8.8/temp
fi

cd .minecraft/versions/1.8.8/
cp 1.8.8.jar temp
cd temp
unzip 1.8.8.jar
cd ../../../../
mv .minecraft/versions/1.8.8/temp/assets src/main/resources
rm -r .minecraft/versions/1.8.8/temp
echo "Complete!"

echo "Would you like to install optifine aswell? [y/n]"
read answer

if [ "$answer" = "y" ] ; then
	echo "Installing optifine"
	cd src/main/java
	wget $OPTIFINE_DOWNLOAD -O optifine.zip
	unzip -o optifine.zip
	rm optifine.zip
	echo "Optifine installed!"
fi

cd ../../../

if [ -d "src/main/java/assets" ] ; then
	cp -r src/main/java/assets/ src/main/resources/
	rm -r src/main/java/assets/
fi

echo "GradleMCP made by Hippo!"


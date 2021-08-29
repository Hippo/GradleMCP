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
MCP_DOWNLOAD="https://download856.mediafire.com/ovk4lisqjjeg/w2xhirqwu4s5u0m/MCP_1.8.9.zip"
OPTIFINE_DOWNLOAD="ttps://www.mediafire.com/file/3ae49n16p7wcxfa/optifine.zip/file"

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

if [ ! -d ".minecraft/versions/1.8.9temp" ] ; then
	mkdir .minecraft/versions/1.8.9/temp
fi

cd .minecraft/versions/1.8.9/
cp 1.8.9.jar temp
cd temp
unzip 1.8.9.jar
cd ../../../../
mv .minecraft/versions/1.8.9/temp/assets src/main/resources
rm -r .minecraft/versions/1.8.9/temp
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


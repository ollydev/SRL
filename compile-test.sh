PLUGINS_VERSION=1.00
FONTS_VERSION=1.00

cd ../
mkdir Includes/

curl -L -o Simba.exe https://github.com/ollydev/Simba/releases/download/SRL/Simba.i386-win32.exe
curl -L -o Plugins.zip https://github.com/SRL/SRL-Plugins/archive/$PLUGINS_VERSION.zip
curl -L -o Fonts.zip https://github.com/SRL/SRL-Fonts/archive/$FONTS_VERSION.zip

7z x Plugins.zip
7z x Fonts.zip
mv SRL-Fonts-$FONTS_VERSION Fonts
mv SRL-Plugins-$PLUGINS_VERSION Plugins
cp -r ./SRL ./Includes/SRL
echo "{\$I SRL/OSR.simba} begin end." >> test.simba
./Simba.exe -open test.simba -compile -test
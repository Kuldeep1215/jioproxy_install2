#!/data/data/com.termux/files/usr/bin/sh
#wget -O plugin.video.jiotv-2.0.13-beta.zip https://cloud.botallen.com/index.php/s/AbGWYFkpqC6fFbi/download
echo "Downloading plugin.video.jiotv-2.0.13-beta.zip"
filename="plugin.video.jiotv-2.0.13-beta.zip"
fileid=19wDb15YQL9w8RPSI5bx3dfu04RHn0fWv
curl -c ~/cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ~/cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
unzip plugin.video.jiotv-2.0.13-beta.zip
mkdir -p ~/.termux/boot/
touch ~/.termux/boot/jiotv
chmod +x ~/.termux/boot/jiotv
if [ $(getprop ro.product.cpu.abi) = arm64-v8a ]
then
        mkdir -p ~/bin/android_arm64
        cp -r ~/plugin.video.jiotv/resources/bin/android_arm64/jiotvProxy ~/bin/android_arm64/jiotvProxy
        echo "#!/data/data/com.termux/files/usr/bin/sh" > ~/.termux/boot/jiotv
        echo "cd ~/bin/android_arm64/" >> ~/.termux/boot/jiotv
        echo "./jiotvProxy > /dev/null 2>&1 &" >> ~/.termux/boot/jiotv
        find ~/bin -name jiotvProxy -exec chmod +x {} \;
        cd ~/bin/android_arm64/
        ./jiotvProxy > /dev/null 2>&1 &
fi
if [ $(getprop ro.product.cpu.abi) = armeabi-v7a ]
then
        mkdir -p ~/bin/android_arm
        cp -r ~/plugin.video.jiotv/resources/bin/android_arm/jiotvProxy ~/bin/android_arm/jiotvProxy
        echo "#!/data/data/com.termux/files/usr/bin/sh" > ~/.termux/boot/jiotv
        echo "cd ~/bin/android_arm/" >> ~/.termux/boot/jiotv
        echo "./jiotvProxy > /dev/null 2>&1 &" >> ~/.termux/boot/jiotv
        find ~/bin -name jiotvProxy -exec chmod +x {} \;
        cd ~/bin/android_arm/
        ./jiotvProxy > /dev/null 2>&1 &
        
fi
if [ $(getprop ro.product.cpu.abi) = x86_64 ]
then
        mkdir -p ~/bin/android_x64
        cp -r ~/plugin.video.jiotv/resources/bin/android_x64/jiotvProxy ~/bin/android_x64/jiotvProxy
        echo "#!/data/data/com.termux/files/usr/bin/sh" > ~/.termux/boot/jiotv
        echo "cd ~/bin/android_x64/" >> ~/.termux/boot/jiotv
        echo "./jiotvProxy > /dev/null 2>&1 &" >> ~/.termux/boot/jiotv
        find ~/bin -name jiotvProxy -exec chmod +x {} \;
        cd ~/bin/android_x64/
        ./jiotvProxy > /dev/null 2>&1 &
fi
if [ $(getprop ro.product.cpu.abi) = x86 ]
then
        mkdir -p ~/bin/android_x86
        cp -r ~/plugin.video.jiotv/resources/bin/android_x86/jiotvProxy ~/bin/android_x86/jiotvProxy
        echo "#!/data/data/com.termux/files/usr/bin/sh" > ~/.termux/boot/jiotv
        echo "cd ~/bin/android_x86/" >> ~/.termux/boot/jiotv
        echo "./jiotvProxy > /dev/null 2>&1 &" >> ~/.termux/boot/jiotv
        find ~/bin -name jiotvProxy -exec chmod +x {} \;
        cd ~/bin/android_x86/
        ./jiotvProxy > /dev/null 2>&1 &
fi
echo "clean up"
rm -r ~/plugin.video.jiotv
rm -r ~/cookie
rm -r ~/plugin.video.jiotv-2.0.13-beta.zip
echo "login to jiotv via http://(local ip):48996/web/login from external device"
echo "After login add http://127.0.0.1:48996/playlist.m3u in external iptv player"
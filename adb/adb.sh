# /bin/bash  
  
adb kill-server  
adb start-server  
  
adb wait-for-device  
  
#处理脚本目录的 Apks 子目录里的apk文件  
cd Apks  
  
#提取该目录下的文件列表  
filelist=`ls`  
  
#遍历各个文件，安装apk  
for file in $filelist  
do  
    adb install -r $file  
done  

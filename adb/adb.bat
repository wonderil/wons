@echo off  
  
:: 重启adb 保证能顺利连接  
adb kill-server  
adb start-server  
  
adb wait-for-device  
  
:: 遍历ApkPath目录下的文件，进行安装  
:: %cd% 表示当前目录，这个脚本处理的是当前目录下 APKs子目录下的文件  
:: 可以根据自己的需求修改  
  
set ApkPath=%cd%  
cd %ApkPath%  
  
for /R %%s in (.,*) do (  
    ::要使用引号来包括apk的路径，不然adb install语法报错  
    adb install -r "%%s"  
)  
  
:: 执行完，cmd窗口暂留  


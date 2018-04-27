#!/bin/bash
#
# Ubuntu安装并配置aria2
#
# @Author: Jaeger <JaegerCode@gmail.com>
# @Version:   0.1

#配置文件下载保存路径
downloadPath='/var/www/html/dl'

basePath='/home/aria2'

mkdir -p $downloadPath $basePath

file1=$basePath/aria2.s

file2=$basePath/aria2.log

touch $file1 $file2

configFile=$basePath/aria2.conf

configTpl="
continue=true \n

daemon=true \n

dir=$downloadPath \n

enable-rpc=true \n

file-allocation=none \n

force-sequential=true \n

input-file=$file1 \n

log=$file2 \n

log-level=notice \n

max-concurrent-downloads=3 \n

max-connection-per-server=5 \n

parameterized-uri=true \n

rpc-allow-origin-all=true \n

rpc-listen-all=true \n

rpc-save-upload-metadata=true \n

save-session=$file1 \n

save-session-interval=30 \n

split=2 \n
"

echo -e $configTpl>$configFile


comTpl="
#!/bin/sh \n
#之前的配置文件 \n
CONF=$configFile \n
  \n
case \"\$1\" in \n
  start) \n
    echo \"Starting aria2c service\" \n
    sudo aria2c --conf-path=\$CONF -D \n
    echo \"done !\" \n
    ;; \n
  stop) \n
    echo \"Stopping aria2c service\" \n
    sudo killall -w aria2c \n
    echo \"done !\" \n
    ;; \n
  restart) \n
    echo \"Restarting aria2c service\" \n
    sudo killall -w aria2c \n
    sudo aria2c --conf-path=\$CONF -D \n
    echo \"done !\" \n
    ;; \n
  *) \n
    echo \"\$0 {start|stop|restart}\" \n
    ;; \n
  esac \n
exit
"
echo -e $comTpl>/etc/init.d/aria2

chmod +x /etc/init.d/aria2

apt update 
apt install sudo aria2 -y

service aria2 start

# 开机启动
update-rc.d aria2 defaults

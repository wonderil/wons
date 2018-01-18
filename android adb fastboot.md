手机正常启动后，命令行模式下输入

adb reboot bootloader

该命令会自动进入fastboot模式

接着：

fastboot devices

查看是否有设备



//erase 擦除的意思，你懂得

fastboot erase system
fastboot erase cache
fastboot erase config
fastboot erase data
fastboot erase logs
fastboot erase factory


fastboot flash boot boot.img

fastboot flash system system.img

fastboot flash recovery recovery.img

fastboot boot recoveryout.img


fastboot reboot

重启


Android ADB 常用命令
[TOC]

adb logcat 查看日志
详细内容可参见

ADB Usage Complete / ADB 用法大全

官方文档 Listing of logcat Command Options

他人整合 http://jiongbull.com/2016/03/17/adb%E5%91%BD%E4%BB%A4/

应用相关
查看应用列表
adb shell pm list package
# has root
adb shell ls /data/data/
adb 启动 / 停止 应用程序
adb shell am start -n [packageName/StartActivity]
adb shell am force-stop [packageName]
端口映射
# 显示所有(PC —> DEVICE)映射的端口连接列表
adb forward —list
# 映射端口连接(PC —> DEVICE)
adb forward (local) (remote)
adb forward tcp:6100 tcp:7100
# 映射端口连接，但是如果local已经映射了就会失败
adb forward —no-rebind (local) (remote)
adb forward --no-rebind tcp:6100 tcp:7100
# 移除指定的映射端口连接
adb forward —remove tcp:6100
# 移除所有的映射端口连接
adb forward —remove-all
# 显示所有来自设备的(DEVICE —> PC)映射的端口连接列表
adb reverse —list
# 反向映射端口连接(DEVICE —> PC)
adb reverse (remote) (local)
adb reverse tcp:7000 tcp:5000
# 如果local已经映射了就会失败
adb reverse —no-rebind (remote) (local)
adb reverse --no-rebind tcp:7000 tcp:5000
# 移除指定的反向映射端口连接
adb reverse —remove tcp:7000
adb reverse —remove-all
应用安装卸载
# 获取apk的packagename 和 classname
aapt d badging <apkfile>
# 安装apk
adb install <apkfile>
# 保留数据和缓存文件，重新安装apk，
adb install -r <apkfile>
# 安装apk到sd卡
adb install -s <apkfile>
# 卸载app
adb uninstall <package>
# 卸载app但保留数据和缓存文件
adb uninstall -k <package>
# 同时安装包多个apk到设备上
adb install-multiple
adb install 参数

-l 锁定应用
-r 替换已存在的应用
-t 允许安装测试包
-s 安装到 sd 卡中
-d 可以安装低版本安装包
-p 安装部分应用
-g 授权所有运行时权限
应用状态查看
# 查看进程列表
adb shell ps
# 查看指定进程状态
adb shell ps -x [PID]
# 查看后台services信息
adb shell service list
# 查看IO内存分区
adb shell cat /proc/iomem
调试查看
列出所有拥有 JDWP 端口进程的进程号

adb jdwp
文件操作
# 查看所有存储设备名
adb shell ls mnt
# 从本地复制文件到设备
adb push <local> <remote>
# 从设备复制文件到本地
adb pull <remote>  <local>
# 列出目录下的文件和文件夹，等同于dos中的dir命令
adb shell ls
# 进入文件夹，等同于dos中的cd 命令
adb shell cd <folder>
# 重命名文件
adb shell rename path/oldfilename path/newfilename
# 删除system/avi.apk
adb shell rm /system/avi.apk
# 删除文件夹及其下面所有文件
adb shell rm -r <folder>
# 移动文件
adb shell mv path/file newpath/file
# 设置文件权限
adb shell chmod 777 [filePath]
# 新建文件夹
adb shell mkdir -d path/foldelname
adb sync
把 Android 设备上/system和/data目录中与主机目录中不一致的内容同步到主机上。
使用前需要设置主机目录地址的环境变量。

adb sync(未设置环境变量)

D:\Code\Git>adb sync
adb: Product directory not specified; use -p or define ANDROID_PRODUCT_OUT
set ANDROID_PRODUCT_OUT = (PATH)

D:\Code\Git>set ANDROID_PRODUCT_OUT = D:\Data\Android
adb sync(已设置环境变量)

D:\Code\Git>adb sync
syncing /system...
push: D:\Data\Android\system/app/WAPPushManager.apk -> /system/app/WAPPushManager.apk

文本操作
# 查看文件内容
adb shell cat <file>
# 查看文件的头10行
adb shell head -n 10 <file>
# 查看文件的尾10行
adb shell tail -n 10 <file>
root 权限操作
此操作需要 root 后的手机才可以执行
# 尝试开启root权限，adb连接会重置 成功会提示 restarting adbd as root
adb root
# 关闭root权限
adb unroot
# 重新挂载系统分区,使系统分区重新可写 成功提示 remount succeeded
adb remount
# 重启设备，进入recovery程序的sideload模式，需要root权限
adb reboot sideload
这样就可以操作 Android 系统文件

调试环境下的 dm-verity 检查
解锁 system 分区用这个

关闭在调试环境下的dm-verity检查
adb disable-verity
启用在调试环境下的dm-verity检查
adb enable-verity
系统项目
设备信息
# 完整设备信息
adb shell cat /system/build.prop
# 厂商信息
adb shell cat /system/build.prop | grep ro.product
环境变量
ADB_TRACE 指定打印调试信息，可以设置为以下列表中的值，用逗号隔开

adb、sockets、packets、rwx、usb、sync、sysdeps、transport 和 jdwp

ANDROID_SERIAL
指定要连接的设备，如果通过-s指定了则该变量不起作用

ANDROID_LOG_TAGS
在使用 logcat 的情况下，只有这些标签的调试信息才会打印

dumpsys

adb shell dumpsys wifi

adb shell dumpsys cpuinfo
可以 dump 当前运行的内容包括

编号	参数
1	SurfaceFlinger
2	accessibility
3	account
4	activity
5	alarm
6	appwidget
7	audio
8	backup
9	battery
10	batteryinfo
11	bluetooth
12	bluetooth_a2dp
13	clipboard
14	connectivity
15	content
16	cpuinfo
17	device_policy
18	devicestoragemonitor
19	diskstats
20	dropbox
21	entropy
22	ethernet
23	hardware
24	input_method
25	iphonesubinfo
26	isms
27	keybar
28	location
29	media.audio_flinger
30	media.audio_policy
31	media.camera
32	media.player
33	meminfo
34	mount
35	netsta
设备信息
# 查看设备cpu和内存占用情况
adb shell top
# 查看占用内存前6的app
adb shell top -m 6
# 刷新一次内存信息，然后返回
adb shell top -n 1
# MAC地址
adb shell cat /sys/class/net/wlan0/address
# CPU序列号
adb shell cat /proc/cpuinfo
备份
# 把设备的数据归档写入文件中
adb backup
adb backup -f backup.ab -all
-f 如果没有这个标识，数据将会写入到当前目录中的 backup.ab 文件中
-apk|-noapk 启用 | 禁用备份. apk 文件自己，默认是 noapk
-obb|-noobb 启用 | 禁用备份应用关联的 apk 扩展，默认是 noobb
-shared|-noshared 启用 | 禁用备份设备共享存储 / SD 中的内容，默认是 noshared
-all 备份所有安装的应用
-system|-nosystem 决定 - all 是否包含系统应用，默认是包含系统应用
packages... 将要备份的应用列表，如果设置了 - all 或 - shared 标识，那么这个参数将是可选的
从归档的备份文件中恢复设备内容

adb restore
adb restore backup.ab
设备操作
# 返回所有应该包含在错误报告中的设备信息
adb bugreport
# 重启
adb reboot
# 重启刷机模式
adb reboot bootloader
# 重启到恢复模式
adb reboot recovery

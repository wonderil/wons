快捷键 Ctrl Alt T 打开一个终端运行以下命令查看帮助，
代码:
conky-colors --help
部份conky-colors命令参数选项介绍：
--lang 语言，5.1.2 版没有cn 中文选项，只能用默认的en 英语。
--theme 面板主题，有17项可选，gnome开头的是透明面板，shiki开头的是颜色面板
gnome-brave，gnome-carbonite， gnome-human（默认），gnome-noble，gnome-tribute，
gnome-wine，gnome-wise，shiki-brave，shiki-human， shiki-noble，shiki-wine，
shiki-wise，shiki-dust，dust， radiance，ambiance，elementary
--side 面板在桌面的位置 left 左， right 右（默认）
--ubuntu 显示LOGO，有9个LOGO可选，还可以在配置文件里自定义更多的LOGO
--Fedora，--openSUSE，--debian，--arch，--gentoo，--pardus，--xfce，--gnome
--cpu 显示CPU信息，双核CPU用2，四核用4，单核用1
--cputemp 显示CPU温度
--swap 显示swap缓存分区的信息
--updates 显示系统需要升级的软件包信息
--proc 显示资源占用情况排在前列的进程，3 显示3个进程（最多为10）
--clock 显示时钟和日期，有7种形式可选default，classic，slim，modern，lucky，digital，off
--calendar 显示月历
--nvidia 显示Nidia显卡信息，抱歉没有ATI 的选项
--hd 显示硬盘信息，有4中形式可选default，meerkat，mix，simple
--hdtemp1 显示第一个硬盘的温度，第2个sata硬盘为 --hdtemp2=sdb
--photord 随机显示幻灯片相册，默认使用的是系统桌面背景图片文件夹，可以在脚本 ~/.conkycolors/bin/conkyPhotoRandom 中把 source="/usr/share/backgrounds/" 修改为自定义的图片目录
--photo 仅固定显示一张图片，放在 /usr/share/backgrounds/ 内
--network 显示网络信息，可以指定使用 --eth 网卡设备，--wlan 无线设备，--ppp 拨号设备 （默认都是0）
--battery 显示电池信息
--unit 温度单位 C 摄氏 或 F 华氏 
--rhythmbox 在多媒体栏显示Ubuntu自带的rhythmbox播放器的曲目信息。
有7中形式可选：default，cd，case，glassy，vinyl，oldvinyl，simple
还支持其他播放器：--covergloobus，--banshee，--exaile
--pidgin 可显示pidgin在线的聊天好友
 
 
按自己需要实现的功能选择相应参数，然后运行conky-colors生成.conkycolors目录和相关文件，
你至少需要运行一次这个命令！否则没有.conkycolors这个目录，或者缺少某些程序文件。例如：
代码:
conky-colors --theme=custom --default-color=black --color0=cyan --color1=green --color2=orange --color3=red --ubuntu --cpu=2--updates --proc=3--clock=default --calendar --nvidia --hd=default --hdtemp1=sda --photo --photord --network --unit=C --side=right --bbcweather=1586--weather=CHXX0100 --rhythmbox=cd
然后生成conkyrc配置文件，存放在 /home/用户名/.conkycolors 目录下,
如果没有.conkycolors这个目录，可以自己创建。
提示：在Linux中，凡是名称以点号开头的文件或文件夹，默认都是隐藏不见的。
在窗口中，按下 Ctrl H 键即可显示隐藏文件。
在终端下，可以用 ls -a 命令查看隐藏文件。

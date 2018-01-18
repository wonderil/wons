# 存放一些个人的杂项 （包括但不限于conky）
## 一劳永逸的解决在ubuntu上的调教

![desktop](https://raw.githubusercontent.com/wonderil/wons/master/2017-06-03%2012-42-40%20%E7%9A%84%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE.png "desktop")

# Conky 个人的一些配置

# Conky-weather
A theme for [conky](https://github.com/brndnmtthws/conky) powered by Weather.com API. Inspired by [Harmattan Theme](https://github.com/zagortenay333/Harmattan)

# Compatibility
Supports conky 1.10.x and later.
# 常用软件安装（包括，但不限于conky）

> sudo apt install conky curl zsh


#额外的安装（全部y）mm

>sudo apt-get install hddtemp lm-sensors conky-all

>sudo chmod u+s /usr/sbin/hddtemp

>sudo sensors-detect


#下载conkycolors并编译安装

>git clone https://github.com/aikunzhe/conky_colors.git

>cd conky_colors

>make

>sudo make install

#测试效果

>conky -c ~/.conkycolors/conkyrc


#oh my zsh 安装

>sh -c "$(curl -fsSL
https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
>chsh -s /bin/zsh




ubuntu+shadowsocks+polipo做全局代理
安装shadowsocks

>sudo apt-get install python-pip

>sudo pip install shadowsocks

启动方式


>sslocal -s 222.22.2.2 -p 222 -b 127.0.0.1 -l 1080 -k pass -t 600 -m aes-256-cfb
# or

>sslocal -c shadowsocks.json

如果用配置文件的方式进行配置 需要编辑配置文件


>touch shadowsocks.json

copy:


>{

>"server" : "222.22.2.2",

>"local_address": "127.0.0.1",

>"server_port" : 222,

>"local_port" : 1080,

>"password" : "pass",

>"timeout" : 600,

>"method" : "aes-256-cfb",

>"fast_open":false

>}

OK,

shadowsocks 是走的socks5协议，需要搭配浏览器插件使用，如果想要在系统全局使用，需要使用polipo进行二次转发
安装polipo

>sudo apt-get install polipo

配置

>vi /etc/polipo/config

copy:



1. #This file only needs to list configuration variables that deviate
2. #from the default values.  See /usr/share/doc/polipo/examples/config.sample
3. #and "polipo -v" for variables you can tweak and further information.
4.
5. logSyslog = true
6. logFile = /var/log/polipo/polipo.log
7.
8. proxyAddress = "0.0.0.0"
9.
10. socksParentProxy = "127.0.0.1:1080"
11. socksProxyType = socks5
12.
13. chunkHighMark = 50331648
14. objectHighMark = 16384
15.
16. serverMaxSlots = 64
17. serverSlots = 16
18. serverSlots1 = 32


重启polipo服务


>sudo /etc/init.d/polipo restart

polipo默认是运行在8123端口的，sslocal运行shadowsocks后，我们可以通过以下方式测试 shadowsocks是否连接成功

>export http_proxy="http://127.0.0.1:8123/"
>curl  ifconfig.me

如果返回正常的话，应该是可以看到shadowsocks服务器ip的

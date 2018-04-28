# 存放一些个人的杂项 
（包括conky Conky-weather shadowsocks hosts vim oh my zsh）

![desktop](https://raw.githubusercontent.com/wonderil/wons/master/2017-06-03%2012-42-40%20%E7%9A%84%E5%B1%8F%E5%B9%95%E6%88%AA%E5%9B%BE.png "desktop")

## Conky 个人的一些配置

## Conky-weather
A theme for [conky](https://github.com/brndnmtthws/conky) powered by Weather.com API. Inspired by [Harmattan Theme](https://github.com/zagortenay333/Harmattan)

# Compatibility
Supports conky 1.10.x and later.
# 常用软件安装（包括，但不限于conky）

> sudo apt install conky curl zsh gnome-tweak-tool openjdk-8-jdk

>curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -

>sudo apt-get install -y nodejs


#额外的安装（全部y）

>sudo apt-get install hddtemp lm-sensors conky-all

>sudo chmod u+s /usr/sbin/hddtemp

>sudo sensors-detect


##下载conkycolors并编译安装

>git clone https://github.com/aikunzhe/conky_colors.git

>cd conky_colors

>make

>sudo make install

##测试效果

>conky -c ~/.conkycolors/conkyrc


#oh my zsh 安装

> sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

or
> sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

>chsh -s /bin/zsh




ubuntu+shadowsocks+polipo做全局代理
安装shadowsocks

>sudo apt-get install python-pip

>sudo pip install shadowsocks

启动方式


>sslocal -s 222.22.2.2 -p 222 -b 127.0.0.1 -l 1080 -k pass -t 600 -m aes-256-cfb

or

>sslocal -c shadowsocks.json

如果用配置文件的方式进行配置 需要编辑配置文件


>touch shadowsocks.json

copy:


```
{
"server" : "38.91",
"local_address": "127.0.0.1",
"server_port" : 28,
"local_port" : 1080,
"password" : "",
"timeout" : 600,
"method" : "aes--cfb",
"fast_open":false
}
```


OK,

shadowsocks 是走的socks5协议，需要搭配浏览器插件使用，如果想要在系统全局使用，需要使用polipo进行二次转发
安装polipo

>sudo apt-get install polipo

配置

>vi /etc/polipo/config

copy:

```

#This file only needs to list configuration variables that deviate
#from the default values.  See /usr/share/doc/polipo/examples/config.sample
#and "polipo -v" for variables you can tweak and further information.

logSyslog = true
logFile = /var/log/polipo/polipo.log

proxyAddress = "0.0.0.0"

socksParentProxy = "127.0.0.1:1080"
socksProxyType = socks5

chunkHighMark = 50331648
objectHighMark = 16384

serverMaxSlots = 64
serverSlots = 16
serverSlots1 = 32

```

重启polipo服务


>sudo /etc/init.d/polipo restart

polipo默认是运行在8123端口的，sslocal运行shadowsocks后，我们可以通过以下方式测试 shadowsocks是否连接成功

>export http_proxy="http://127.0.0.1:8123/"
>curl  ifconfig.me

如果返回正常的话，应该是可以看到shadowsocks服务器ip的

#vim配置文件和插件(作者不再维护)
### 超强vim配置文件

[![Build Status](https://travis-ci.org/ma6174/vim.png?branch=master)](https://travis-ci.org/ma6174/vim)

### 运行截图
![screenshot](https://raw.githubusercontent.com/ma6174/vim-deprecated/master/screenshot.png "screenshot")


### 简易安装方法：

打开终端，执行下面的命令就自动安装好了：

>wget -qO- https://raw.github.com/ma6174/vim/master/setup.sh | sh -x

### 或者自己手动安装：(以ubuntu为例)

1. 安装vim `sudo apt-get install vim`
- 安装ctags：`sudo apt-get install ctags`
- 安装一些必备程序：`sudo apt-get install xclip vim-gnome astyle python-setuptools`
- python代码格式化工具：`sudo easy_install -ZU autopep8`
- `sudo ln -s /usr/bin/ctags /usr/local/bin/ctags`
- clone配置文件：`cd ~/ && git clone git://github.com/ma6174/vim.git`
- `mv ~/vim ~/.vim`
- `mv ~/.vim/.vimrc ~/`
- clone bundle 程序：`git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`
- 打开vim并执行bundle程序`:BundleInstall`
- 重新打开vim即可看到效果

#一些常用下载
### chrome
`
https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
`
### sublime text 3
`
https://download.sublimetext.com/sublime-text_build-3143_amd64.deb
`
######让subl可以输入中文（需要你自己事先装好输入法= =）

>git clone https://github.com/lyfeyaj/sublime-text-imfix.git

将subl移动到/usr/bin/，并且将sublime-imfix.so移动到/opt/sublime_text/（sublime安装目录）：
`
cd ~/sublime-text-imfix

sudo cp ./lib/libsublime-imfix.so /opt/sublime_text/

sudo cp ./src/subl /usr/bin/
`
######一些常用插件
packages Control

```

import urllib.request,os,hashlib; h = '6f4c264a24d933ce70df5dedcf1dcaee' + 'ebe013ee18cced0ef93d5f746d80ef60'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)

```

[material-theme](https://github.com/equinusocio/material-theme) 
[Emmet（原名 Zen Coding](http://emmet.io/)
JSFormat
SublimeLinter
Sublime Tmpl
BracketHighlighter
[Autocomplete](https://github.com/alienhard/SublimeAllAutocomplete)
[SublimeREPL](https://github.com/wuub/SublimeREPL)
###[Stacer](https://github.com/oguzhaninan/Stacer)
###[SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega)

# ubuntu 16.04 重装
## 双引导系统安装

* 准备条件
    * 前置条件
        * 备份磁盘重要数据
    * 硬件条件
        * 可用网络
    * 软件条件
        * windows 系统已经安装
    * U盘条件
        * Windows启动盘
        * Linux live 启动盘
    * 烧制启动盘
       * [工具](https//:www.balena.ioetcher)

* 分区
    * Something else
        * swap
        * /

* 引导管理
    * 工具
        * grub-customizer
        ```bash
        sudo add-apt-repository ppa:danielrichter2007/grub-customizer
        sudo apt-get update
        sudo apt-get install grub-customizer
        ```

## 系统工具
* [google 输入法](https://www.cnblogs.com/duanguyuan/p/3480162.html)
    ```bash
    sudo apt-get install ibus ibus-clutter ibus-gtk ibus-gtk3 ibus-qt4
    sudo apt-get install ibus-googlepinyin
    im-switch -s ibus
    ```

* [ssr](https://mikoto10032.github.io/post/%E7%A8%8B%E5%BA%8F%E5%91%98%E9%82%A3%E4%BA%9B%E4%BA%8B/linux%E4%BD%BF%E7%94%A8ssr%E5%AE%A2%E6%88%B7%E7%AB%AF/)
    ```bash
    sudo apt-get install git
    git clone https://github.com/ssrbackup/shadowsocksr
    cp shadowsocksr/config.json /etc/shadowsocks.json
    vim /etc/shadowsocks.josn

	alias ssr='python /opt/shadowsocksr/shadowsocks/local.py -c /opt/shadowsocksr/config.json &'
    ```

* [Polipo](https://blog.csdn.net/hejunqing14/article/details/52670341)
    ```bash
    sudo apt-get install polipo
    sudo vim /etc/polipo/config

    alias proxy='export https_proxy=http://127.0.0.1:8123; export http_proxy=http://127.0.0.1:8123'
    ```

* [chrome 浏览器](https://askubuntu.com/questions/510056/how-to-install-google-chrome)
    ```bash
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
    sudo apt-get update
    sudo apt-get install google-chrome-stable
    ```

* [chromium](https://www.hiroom2.com/2017/08/11/ubuntu-1604-chromium-en/)
	```bash
    sudo apt install -y chromium-browser
    ```

* 插件
	* [setupVPN](https://install.cd-n.net/Setupvpn/Chrome/)
	* [OMEGA](https://proxy-switchyomega.com/download/#chrome-%E6%88%96%E5%9F%BA%E4%BA%8E-chromium-%E7%9A%84%E6%B5%8F%E8%A7%88%E5%99%A8)

* 配置文件
    ```bash
    {"+auto switch":{"color":"#4477bb","defaultProfileName":"direct","name":"auto switch","profileType":"SwitchProfile","revision":"161a1cb551b","rules":[{"condition":{"conditionType":"HostWildcardCondition","pattern":"*.google.*"},"profileName":"proxy"},{"condition":{"conditionType":"HostWildcardCondition","pattern":"*.youtube.*"},"profileName":"proxy"}]},"+new":{"bypassList":[{"conditionType":"BypassCondition","pattern":"127.0.0.1"},{"conditionType":"BypassCondition","pattern":"[::1]"},{"conditionType":"BypassCondition","pattern":"localhost"}],"color":"#47b","name":"new","profileType":"FixedProfile","revision":"166916a7c59"},"+proxy":{"bypassList":[{"conditionType":"BypassCondition","pattern":"127.0.0.1"},{"conditionType":"BypassCondition","pattern":"::1"},{"conditionType":"BypassCondition","pattern":"localhost"}],"color":"#25dfe1","fallbackProxy":{"host":"127.0.0.1","port":1080,"scheme":"socks5"},"name":"proxy","profileType":"FixedProfile","revision":"1611e2e2de5"},"-addConditionsToBottom":false,"-confirmDeletion":true,"-downloadInterval":1440,"-enableQuickSwitch":true,"-monitorWebRequests":true,"-quickSwitchProfiles":["auto switch","proxy"],"-refreshOnProfileChange":true,"-revertProxyChanges":true,"-showE
    ```

## 优化工具

### tweak
```bash
sudo apt-get install unity-tweak-tool
```

### theme
* [flatbulous](https://github.com/anmoljagetia/Flatabulous)
    ```bash
    wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
    sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu xenial-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'
    sudo apt-get update
    sudo apt-get install ubuntu-tweak
    ```

* [Ant-Dracula](https://github.om/ElierLr/nt-DrulDracula)
    ```bash
    git clone https://github.com/EliverLara/Ant-Dracula
    mv Ant-Draculr /usr/share/themes/
    ```

* [Ant](https://github.com/EliverLara/Ant)
    ```bash
    git clone https://github.com/EliverLara/Ant
    mv Ant  /usr/share/themes/
    ```

### icon
* [all icons themes](https://itsfoss.com/best-icon-themes-ubuntu-16-04/)
* [oranchelo-icon-theme](https://github.om/OrnheloTem/ornhelo-ion-theme)
    ```bash
    sudo add-apt-repository ppa:oranchelo/oranchelo-icon-theme
    sudo apt-get update
    sudo apt-get install oranchelo-icon-theme
    ```
### font
* 中文字体
    * [文泉雅黑](https://blog.csdn.net/tao_627/article/details/24180781)
	```bash
    sudo aptitude install ttf-wqy-microhei
    ```

* 其他字体
    * [Dejavu](https://www.jianshu.com/p/ed098f15f638)
	```bash
    sudo apt-get install ttf-dejavu
    ```

* redshift
    ```bash
    sudo apt install gtk-redshift redshift python-appindicator
    gtk-redshift
    ```

	* [配置文件](https://gist.github.com/bcomnes/4243805)`/home/alopex/.config/redshift.conf`

    ```bash
    [redshift]
    ; Set the day and night screen temperatures
    temp-day=5700
    temp-night=3500

    [manual]
    lat=23.39
    lon=113.20
    ```

## 生产工具
* vim
    * Vundle
    ```bash
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle
    ```
	* 配置文件名 .vimrc
    ```bash
	wget https://github.com/Alopex4/configure/blob/master/.vimrc
    ```
* [tmux](http://louiszhai.github.io/2017/09/30/tmux/#%E7%AE%80%E4%BB%8B)
	* 配置文件名  .tmux.conf
	* 配置内容
    ```bash
    wget https://github.com/Alopex4/configure/blob/master/.tmux.conf
    ```

* [vmm](https://help.ubuntu.com/community/KVM/VirtManager)
	```bash
	sudo apt-get install virt-manager
	```

* xmind 8 pro
	* [安装1](https://askubuntu.com/a/869857)
	* [安装2](https://www.xmind.net/m/PuDC/)

* 编程工具
	* [vscode](https://code.visualstudio.com/download)
    	* 选择 .deb 下载
    	* dpkg -i   vscode.deb
    	* [出现依赖问题](https://blog.csdn.net/tterminator/article/details/41009225)
    	* apt-get -f install
	* [配置文件](https://github.com/Alopex4/configure/tree/master/.vscode)

	* [pycharm](https://www.jetbrains.com/pycharm/download/#section=linux)
		* [配置文件](https://github.com/Alopex4/configure/tree/master/.pycharm)
    * 安装方式1
        * 选择 community 下载 安装即可
    * 安装方式2
    ```bash
    sudo snap install pycharm-community --classic
    ```

* [ffmpeg](https://github.com/adaptlearning/adapt_authoring/wiki/Installing-FFmpeg)
    ```bash
    sudo add-apt-repository ppa:mc3man/trusty-media
    sudo apt-get update
    sudo apt-get install ffmpeg
    sudo apt-get install frei0r-plugins
    ```
	* [针对初学者的 20 多个 FFmpeg 命令](https://linux.cn/article-10932-1.html)
	* [The Complete Guide for Using ffmpeg in Linux](https://itsfoss.com/ffmpeg/)

* [wireshark](https://askubuntu.com/a/778172)
    ```bash
    sudo add-apt-repository ppa:wireshark-dev/stable
    sudo apt-get update
    sudo apt-get install wireshark
    ```
* something wrong ！
    ```bash
    sudo dpkg-reconfigure wireshark-common
    sudo adduser $USER wireshark
    ```

* [libre office](https://www.liquidweb.com/kb/installing-libreoffice-on-ubuntu-16-04/)
    ```bash
    sudo add-apt-repository ppa:libreoffice/ppa
    sudo apt update
    sudo apt install libreoffice
    ```

* [golden dictory](https://askubuntu.com/a/540023)
    ```bash
    sudo apt-get install goldendict
    sudo apt-get install goldendict-wordnet
    ```
	* [相关字典资源1](https://freemdict.com/category/%e8%8b%b1%e8%af%ad/)
	* [相关字典资源2](https://downloads.freemdict.com/Recommend/)

* [Haroopad](http://pad.haroopress.com/user.html)
    ```
    deb包下载 安装
    ```

* [kazam](https://itsfoss.om/kzm-sreen-reorder/)
    ```bash
    sudo add-apt-repository ppa:sylvain-pineau/kazam
    sudo apt-get update
    sudo apt install kazam
    sudo apt install python3-cairo python3-xlib
    ```

* [nvidia](https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-18-04-bionic-beaver-linux)
    ```bash
    ubuntu-drivers devices
    sudo ubuntu-drivers autoinstall
    sudo apt install nvidia-340
    ```

* [xournal](http://linuxg.net/how-to-install-xournal-0-4-8-on-ubuntu-18-10-and-ubuntu-18-04/)
    ```bash
    sudo apt update
    sudo apt install xournal
    ```

* [teamviewer](https://www.teamviewer.com/en/download/linux/)
    ```bash
    deb 包安装
    ```

## 别名命令


* 网络
    ```bash
    alias ethdown='sudo ip link set enp4s0 down'
    alias ethup='sudo ip link set enp4s0 up'
    ```

* qkmd
    ```bash
    pip3 install qkmd --user
    ```

* 自定义函数
    ```bash
    # Custome function
    ## Get the weather
    weather(){
        curl -s "wttr.in/$1?m1"
    }

    ask_google(){
        search_str=`echo "$@" | tr ' ' '+'`
        chromium-browser  --app="https://www.google.com/search?q="${search_str}""
    }

    ipip(){
        local request_parse="${1}"

        echo ${request_parse} | egrep -xq '([0-9.]{1,4}){3}[0-9]{1,3}'
        if [ $? == 0 ]
        then
            hosts=${request_parse}
        else
            echo ${request_parse} | grep -iq 'http'
            if [ $? == 0 ]
            then
                request_parse=`echo ${request_parse} | cut -d ':' -f2 | cut -d '/' -f3`
            fi
            hosts=`getent hosts ${request_parse} | awk '{print $1}'`
        fi

        for host in ${hosts}
        do
            echo '/*------------------<<<-start->>>-------------------*/'
            echo ">> ${host} <<"
            parse ${host}
            echo '/*------------------<<<--end-->>>-------------------*/'
            echo ''
        done
    }

    parse(){
        local ip="${1}"
        local token="80977e50c0ef36"
        export https_proxy=http://127.0.0.1:8123
        export http_proxy=http://127.0.0.1:8123
        curl ipinfo.io/${ip}?token=${token}
        echo
    }

    qr_code(){
        url=${1}
        name=${2}
        file_name=${name:-qrcode.png}
        qrencode -o /tmp/${file_name} ${url} -s 8
        display /tmp/${file_name}
    }

    transfer() {
    if [ $# -eq 0 ];
        then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md";
        return 1;
    fi

    tmpfile=$( mktemp -t transferXXX );

    if tty -s;
        then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g');
        curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile;
    else
        curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ;
    fi;
    cat $tmpfile;
    rm -f $tmpfile;
    }
    ```

## 娱乐工具
### 游戏
* steam
    ```bash
    sudo apt-get install steam
    ```

### 音乐
* [spotfiy](https://www.spotify.com/us/download/linux/)
	* 方法1
    ```bash
        # 1. Add the Spotify repository signing keys to be able to verify downloaded packages
        sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90

        # 2. Add the Spotify repository
        echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

        # 3. Update list of available packages
        sudo apt-get update

        # 4. Install Spotify
        sudo apt-get install spotify-client
    ```

	* 方法2
    ```bash
    snap install spotify
    ```

* [musixmatch](https://snapcraft.io/install/musixmatch/ubuntu)
    ```bash
    sudo snap install musixmatch
    ```

### 视频
* [vlc](https://tecadmin.net/install-vlc-on-ubuntu/)
    ```bash
    sudo apt install snap -y
    sudo snap install vlc
    ```

### 流下载
* [Deluge BitTorren](https://www.linuxbabe.com/bittorrent/deluge-bittorrent-client-ubuntu-16-04)
    ```bash
    sudo add-apt-repository ppa:deluge-team/ppa
    sudo apt update && sudo apt install deluge
    ```

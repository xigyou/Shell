# Shell
Some cool Shell scripts



工具：auto_fdisk_ssd.sh 
功能：自动检测是否有尚未分区的数据盘，格式化新的数据盘并自动挂载
适用系统版本：兼容线上所有IO优化+SSD云盘的linux版本
执行方法：以root身份执行命令：bash auto_fdisk_ssd.sh
解决了什么问题：一键式检测是否有尚未分区的数据盘，并能对其格式化和自动挂载，省去了复杂的命令和步骤
auto_fdisk_ssd.zip
http://help.aliyun.com/knowledge_detail/6689611.html?spm=5176.7618386.5.3.os5I5q



工具：update_source.sh
所有执行的脚本都需要root身份来执行，执行方法：以root身执行命令：bash xxx.sh
 
功能：自动检测系统并更新源
适用系统版本：兼容线上所有linux版本
执行方法：以root身份执行命令：bash update_source.sh
解决了什么问题：一键式检测系统并更新源
给客户带来了好处：用户只需执行该脚本一次即可自动检测系统并更新源。
备注：由于系统版本都有支持的周期所以部分源可能会出现不可用的情况，包括官方的源，这是正常情况
update_source.tgz
http://help.aliyun.com/knowledge_detail/5974184.html?spm=5176.788314861.3.5.b8CVNi






工具：install_vnc_server.sh 
功能：自动修改系统源和安装vncserver相关的软件包，centos、redhat系列都是安装gnome桌面环境，ubuntu和debian系列都是安装LXDE(Lightweight X11 Desktop Environment) 。目前不支持线上的OpenSUSE和Gentoo操作系统。
适用系统版本：兼容线上所有linux版本
执行方法：以root身份执行命令：bash install_vnc_server.sh
解决了什么问题：一键式安装vncserver，使用户可以远程图形化管理服务器
install_vnc_server.tgz
 
centos6系列安装完毕后第一次登陆会提示如下信息：

 
勾上图中红色选项，然后选择close关闭即可。Ubuntu和debian安装时会提示如下：

 
选择USA并使用键盘的”Tab”键选择OK关闭即可。

http://help.aliyun.com/knowledge_detail/5975063.html?spm=5176.788314861.3.7.b8CVNi




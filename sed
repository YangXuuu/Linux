###
sed主要用来处理文本内容的修改，文本的提取分割可以使用awk和cut命令

sed命令格式：

sed [选项] '.../.../...' [输入文件]...

'参数1/.../参数2' 这个和vi里命令行模式的输入格式很像，比如替换文本/s/root/aaa/g

常用选项：

-n 仅显示处理的行

-i 直接对原文件进行修改

-r 使用扩展的正则表达式

常用参数：

d 删除指定行
s 替换字符
使用s替换时结尾可用参数：
g 替换所有匹配行，例如sed -n 's/root/aaaa/g' file是将file文件中所有root替换成aaaa
数字 如为2时表示替换第二个匹配的字符或字符串，例如sed -n 's/root/aaaa/2' file是将file文件中第二个匹配的root替换成aaaa，其他root字符串不进行替换

1.替换指定字符（指定字符后面内容不固定）

有一个文本S98ifconfig

需要修改IPADDR后的ip内容，ip不固定

[root@iProc /root]#cat S98ifconfig 
#!/bin/sh
ETH="eth0"
IPADDR="11.11.11.120"

使用命令，将ip修改为11.11.11.190

sed -ri 's/(IPADDR=")[^"]*/\111.11.11.190/' S98ifconfig

如果替换的字符中包含/符号，前面需要添加转义符，不然报错，即输入\/即可

修改后的文件

[root@iProc /root]#sed -ri 's/(IPADDR=")[^"]*/\111.11.11.190/' S98ifconfig
[root@iProc /root]#cat S98ifconfig 
#!/bin/sh
ETH="eth0"
IPADDR="11.11.11.190"

2.删除指定字符串行

删除带有“ADDR”的行

[root@iProc /root]#cat S98ifconfig 
#!/bin/sh
ETH="eth0"
IPADDR="11.11.11.120"

使用命令 sed '/ADDR/d' passwd

ckx@ckx:~/ckxcode$ sed '/ADDR/d' passwd
#!/bin/sh
ETH="eth0"


3.删除空白行

删除所有空白行

sed '/^$/d' passwd

4.删除文件指定行

删除第二行

sed '2d' passwd 

删除第二行及后面的所有行

sed '2,$d' passwd

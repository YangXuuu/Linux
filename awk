### 如果没写条件判断即对所有行进行处理
awk FS=":" 'NR==1{print $1,$2}' ../awk.txt
### 上述命令也可写成
awk -F":" 'NR==1{print $1,$2}' ../awk.txt
或者
awk -v FS=":" 'NR==1{print $1,$2}' ../awk.txt
###

awk -F":" '{print $1"\tusername:\t"$2"\tuid:"$4}' ..awk.txt
以冒号做分割， $1代表打印的是第一列，\t为制表符，awk为逐行处理，即每一行都会做这样的处理，原文件中的冒号被作为分割符用掉了，默认按照空格进行分割；username及uid都是人为手写进的

### 提取行数大于12的数据
awk 'NR>12' ../awk.txt
没写花括号即默认打印，上述命令也可写成
awk 'NR>12{print $0}' ../awk.txt

### 打印偶数行
awk 'NR%2==0' ../awk.txt
上述命令可写成
awk 'NR%2!1' ../awk.txt
### 打印奇数行
awk 'NR%2==1 ../awk.txt'
### 打印偶数行或行数小于5的行
awk 'NR%2!1||NR<5' ../awk.txt
### 打印偶数行且行数小于5的行
awk 'NR%2!=1&&NR<5' ../awk.txt
### 以冒号符作为分割，打印$1与$4
awk -F":" 'NR%2!=1&&NR<5{print $1,$4}' ../awk.txt
%表示求余数，逻辑判断是两个等号==，赋值为一个等号= ; 条件判断： 或写法为||, 且写法为&&

### 匹配含有"sh"的行
awk -F":" '/sh/' ..awk.txt
上述命令也可写成
awk -F":" '$0~/sh/' ..awk.txt
### 对于第一行来说，匹配含有"sh"的行
awk -F":" '$1/sh/' ..awk.txt
### 匹配结尾行
awk -F":" '$NF~/sh/' ..awk.txt
### 匹配含有"sh"结尾的行
awk -F":" '/sh$/' ..awk.txt













###
awk FS=":" 'NR==1{print $1,$2}' ../awk.txt
### 上述命令也可写成
awk -F":" 'NR==1{print $1,$2}' ../awk.txt
或者
awk -v FS=":" 'NR==1{print $1,$2}' ../awk.txt
###

import os
import re

path = "D:\\Acode\\Gowin\\9_doubleOv5640_transformer_UDP\\src\\"
# 定义正则表达式模式，使用负向预测断言来排除"tmp"，使用正向预测断言来匹配".v"
pattern = r'^(?!.*tmp)(?!.*temp)'

operate_path = os.listdir(path)
all_file = []
for root, dirs, files in os.walk(path):
    for file in files:
        if file[-1] == 'v':
            all_file.append(root + '\\' + file)

tcl_file = open(path + 'tcl\\main.tcl', mode = 'w')
for i in all_file:
    if re.search(pattern,i):
        i = i.replace('\\','/')
        tcl_file.writelines('add_file ' + i + '\n')
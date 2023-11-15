import os
import re


path = "D:\\Acode\\Gowin\\4_ov5640_beta3\\src\\"
# 定义正则表达式模式，使用负向预测断言来排除"tmp"，使用正向预测断言来匹配".v"
pattern = r'^(?!.*tmp)(?!.*temp)'

operate_path = os.listdir(path)
all_file = []
for root, dirs, files in os.walk(path):
    for file in files:
        if file[-1] == 'v':
            all_file.append(root + '\\' + file)

tcl_file = open(path + 'tcl\\modelsim.tcl', mode = 'w')
for i in all_file:
    if re.search(pattern,i):
        i = i.replace('\\','/')
        tcl_file.writelines('vlog ' + i + '\n')

tcl_file.writelines('''vsim work.tb_main -novopt -L {D:/Software/ModelsimSE 10.5/gowin/gowin} \n
add ware /tb_main/* \n
run 1us')''');
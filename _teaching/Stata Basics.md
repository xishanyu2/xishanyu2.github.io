---
layout: archive
permalink: /teaching/stata/chap1
author_profile: true
---

{% include base_path %}

# Stata学习资源（结合Wooldridge, 6e）：

学习视频：[Stata33讲](https://lianxh-class.cn/view/1527932289698443345)、[Stata+R软件基础](https://lianxh-class.cn/view/1527932289698443382)、[习明明讲计量](https://space.bilibili.com/1086486458/lists/1179466?type=season)

**人手一份**：[Stata 101](https://file.lianxh.cn/KC/Slides/lianxh_Stata101.pdf)

[Wooldridge datasets](http://fmwww.bc.edu/ec-p/data/wooldridge/datasets.list.html)（结合`bcuse`命令），Boston College之前出过伍德里奇第一、二版书中例题的Stata程序代码，有学者针对第六版进行了更新[-Econometric-textbook-stata-replication](https://github.com/Econtech/-Econometric-textbook-stata-replication)

如果想用`Python`、`R`、`Julia`实现伍德里奇教材，可以阅读以下几本书：[Using R, Python and Julia for Introductory Econometrics](http://www.upfie.net/)

---
# 第一章总结与补充：
1. 认识Stata界面的5个窗口、菜单栏、快捷键
	- 数据编辑器(编辑)与数据编辑器(浏览)的区别、三种颜色数据类型的区别与转换
	- 用Ctrl+D替代在Do-file里点击执行所选(do)
	<div align=center>
		<img src='/images/Pasted image 20250225203602.png' width="450">
	</div>

2. 创建日志文件
3. 数据导入与导出
	- 4种导入数据方式：
		1. 文件(File)→导入(Import)：可以导入多种类型的数据，注意导入Excel文件时是否将第一行作为变量名；
		2. 快捷键”打开“（快捷键第一个图标或使用Ctrl+D）：只能导入Stata格式文件；
		3. 输入命令：`use`和`sysuse`的区别、`import`与第一种导入方式结果窗口显示的命令相同；
		4. 直接点击或拖动Stata格式数据到Stata界面（.dta文件和Do-file同时打开）
	- 数据导出（同样可分为点击式和命令式）：`save`, `export`
4. 数据审阅：`list`, `describe`, `codebook`, `sort`, `gsort`
5. 描述性统计：`sum`, `tabulate`, `duplicates`（检查重复值）, `sum2docx`（导出描述性统计表格到论文中）
6. 变量处理：`gen`, `rename`, `drop`, `keep`, `replace`, `label`
7. 数据可视化：`histogram`, `scatter`, `line`, `kdensity`, `graph dot/pie/box/bar/matrix`（论文当中则需要对图像细节做更多处理）
```stata
*图形叠加
twoway scatter price weight || lfit price weight
*也可以写成
twoway (scatter price weight) (lfit price weight)
```
8. 善用`help`命令！

---
# 第一章上机练习解答：

---
# 问题汇总与解答：
1. 初始化设置：

```stata
cd "C:\Program Files\Stata18"
clear all
set more off
capture log close
log using "chapter01.log", replace
```

**可能的错误：**
<div align=center>
	<img src='/images/屏幕截图 2025-02-25 125725(1).png' width="425">
</div>
<br>
**解决方案**：设置日志文件时不要储存在Stata安装路径下，例如可以修改为（假设D盘下已经建立了一个名为stata的文件夹）：

```stata
cd "D:\stata"
clear all
set more off
capture log close
log using "chapter01.log", replace
```

<div align=center>
	<img src='/images/屏幕截图 2025-02-25 130547(1).png' width="425">
</div>
<br>
此外，连老师编写过一个profile.do文件，可以实现开机自动生成日志文件，参见：[Stata：聊聊 profile.do 文件](https://www.lianxh.cn/details/77.html)、[聊聊Stata中的profile文件-第二季](https://www.lianxh.cn/details/672.html)

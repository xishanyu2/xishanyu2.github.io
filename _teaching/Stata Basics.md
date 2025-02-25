---
permalink: /teaching/stata/L2
date: 2025-2-25
---

{% include base_path %}

# Stata学习资源（结合Wooldridge, 6e）：
[连享会](https://www.lianxh.cn/)、[陈强](http://www.econometrics-stata.com/)、[Stata官网](https://www.stata.com/)...

推荐学习视频：[Stata33讲](https://lianxh-class.cn/view/1527932289698443345)、[Stata+R软件基础](https://lianxh-class.cn/view/1527932289698443382)、[习明明讲计量](https://space.bilibili.com/1086486458/lists/1179466?type=season)

**人手一份**：[Stata 101](https://file.lianxh.cn/KC/Slides/lianxh_Stata101.pdf)

[Wooldridge datasets](http://fmwww.bc.edu/ec-p/data/wooldridge/datasets.list.html)（结合`bcuse`命令），Boston College之前出过伍德里奇第一、二版书中例题的Stata程序代码，有学者针对第六版进行了更新[-Econometric-textbook-stata-replication](https://github.com/Econtech/-Econometric-textbook-stata-replication)

如果想用`Python`、`R`、`Julia`实现伍德里奇教材，可以阅读以下几本书：[Using R, Python and Julia for Introductory Econometrics](http://www.upfie.net/)
# 第一章总结与补充：
# 问题汇总与解答：
1.初始化设置：

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
</div>\

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
</div>\

此外，连玉君老师编写过一个profile.do文件，可以实现开机自动生成日志文件，参见：[Stata：聊聊 profile.do 文件](https://www.lianxh.cn/details/77.html)、[聊聊Stata中的profile文件-第二季](https://www.lianxh.cn/details/672.html)

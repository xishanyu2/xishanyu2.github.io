---
title: Softwares for Economics
date: 2024-10-14
permalink: /blogs/soft
---

An economics student is a jack of all trades and master of none.

今天尧尧和我分享了一则推文[【芾椿经验002】Julia：速度更快的Stata高维面板回归命令——reghdfejl](https://mp.weixin.qq.com/s/FBy8qso-ctVECK36-AsLTA)  ，恰好我之前用过`Julia`-`Pluto`；之后正在找实习的Boyi和我分享了他的简历：_熟悉使用Word、PowerPoint等办公软件，曾使用Excel和Stata收集分析上万条数据，并对文件管理非常熟悉_。我指出业界可能不太用`Stata`，并且他需要提升一些编程能力；十一期间去北京实习的小K说他们要会`SQL`。

适逢今天诺贝尔经济学奖公布，虽然和物化不同与AI无关，但21世纪经济学习需要一定的计算和编程能力，下面将盘点经济学都会用到的软件:

**编程软件**：`C++`，`Python`，`R`，`Julia`  
 我大一刚入学时（理工科）学的就是`C++`，大二转向（经管类）学的`Python`，致使我一段时间不太适应这种语法转变。例如交换两个数的值，`C++`里需要一个临时变量，可以看作有三个盒子，先把a中的小球放入t，再把b中的小球放入a，最后把t中原来a的小球放入b，实现两个数的对调：
```
#include<iostream>
using namespace std;
int main()
{
	int a = 5;
	int b = 10;
	int t = a;
	a = b;
	b = t;
	cout << "a: " << a << endl;
	cout << "b: " << b << endl;
	system("pause");
	return 0;
}
```

`Python`一句话就能写完：
```
x,y=5,10
x,y=y,x
print(x,y)
```
`Python`更简洁，但`C++`在编程的底层逻辑上更强，所以工科还是先学`C`或`C++`。

踪家峰老师在他的《区域与城市经济学》一书中指出经济学本科生需要掌握`Stata`，研究生需要在`Stata`的基础上在`Python`和`R`中掌握一个。计算机领域的学者更熟悉`Python`，统计学领域的学者更熟悉`R`；机器学习两者都可选择，但从陈强老师两本书的销量来看还是选择`Python`的更多。

`Julia`是由MIT开发的，学习可参见[Interactive Computational Thinking — MIT](https://computationalthinking.mit.edu/Fall24/)，近年来出了用`Python`、`R`、`Julia`实现伍德里奇计量经济学的书 [weblink](http://www.upfie.net/)：

**经济数据分析**：`Stata`，`SPSS`，`EViews`，`MATLAB`  
经济学跑回归离不开`Stata`，其重要性不言自明；  
`SPSS`在统计学上机时会用到，但之后就不用了，更多的是管理学和社会学做相关分析、因子分析等会用到；  
`EViews`作为时间序列分析的工具，计量上机时有的老师会选择；  
`MATLAB`在经济学数值分析、高宏DSGE相关部分会用到，美赛通常也是使用`Python`或`MATLAB`。

**社会网络分析**：`UCINet`，`Gephi`...  
社会网络分析软件种类繁多、功能强大，`UCINet`是最知名和最经常被使用的处理社会网络数据的分析程序，能够处理矩阵格式的数据，并提供了大量数据管理和转化工具，但可视化功能不强，需要联动搭配`NetDraw`、`Mage`、`Pajek`使用。  
`Gephi`是一款网络分析领域的数据可视化处理软件，开源免费，界面优美，被誉为“数据可视化领域的`Photoshop`”，应用场景广泛，包括社交网络分析、舆情分析、知识图谱、生物科学等领域，主要用于各种网络和复杂系统的动态和分层图的交互可视化与探测。  
而`Stata`作为经管邻域最常用的计量分析软件，近年来在社会网络分析领域第三方包也不断完善，可视化功能日趋完备，但处理数据量有限，一般是经过上述专业社会网络分析软件处理计算后，得到相应指标进行改进作为解释变量，再用`Stata`进行分析。

**地理信息系统**：`ArcGIS`，`GeoDa`...

**文字排版处理**：LaTeX、Markdown、Microsoft Office、Adobe

`TeX Live`+`TeXstudio`：需要配环境且`TeX Live`太大了，个人更偏好`Overleaf`.  
我现在用Markdown和`Marp`取代了`Word`和`PowerPoint`，能实现自动排版；Markdown可在`VS Code`或`Obsidian`里编译，改改就能用`Marp`做slides.  
`Excel`在投入产出中的操作主要函数有：

```
1.矩阵乘法（MMULT）：函数——>数学和三角函数(Maths & Trig)——>MMULT，参数array1选择左乘的矩阵，array2选定右乘的矩阵；
函数嵌套：MMULT(MMULT(A, B),C)等价于MMULT(A,MMULT(B,C))
2.矩阵转置（TRANSPOSE）：Excel粘贴时能实现行/列向量、矩阵的转置；
3.矩阵求逆（MINVERS）
3.固定行/列（$）：在字母前加$表示固定列只改变行的位置，在数字前加$表示固定行只改变列的位置；
4.条件语句（IF）：IF(logical_test,value_if true,value_if false)
```

**彩蛋**：不同编程语言注释总结
```
//C++
//Word里直接加两条斜杠不等于删除！
```

```
#Python
#使用一个井字符进行单行注释
'''
使用一对三个英文单引号进行多行注释
'''
"""
或者使用一对三个英文双引号进行多行注释
"""
```

```
*Stata
*这样可以注释一行
reg y $x, r //这样可以在一行后注释
/*
这样可以注释一块
*/
```

```
%LaTeX
%使用百分号进行注释，正常打百分号需加转义符
```

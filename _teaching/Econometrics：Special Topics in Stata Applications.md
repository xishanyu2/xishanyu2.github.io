---
title: "Econometrics：Special Topics in Stata Applications"
collection: teaching
type: "Teaching Assistant"
permalink: /teaching/stata
venue: "Spring"
date: 2025-01-01
---

Please contanct me in Feishu.

# 写在前面：理解计量经济学的3种方式

在计量经济学的学习过程中，我认为有三种理解方式（或认识角度）——理论、操作、应用，这三者你中有我、我中有你、互相映照、共同帮助我们理解计量经济学的本质。

具体而言，理论就是数学基础与推导，比如OLS参数估计值的推导、检验统计量的构造、根据实际研究的问题和数据选择合适的模型等等，这是在使用伍德里奇教材时我们主要学习的部分。

操作是运用计算机软件处理、分析数据的过程，在经济学里我们常用Stata来实现。

而应用则是结合经济学模型与实证分析，如估计菲利普斯曲线、验证有效市场假说，让模型与数据有经济学意义，这也是我们在看经济学论文时主要关注的东西。

---
！计量初学者可跳过这一部分。
我们在书中经常看到这样的“算法块”，以伍德里奇第12章为例，在这里我们不从ARIMA(p,d,q)模型和序列相关、异方差说起，而是以从理论向操作转变的代码描述为例，我建议同学们在学习过程中遇到例题或这种描述性语句多想想Stata代码该怎么写（以下给出了第12章所有代码描述对应基本语法，下图对应最后一个代码块）：
![[屏幕截图 2025-02-26 222136.png]]
```
* Testing for AR(1) Serial Correlation with Strictly Exogenous Regressors:
reg y_t x_t1 ... x_tk
predict uhat, residual
reg uhat L.uhat
```

```
* Testing for Serial Correlation with General Regressors:
reg y_t x_t1 ... x_tk
predict uhat, residual
reg uhat x_t1 ... x_tk L.uhat
```

```
* Testing for AR(q) Serial Correlation:
reg y_t x_t1 ... x_tk
predict uh, res
reg uhat x_t1 ... x_tk L.uh L2.uh ... Lq.uh
test L1.uh L2.uh ... Lq.uh
```

```
* Feasible GLS Estimation of the AR(1) Model:
reg y_t x_t1 ... x_tk
predict uhat, res
reg uhat L.uhat //Cochrane-Orcutt (CO) estimation
prais y_t x_t1 ... x_tk // Prais-Winsten (PW) estimation
```

```
* Serial Correlation–Robust Standard Error for b1_hat
newey y_t x_t1 ... x_tk, lag(n)
```

```
* Feasible GLS with Heteroskedasticity and AR(1) Serial Correlation:
reg y_t x_t1 ... x_tk
predict uh, r
gen lu2 = ln( uh^2 )
reg lu2 x_t1 ... x_tk
predict gh
gen hh = exp(gh)
prais hh x_t1 ... x_tk [aw=1/hh]
```

伍德里奇的例题和习题都是非常好的练习素材，习题内容与难度也是层层递进、前后呼应的；
当我们掌握了第12章所有的理论和Stata操作后，就要通过练习来理论联系实际达到应用，不妨来看一道有意思的课后计算机练习，这道题还有个名字叫“风浪越大，鱼越贵”（stormy seas would increase the price of fish）：
<div style="display: flex; justify-content: center; align-items: center;">
    <img src='/images/Pasted image 20250226171343.png' width="153">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <img src='/images/Pasted image 20250226165852.png' width="500">
</div>

这道题是当时另一个计量班的作业，有同学问我我写的代码如下：
```stata
bcuse fish
global x "mon tues wed thurs"
reg lavgprc $x t
test $x
reg lavgprc $x t wave2 wave3
predict u, res
tsset t
reg u l.u
quietly reg lavgprc $x t wave2 wave3
est store m1
quietly newey lavgprc $x t wave2 wave3, lag(4)
est store m2
esttab m1 m2
prais lavgprc $x t wave2 wave3
test wave2 wave3
```
---

对于刚接触计量经济学的同学可能有些难度，看不懂没关系，我们换一个更为简单的例子来说明：
1. 理论：
在一元线性回归中，回归模型为：
$$y=\beta_0+\beta_1x+u$$
为了保证OLS被估参数的无偏性，需要满足$Gauss-Markov$假定，其中假定4为：$E(u|x)=0$

2. 应用：
考虑教育的投资回报率（明瑟方程），回归方程就可以写为：
$$ln(wage)=\beta_0+\beta_1educ+u$$
如何理解零条件均值假设？其中需要满足解释变量$educ$和误差项$u$不相关，即$Cov(x,u)=0$，$u$中可能包含有“能力”$ability$，能力$ability$越高可能受教育年限$educ$更大（有更多接受教育的机会），那么$educ$和$u$就可能相关。
不要小看这个简单的例子，随着学习的深入，我们会在模型里加入一些控制变量、使用代理变量$IQ$（尽管$IQ$是$ability$的好的代理变量，但不是$educ$的好的工具变量，因为不满足外生性假定），用父母的教育程度或兄弟姐妹数作IV、用出生季度作IV（Angrist & Krueger, 1991），研究女性的投资回报率（Mroz, T.A., 1987）——`bcuse mroz`（Wooldrige, 6e：例题15.1、15.5、16.5），用PSM-DID方法研究如果上TJU而不是NKU工作后的工资是不是会更高，还可以采用断点回归（fuzzy RD）的方法[^1]...

3. 操作：
主要用到的就是`reg`命令，Stata代码为：
```stata
bcuse wage1
gen lwage = ln(wage)
reg lwage educ
```
---

因此这门课不是对计量1和计量2的简单补充和重新组织，也不是一门专门讲Stata数据处理与编程的课，而是基于伍德里奇《计量经济学导论：现代观点》教材，理论与实践并重，用计量理论引领Stata的学习，通过Stata反向加深对理论知识的理解，并辅之以相关文献的阅读与复现，实现“理论-操作-应用”三个维度的有机融合，以期提高同学们的学术能力与规范，为大创、论文等打下良好基础。

[^1]: 李逸飞,刘海琦,李静.读书何以改变命运?——基于精英教育长期回报的考察[J].经济学(季刊),2024,24(05):1394-1411.
	



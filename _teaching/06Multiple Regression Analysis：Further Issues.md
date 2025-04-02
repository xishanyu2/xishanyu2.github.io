---
title: "Multiple Regression Analysis：Further Issues"
collection: talks
type: "Chap7"
permalink: /teaching/stata/chap7
venue: "Mar 31st"
date: 2025-01-01
location: ""
---

[pdf version](http://xishanyu2.github.io/files/), [html version](http://xishanyu2.github.io/files/)

---

## 实验1：数据测度单位改变对OLS统计量的影响

|  统计量类型  | 因变量单位变换影响 | 自变量单位变换影响 | 对数变量单位变换单位 |
| :-----: | :-------: | :-------: | :--------: |
|  系数估计值  |   等比例缩放   |   反比例缩放   |   斜率系数不变   |
|   标准误   |   等比例缩放   |   反比例缩放   | 斜率系数的SE不变  |
| 置信区间宽度  |   等比例缩放   |   反比例缩放   | 斜率系数的CI不变  |
|   t、F   |    不变     |    不变     |  斜率系数的t不变  |
|   R²    |    不变     |    不变     |    基本不变    |
| SSR、SER |    改变     |    不变     |    基本不变    |

## 实验2：标准化系数

```stata
*标准化变量
egen x_z = std( x )
```

```stata
*比较解释变量的重要程度
reg y x1_z x2_z x3_z, noc
*等价于：
reg y x1 x2 x3, beta
```

## 实验3：含对数的模型

> 精确百分比的计算与使用条件

```stata
dis 100*( exp(_b[x]) - 1 )
```

## 实验4：含二次项的模型

```stata
*生成交互项
*foreach（已讲）
reg y c.x##c.x //生成x的一次项与x的平方项
reg y c.x#(c.p2-p9) //只生成x与p2-p9的系列交互项
reg y c.x##(c.p2-p9) //生成x与p2-p9的系列交互项，和x与p2-p9本身
```

```stata
*二次拟合
*qfit（已讲）
```

```stata
*中心化处理
sum x
gen x_centered = x - r(mean)
```

## 实验5：含交叉项的模型

> 偏效应的解读

```stata
*再参数化
sum x1
scalar x1_mean = r(mean)
gen x1cx2 = ( x1 - x1_mean ) * x2
```

## 实验6：拟合优度和变量选择

## 实验7：预测和残差分析

---
title: "Multiple Regression Analysis：Inference"
collection: talks
type: "Chap5"
permalink: /teaching/stata/chap5
venue: "Mar 17th"
date: 2025-01-01
location: ""
---

[pdf version](http://xishanyu2.github.io/files/Multiple Regression Analysis：Inference.pdf), [html version](http://xishanyu2.github.io/files/Multiple Regression Analysis：Inference.html)

---

# 四大重要分布：

1.1 标准正态分布
```stata
twoway function y=normalden(x),range(-5 5) xline(0) ytitle("概率密度")
```

1.2 正态分布
```stata
twoway function z=normalden(x,1,2),range(-5 10) xline(1) ytitle("概率密度")
```

2.t分布
```stata
twoway function t=tden(1,x),range(-5 5) ///
|| function y=normalden(x),range(-5 5) xline(0) ytitle("概率密度")
```

3.卡方分布
```stata
twoway function chi3=chi2den(3,x),range(0 20) ///
|| function chi5=chi2den(100,x),range(0 20) lp(dash) ytitle("概率密度")
```

4.F分布
```stata
twoway function F20=Fden(10,20,x),range(0 5) ///
|| function F5=Fden(10,5,x),range(0 5) lp(dash) ytitle("概率密度")
```
# t值、p值、F值、临界值的计算：

chap5.1_t检验与F检验 [download]()
# 检验
1. `test`
- 排除性约束检验/联合显著性检验
```stata
test x
test x1 x2 x3
```

- 检验系数是否等于某个常数
```stata
test x = 0
test x = c
```

- 检验系数是否相等
```stata
test x1 = x2
```

- 检验参数间的线性关系
```stata
test a*x1 + b*x2 = c
```

```stata
lincom a*x1 + b*x2 //"=" not allowed in expression
```

- 检验参数间的非线性关系（delta方法）
```stata
testnl _b[x]/_b[x] = c //chi2
```

```stata
nlcom _b[x]/_b[x] - c //z
```

2. `ttest`（检验均值）
```stata
ttest x == c
```

```stata
ttest x == y
```

- 组间均值差异检验
```stata
ttest x, by(group)
```

3. `ftest`
4. Wald检验、LM检验与LR检验
`lrtst`，没有`lmtest`

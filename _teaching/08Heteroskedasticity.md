---
title: "Heteroskedasticity"
collection: talks
type: "Chap9"
permalink: /teaching/stata/chap9
venue: "Apr 14th"
date: 2025-01-01
location: ""
---

[pdf version](http://xishanyu2.github.io/files/Heteroskedasticity.pdf), [html version](http://xishanyu2.github.io/files/Heteroskedasticity.html)

---

# Summary

**异方差的概念**、类型、图示
**异方差的来源**
**异方差的后果**：影响有效性（t、F检验失效，OLS不再是BLUE）

```stata
*A Heteroskedasticity-Robust LM Statistic:
reg y x1 x2 x3
predict uh, r
reg x4 x1 x2 x3
predict r1, r
reg x5 x1 x2 x3
predict r2, r
gen r1u = r1*uh
gen r2u = r2*uh
reg 1 r1u r2u, noc
dis "LM统计量为：" _N-e(rss)
```

**异方差的检验**：BP 检验（局限性）、White检验

```stata
*The Breusch-Pagan Test for Heteroskedasticity:
reg y x1 x2 x3
predict uhat, r
gen uhsq = uhat^2
reg uhsq x1 x2 x3
test x1 x2 x3 //F检验
dis "LM统计量为：" _N*e(r2) //LM检验
```

```stata
*A Special Case of the White Test for Heteroskedasticity:
reg y x1 x2 x3
predict yhat
predict uhat, r
gen yhsq = yhat^2
gen uhsq = uhat^2
reg uhsq yhsq
test yhsq
dis "LM统计量为：" _N*e(r2)
```

**异方差的处理**：
1. 异方差稳健标准误：`robust`
2. WLS/GLS（已知异方差）
3. FWLS（未知异方差）

```stata
*A Feasible GLS Procedure to Correct for Heteroskedasticity:
reg y x1 x2 x3
predict uh, r
gen lusq = ln( uh^2 )
reg lusq x1 x2 x3
predict gh
gen hh = exp(gh)
reg y x1 x2 x3 [aw=1/hh]
reg y x1 x2 x3 [aw=1/hh], r
```

```stata
*Estimating the Linear Probability Model by Weighted Least Squares:
reg y x1 x2 x3
predict yh
replace yh = 0.01 if yh < 0.01
replace yh = 0.99 if yh > 0.99
gen hh = yh*(1-yh)
reg y x1 x2 x3 [aw=1/hh]
```

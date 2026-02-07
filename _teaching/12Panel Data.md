---
title: "Pooled Cross Section and Panel Data"
collection: talks
type: "Chap12"
permalink: /teaching/stata/chap12
venue: "May 19th"
date: 2025-01-01
location: ""
---

A very simple and quick glance.

---



```stata
xtset id year //xtdes,xttab,xtsum,xtline

*- 混合OLS估计
reg y $x if year==1

xtfmb y $x //Fama and MacBeth (1973)

*- FD估计
reg diff_y diff_x //不能使用D., help xtserial

*- LSDV估计
reg y $x i.id, vce(cluster id)

*- FE, RE估计
xtreg y $x, fe
//reg y $x i.id
//reghdfe y $x, absorb(id)
est sto fe

xtreg y $x, re
est sto re

*- Hausman检验
hausman fe re
```

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
reg △y △x //不能使用D., help xtserial

*- LSDV估计
reg y $x i.id, vce(cluster id)

*- FE, RE估计
xtreg y $x, fe //reg y x i.id
est sto fe
xtreg y $x, re
est sto re

hausman fe re
```

**Reference**
陈强（2023）**chap12**
[连享会-gitee/PanelData](https://gitee.com/arlionn/PanelData "PanelData")
[Stata 101/面板数据](https://book.lianxh.cn/stata101/body/XT1_%E9%9D%A2%E6%9D%BF%E6%95%B0%E6%8D%AE%E6%A8%A1%E5%9E%8B%E7%AE%80%E4%BB%8B.html)

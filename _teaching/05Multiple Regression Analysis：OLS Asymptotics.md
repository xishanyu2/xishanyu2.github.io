---
title: "Multiple Regression Analysis：OLS Asymptotics"
collection: talks
type: "Chap6"
permalink: /teaching/stata/chap6
venue: "Mar 24th"
date: 2025-01-01
location: ""
---

No video in this chapter.

---

补充（伍德里奇第三章C11）：多重共线性处理之逐个放入——看调整的R方

```stata
use "\meapsingle.dta" 
qui reg math4 pctsgle lmedinc free
eststo m1
qui reg math4 pctsgle
eststo m2
qui reg math4 pctsgle lmedinc
eststo m3
qui reg math4 pctsgle free
eststo m4
esttab, se r2 ar2 //报告R方和调整的R方
/*
----------------------------------------------------------------------------
                      (1)             (2)             (3)             (4)   
                    math4           math4           math4           math4   
----------------------------------------------------------------------------
pctsgle            -0.200          -0.833***       -0.682***       -0.275*  
                  (0.159)        (0.0707)         (0.143)         (0.117)   

lmedinc             3.560                           6.530                   
                  (5.042)                         (5.344)                   

free               -0.396***                                       -0.402***
                 (0.0703)                                        (0.0699)   

_cons               51.72           96.77***        20.97           93.00***
                  (58.48)         (1.597)         (62.06)         (1.632)   
----------------------------------------------------------------------------
N                     229             229             229             229   
R-sq                0.460           0.380           0.384           0.459   
adj. R-sq           0.453           0.377           0.378           0.454   
----------------------------------------------------------------------------
Standard errors in parentheses
* p<0.05, ** p<0.01, *** p<0.001
*/
```

---

1. 无偏性与一致性
2. OLS的渐近性：  
大样本下：  
   MLR.1-MLR.4：一致性  
   MLR.1-MLR.5：渐近正态性  
3. 渐近偏误：判断方法与第三章相同
4. 实验1：OLS无偏性的蒙特卡罗模拟  
   实验2：OLS一致性的蒙特卡罗模拟  
   实验3：OLS渐近正态性的蒙特卡罗模拟

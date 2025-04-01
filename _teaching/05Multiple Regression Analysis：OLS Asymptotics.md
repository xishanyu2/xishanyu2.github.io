---
title: "Multiple Regression Analysis：OLS Asymptotics"
collection: talks
type: "Chap6"
permalink: /teaching/stata/chap6
venue: "Mar 24th"
date: 2025-01-01
location: ""
---

[pdf version](http://xishanyu2.github.io/files/), [html version](http://xishanyu2.github.io/files/)

---

```stata
qui reg math4 pctsgle lmedinc free
eststo m1
qui reg math4 pctsgle
eststo m2
qui reg math4 pctsgle lmedinc
eststo m3
qui reg math4 pctsgle free
eststo m4
esttab, ar2
/*
----------------------------------------------------------------------------
                      (1)             (2)             (3)             (4)   
                    math4           math4           math4           math4   
----------------------------------------------------------------------------
pctsgle            -0.200          -0.833***       -0.682***       -0.275*  
                  (-1.26)        (-11.78)         (-4.78)         (-2.34)   

lmedinc             3.560                           6.530                   
                   (0.71)                          (1.22)                   

free               -0.396***                                       -0.402***
                  (-5.64)                                         (-5.75)   

_cons               51.72           96.77***        20.97           93.00***
                   (0.88)         (60.60)          (0.34)         (56.97)   
----------------------------------------------------------------------------
N                     229             229             229             229   
adj. R-sq           0.453           0.377           0.378           0.454   
----------------------------------------------------------------------------
t statistics in parentheses
* p<0.05, ** p<0.01, *** p<0.001
*/
```

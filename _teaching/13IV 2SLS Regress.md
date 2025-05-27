---
title: "IV, 2SLS & Logit, Probit"
collection: talks
type: "Chap13&14"
permalink: /teaching/stata/chap13&14
venue: "May 26th"
date: 2025-01-01
location: ""
---

The end. ✿✿ヽ(ﾟ▽ﾟ)ノ✿

---

一、内生性的概念  
二、工具变量的概念  
三、工具变量估计方法`ivregress 2sls y (x = iv) z, r`  
    【实验1】已婚女性的教育回报率  
    【实验2】男性的教育回报率  
    【实验3】 Card(1995) 教育回报研究  
    【实验4】职业女性的教育回报  
四、模型的检验方法  
    【实验5】教育回报模型
- 模型的内生性检验
  - Huasman检验`hausman iv ols, constant sigmamore`
  - DWH检验`estat endog`
- 工具变量有效性的检验
  - 相关性检验（弱工具变量检验）`estat first` `weakivtest`
  - 外生性检验（过度识别约束检验）`estat overid`

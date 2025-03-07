---
title: "Stata Intermediate & Monte Carlo Simulation"
collection: talks
type: "Chap2&3"
permalink: /teaching/stata/chap2
venue: "Mar 3rd"
date: 2025-01-01
location: ""
---

[pdf version](http://xishanyu2.github.io/files/Stata Intermediate & Monte Carlo Simulation.pdf), [html version](http://xishanyu2.github.io/files/Stata Intermediate & Monte Carlo Simulation.html)

---

# Chap2 Stata进阶

1.`bysort`, `egen`, `binscatter`

- 数据类型

| Storage type | Minimum              | Maximum             | Closest to 0 without being 0 | bytes |
| ------------ | -------------------- | ------------------- | ---------------------------- | ----- |
| byte         | -127                 | 100                 | +/-1                         | 1     |
| int          | -32,767              | 32,740              | +/-1                         | 2     |
| long         | -2,147,483,647       | 2,147,483,620       | +/-1                         | 4     |
| float        | -1.70141173319*10^38 | 1.70141173319*10^38 | +/-10^-38                    | 4     |
| double       | -8.9884656743*10^307 | 8.9884656743*10^307 | +/-10^-323                   | 8     |

- 数据显示转换
```stata
format varlist %fmt
format %fmt varlist
```
> %9.2f

2.数据类型转换：`destring`, `tostring`, `encode`, `decode`, `real`

- 字符串提取：
```stata
gen newvar1 = substr( str1 ,1,3)
gen newvar2 = substr( str2 ,-2,.)
```

-  日期数据处理：
```stata
gen date1 = date( date , "YMD")
```

3.数据拆分与合并：横向拆分与纵向拆分，`append`, `merge`
```stata
merge 1:1 varlist using filename
keep if _merge == 3
drop _merge

merge m:1 varlist using filename, nogen

merge 1:m varlist using filename
merge m:m varlist using filename
merge 1:1 _n using filename
```
4.长宽数据转换：`reshape`
```stata
reshape wide var, i(id) j(year)
reshape long var, i(id) j(year)
```

5.条件语句
```stata
local score = 88
if `score' >= 90{
	di "优秀"
}
else if `score' >= 80{
	di "良好"
}
else if `score' >= 70{
	di "一般"
}
else if `score' >= 60{
	di "合格"
}
else{
	di "不合格"
}
```

6.循环语句
- `while`

```stata
set obs 1
gen sum = 0
local i = 1
local n = 100
while `i' <= `n' {
	qui replace sum = sum + `i'
	local i = `i' + 1
}
list
```

- `forvalues`

```stata
set obs 1
gen sum = 0
forvalues i = 1/100 {
	qui replace sum = sum + `i'
}
list
```

- `foreach in/of`

```stata
foreach v of varlist d81-d87{
	gen `v'educ = educ*(`v')
}
```

---

# Chap3 一元线性回归及蒙特卡罗模拟

chap3.1_Stata模拟重复抽样.do [download](http://xishanyu2.github.io/files/chap3.1_Stata模拟重复抽样v2.do)  
chap3.2_simulate修改.do [download](http://xishanyu2.github.io/files/chap3.2_simulate修改.do)  
chap3.3_同方差异方差.do [download](http://xishanyu2.github.io/files/chap3.3_同方差异方差.do)  

> 安慰剂检验：参考`BV13E421w79K`

可视化网站：
[Ordinary Least Squares](https://econometricsbysimulation.shinyapps.io/OLS-App/), [PGFplots.net](https://pgfplots.net/), [Stata Graph Gallery](https://surveydesign.com.au/stata/graphs.html), [Stata Visual Library](https://worldbank.github.io/stata-visual-library/)

---

# 第二章上机练习
```stata
//C8
*(i)
clear
set seed 1234
set obs 500
gen x = runiform()*10
sum x
*(ii)
gen u = rnormal(0, 1)*6
sum u
*(iii)
gen y = 1 + 2 * x + u
reg y x
*(iv)
predict uhat, r
egen suh = sum(uhat)
sum suh
egen sxuh = sum(x*uhat)
sum sxuh
*(v)
egen su = sum(u)
sum su
egen sxu = sum(x*u)
sum sxu
*(vi)
clear
set seed 10101
```

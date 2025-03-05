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

1. `bysort`
```stata
by varlist [, sort rc0]:  stata_cmd
bysort varlist [, rc0]:  stata_cmd
```
2. `egen`
```stata
egen [type] newvar = fcn(arguments) [if] [in] [, options]
```

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

3. 数据类型转换：`destring`, `tostring`, `encode`, `decode`, `real`

- 字符串提取：
```stata
gen newvar1 = substr( str1 ,1,3)
gen newvar2 = substr( str2 ,-2,.)
```

-  日期数据处理：
```stata
gen date1 = date( date , "YMD")
```

4. 数据拆分与合并：横向拆分与纵向拆分，`append`, `merge`
```stata
merge 1:1 varlist using filename [ , options]
merge m:1 varlist using filename [ , options]
merge 1:m varlist using filename [ , options]
merge m:m varlist using filename [ , options]
merge 1:1 _n using filename [ , options]
```
5. 长宽数据转换：`reshape`
```stata
reshape wide var, i(id) j(year)
reshape long var, i(id) j(year)
```

6. 条件语句
```stata
*Typical use: Example 1

    program ...
            syntax varlist [, Report ]
            ...
            if "`report'" != "" {
                    (logic for doing the optional report)
            }
            ...
    end
```

```stata
*Typical use: Example 2

program ...
            syntax varlist [, Adjust(string) ]
            ...
            if "`adjust'" != "" {
                    if "`adjust'" == "means" {
                            ...
                    }
                    else if "`adjust'" == "medians" {
                            ...
                    }
                    else {
                            display as err /*
                            */ "specify adjust(means) or adjust(medians)"
                            exit 198
                    }
            }
            ...
    end
```

```stata

*Typical use: Example 3

program ...
            syntax ... [, ... n(integer 1) ... ]
            ...
            if `n'==1 {
                local word "one"
            }
            else if `n'==2 {
                local word "two"
            }
            else if `n'==3 {
                local word "three"
            }
            else {
                local word "big"
            }
            ...
    end
```

7. 循环语句
- while
```stata
*Syntax
while exp {
	stata_commands
}
```
- foreach
```stata
*Syntax
foreach lname {in|of listtype} list {
	commands referring to `lname'
}
```

```stata
foreach v of varlist d81-d87{
gen `v'educ =educ*(`v')
}
```

- forvalues
```stata
*Syntax
forvalues lname = range {
	Stata commands referring to `lname'
}
```

```stata
forvalues i = 1/1000 {
	replace x = rnormal(5, 2)
	replace u = rnormal(0, 1)
	replace y = 2 + 0.5*x + u
	qui regress y x
	replace beta0 = _b[_cons] in `i'
	replace beta1 = _b[x] in `i'
}
```
---

# Chap3 一元线性回归及蒙特卡罗模拟

chap3.1_Stata模拟重复抽样v2.do [download](http://xishanyu2.github.io/files/chap3.1_Stata模拟重复抽样v2.do)  
chap3.2_simulate修改.do [download]()  
chap3.3_同方差异方差.do [download]()  

> 参考`BV13E421w79K`

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

clear
set seed 10101
set obs 500
gen educ = round(rnormal(12,3))
gen exper = 20 - educ + rnormal(0,2)
histogram exper
gen ability = 1.5*log(educ) + rnormal(0,1)
gen hours = runiform(0,1)*10
gen is8h = (hours <= 8)
gen is8h1 = 1 if hours <= 8
replace is8h1 = 0 if hours > 8
gen wage = 15 + 0.8*educ + 1.2*exper + 2*ability + rnormal(0,3)
adopath + D:\stata\adofiles
reg wage educ
eststo m1
reg wage educ exper
eststo m2
esttab m1 m2
reg wage educ exper
predict uhat, r
kdensity uhat, normal
qnorm uhat
//swilk uhat
sktest uhat
jb uhat
jb6 uhat
twoway scatter uhat ability || lfit uhat ability
reg uhat ability
corr uhat ability
reg wage educ exper
set obs `=_N+1'
replace educ = 16 in `=_N'
replace exper = 2 in `=_N' 
predict yhat if _n == _N, xb
list yhat if _n == _N
dis _b[educ]*16 + _b[exper]*2 + _b[_cons]
import delimited "student-mat.csv", delimiter(";") clear
sum
corr g1 g2 g3
drop g1 g2
hist g3
foreach var of varlist school sex address famsize pstatus mjob fjob reason guardian schoolsup famsup paid activities nursery higher internet romantic{
    encode `var', gen(`var'_d)
}
drop school sex address famsize pstatus mjob fjob reason guardian schoolsup famsup paid activities nursery higher internet romantic
order g3
adopath + D:\stata\adofiles
foreach var of varlist age-romantic_d{
    center `var', s
}
drop age-romantic_d
lasso2 g3 c*, plot(norm) alpha(0)
cvlasso g3 c*, lopt alpha(0) seed(123)
lasso2 g3 c*, plot(norm)
cvlasso g3 c*, lopt seed(123)
cvlasso g3 c*, alpha(0.001 0.01 0.1 0.5 1) seed(123)
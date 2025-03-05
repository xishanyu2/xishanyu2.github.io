set seed 1234

capture program drop my_regression
program define my_regression
	* 第一次模拟：同方差场景
	clear
	set obs 1000
	gen x = rnormal(5, 2)
	gen u_homo = rnormal(0, 2)
	gen y_homo = 2 + 0.5 * x + u_homo
    regress y_homo x
end

simulate b_homo = _b[x], reps(1000) saving(homo_results, replace): my_regression

capture program drop my_regression
program my_regression
	* 第二次模拟：异方差场景（方差随x增大）
	clear
	set obs 1000
	gen x = rnormal(5, 2)
	gen u_hetero = rnormal(0, 0.5 * x^2)
	gen y_hetero = 2 + 0.5 * x + u_hetero
    regress y_hetero x
end

simulate b_hetero = _b[x], reps(1000) saving(hetero_results, replace): my_regression

* 合并结果
use homo_results.dta, clear
merge 1:1 _n using hetero_results.dta

* 对比分布特征
sum b_homo b_hetero, detail
twoway (kdensity b_homo) (kdensity b_hetero), ///
       legend(label(1 "同方差") label(2 "异方差")) ///
       title("回归系数的分布对比") ///
       xtitle("回归系数") ytitle("密度")

* 一个应用
sysuse auto, clear
keep if foreign
sort weight

generate weight2 = weight^2
regress mpg weight weight2
predict fit
predict se , stdp

scatter mpg weight, legend(off) ytitle(Miles per gallon) xtitle(Weight) title("Scatter with Regression Line" "and" "Confidence Interval Densities") || function weight[3] - 1000 * normalden(x, `=fit[3]' , `=se[3]'), range(`=fit[3] -5' `=fit[3] +5') horiz pstyle(p2) || function fit[3], range(`=weight[3]' `=weight[3]-1000*normalden(0, se[3])') pstyle(p2) || function weight[17] - 1000 * normalden(x, `=fit[17]', `=se[17]'), range(`=fit[17]-5' `=fit[17]+5') horiz pstyle(p2) || function `=fit[17]', range(`=weight[17]' `=weight[17]-1000*normalden(0, se[17])') pstyle(p2) || function weight[21] - 1000 * normalden(x, `=fit[21]' , `=se[21]'), range(`=fit[21] -7' `=fit[21] +7') horiz pstyle(p2) || function `=fit[21]', range(`=weight[21]' `=weight[21]-1000*normalden(0, se[21])') pstyle(p2) || line fit weight, clwidth(*2) pstyle(p3)
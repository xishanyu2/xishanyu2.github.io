*             ========================
*                         1   
*             ========================

clear
* 设置随机种子以确保结果可重复
set seed 1234

* 设置样本数为20
set obs 20

* 生成解释变量x和误差项u
gen x = rnormal(5, 2)
gen u = rnormal(0, 1)

* 生成因变量y，满足线性回归模型 y = 2 + 0.5x + u
gen y = 2 + 0.5*x + u

* 画总体回归函数和样本回归函数
twoway function PRF = 2 + 0.5*x, range(-5 15) || scatter y x || lfit y x

*             ========================
*                         2   
*             ========================

clear
* 更改样本数为1000
set obs 1000
gen x = rnormal(5, 2)
gen u = rnormal(0, 1)
gen y = 2 + 0.5*x + u
twoway function PRF = 2 + 0.5*x, range(-5 15) || scatter y x || lfit y x

*             ========================
*                         3   
*             ========================

* 创建两个空的列来存储回归系数的结果
gen beta0 = .
gen beta1 = .

* 模拟1000次重复抽样并计算回归系数的估计值
forvalues i = 1/1000 {
    * 生成新的x和u
    replace x = rnormal(5, 2)
	replace u = rnormal(0, 1)
    
    * 生成新的y
    replace y = 2 + 0.5*x + u
    
    * 执行回归并存储系数
    qui regress y x
    replace beta0 = _b[_cons] in `i'
    replace beta1 = _b[x] in `i'
}

* 保存结果
save sim_results, replace

*             ========================
*                         4   
*             ========================

* 加载模拟结果
use sim_results.dta, clear

* 计算并显示回归系数估计值的均值（无偏性）
sum beta0
di "真实截距: 2 模拟平均截距: " r(mean)
sum beta1
di "真实斜率: 0.5 模拟平均斜率: " r(mean)

* 绘制回归系数估计值的分布图并于正态分布比较
kdensity beta0, title("截距估计值核密度图") normal
kdensity beta1, title("斜率估计值核密度图") normal

* 计算并显示回归系数估计值的方差
sum beta0, detail
di "截距估计值的方差: " r(Var)
sum beta1, detail
di "斜率估计值的方差: " r(Var)

*             ========================
*                         5   
*             ========================

clear
set obs 1000
gen x = rnormal(5, 2)
gen u = rnormal(0, 1)
gen y = 2 + 0.5*x + u
regress y x


* 绘制残差与拟合值的关系图
predict fitted, xb
predict residuals, residuals
//scatter residuals fitted
rvfplot, yline(0)

* Q-Q图检验残差的正态性（标准化残差）
//统计学里Q-Q图（分位数-分位数图）是用图形的方式比较两个概率分布，把他们的两个分位数放在一起比较。首先选好分位数间隔。如果两个分布相似，则该Q-Q图趋近于落在y=x线上。
predict rstandard, rstandard
qnorm rstandard, title("残差正态性检验")

* 计算DFBETA统计量
//DFBETAS是一种统计量,用于测量在回归模型中,每个样本对估计系数的估计值的影响程度。
predict dfbeta_x, dfbeta(x)
list dfbeta_x if abs(dfbeta_x) > 2/sqrt(e(N))

*             ========================
*                         6   
*             ========================

//李增福,陈嘉滢.企业ESG表现与短债长用[J].数量经济技术经济研究,2023,40(12):152-171.
use ESG-SDLA-数据.dta
//基准回归
reghdfe SDLA_w ESG_w SIZE_w LEV_w ROA_w GROWTH_w CF_w FA_w BOARD_w TOP1_w SOE_w MH_w,a(S YEAR INDUSTRY) vce(cluster S)
//安慰剂检验
cap erase "simulation.dta"
permute ESG_w beta =_b[ESG_w] se=_se[ESG_w] df=e(df_r),reps(500) rseed(123) saving("simulation.dta"):reghdfe SDLA_w ESG_w SIZE_w LEV_w ROA_w GROWTH_w CF_w FA_w BOARD_w TOP1_w SOE_w MH_w,a(S YEAR INDUSTRY) vce(cluster S)
use "simulation.dta",clear
gen t_value = beta / se
gen p_value = 2*ttail(df,abs(beta/se))
//画图：系数
dpplot beta,xline(-0.152, lp(dash)) xlabel(-0.16(0.02)0.04) xtitle("虚假估计系数") ytitle("密度") scheme(tufte)
//画图：P值
dpplot p_value,xtitle("虚假P值") ytitle("密度") scheme(tufte)
//画图：T值
dpplot t_value,xtitle("虚假T值") ytitle("密度") scheme(tufte)


//陈强,齐霁,颜冠鹏.双重差分法的安慰剂检验：一个实践的指南[J].管理世界,2025,41(02):181-220.
use cao_chen.dta, clear
//下载命令
ssc install didplacebo, replace

//基准回归
xtset county year
reghdfe rebel canal_post, absorb(i.county i.year) cluster(county) 
//存储结果
estimates store did_cao_chen

//虚构时间安慰剂
didplacebo did_cao_chen, treatvar(canal_post) pbotime(1(1)10) 

//虚构空间安慰剂
didplacebo did_cao_chen, treatvar(canal_post) pbounit rep(500) seed(1)

//虚构混合安慰剂
didplacebo did_cao_chen, treatvar(canal_post) pbomix(1) seed(1)
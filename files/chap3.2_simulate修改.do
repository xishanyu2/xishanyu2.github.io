* 设置随机种子以确保结果可重复
set seed 1234

* 定义一个程序，用于生成数据并运行回归
capture program drop my_regression
program define my_regression
    * 生成解释变量x和误差项u
    clear
    set obs 1000
    gen x = rnormal(5, 2)
    gen u = rnormal(0, 1)

    * 生成因变量y，满足线性回归模型 y = 2 + 0.5x + u
    gen y = 2 + 0.5*x + u

    * 执行回归分析
    regress y x
end

* 模拟1000次重复抽样并计算回归系数的估计值
simulate beta0 = _b[_cons] beta1 = _b[x], reps(1000) saving(sim_results, replace): my_regression

use sim_results.dta, clear

* 计算并显示回归系数估计值的均值
sum beta0
di "真实截距: 2 模拟平均截距: " r(mean)
sum beta1
di "真实斜率: 0.5 模拟平均斜率: " r(mean)

* 绘制回归系数估计值的分布图并于正态分布比较
kdensity beta0, title("截距估计值核密度图") normal
kdensity beta1, title("斜率估计值核密度图") normal
bcuse wage1
des wage educ exper tenure
reg lwage educ exper tenure

*-计算区间估计量

scalar lb = _b[educ] - invttail(e(df_r),.025) * _se[educ] //95%的区间估计下临界点
scalar ub = _b[educ] + invttail(e(df_r),.025) * _se[educ] //95%的区间估计上临界点
scalar list lb ub

scalar lb1 = _b[educ] - invttail(e(df_r),.005) * _se[educ] //99%的区间估计下临界点
scalar ub1 = _b[educ] + invttail(e(df_r),.005) * _se[educ] //99%的区间估计上临界点
scalar list lb1 ub1

*-t检验（双侧）

scalar t = _b[educ]/_se[educ]
scalar p = 2 * ttail(522, abs(t))
scalar list t p

*-t检验（单侧）

scalar t1 = _b[exper]/_se[exper]
scalar crit = - invttail(e(df_r), .05) //5%临界值的大小
scalar pval = ttail(e(df_r), t1) //计算单侧p值（t分布的右侧尾部的面积）
scalar list t1 crit pval

*-组间均值差异检验：t检验
*-对比男性和女性的工资(均值)是否存在差异
ttest wage, by(female)


*-F检验

reg lwage educ exper tenure
test exper tenure

*-完整计算过程
*-无约束模型
reg lwage educ exper tenure
scalar sseu = e(rss) //残差平方和，不能写成ssr!
scalar df_unrest = e(df_r) //残差自由度

*-有约束模型
reg lwage educ
scalar sser = e(rss)
scalar df_rest = e(df_r)

scalar q = df_rest - df_unrest

scalar fstat = ((sser-sseu)/q)/(sseu/(df_unrest))

scalar crit1 = invFtail(q, df_unrest, .05)
scalar pvalue = Ftail(q, df_unrest, fstat)
scalar list sseu sser q df_unrest fstat pvalue crit1

*-t检验和F检验的关系
reg lwage educ exper tenure //无约束模型
scalar sseu = e(rss)
scalar df_unrest = e(df_r)

scalar tratio = _b[educ]/_se[educ]
scalar t_sq = tratio^2

reg lwage exper tenure //有约束模型
scalar sser = e(rss)
scalar df_rest = e(df_r)

scalar q = df_rest - df_unrest
scalar fstat = ((sser-sseu)/q)/(sseu/(df_unrest))
scalar crit = invFtail(q, df_unrest, .05)
scalar pvalue = Ftail(q, df_unrest, fstat)
scalar list sseu sser q df_unrest fstat pvalue crit t_sq

*-ftest（需安装）
reg lwage educ exper tenure //无约束模型
est store m1
reg lwage educ //有约束模型
est store m0	
ftest m1 m0

sysuse auto, clear
codebook rep78
tab mpg
duplicates list mpg
duplicates report mpg
duplicates example mpg
sum headroom
gen c1_headroom = headroom - r(mean)
adopath + D:\stata\adofiles
center headroom, prefix(c2_)
sum trunk
bysort foreign: egen z1_trunk = std(trunk)
bysort foreign: center trunk, s prefix(z2_)
sum turn
gen n_turn = (turn - r(min))/(r(max) - r(min))
norm turn, method(mmx)
reg price mpg weight length gear_ratio
hettest
estat hettest
whitetst
test weight length
ttest displacement, by( foreign )
corr weight length
pwcorr weight length
reg price mpg weight length gear_ratio
estat vif
gen wlr = weight/length
reg price mpg wlr gear_ratio
reg price mpg weight gear_ratio
reg price mpg length gear_ratio
reg price mpg weight length gear_ratio
help sum2docx
sum2docx price mpg weight length foreign using output1.docx, replace stats(N mean(%9.2f) sd(%9.2f) min(%9.2f) max(%9.2f)) title(描述性统计结果)
logout, save(output2) word replace: tabstat price mpg weight length foreign, s(N mean sd min max) f(%9.2f) c(s)

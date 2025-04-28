import excel "C:\Users\zzyna\Desktop\data\Q1\FS_Combas.xlsx", sheet("sheet1") firstrow
drop in 1/2
destring _all, replace
label var Stkcd	证券代码
label var ShortName	证券简称
label var Accper	统计截止日期
label var Typrep	报表类型
label var A001211000	投资性房地产净额
label var A001212000	固定资产净额
label var A001000000	资产总计
label var A002000000	负债合计

import excel "C:\Users\zzyna\Desktop\data\Q1\FS_Combas.xlsx", sheet("sheet1") firstrow
destring Stkcd, gen(id)
gen date1 = date( Accper , "YMD")
format date1 %td
gen date2 = subinstr( Accper ,"-","",.)
destring date2, replace
gen lev = A002000000/ A001000000
sum lev
drop if lev > 1
adopath + D:\stata\adofiles
winsor2 lev, replace cuts(1 99)
save "C:\Users\zzyna\Desktop\data\Q1\FS_Combas.dta"

use "C:\Users\zzyna\Desktop\data\Q1\FS_Comins.dta" 
gen newvar1 = substr( ShortName ,1,2)
drop if newvar1 == "*S" | newvar1 == "ST"
drop newvar1
save "C:\Users\zzyna\Desktop\data\Q1\FS_Comins.dta", replace

use "C:\Users\zzyna\Desktop\data\Q1\FS_Comins.dta" 
gen LetterU = ustrregexs(0) if ustrregexm( ShortName ,"[A-Z]+")
drop if LetterU == "ST"

use "C:\Users\zzyna\Desktop\data\Q1\FS_Comscfd.dta" 
append using "C:\Users\zzyna\Desktop\data\Q1\FS_Comscfd_add.dta"
save "C:\Users\zzyna\Desktop\data\Q1\FS_Comscfd.dta", replace

use "C:\Users\zzyna\Desktop\data\Q1\FS_Combas.dta" 
merge 1:1 Stkcd using "C:\Users\zzyna\Desktop\data\Q1\FS_Comins.dta"
drop if _merge==2
drop _merge
merge 1:1 Stkcd using "C:\Users\zzyna\Desktop\data\Q1\FS_Comscfd.dta"
drop if _merge==2
drop _merge
save "C:\Users\zzyna\Desktop\data\Q1\FS_Combas.dta", replace
	use "Trust_OLS.dta", clear
	adopath + D:\stata\adofiles
	global depend_var "trust_relatives trust_neighbors trust_local_council trust_intra_group trust_inter_group"
	global independ_var "exports export_area export_pop ln_export_area ln_export_area ln_export_pop"
	global baseline_controls "c.age##c.age male urban i.education i.occupation i.religion i.living_conditions district_ethnic_frac frac_ethnicity_in_district i.isocode" 
	
	gen ln_exports = log(exports+1)
	gen ln_export_area = log(export_area+1)
	gen ln_export_pop = log(export_pop+1)
	
	xi: reg trust_neighbors exports $baseline_controls, cluster(murdock)
	outreg2 using output2.doc, keep(exports) replace
	xi: reg trust_neighbors export_area $baseline_controls, cluster(murdock)
	outreg2 using output2.doc, keep(export_area)
	xi: reg trust_neighbors export_pop $baseline_controls, cluster(murdock)
	outreg2 using output2.doc, keep(export_pop)
	xi: reg trust_neighbors ln_exports $baseline_controls, cluster(murdock)
	outreg2 using output2.doc, keep(ln_exports)
	xi: reg trust_neighbors ln_export_area $baseline_controls, cluster(murdock)
	outreg2 using output2.doc, keep(ln_export_area)
	xi: reg trust_neighbors ln_export_pop $baseline_controls, cluster(murdock)
	outreg2 using output2.doc, keep(ln_export_pop)
	
	local i = 1
	local j = 1
	foreach v1 in $depend_var{
		local j = 1
		foreach v2 of varlist ln_export_area{
			qui xi: reg `v1' `v2' $baseline_controls, cluster(murdock)
			estadd local Individual_controls "Yes", replace
			estadd local District_controls "Yes", replace
			estadd local Country_fixed_effects "Yes", replace
			eststo _m1_`i'_`j'
			local j = `j' + 1
		}
		local i = `i' + 1
	}
	esttab _m*, b(%8.3f) se(%8.3f) keep(ln_export_area) nogap stat(Individual_controls District_controls Country_fixed_effects N r2, fmt(%3s %3s %3s %12.0f %9.2f))
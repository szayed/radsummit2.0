* Create data
clear
set obs 10
g var1 = 1
g var2 = 2
g var3 = 3

cap program drop practice
program define practice


	syntax varlist(numeric max=2) [if] [, Detail]
	
	summarize `varlist' `if', `detail'
	
	dis as txt "varlist: `varlist'"
	dis as txt "if: `if'"
	dis as txt "detail: `detail'"
	
end

cap program drop radsummit
program define radsummit

	syntax varlist(numeric max=3) [, red]
	
	if "`red'" == "red" local color "as red"
	
	display `color' "Stephanie Zayed `varlist'"
	
end
	
	
cap program drop tabreport

program define tabreport

	syntax varlist(numeric max=2) [, title]
	
	if "`title'" == "title" local titledoc "Table"
	
	putdocx clear
	putdocx begin
	putdocx paragraph, halign(center)
	putdocx text ("`titledoc'"), font (Arial, 16)
	table `varlist', replace 
	putdocx table  tabledoc = data(_all) , title("This is my example table") halign(center)
	
	putdocx save "putdocx.docx", replace 

	
end
	
	
	
	
	
	
	
	
	
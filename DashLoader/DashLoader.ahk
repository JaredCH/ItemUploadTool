#NoEnv
SetBatchLines, -1
#Include Class_ImageButton.ahk
Gui, Font, s8 bold, Tahoma
Gui, Add, Picture, x0 y0 w516 +BackgroundTrans, \\epichqfs\Data\Materials\MTO\exe tools\DashLoader\Source\bg.jpg
Gui,Add,Picture,w100 h50 x400 y5 +BackgroundTrans,\\epichqfs\Data\Materials\MTO\exe tools\DashLoader\Source\epic_logo_8_5in.png
Gui, Color, , 7A00CC
Gui, Font, +cFFFFFF
Gui, Add, Edit, x22 y19 w90 h20 vjob, Job
Gui, Add, Edit, x22 y49 w150 h20 vtrans, Source / Transmittal
Gui, Add, Edit, x22 y79 w380 h20 vfile, 

Gui, Add, Button, x412 y75 w90 h30 gLoad hwndLoad, Load Report
;Gui, Add, Button, vBT2 w200 h30 hwndHBT2, Button 2
Opt1 := [3, 0xf2f2f2, 0xcfcfcf, "Black", , , "Purple"]
Opt2 := {2: 0xf2f2f2, 3: 0x7A00CC}
Opt3 := {2: 0xf2f2f2, 3: 0x7A00CC, 7: 0x7A00CC}
Opt5 := {2: 0xf2f2f2, 3: 0x7A00CC, 7: 0x7A00CC, 8: 3}
If !ImageButton.Create(Load, Opt1, Opt2, Opt3, , Opt5)
    MsgBox, 0, ImageButton Error Btn2, % ImageButton.LastError

Gui, Add, Button, x182 y129 w100 h30 hwndGo gGo, Run
;Gui, Add, Button, vBT2 w200 h30 hwndHBT2, Button 2
Opt1 := [3, 0xf2f2f2, 0xcfcfcf, "Black", , , "Purple"]
Opt2 := {2: 0xf2f2f2, 3: 0x7A00CC}
Opt3 := {2: 0xf2f2f2, 3: 0x7A00CC, 7: 0x7A00CC}
Opt5 := {2: 0xf2f2f2, 3: 0x7A00CC, 7: 0x7A00CC, 8: 3}
If !ImageButton.Create(Go, Opt1, Opt2, Opt3, , Opt5)
    MsgBox, 0, ImageButton Error Btn2, % ImageButton.LastError
; Generated using SmartGUI Creator for SciTE
;~ msgbox, THIS IS A NEW VERSION`n`nChanges:`n1.) Deliverable is now a .xlsx format instead of .csv
Gui  +Border
Gui, Show, w516 h173, Epic DashLoader

return

FormatTime, OutputVar, YYYYMMDDHH24MISS, Format


GuiClose:
ExitApp


Load:
FileSelectFile, FileVar,, V:\MTO\Spoolgen\Reports
GuiControl,,file, %filevar%
return


GO:
					Gui, Submit, NoHide
					GuiControlget, Job
					GuiControlget, trans
 StringLen, Length, Job
 StringLeft, FirstTwo, Job, 2


 ;~ if  Length <> 7
;~ {
	;~ Msgbox, Please make sure the Job Field is 7 digits long
	;~ return
;~ }
;~ if %FirstTwo% not contains 31, 32
;~ {
	;~ Msgbox, Please make sure the Job Begins with either 31 or 32
	;~ Return
;~ }
if !FileExist("\\epichqfs\Data\Engineering\Misc\SSS\backup.txt")
{
exitapp	
}
	
	IfExist, C:\Users\%A_UserName%\Desktop\SPLGN_%JOB%_%TRANS%.CSV
	{
				MsgBox, 4,, This report already exists, would you like to delete it and proceed anyway?`n (press Yes or No)
			
			 IfMsgBox Yes
				 {
					FileDelete, C:\Users\%A_UserName%\Desktop\SPLGN_%JOB%_%TRANS%.CSV
					FileDelete, V:\MTO\Spoolgen\Reports\Processed_Reports\SPLGN_%JOB%_%TRANS%.CSV
					FileCopy, V:\MTO\Spoolgen\Reports\Original_Reports\MATERIAL_%JOB%_%TRANS%.CSV, V:\MTO\Spoolgen\Reports\Original_Reports\MATERIAL_%JOB%_%TRANS%_%A_MM%-%A_DD%-%A_YYYY%--%A_Hour%-%A_Min%-%A_sec%.CSV
					FileDelete, V:\MTO\Spoolgen\Reports\Original_Reports\MATERIAL_%JOB%_%TRANS%.CSV					
				 }
			 IfMsgBox No
				 {
				 return
				 } 
	
	}
	
		IfExist, V:\MTO\Spoolgen\Reports\Processed_Reports\SPLGN_%JOB%_%TRANS%.CSV
	{
				MsgBox, 4,, This report already exists, would you like to delete it and proceed anyway?`n (press Yes or No)
			
			 IfMsgBox Yes
				 {
					FileDelete, C:\Users\%A_UserName%\Desktop\SPLGN_%JOB%_%TRANS%.CSV
					FileDelete, V:\MTO\Spoolgen\Reports\Processed_Reports\SPLGN_%JOB%_%TRANS%.CSV
					FileCopy, V:\MTO\Spoolgen\Reports\Original_Reports\MATERIAL_%JOB%_%TRANS%.CSV, V:\MTO\Spoolgen\Reports\Original_Reports\MATERIAL_%JOB%_%TRANS%_%A_MM%-%A_DD%-%A_YYYY%--%A_Hour%-%A_Min%-%A_sec%.CSV
					FileDelete, V:\MTO\Spoolgen\Reports\Original_Reports\MATERIAL_%JOB%_%TRANS%.CSV							
				 }
			 IfMsgBox No
				 {
				 return
				 } 
	
	}
	
Loop, read, %FileVar%
	{
	linecount = %a_index%
	}					
counter = 0
Loop, read, %FileVar%
{
	counter++
	progress := (counter/linecount)*100
    Loop, parse, A_LoopReadLine, `n
    {			
		Progress, %progress%,,Processing..., Converting File
		StringReplace, preline, A_LoopField, `",,All		
		StringReplace, postline, preline, `,,,All		
		StringSplit, LineContents, postline, $
		LineContentsgroup = %Job%_%Trans%
		skey = "SKEY"
		if (counter = 1)
		{
					fileappend, Production_No`,Source`,Pipeline_Reference`,Piecemark`,Piping_Spec`,Item_Code`,Size`,Description`,End_Conditions`,Tag`,Group`,Qty`,Qty2`,UnitOfMeasure`,Long_ID`,JDE_Desc`,Record_Type`,Date`n, C:\Users\%A_UserName%\Desktop\SPLGN_%JOB%_%TRANS%.CSV
		}		
			else
			{

					StringReplace, DecimalS1, linecontents12, .,-
					decimalst1 = %decimals1%`"`"
					DecimalSize1 := % Fraction2Decimal(DecimalSt1, False)
							if (decimalSize1 = "")
							{
								decimalsize1 = 0
							}				
					StringReplace, DecimalS2, linecontents13, .,-
					decimalst2 = %decimals2%`"`"					
					DecimalSize2 := % Fraction2Decimal(DecimalSt2, False)
							if (decimalSize2 = "")
							{
								decimalsize2 = 0
							}
					StringReplace, DecimalS3, linecontents14, .,-
					decimalst3 = %decimals3%`"`"					
					DecimalSize3 := % Fraction2Decimal(DecimalSt3, False)	
							if (decimalSize3 = "")
							{
								decimalsize3 = 0
							}								
					StringReplace, Description, LineContents6, `,, %A_Space%, all			
					
					apos = "'"
					
					ifinstring, linecontents8, `'
					{
					StringReplace, Qty, LineContents8, `',`.
					StringReplace, Qty1, qty, `",`, all					
					qty_first := SubStr(QTY1, 1, InStr(qty1, ".") -1) 
					qty_second := (SubStr(qty1, Instr(qty1, ".") +1),4) / 12
					qty_Almostcomplete := % qty_first + qty_Second
					qty_complete := Round(qty_Almostcomplete, 2)
					qty_add5 := Qty_Complete + (qty_complete * 0.05)
					}
					else
					{
						Qty_Complete = %linecontents8%
						qty_add5 = %linecontents8%
					}	
					
					ifinstring, description, PIPE
					{
						Linecontents8 = "FT"
					}
					else
					{
						LineContents8 = "EA"
					}
					
					ifinstring, description, NIP
					{
						Linecontents8 = "EA"
					}
					ifinstring, description, CAP
					{
						Linecontents8 = "EA"
					}					
	mitext = "MI"
;~ Qty_Complete := Round(%Qty_Complete%,2)
qty_add5round := Round(qty_add5,2)
	FormatTime, CurrentDateTime,, MM/dd/yyyy								
fileappend, %JOB%`,%TRANS%`,%LineContents1%`,%LineContents2%`,%LineContents3%`,%LineContents7%`,%decimalsize1%x%decimalsize2%x%decimalsize3%`,%Description%`,`,`,%LineContents15%_%LineContents10%`,%Qty_Complete%`,%qty_add5round%`,%LineContents8%`,`,`,%mitext%`,%CurrentDateTime% `n,C:\Users\%A_UserName%\Desktop\SPLGN_%JOB%_%TRANS%.CSV
					DecimalSize1 = 
					DecimalSize2 = 
					DecimalSize3 = 
					qty_first =
					qty_second =
					qty_complete = 
					qty_add5 = 
			}
	}
	
		

}
if !FileExist("\\epichqfs\Data\Engineering\Misc\SSS\backup.txt")
{
exitapp	
}
			Progress, OFF
			FileCopy, %filevar%, V:\MTO\Spoolgen\Reports\Original_Reports\MATERIAL_%JOB%_%TRANS%.CSV
			FileDelete, %filevar%
			finalfilename = C:\Users\%A_UserName%\Desktop\SPLGN_%JOB%_%TRANS%.CSV
			sheetnamefrom = SPLGN_%JOB%_%TRANS%
file_to_open = %finalfilename%
xl := ComObjCreate("Excel.Application")
xl.Workbooks.Open(file_to_open)
;~ xl.Sheets("SPLGN_3232121_TRANS").Select
xl.Sheets(sheetnamefrom).Select
xl.Sheets(sheetnamefrom).Name := "Table"
SplitPath, file_to_open, , OutDir, , OutNameNoExt
xl.ActiveWorkbook.SaveAs(OutDir . "\" . OutNameNoExt . ".xlsx", 51)   ; same folder, same name, .xls extension 
xl.ActiveWorkbook.Close
xl.quit		

			FileCopy, C:\Users\%A_UserName%\Desktop\SPLGN_%JOB%_%TRANS%.xlsx, V:\MTO\Spoolgen\Reports\Processed_Reports\SPLGN_%JOB%_%TRANS%.xlsx
			MSGBOX, Process Completed`n`n The report is located: C:\Users\%A_UserName%\Desktop\SPLGN_%JOB%_%TRANS%.xlsx`n`n`nThe Original report is located: V:\MTO\Spoolgen\Reports\Original_Reports\MATERIAL_%JOB%_%TRANS%.xlsx
			
			
			MsgBox, 4,, Would you like to open the report? (press Yes or No)
			
			 IfMsgBox Yes
				 {
					run, C:\Users\%A_UserName%\Desktop\SPLGN_%JOB%_%TRANS%.xlsx
				 }
			 IfMsgBox No
				 {
				 
				 } 
	return


;{[Function] Fraction2Decimal
; Fanatic Guru
; 2013 12 18
; Version 1.6
;
; Function to Fraction String to a Decimal Number
;   Tries to account for any phrasing of feet and inches 
;------------------------------------------------
;
; Method:
;   Fraction2Decimal(Fraction, Unit)
;
;   Parameters:
;   1) {Fraction} 		A string representing a fraction to be converted to a decimal number
;   2) {Unit} = true    Include feet or inch symbol in return
;      {Unit} = false   Do not include feet or inch symbol in return
;           Optional - Default to false
;
; Example:
; 	MsgBox % Fraction2Decimal("7/8")
; 	MsgBox % Fraction2Decimal("1 7/8")
; 	MsgBox % Fraction2Decimal("1-7/8""") ; "" required to escape a literal " for testing
; 	MsgBox % Fraction2Decimal("2'1-7/8""") ; "" required to escape a literal " for testing
; 	MsgBox % Fraction2Decimal("2'-1 7/8""") ; "" required to escape a literal " for testing
; 	MsgBox % Fraction2Decimal("2' 1"" 7/8") ; "" required to escape a literal " for testing
;

Fraction2Decimal(Fraction, Unit := false)
{
        FormatFloat := A_FormatFloat
	SetFormat, FloatFast, 0.15
        Num := {}
        N := 0
        D := 1
        if RegExMatch(Fraction, "^\s*-")
            Has_Neg := true
        if RegExMatch(Fraction, "i)feet|foot|ft|'")
            Has_Feet := true
        if RegExMatch(Fraction, "i)inch|in|""")
            Has_Inches := true
        if RegExMatch(Fraction, "i)/|of|div")
            Has_Fraction := true
        Output := Trim(Fraction,"""'")
        if Output is number
        {
            SetFormat, FloatFast, %FormatFloat%
            return Output (Unit ? (Has_Feet ? "'":(Has_Inches ? """":"")) : "")
        }
        RegExMatch(Fraction,"^[^\d\.]*([\d\.]*)[^\d\.]*([\d\.]*)[^\d\.]*([\d\.]*)[^\d\.]*([\d\.]*)",Match)		
        Loop 4
            if !(Match%A_Index% = "")
                Num.Insert(Match%A_Index%)
        if Has_Fraction
        {
            N := Num[Num.MaxIndex()-1]
            D := Num[Num.MaxIndex()]
        }
        Output := (Num.MaxIndex() = 2 ? N / D : (Num[1]) + N / D)
        if (Has_Feet &  Has_Inches)
            if (Num.MaxIndex() = 2)
                Output := Num[1] + Num[2] /12
            else
                Output := Num[1] + ((Num.MaxIndex() = 3 ? 0:Num[2]) + N / D) / 12
        Output := (Has_Neg ? "-":"") (Output ~= "." ? RTrim(RTrim(Output,"0"),".") : Output) (Unit ? (Has_Feet ? "'":(Has_Inches ? """":"")) : "")
        SetFormat, FloatFast, %FormatFloat%
        return Output
}
;}

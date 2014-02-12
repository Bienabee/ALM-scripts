''' This is the 1st itereation of the DBID.xml File updater '''

Dim findConStr, findDB, findUser, FindPW


''''''' THE CODE BELOW THIS IS FROM THE LOG PARSER '''''''

Dim Counter
Dim dateStart 
Dim dateEnd 
Dim aDate
Dim countStart
Dim countEnd
Dim Count
Dim strCharachters

Dim excWB
Dim logParse

excWB = "C:\<add Directory Here>\test.xlsx"
logParse = "C:\<add Directory Here>\upgrade.txt"

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile(logParse)

Set objExcel = CreateObject("Excel.Application")
objExcel.Visible = False

Set objWorkbook = objExcel.Workbooks.Add()

    objExcel.Columns("A:A").Select
    objExcel.Selection.NumberFormat = "h:mm:ss"

counter = 1
intRow = 1


countStart = "Total number of files scanned till now:"

'strCharacters = objFile.ReadAll


'WScript.Echo (InStr(counter, strCharachters, "i"))

Do Until objFile.AtEndOfStream 
    strLine = objFile.ReadLine
	If (InStr(strLine, countStart)) > 0 Then
    '   Wscript.echo strLine
	'	WScript.Echo (InStr(strLine, countStart))
	'	WScript.Echo (InStrRev(strLine, ":"))
		countEnd = (InStrRev(strLine, " "))
		dateStart = (InStr(strLine, " ")) + 1
		dateEnd =(InStr(strLine, ":"))
		'WScript.Echo countEnd
		aDate = (mid(strLine,dateStart,9))
		aCount = (mid(strLine,countEnd,100))
		
'		WScript.Echo aDate
		objExcel.Cells(intRow, 1).Value = aDate
'		WScript.Echo aCount
		objExcel.Cells(intRow, 2).Value = aCount
		intRow = intRow + 1
	End If
	
Loop


objWorkbook.SaveAs(excWB)

objExcel.Quit
objFile.Close

wscript.echo "File Closed"

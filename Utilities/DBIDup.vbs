''' This is the 1st iteration of the DBID.xml File updater '''

Dim findConStr, findDB, findUser, FindPW

Dim dbiParse 
dbiParse = InputBox("Paste the file path to the DBID.xml File Here" , "Include direct file path")
Dim saveDir 
saveDir = dbiParse

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile(dbiParse)


Do Until objFile.AtEndOfStream 
    strLine = objFile.ReadLine
	If (InStr(strLine, countStart)) > 0 Then
        Wscript.echo strLine
	'	WScript.Echo (InStr(strLine, countStart))
	'	WScript.Echo (InStrRev(strLine, ":"))
	'	countEnd = (InStrRev(strLine, " "))
	'	dateStart = (InStr(strLine, " ")) + 1
	'	dateEnd =(InStr(strLine, ":"))
		'WScript.Echo countEnd
	'	aDate = (mid(strLine,dateStart,9))
	'	aCount = (mid(strLine,countEnd,100))
		
	End If
	
Loop

objFile.Close

wscript.echo "File Closed"

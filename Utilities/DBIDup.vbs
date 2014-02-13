''' This is the 1st iteration of the DBID.xml File updater '''

Dim findConStr, findDB, findDir, FindPW, countStart


Dim dbiParse 
dbiParse = "C:\Users\Admin\Desktop\DBIDup\dbid.xml" '''InputBox("Paste the file path to the DBID.xml File Here" , "Include direct file path")
Dim saveDir 
saveDir = "C:\Users\Admin\Desktop\DBIDup\dbid-backup.xml" 'dbiParse

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile(dbiParse)
Set objBackup = objFSO.CreateTextFile(saveDir, True)

objBackup.Write(objFile.ReadAll)

objBackup.Close


findConStr = "<DB_CONNSTR_FORMAT>"  '' 19 chars long
findDB = "<DBSERVER_NAME>"
findDir = "<PHYSICAL_DIRECTORY>"
findPW = "<DB_USER_PASS>"

Do Until objFile.AtEndOfStream 
    strLine = objFile.ReadLine
	If (InStr(strLine, findConStr)) > 0 Then
        Wscript.echo strLine
		wscript.echo (InStr(strLine, findConStr))
		startConStr = (InStr(strLine, findConStr)) + 19
		endConStr = (InStr(strLine, "</")) - 21
		Wscript.echo endConStr
	'	WScript.Echo (InStr(strLine, countStart))
	'	WScript.Echo (InStrRev(strLine, ":"))
	'	countEnd = (InStrRev(strLine, " "))
	'	dateStart = (InStr(strLine, " ")) + 1
	'	dateEnd =(InStr(strLine, ":"))
		'WScript.Echo countEnd
		aConStr = (mid(strLine,startConStr,endConStr))
		WScript.echo aConStr
	'	aCount = (mid(strLine,countEnd,100))
	
		bConStr = "NEWCONSTR"
		
		strLine = (Replace(strLine, aConStr, bConStr))
		
		WScript.echo strLine
		
	End If
	
Loop

objFile.Close

wscript.echo "File Closed"

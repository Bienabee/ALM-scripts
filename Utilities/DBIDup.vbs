''' This is the 1st iteration of the DBID.xml File updater '''

'' LT 2/14/2014

Dim findConStr, findDB, findDir, FindPW, countStart
Const ForReading = 1, ForWriting = 2, ForAppending = 8 

Dim dbiParse 
dbiParse = "C:\Users\Admin\Desktop\DBIDup\dbid.xml" '''InputBox("Paste the file path to the DBID.xml File Here" , "Include direct file path")
Dim saveDir 
saveDir = "C:\Users\Admin\Desktop\DBIDup\dbid-backup.xml" 'dbiParse

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile(dbiParse)

Set objFS = CreateObject("Scripting.FileSystemObject")
Set objBackup = objFS.CreateTextFile(saveDir, True)

objBackup.Write(objFile.ReadAll)

objBackup.Close
objFile.Close

WScript.echo "Backup Saved... Begin dbid.xml update"

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile(dbiParse, ForWriting)
Set objFileRead = objFS.OpenTextFile(saveDir, ForReading)

findConStr = "<DB_CONNSTR_FORMAT>"  '' 19 chars long
findDB = "<DBSERVER_NAME>"
findDir = "<PHYSICAL_DIRECTORY>"
findPW = "<DB_USER_PASS>"

Do Until objFileRead.AtEndOfStream 
    'strLine = objFileRead.ReadLine
	strLine = objFileRead.ReadAll
	strLineLen = (Len(strLine))
	WScript.echo strLineLen
	
	If (InStr(strLine, findConStr)) > 0 Then
        Wscript.echo strLine
		wscript.echo (InStr(strLine, findConStr))
		startConStr = (InStr(strLine, findConStr)) + 19
		'endConStr = (InStr(strLine, "</")) - 21
		endConStr = (InStrRev(strLine, "</DB_CONNSTR_FORMAT>")) '- 21 'if using instr instead of instrev add 21
		Wscript.echo endConStr

		'' This is used to determine the length of the connection string to store as a variable and replace
		aEnd = endConStr - startConStr
		WScript.echo aEnd
		
		'aConStr = (mid(strLine,startConStr,endConStr))
		aConStr = (mid(strLine,startConStr,aEnd))
		WScript.echo aConStr
	
		bConStr = "NEWCONSTR"
		WScript.echo bConStr
		
		strLine = (Replace(strLine, aConStr, bConStr))
		
		WScript.echo strLine
		'objFile.WriteLine strLine
		objFile.Write strLine
		
	End If
	
Loop


'Set objFile = objFSO.OpenTextFile(dbiParse, ForWriting)

	'objFile.WriteLine strLine

objFile.Close
objFileRead.Close

wscript.echo "File Closed"

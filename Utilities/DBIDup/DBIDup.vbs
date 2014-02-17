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
findDB = "<DBSERVER_NAME>"   '' 15 chars long
findDir = "<PHYSICAL_DIRECTORY>"  '' 20 chars long
findPW = "<DB_USER_PASS>"  '' 14 chars long

Do Until objFileRead.AtEndOfStream 
    'strLine = objFileRead.ReadLine
	strLine = objFileRead.ReadAll
	strLineLen = (Len(strLine))
'	WScript.echo strLineLen
	
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
		
		'' Looks like I only need to write the file once
		
		'objFile.Write strLine
		
	'End If
	
	''' Find and Replace DB '''
'	ElseIf (InStr(strLine, findDB)) > 0 Then
	
		startDB = (InStr(strLine, findDB)) + 15
		WScript.echo startDB
		endDB = (InStrRev(strLine, "</DBSERVER_NAME>"))
		WScript.echo endDB
		
		bEnd = endDB - startDB
		WScript.echo bEnd
		
		aDB = (mid(strLine,startDB,bEnd))
		bDB = "NEWDB"
		
		strLine = (Replace(strLine, aDB, bDB))
		
	'	objFile.Write strLine
		
	''' Find and Replace PhysicalDirectory '''
'	ElseIf (InStr(strLine, findDB)) > 0 Then
	
		startDir = (InStr(strLine, findDir)) + 20
		WScript.echo startDir
		endDir = (InStrRev(strLine, "</PHYSICAL_DIRECTORY>"))
		WScript.echo endDir
		
		cEnd = endDir - startDir
		WScript.echo cEnd
		
		aDir = (mid(strLine,startDir,cEnd))
		bDir = "c:\New\Directory\Folder"
		
		strLine = (Replace(strLine, aDir, bDir))
		
		'objFile.Write strLine
	
	''' Find and Replace Password '''
'	ElseIf (InStr(strLine, findDB)) > 0 Then
	
		startPW = (InStr(strLine, findPW)) + 14
		WScript.echo startPW
		endPW = (InStrRev(strLine, "</DB_USER_PASS>"))
		WScript.echo endPW
		
		dEnd = endPW - startPW
		WScript.echo dEnd
		
		aPW = (mid(strLine,startPW,dEnd))
		bPW = "Pa$$words1"
		
		strLine = (Replace(strLine, aPW, bPW))
		
		objFile.Write strLine
	
	End If
	
	
Loop



objFile.Close
objFileRead.Close

wscript.echo "File Closed"

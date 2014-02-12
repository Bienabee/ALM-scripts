Public Function UploadDefectAttachment() As Boolean

‘ This routine adds file “D:\temp\A\SampleAttachment.txt”
‘ as an attachment to a defect. The file must exist
‘ at that path before running the routine.
    Const FUNCNAME = “UploadDefectAttachment”

    Dim BugFact As BugFactory
    Dim bugObj As Bug
    Dim attachFact As AttachmentFactory
    Dim attachObj As Attachment
    Dim ExStrg As IExtendedStorage
    Dim rc

‘ Get the bug factory from the TDConnection.
    ‘tdc is the global TDConnection object.
    Set BugFact = tdc.BugFactory
‘ Get a bug object.
‘To see how to get this specific bug without knowing the ID,
‘ See the example
‘”Downloading a defect attachment with Extended Storage”
‘ for ExtendedStorage.Load.
    Set bugObj = BugFact.Item(2)
‘—————————————–
‘Use Bug.Attachments to
‘ get the bug attachment factory.
    Set attachFact = bugObj.Attachments
‘Add a new extended storage object,an attachment
‘ named SampleAttachment.txt.
    Set attachObj = attachFact.AddItem(“SampleAttachment.txt”)
‘ Modify the attachment description.
    attachObj.Description = “Bug Sample Attachment”
‘ Update the attachment record in the project database.
    attachObj.Post
‘ Get the bug attachment extended storage object.
    Set ExStrg = attachObj.AttachmentStorage
‘Specify the location of the file to upload.
    ExStrg.ClientPath = “D:\temp\A”
‘—————————————–
‘Use IExtendedStorage.Save to
‘ upload the file.
    ExStrg.Save “SampleAttachment.txt”, True
    ExStrg.GetLastError
    Debug.Print err.Description

    UploadDefectAttachment = SUCCESS
Exit Function
FUNC_ERR:
    UploadDefectAttachment = FAILURE
    ErrHandler err, FUNCNAME, “”, FATAL_ERROR
End Function

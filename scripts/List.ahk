FileSelectFolder, Folder
FileList =  ; ��ʼ��Ϊ�ա�
Loop, %Folder%\*.jpg, , 1  ; �����ļ�����������
FileList = %FileList%%A_LoopFileName%`n
Sort, FileList, StringSort
StringSort(a1, a2)
{
    if(StrLen(a1)>strlen(a2))

	return a1 > a2 ? 1 : a1 < a2 ? -1 : 0
}

Loop, parse, FileList, `n
{
    if A_LoopField =  ; �������б�ײ��Ŀհס�
        continue
    FileAppend, <img src="%A_LoopField%" />`n, d:\Test.txt
}
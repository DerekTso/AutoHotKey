Loop
{
	FileReadLine, TargetURL, urls.txt, %A_Index%
	; ��ȡ�ļ� urls.txt ��ÿһ�У��ŵ����� TargetURL ���棬��� urls.txt �У�һ����ַ����һ�С�
	if ErrorLevel
		break
	; ����Ҳ����ļ��Ļ�������ѭ����
	IfNotExist %A_Index%1.txt
	{
		UrlDownloadToFile, %TargetURL%, %A_Index%1.html
		; ����ַ����Ϊ�ļ�
		FileRead, TempVar, %A_Index%1.html
		; ��ȡ���ص����ļ�
		FileDelete, %A_Index%1.html
		; ɾ�����ص����ļ�
		Transform, Clipboard, Unicode, %TempVar%
		; ���ü������ utf-8 ת��Ϊ Unicode
		FileAppend, %Clipboard%, %A_Index%1.txt
		; �Ѽ����������д��һ�� txt���ͱ�� gb2312 �����ˣ�
	}
	else IfNotExist %A_Index%2.txt
	{
		UrlDownloadToFile, %TargetURL%, %A_Index%2.html
		FileRead, TempVar, %A_Index%2.html
		FileDelete, %A_Index%2.html
		Transform, Clipboard, Unicode, %TempVar%
		FileAppend, %Clipboard%, %A_Index%2.txt
		RunWait %ComSpec% /c "fc %A_Index%1.txt %A_Index%2.txt > %A_Index%3.txt"
		; ������������ʾ����%ComSpec%���� fc ����Ƚ��ļ��Ĳ�ͬ���ѱȽϽ��д��һ�� txt
		run %A_Index%3.txt
		; �򿪽��
	}
	else
	{
		FileDelete, %A_Index%1.txt 
		FileMove, %A_Index%2.txt,%A_Index%1.txt
		UrlDownloadToFile, %TargetURL%, %A_Index%2.html
		FileRead, TempVar, %A_Index%2.html
		FileDelete, %A_Index%2.html
		Transform, Clipboard, Unicode, %TempVar%
		FileAppend, %Clipboard%, %A_Index%2.txt
		RunWait %ComSpec% /c "fc %A_Index%1.txt %A_Index%2.txt > %A_Index%3.txt"
		run %A_Index%3.txt
	}
}

; Author��sfufoet - С����� - http://www.appinn.com
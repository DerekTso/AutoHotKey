#Persistent
; ��֤����һֱ����
Menu,Tray,NoStandard
Menu,Tray,DeleteAll
; ɾ�� AutoHotKey Ĭ�ϵ�����ͼ���Ҽ��˵�
Menu,Tray,Add,���, loopcheck
Menu,Tray,Add,�˳�, Exit
SetTimer, loopcheck,60000
; ÿһ��������һ�� loopcheck����������������Ҫ�޸ģ���λ�Ǻ��룬��������ֹ����Ļ����һ�����ͼ�꣬ѡ�񡰼�顱

loopcheck:
Loop
{
	FileReadLine, TargetURL, urls.txt, %A_Index%
	; ��ȡ�ļ� urls.txt ��ÿһ�У��ŵ����� TargetURL ���棬��� urls.txt �У�һ����ַ����һ�С�
	if ErrorLevel
		break
	; ����Ҳ����ļ��Ļ�������ѭ����
	UrlDownloadToFile, %TargetURL%, %A_Index%.txt
	; ���ض�ȡ������ַ��һ����ѭ������A_Index�������� txt �С�
	FileRead, alltext, %A_Index%.txt
	; �Ѷ�ȡ���ص����ļ��� alltext
	SplitText=<div id="content">
	; ���÷ָ��ַ������� Wordpres ������ĵı�ǡ�
	StringGetPos, textPos, alltext, %SplitText%
	; ��� SplitText �� alltext �е�λ��
	StringTrimLeft, alltext, alltext, %textPos%
	; ȥ�� <div id="content"> ֮ǰ�������ַ���
	RegExMatch(alltext, "http://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?",URL)
	; ��ʣ�µ���������������ʽ��������������������ƥ����ַ��
	IfNotExist %A_Index%1.txt
	{
		FileAppend, %URL%, %A_Index%1.txt
	}
	; ����ļ������ڣ���ƥ�䵽����ַд��һ�� txt
	else
	{
	; ����ļ����ڣ��ȶ�ȡ��Ȼ��ɾ�����ٱȽ϶�ȡ�����ݺ�ƥ�䵽�������ǲ���һ���ġ�
		FileRead, temp, %A_Index%1.txt
		FileDelete, %A_Index%1.txt 
		FileAppend, %URL%, %A_Index%1.txt
		if (URL<>temp)
		{
			traytip,, %TargetURL% �ոո��£�
			run %URL%
			; ��һ���Ļ�������������ʾ��������ƥ�䵽����ַ��Ҳ����ֱ�Ӵ������¡�
		}
	}
}
return

Exit:
ExitApp

; Author��sfufoet - С����� - http://www.appinn.com
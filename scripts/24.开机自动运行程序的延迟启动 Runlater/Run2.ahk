IfNotExist, RunSetting.ini
{
 ini=%ini%[Settings]
 ini=%ini%`nFolder=.`n `; ���ÿ�ݷ�ʽ����λ�ã�һ����.����ʾ��ݷ�ʽ�� ahk �ļ���һ��
 ini=%ini%`nIsWait=0`n`; �������Ϊ 0 �Ļ���ʹ�� run ��������������ͣһ�£�����Ļ����� runwait ������������
 ini=%ini%`nSleepTime=1`n`; �� IsWait=0 ʱ�������ã�����һ���������ͣ��ã���λ���롣
 FileAppend, %ini%, RunSetting.ini
 ini=
}

IniRead, Folder, RunSetting.ini, Settings, Folder
IniRead, IsWait, RunSetting.ini, Settings, IsWait
IniRead, SleepTime, RunSetting.ini, Settings, SleepTime

SleepTime:=SleepTime*1000

Loop, %Folder%\*.lnk
{
	If IsWait=0
	{
		run %Folder%\%A_LoopFileName%
		tooltip %Folder%\%A_LoopFileName%
		sleep %SleepTime%
	}
	else
	{
		runwait %Folder%\%A_LoopFileName%
		tooltip %Folder%\%A_LoopFileName%
	}
}

ExitApp
SetTitleMatchMode, 2 ;�趨ahkƥ�䴰�ڱ����ģʽ
run c:\Program Files\vim\vim71\gvim.exe ;����gvim
winactivate, No Name ; ����˴���
sleep, 500 ; ��ʱ��ȷ��

send :e d:\Notebook\txt\temp.txt{enter} ;�򿪱ʼ��ļ�

sleep, 500
winmove, temp.txt,,-1,-6,1408,1062 ;���ô��ڣ���С��λ��,��Щ��ֵ��Ҫ����ʹ���ߵ���Ļ�ֱ��ʵ���,������1400 X 1050 �ֱ�����Ļ��һ���ο�ֵ

WinSet, Style, -0xC00000, temp.txt  ;WS_CAPTION, ȥ��title bar
WinSet, Style, 0x10000000, temp.txt ;WS_VISIBLE, ȫ��ģʽ


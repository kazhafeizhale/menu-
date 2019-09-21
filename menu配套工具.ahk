

Clipboard:=StrReplace(Clipboard, "Menu","autogui_menue", Count)
Clipboard:=StrReplace(Clipboard, "Function","autogui_menue_Function", Count)

;MyString:="pycharm,pycharm,Add,光标,Function"
FileDelete, C:\Users\hetong\Desktop\我的AHK程序\ahk工具\menu工具\menu.txt
FileAppend,% Clipboard, C:\Users\hetong\Desktop\我的AHK程序\ahk工具\menu工具\menu.txt
Clipboard:=""
Loop, read, C:\Users\hetong\Desktop\我的AHK程序\ahk工具\menu工具\menu.txt
{
    LineNumber = %A_Index%
    Clipboard :=Clipboard . "`n" . StrReplace(A_LoopReadLine, "autogui_menue","Menu", Count,1)

}
FileDelete, C:\Users\hetong\Desktop\我的AHK程序\ahk工具\menu工具\menu.txt
FileAppend,% Clipboard, C:\Users\hetong\Desktop\我的AHK程序\ahk工具\menu工具\menu.txt




#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Menu,Menu,Add,1.1 linux,Function
Menu,1.1 linux,Add,1.1.1 shellcommand,Function
Menu,1.1.1 shellcommand,Add,1111_修改密码,Function
Menu,1.1.1 shellcommand,Add,1112_杀死进程,Function
Menu,1.1.1 shellcommand,Add,1113_host命令,Function
Menu,1.1 linux,Add,112_socket,Function
Menu,Menu,Add,1.2 C语言编程,Function
Menu,1.2 C语言编程,Add,121_打印,Function
Menu,1.2 C语言编程,Add,122_switch语句,Function
Menu,Menu,Add,1.3mathematica,Function
Menu,1.3mathematica,Add,131_转化为c代码,Function
Menu,Menu,Add,1.4_ahk,Function
Menu,1.4_ahk,Add,141_窗口命令,Function
Menu,141_窗口命令,Add,1411_窗口置顶,Function
Menu,Menu,Add,1.5 C++编程,Function
Menu,1.5 C++编程,Add,151_函数,Function
Menu,151_函数,Add,1511_引用,Function
Menu,1511_引用,Add,引用的使用_15111,Function
Menu,1.5 C++编程,Add,类,Function
Menu,1.5 C++编程,Add,数据类型,Function
Menu,1.5 C++编程,Add,表达式,Function
Menu,1.5 C++编程,Add,STL,Function
Menu,Menu,Add,1.1 linux,:1.1 linux
Menu,1.1 linux,Add,1.1.1 shellcommand,:1.1.1 shellcommand
Menu,Menu,Add,1.2 C语言编程,:1.2 C语言编程
Menu,Menu,Add,1.3mathematica,:1.3mathematica
Menu,Menu,Add,1.4_ahk,:1.4_ahk
Menu,1.4_ahk,Add,141_窗口命令,:141_窗口命令
Menu,Menu,Add,1.5 C++编程,:1.5 C++编程
Menu,1.5 C++编程,Add,151_函数,:151_函数
Menu,151_函数,Add,1511_引用,:1511_引用
return


!z::
Menu,Menu,Show
return
Function(Item,Index,Menu)
{
    fn := Func(Item)
    fn.Call()
}
引用的使用_15111()
{        
    CommandText = 
    (
const使用方法：
    一、修改传入函数的值时
        1、默认数据类型用指针。int ,float, double ,char
        2、结构体用指针或者引用
        3、数组只能用指针
        4、类对象只能用引用
    二、不修改传入函数的值时
        1、默认数据类型用传值
        2、结构体用const 指针或者const引用
        3、数组只能用const 指针
        4、类对象用const引用
    )    
    Instruction := CommandText
    Content := ""
    TaskDialog(Instruction, Content, "", 0x1, 0)
}
1111_修改密码()
{
        UserInput:=""    
        Var =
        (
-a 全部
        )        
        InputBox, UserInput, Phone Number,% Var,
        inputvar = 
        (
passwd            
        )        
        inputvar:=inputvar . UserInput
        ascinput(inputvar)    
    
}
1112_杀死进程()
{    
         Var =
        (
        )
        inputvar = 
        (
kill            
        )   
        inputvar:= inputvar . UserInput
        ascinput(inputvar)
}
1113_host命令()
{
         Var =
        (
-a：显示详细的DNS信息；
-c<类型>：指定查询类型，默认值为“IN“；
-C：查询指定主机的完整的SOA记录；
-r：在查询域名时，不使用递归的查询方式；
-t<类型>：指定查询的域名信息类型；
-v：显示指令执行的详细信息；
-w：如果域名服务器没有给出应答信息，则总是等待，直到域名服务器给出应答；
-W<时间>：指定域名查询的最长时间，如果在指定时间内域名服务器没有给出应答信息，则退出指令；
-4：使用IPv4；
-6：使用IPv6.
        )
        InputBox, UserInput, Phone Number,% Var,
        
        inputvar = 
        (
host            
        )
        inputvar:= inputvar . " " . UserInput
        ascinput(inputvar)    
    
}
121_打印()
{
         Var =
        (
        )
        inputvar = 
        (
        printf("",);
        )
        inputvar:= inputvar . " " . Var
        ascinput(inputvar)    
    
}

122_switch语句()
{
         Var =
        (
        )
        inputvar = 
        (
switch()
{
    case :
    break;
    defualt:
    break;
};
        )
        clipboard:=inputvar
        ToolTip("Clipboard")    
    
    
}
131_转化为c代码()
{
    Var =
    (
    )
    inputvar = 
    (
CForm[expr]
    )
    clipboard:=inputvar . var
    ToolTip("Clipboard")   
    
    
}
1411_窗口置顶()
{
    Var =
    (
    )
    inputvar = 
    (
MouseGetPos, MouseX, MouseY, MouseWin
; 似乎有必要首先关闭任何现有的透明度:
WinSet, AlwaysOnTop, On, ahk_id %MouseWin%
    )
    clipboard:=inputvar . var
    ToolTip("Clipboard")

}

;说明 在QQ聊天窗口中是乱码，需要发送UTF-16BE编码
ascinput(string){
u :=  A_IsUnicode ? 2 : 1 ;Unicode版ahk字符长度是2
length:=StrPut(string,"CP0")
if(A_IsUnicode)
    {
    VarSetCapacity(address,length),StrPut(string,&address,"CP0")
    }
else
    address:=string
VarSetCapacity(out,2*length*u)
index =0
Loop
{
index += 1
if (index>length-1)
    Break
asc := NumGet(address,index-1,"UChar")
if asc > 126
    {
    index += 1
    asc2 := NumGet(address,index-1,"UChar")
    asc := asc*256+asc2
    }
sendinput, % "{ASC " asc "}"
}
}
 
 
ascaltinput(string){
u :=  A_IsUnicode ? 2 : 1 ;Unicode版ahk字符长度是2
length:=StrPut(string,"CP0")
if(A_IsUnicode)
    {
    VarSetCapacity(address,length),StrPut(string,&address,"CP0")
    }
else
    address:=string
VarSetCapacity(out,2*length*u)
index =0
Loop
{
index += 1
if (index>length-1)
    Break
asc := NumGet(address,index-1,"UChar")
if asc > 126
    {
    index += 1
    asc2 := NumGet(address,index-1,"UChar")
    asc := asc*256+asc2
    }
StringSplit, var, asc,
Loop % var0
{
str .= "{Numpad" var%A_index% "}"
}
sendinput, {AltDown}%str%{Altup}
str =
}
}



ToolTip(label){
  ToolTip, %label%, 930, 650

  SetTimer, RemoveToolTip, 1000
  return
  RemoveToolTip:
  SetTimer, RemoveToolTip, Off
  ToolTip
  Return
}




TaskDialog(Instruction, Content := "", Title := "", Buttons := 1, IconID := 0, IconRes := "", Owner := 0x10010) {
    Local hModule, LoadLib, Ret

    If (IconRes != "") {
        hModule := DllCall("GetModuleHandle", "Str", IconRes, "Ptr")
        LoadLib := !hModule
            && hModule := DllCall("LoadLibraryEx", "Str", IconRes, "UInt", 0, "UInt", 0x2, "Ptr")
    } Else {
        hModule := 0
        LoadLib := False
    }

    DllCall("TaskDialog"
        , "Ptr" , Owner        ; hWndParent
        , "Ptr" , hModule      ; hInstance
        , "Ptr" , &Title       ; pszWindowTitle
        , "Ptr" , &Instruction ; pszMainInstruction
        , "Ptr" , &Content     ; pszContent
        , "Int" , Buttons      ; dwCommonButtons
        , "Ptr" , IconID       ; pszIcon
        , "Int*", Ret := 0)    ; *pnButton

    If (LoadLib) {
        DllCall("FreeLibrary", "Ptr", hModule)
    }

    Return {1: "OK", 2: "Cancel", 4: "Retry", 6: "Yes", 7: "No", 8: "Close"}[Ret]
}
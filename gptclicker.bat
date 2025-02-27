@echo off
title AutoClicker 15 CPS
color 0A
echo AutoClicker Iniciado
echo Presiona V para activar/desactivar.
echo Cierra esta ventana para salir.

:: Crea el script VBScript para manejar los clics
echo Set WshShell = CreateObject("WScript.Shell") > autoclicker.vbs
echo active = False >> autoclicker.vbs
echo Do >> autoclicker.vbs
echo     If WshShell.AppActivate("AutoClicker 15 CPS") Then >> autoclicker.vbs
echo         If WshShell.SendKeys("^V") Then active = Not active >> autoclicker.vbs
echo         If active Then >> autoclicker.vbs
echo             WshShell.SendKeys("^{LEFT}") >> autoclicker.vbs
echo             WScript.Sleep 67 >> autoclicker.vbs
echo         Else >> autoclicker.vbs
echo             WScript.Sleep 100 >> autoclicker.vbs
echo         End If >> autoclicker.vbs
echo     End If >> autoclicker.vbs
echo Loop >> autoclicker.vbs

:: Ejecuta el script en segundo plano
start /min wscript.exe autoclicker.vbs
exit

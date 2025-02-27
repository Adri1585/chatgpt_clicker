@echo off
setlocal EnableDelayedExpansion

:: Configuración
echo AutoClicker en .bat iniciado
set "intervalo=100"
set "tecla=F6"

:: Cargar librerías necesarias
powershell -Command "Add-Type -TypeDefinition 'using System;using System.Runtime.InteropServices;public class Click{[DllImport(\"user32.dll\",CharSet=CharSet.Auto,SetLastError=true)]public static extern void mouse_event(int dwFlags,int dx,int dy,int dwData,int dwExtraInfo);public static void LeftClick(){mouse_event(0x02,0,0,0,0);mouse_event(0x04,0,0,0,0);}}' -Language CSharp -PassThru | Out-Null"

echo Presiona %tecla% para iniciar/detener el autoclicker

timeout /t 2 >nul

:inicio
powershell -Command "$global:run=$true;while($global:run){[Click]::LeftClick();Start-Sleep -Milliseconds %intervalo%}" | powershell -Command "while($true){if((Get-AsyncKeyState 0x75) -ne 0){$global:run=!$global:run}}"

goto inicio

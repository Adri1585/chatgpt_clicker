Add-Type @"
using System;
using System.Runtime.InteropServices;
using System.Threading;

public class Clicker {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern void mouse_event(uint dwFlags, uint dx, uint dy, uint dwData, UIntPtr dwExtraInfo);
    
    [DllImport("user32.dll")]
    public static extern short GetAsyncKeyState(int vKey);
    
    private const uint MOUSEEVENTF_LEFTDOWN = 0x02;
    private const uint MOUSEEVENTF_LEFTUP = 0x04;
    private const int KEY_V = 0x56; // Código de la tecla V
    private const int CLICKS_PER_SECOND = 15;
    private const int DELAY = 1000 / CLICKS_PER_SECOND;

    public static void ClickLoop() {
        bool running = false;

        while (true) {
            // Detecta si la tecla "V" se presionó para alternar el estado
            if ((GetAsyncKeyState(KEY_V) & 0x01) != 0) {
                running = !running;
                Console.WriteLine(running ? "AutoClicker ACTIVADO" : "AutoClicker DESACTIVADO");
            }

            // Si está activo, genera clics
            if (running) {
                mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, UIntPtr.Zero);
                Thread.Sleep(10);
                mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, UIntPtr.Zero);
                Thread.Sleep(DELAY);
            } else {
                Thread.Sleep(50); // Pequeña espera para reducir uso de CPU cuando está inactivo
            }
        }
    }
}
"@ -Language CSharp

[Clicker]::ClickLoop()

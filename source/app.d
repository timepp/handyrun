import std.stdio;
import core.sys.windows.windows;
import core.runtime;
import std.string;

extern (Windows)
int WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance,
            LPSTR lpCmdLine, int nCmdShow)
{
    int result;

    try
    {
        Runtime.initialize();
        result = myWinMain(hInstance, hPrevInstance, lpCmdLine, nCmdShow);
        Runtime.terminate();
    }
    catch (Throwable e) 
    {
        MessageBoxA(null, e.toString().toStringz(), "Error",
                    MB_OK | MB_ICONEXCLAMATION);
        result = 0;     // failed
    }

    return result;
}

int myWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance,
              LPSTR lpCmdLine, int nCmdShow)
{
    // ... insert user code here ...
    return 0;
}
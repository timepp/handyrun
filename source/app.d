import std.stdio;
import core.sys.windows.windows;
import core.runtime;
import std.string;
import progman;
import common;

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
    program prog;
    prog.id = "fjdksal";
    prog.name = "100";

    auto mgr = new ProgramManager;
    mgr.initialize();

    mgr.addProgram(prog);

    mgr.uninitialize();
    
    return 0;
}
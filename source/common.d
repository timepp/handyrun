module common;

import std.file;
import std.path;
import core.sys.windows.windows;
import std.utf;

string getAppDataDir()
{
    return thisExePath().dirName();
}

void UILog(string message)
{
    MessageBoxW(null, message.toUTF16z(), "handyrun"w.ptr,
                    MB_OK | MB_ICONEXCLAMATION);
}
module progman;

import common;
import std.json;
import std.file;
import std.array;
import std.algorithm;

struct program 
{
    // each program has a unique ID. this ID is used to link the key program data with other program data stored otherwhere.
    // for example, UI components will store the program icons/images seperately.
    string id;
    string name;
    string path;
    string[] params;
    string comments;
    string tag;
}

class ProgramManager
{
    const(program[]) getAllPrograms()
    {
        program[] progs;
        // dupe
        return array(_progs);
    }

    program getProgramByID(string id)
    {
        foreach (p; _progs)
        {
            if (p.id == id) return p;
        }
        assert(0);
    }

    void addProgram(program prog)
    {
        _progs ~= prog;
        onDirty();
    }

    void updateProgram(program prog)
    {
        foreach (ref p; _progs)
        {
            if (p.id == prog.id)
            {
                p = prog;
            }
        }
        onDirty();
    }

    void deleteProgram(string id)
    {
        remove!(a => a.id == id)(_progs);
        onDirty();
    }

    void initialize()
    {
        _configFilePath = getAppDataDir ~ "\\progs.json";
        UILog(_configFilePath);
        load();
    }

    void uninitialize()
    {
        save();
    }

    private program[] _progs;
    private string _configFilePath;
    private bool _dirty;

    private void load()
    {
        if (!exists(_configFilePath))
        {
            return;
        }

        string config = readText(_configFilePath);
        JSONValue j = parseJSON(config);
        foreach (v; j.array)
        {
            program p;
            p.id = v["id"].str;
            p.name = v["name"].str;
            p.path = v["path"].str;
            p.tag = v["tag"].str;
            p.comments = v["comments"].str;
            _progs ~= p;
        }

        _dirty = false;
    }

    private void save()
    {
        if (!_dirty)
        {
            // do nothing if we are clean
            return;
        }

        JSONValue j;

        foreach (prog; _progs)
        {
            JSONValue p = [
                "id": prog.id,
                "name": prog.name,
                "path": prog.path,
                "tag": prog.tag,
                "comments": prog.comments
            ];
            j.array ~= p;
        }

        write(_configFilePath, j.toPrettyString());
        _dirty = false;
    }

    private void onDirty()
    {
        _dirty = true;
        save();
    }
}

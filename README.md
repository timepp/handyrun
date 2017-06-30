# handyrun
handyrun in D

# details
## process modal
**HandyRun.exe**
the main process.

**HandyRunHelper.exe**
[optional] background elevated process to perform tasks which require administrator previledge, such as
1. listen special hotkeys, e.g. double click the control key
2. run process with admin rights but won't show the UAC dialog

## configuration
the configuration is json file and can be modified manually.

## program
each program has a unique ID. this ID is used to link the key program data with other program data stored otherwhere.
for example, UI components will store the program icons/images seperately.

# TODO
## need better json serialization/deserialization, see http://vibed.org/api/vibe.data.json/serializeToJson

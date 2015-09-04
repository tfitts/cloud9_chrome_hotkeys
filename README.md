This is an auto-it script to override chrome keyboard shortcuts for use with Cloud9.

The script checks the window title, if Cloud9 is in the title it applies the shortcuts,
otherwise it releases them back to chrome or any other program.

A default configuration file is created upon first run.  New shorcuts can be added.

Example .ini prevent chrome from switching tabs.  Map Ctrl+] to tab between ide windows.

;^=Ctrl, !=Alt, +=Shift, special keys like {TAB}\n
[shortcuts]
^{TAB}=^]


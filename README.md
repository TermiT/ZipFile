# zipfile Titanium Module

## Description

A simple Titanium module to create, extract and add to (since 0.1.20) zip files. Requires Titanium SDK version 1.6.3 or above.
	
## Build

Edit the file "titanium.xcconfig" for your current SDK setup. You can find the current TITANIUM_SDK_VERSION by looking in the directory specified by TITANIUM_SDK (depending on your setup, you may also need to change this from /Library/… to ~/Library).

Then run:
```
	./build.py
```

## Install

Download or build from source zipfile module.

Put zipfile-iphone-x.y.z.zip into your Titanium Application Support directory (either /Library/Application\ Support/ or ~/Library/Application\ Support/) and unzip it.

## How to use

Register the zipfile module with your application by editing 'tiapp.xml' and adding the module:

```xml
<modules>
	<module version="0.1.20">zipfile</module>
</modules>
```

## Zip File Extraction Example

	//app.js: download zip from DropBox to Documents folder and extact file to Documents folder

	// This loads the module for use in the JavaScript
	var zipfile = require("zipfile");

	Titanium.UI.setBackgroundColor('#000');

	var win1 = Titanium.UI.createWindow({  
	    title:'ZipFile test',
	    backgroundColor:'#fff'
	});

	win1.open();
	var xhr = Titanium.Network.createHTTPClient();

	xhr.onload = function()
	{
		var f = Ti.Filesystem.getFile(Ti.Filesystem.applicationDataDirectory,'test.zip');
		f.write(this.responseData);
		Ti.API.log('INFO',Ti.Filesystem.applicationDataDirectory);
		zipfile.extract(Ti.Filesystem.applicationDataDirectory+'/test.zip', Ti.Filesystem.applicationDataDirectory);
	};
	xhr.open('GET','http://dl.dropbox.com/u/1400234/test.zip');
	xhr.send();

## Zip File Creation Example

		// This loads the module for use in the JavaScript.
		var zipfile = require("zipfile");

        var zip = zipfile.create("/path/to/zip/as/string.zip");
        zip.addFile("/path/to/file/to/add/filename", "path/in/zip/filename");
        zip.close();

## Opening Existing Zip File Example For File Addition/Update

		// This loads the module for use in the JavaScript
		var zipfile = require("zipfile");

        var zip = zipfile.open("/path/to/zip/as/string.zip");
        // This will return false if it does not exist. Now, add/update files to it
        zip.addFile("/path/to/file/to/add/filename", "path/in/zip/filename");
        zip.close();

## Author

Created by Gennadiy Potapov 
http://generalarcade.com 
Source : https://github.com/TermiT/ZipFile 

Zip creating by Damien Elmes

Updated to Ti SDK 1.7.0 and deprecated fixes of minizip code by Kosso 
http://kosso.co.uk 
Forked Source : https://github.com/kosso/ZipFile 

All contributors: https://github.com/TermiT/ZipFile/contributors

## Credits

Based on ZipArchive: http://code.google.com/p/ziparchive/ 


## License

MIT License

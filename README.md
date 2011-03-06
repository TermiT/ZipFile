# zipfile Module

## Description

Titanium module to create and extract Zip files

## Accessing the zipfile Module

To access this module from JavaScript, you would do the following:

	var zipfile = require("zipfile");

The zipfile variable is a reference to the Module object.	

Build
=====

Just run ./build.py

Install
=======

1.Download or build from source zipfile module.
2.Place zipfile-iphone-x.y.z.zip file to /Library/Application Support/Titanium and unzip it.

How to use
==========

1.Register the zipfile module with your application by editing 'tiapp.xml' and adding the module:

<modules>
	<module version="0.1.19">zipfile</module>
</modules>

2. 


	var zipfile = require("zipfile");
	zipfile.extract(path_to_zip_file, dir_to_extract);



Zip File Extraction Example
=======

	//app.js: download zip from DropBox to Documents folder and extact file to Documents folder

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
		Ti.ZipFile.extract(Ti.Filesystem.applicationDataDirectory+'/test.zip', Ti.Filesystem.applicationDataDirectory);
	};
	xhr.open('GET','http://dl.dropbox.com/u/1400234/test.zip');
	xhr.send();

Zip File Creation Example
================


        var zip = zipfile.create("/path/to/zip/as/string.zip");
        zip.addFile("/path/to/file/to/add/filename", "path/in/zip/filename");
        zip.close();


## Author

Based on ZipArchive: http://code.google.com/p/ziparchive/ 

Created by Gennadiy Potapov
http://generalarcade.com
Source : https://github.com/TermiT/ZipFile

Updated to Ti SDK 1.7.0 and deprecated fixes of minizip code by Kosso
http://kosso.co.uk
Forked Source : https://github.com/kosso/ZipFile

Credits
=======

Based on ZipArchive: http://code.google.com/p/ziparchive/ 


## License

MIT License

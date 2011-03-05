Titanium.UI.setBackgroundColor('#000');

var zipfile = require("zipfile"); 

var win1 = Titanium.UI.createWindow({  
    title:'ZipFile test',
    backgroundColor:'#fff'
});


// Download a zip file from DropBox and extract content to the app/Documents folder

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


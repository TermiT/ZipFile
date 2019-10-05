/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "ZipfileModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation ZipfileModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"12bdae7d-5d4b-43b7-bd59-cacecd19756b";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"zipfile";
}

#pragma Public APIs

-(void)extract:(id)args
{
	NSString *file = [args objectAtIndex:0];
	NSString *path = [args objectAtIndex:1];

	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	if(![fileManager fileExistsAtPath:file]) {
		NSLog(@"[DEBUG] Can't find zip file");
	}
	
	TiZipArchive *zipArchive = [[TiZipArchive alloc] init];
	if([zipArchive UnzipOpenFile:file]) {
		NSLog(@"[DEBUG] zip opened");
		BOOL ret = [zipArchive UnzipFileTo:path overWrite: YES];
		if (NO == ret){
			NSLog(@"[DEBUG] failed to unzip");
		} else {
			NSLog(@"[DEBUG] file unzipped");
		}
		[zipArchive UnzipCloseFile];
		// removed deletion of zip file after extraction.
		// Developer can use Ti.FileSystem.deleteFile if they want to do this.
		//[fileManager removeItemAtPath:file error:NULL];
	} else  {
		NSLog(@"[DEBUG] can't open zip");
	}
}


-(id)create:(id)args
{
    NSString *path = [args objectAtIndex:0];
	ZipfileProxy *z = [[ZipfileProxy alloc] initWithFile:path];
    if (z) {
        return z;
    } else {
        return nil;
    }
}

// Kosso added to enable opening an existing zip file to add files to
-(id)open:(id)args
{
    NSString *path = [args objectAtIndex:0];
    ZipfileProxy *z = [[ZipfileProxy alloc] initWithExistingFile:path];
    if (z) {
        return z;
    } else {
        return nil;
    }
}


@end

@implementation ZipfileProxy

-(id)initWithFile:(NSString*)path
{
    if (self = [super init]) {
        zipArchive = [[TiZipArchive alloc] init];
        if ([zipArchive CreateZipFile2:path]) {
            NSLog(@"[DEBUG] zip opened");
        } else {
            NSLog(@"[DEBUG] could'nt create zip");
            return nil;
        }            
    }
    return self;
}

// Kosso added to enable opening an existing zip file to add files to
-(id)initWithExistingFile:(NSString*)path
{
    if (self = [super init]) {
        zipArchive = [[TiZipArchive alloc] init];
        if ([zipArchive OpenZipFile2:path]) {
            NSLog(@"[DEBUG] zip opened");
        } else {
            NSLog(@"[DEBUG] could'nt create zip");
            return nil;
        }            
    }
    return self;
}


-(id)addFile:(id)args
{
    NSString *path = [args objectAtIndex:0];
    NSString *newName = [args objectAtIndex:1];
	
    //NSLog(@"[DEBUG] add %@ to zip as %@", path, newName);
    return NUMBOOL([zipArchive addFileToZip:path newname:newName]);
}

// theoretically this should just be done on dealloc, but for some reason the
// proxy in my test function is not being deallocated
-(void)close:(id)args
{
    NSLog(@"[DEBUG] close zip");
    if (zipArchive) {
        [zipArchive CloseZipFile2];
    }
}


@end

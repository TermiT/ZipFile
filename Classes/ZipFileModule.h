/**
 * Originally by TermiT from https://github.com/TermiT/ZipFile
 * Updated for Ti SDK 1.7.0 and fixed deprecated functions in minizip 
 * by Kosso : http://kosso.co.uk
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "TiModule.h"
#import "TiZipArchive.h"

@interface ZipfileModule : TiModule

@end

@interface ZipfileProxy : TiProxy {
@private
    TiZipArchive *zipArchive;
}

-(id)initWithFile:(NSString*)path_;

// Kosso added to enable opening an existing zip file to add files to
-(id)initWithExistingFile:(NSString*)path_;

@end

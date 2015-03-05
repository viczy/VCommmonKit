//
//  VCFileManager.h
//  VCommonKit_Example
//
//  Created by Vic Zhou on 3/5/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VCFileManager : NSObject

+ (BOOL)fileExists:(NSString *)path;

+ (BOOL)remove:(NSString *)path;

+ (BOOL)makeDir:(NSString *)path;

+ (NSString*)getDocumentsPath;

+ (NSString*)getCachesPath;

+ (NSString*)getPathWithFileName:(NSString*)filename inFolder:(NSString*)folderPath;

+ (NSString*)getDocumentsFilePath:(NSString*)filename;

+ (NSString*)getCachesFilePath:(NSString*)filename;

@end

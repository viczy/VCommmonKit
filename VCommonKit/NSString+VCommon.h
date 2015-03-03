//
//  NSString+VCommon.h
//  VCommonKit_Example
//
//  Created by Vic Zhou on 3/3/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (VCommon)

//MD5
- (NSString *)md5String;

- (NSData *)md5Data;

//网页特殊字符处理
- (NSString*)specialCharReplace;

//时间比较
- (BOOL)earlierToNowWithFormat:(NSString*)format;

@end

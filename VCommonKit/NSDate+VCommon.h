//
//  NSDate+VCommon.h
//  VCommonKit_Example
//
//  Created by Vic Zhou on 3/3/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (VCommon)

//默认dateformater
+ (NSDateFormatter *)defaultFormatter;

//获取当前时间
+ (NSString *)systemTimeWithFormat:(NSString *)format;

@end

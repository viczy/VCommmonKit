//
//  NSDate+VCommon.m
//  VCommonKit_Example
//
//  Created by Vic Zhou on 3/3/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

#import "NSDate+VCommon.h"

@implementation NSDate (VCommon)

/**
 * @brief 获取系统时间方法
 *  format:MM与mm，HH与hh区分（NSDate与NSString之间的互相转换通过NSDateFormatter）
 * Detailed
 * @param[in] 时间的格式
 * @param[out] N/A
 * @return 所需格式的系统时间
 * @note
 */
+ (NSString *)systemTimeWithFormat:(NSString *)format {
    NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
    NSDate *date = [NSDate date];
    [[NSDate date] timeIntervalSince1970];
    [formatter setDateFormat:format];
    NSString *returnTime = [formatter stringFromDate:date];
    return returnTime;
}

@end

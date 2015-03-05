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
 * @brief
 *  获取默认的DateFormatter
 * Detailed
 * @param[in] N/A
 * @param[out] N/A
 * @return  NSDateFormatter
 * @note
 */

+ (NSDateFormatter *)defaultFormatter {
    NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    formatter.dateFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'";
    return formatter;
}

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
    NSDateFormatter *formatter = [self defaultFormatter];
    [formatter setDateFormat:format];
    NSDate *date = [NSDate date];
    [[NSDate date] timeIntervalSince1970];
    NSString *returnTime = [formatter stringFromDate:date];
    return returnTime;
}


@end

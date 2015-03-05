//
//  NSString+VCommon.m
//  VCommonKit_Example
//
//  Created by Vic Zhou on 3/3/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

#import "NSString+VCommon.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSDate+VCommon.h"

@implementation NSString (VCommon)

/**
 * @brief
 * 引入头文件：#import <CommonCrypto/CommonDigest.h>
 * Detailed
 * @param[in]
 * @param[out] N/A
 * @return
 * @note
 */
- (NSString *)md5String {
    const char *ptr = [self UTF8String];

    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];

    CC_MD5(ptr, (int)strlen(ptr), md5Buffer);

    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",md5Buffer[i]];
    
    return output;
}

/**
 * @brief
 * 引入头文件：#import <CommonCrypto/CommonDigest.h>
 * Detailed
 * @param[in]
 * @param[out] N/A
 * @return
 * @note
 */
- (NSData *)md5Data {

    const char *ptr = [self UTF8String];

    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];

    CC_MD5(ptr, (int)strlen(ptr), md5Buffer);

    NSData	*data = [NSData dataWithBytes:(const void *)md5Buffer length:sizeof(unsigned char)*CC_MD5_DIGEST_LENGTH];
    
    return data;
}

/**
 * @brief 替换字符串中xml的特殊字符
 *
 * Detailed
 * @param[in]  待处理的字符串
 * @param[out] N/A
 * @return  替换特殊字符后的字符串
 * @note
 */
- (NSString*)specialCharReplace {
    NSString *string;
    if(self.length >0 ) {
        string = [self stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
        string = [string stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
        string = [string stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
        string = [string stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
        string = [string stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    }
    return string;
}

/**
 * @brief
 *  与系统时间作比较
 * Detailed
 * @param[in] format
 * @param[out] N/A
 * @return BOOL
 * @note
 */

- (BOOL)earlierToNowWithFormat:(NSString*)format {
    NSDateFormatter *formatter = [NSDate defaultFormatter];
    [formatter setDateFormat:format];
    NSDate *now = [NSDate date];
    NSDate *selfDate = [formatter dateFromString:self];
    if ([now compare:selfDate] == NSOrderedAscending) {
        return YES;
    }else {
        return NO;
    }
}

/**
 * @brief
 *  与Date作比较
 * Detailed
 * @param[in] date, format
 * @param[out] N/A
 * @return BOOL
 * @note
 */

- (BOOL)earlierToDate:(NSDate*)date withFormat:(NSString *)format {
    NSDateFormatter *formatter = [NSDate defaultFormatter];
    [formatter setDateFormat:format];
    NSDate *selfDate = [formatter dateFromString:self];
    if ([date compare:selfDate] == NSOrderedAscending) {
        return YES;
    }else {
        return NO;
    }
}

/**
 * @brief
 *  与Date作比较
 * Detailed
 * @param[in] string, format, format
 * @param[out] N/A
 * @return BOOL
 * @note
 */

- (BOOL)earlierToString:(NSString*)dateString stringFormat:(NSString *)stringFormat selfFormat:(NSString *)selfFormat {
    NSDateFormatter *selfFormatter = [NSDate defaultFormatter];
    [selfFormatter setDateFormat:selfFormat];
    NSDate *selfDate = [selfFormatter dateFromString:self];

    NSDateFormatter *stringFormatter = [NSDate defaultFormatter];
    [stringFormatter setDateFormat:selfFormat];
    NSDate *stringDate = [selfFormatter dateFromString:self];
    if ([stringDate compare:selfDate] == NSOrderedAscending) {
        return YES;
    }else {
        return NO;
    }
}

@end

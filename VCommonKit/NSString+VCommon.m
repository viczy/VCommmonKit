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

/**
 * @brief
 *  判断字符串是否是国内有效的手机号码
 * Detailed
 * @param[in]
 * @param[out] N/A
 * @return BOOL
 * @note
 */

- (BOOL)isPhoneNumber {
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,183,184,187,188,147,178
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|47|5[017-9]|78|8[23478])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186,145,176
     17         */
    NSString * CU = @"^1(3[0-2]|45|5[256]|76|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,181,189
     22         */
    NSString * CT = @"^1((33|53|8[019])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";

    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];

    if (([regextestmobile evaluateWithObject:self] == YES)
        || ([regextestcm evaluateWithObject:self] == YES)
        || ([regextestct evaluateWithObject:self] == YES)
        || ([regextestcu evaluateWithObject:self] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

/**
 * @brief
 *  判断字符串是否是邮箱地址
 * Detailed
 * @param[in]
 * @param[out] N/A
 * @return BOOL
 * @note
 */
- (BOOL)isEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailtest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailtest evaluateWithObject:self];
}

/**
 * @brief 判断网址合法
 *
 * Detailed
 * @param[in]  待分析的网址
 * @param[out] N/A
 * @return 是否合法
 * @note
 */
- (BOOL)isNetAddress {
    NSString *httpRegex = @"[a-zA-z]+://[^\\s]*";
    NSPredicate *httpTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", httpRegex];
    return [httpTest evaluateWithObject:self];
}

@end

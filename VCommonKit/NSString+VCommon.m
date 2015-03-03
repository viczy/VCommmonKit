//
//  NSString+VCommon.m
//  VCommonKit_Example
//
//  Created by Vic Zhou on 3/3/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

#import "NSString+VCommon.h"
#import <CommonCrypto/CommonDigest.h>

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

@end

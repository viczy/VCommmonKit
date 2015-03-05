//
//  VCFileManager.m
//  VCommonKit_Example
//
//  Created by Vic Zhou on 3/5/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

#import "VCFileManager.h"

@implementation VCFileManager

/**
 * @brief 判断文件是否已存在
 *
 * Detailed
 * @param[in]  文件路径
 * @param[out] N/A
 * @return  是否存在
 * @note
 */
+ (BOOL)fileExists:(NSString *)path {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL returnValue = [fileManager fileExistsAtPath:path];
    return returnValue;
}

/**
 * @brief 删除文件
 *
 * Detailed
 * @param[in]  文件路径
 * @param[out] N/A
 * @return  是否删除成功
 * @note
 */
+ (BOOL)remove:(NSString *)path {
    NSError *error = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        [fileManager removeItemAtPath:path error:&error];
    }
    if (error) {
        return NO;
    }
    return YES;
}

/**
 * @brief 创建文件
 *
 * Detailed
 * @param[in]  文件路径
 * @param[out] N/A
 * @return  是否创建成功
 * @note
 */
+ (BOOL)makeDir:(NSString *)path {
    NSError *error = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
    if (error) {
        return NO;
    }
    return YES;
}

/**
 * @brief 获取documents路径
 *
 * Detailed
 * @param[in]  N/A
 * @param[out] N/A
 * @return  documents路径
 * @note
 */
+ (NSString*)getDocumentsPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex: 0];
    return documentsDirectory;
}

/**
 * @brief 获取caches路径
 *
 * Detailed
 * @param[in]  N/A
 * @param[out] N/A
 * @return  caches路径
 * @note
 */
+ (NSString*)getCachesPath {
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString* cachesDirectory = [paths objectAtIndex: 0];
    return cachesDirectory;
}

/**
 * @brief 获取父文件夹路径下子文件路径
 *
 * Detailed
 * @param[in]  文件夹 文件名
 * @param[out] N/A
 * @return  文件路径
 * @note
 */

+ (NSString*)getPathWithFileName:(NSString*)filename inFolder:(NSString*)folderPath {
    NSString *path = [folderPath stringByAppendingPathComponent:filename];
    return path;
}


/**
 * @brief 获取documents路径下文件路径
 *
 * Detailed
 * @param[in]  文件名
 * @param[out] N/A
 * @return  文件路径
 * @note
 */
+ (NSString*)getDocumentsFilePath:(NSString*)filename {
    NSString *documentsPath = [self getDocumentsPath];
    NSString *path = [self getPathWithFileName:filename inFolder:documentsPath];
    return path;
}

/**
 * @brief 获取caches路径下文件路径
 *
 * Detailed
 * @param[in]  文件名
 * @param[out] N/A
 * @return  文件路径
 * @note
 */
+ (NSString*)getCachesFilePath:(NSString*)filename {
    NSString *cachesPath = [self getCachesPath];
    NSString *path = [self getPathWithFileName:filename inFolder:cachesPath];
    return path;
}


@end

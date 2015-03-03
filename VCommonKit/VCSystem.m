//
//  VCSystem.m
//  VCommonKit_Example
//
//  Created by Vic Zhou on 3/3/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

#import "VCSystem.h"
#import <OpenUDID.h>

static NSString *const UUIDKey = @"localUUID";

@implementation VCSystem

/**
 * @brief 系统重置会改变,需要podfile添加：pod "OpenUDID"
 *
 * Detailed
 * @param[in]  N/A
 * @param[out] N/A
 * @return  UDID
 * @note
 */

+ (NSString *)openUDID {
    NSString *openUDID = [OpenUDID value];
    return openUDID;
}

/**
 * @brief 需本地存储
 *
 * Detailed
 * @param[in]  N/A
 * @param[out] N/A
 * @return  UUID
 * @note
 */

+ (NSString *)localUUID {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *uuid = [userDefaults objectForKey:UUIDKey];
    if (uuid.length > 0) {
        return uuid;
    }else {
        uuid = [[NSUUID UUID] UUIDString];
        [userDefaults setObject:uuid forKey:UUIDKey];
        [userDefaults synchronize];
    }
    return uuid;
}

@end

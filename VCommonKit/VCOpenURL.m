//
//  VCOpenURL.m
//  VCommonKit_Example
//
//  Created by Vic Zhou on 3/3/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

#import "VCOpenURL.h"

@implementation VCOpenURL

/**
 * @brief 跳转到苹果市场该app的详情页
 *
 * Detailed
 * @param[in]  App的id
 * @param[out] N/A
 * @return  N/A
 * @note
 */
+ (void)goToAppStoreHomePage:(NSInteger)appid {
    NSString *str = [NSString stringWithFormat:@"itms-apps://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=%ld", (long)appid];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

/**
 * @brief 跳转到苹果市场该app的评论页
 *
 * Detailed
 * @param[in]  App的id
 * @param[out] N/A
 * @return  N/A
 * @note
 */
+ (void)goToAppStoreCommentPage:(NSInteger)appid {
    NSString *str = [NSString stringWithFormat: @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%ld", (long)appid ];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

/**
 * @brief 打开系统浏览器
 *
 * Detailed
 * @param[in]  链接地址
 * @param[out] N/A
 * @return  N/A
 * @note
 */
+ (void)openBrowse:(NSString*)url {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

/**
 * @brief 打开系统短信
 *
 * Detailed
 * @param[in]  电话号码
 * @param[out] N/A
 * @return  N/A
 * @note
 */
+ (void)openSmsPage:(NSString*)phoneNumber {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"sms://%@",phoneNumber]]];
}

/**
 * @brief 打开系统邮箱
 *
 * Detailed
 * @param[in]  邮箱地址
 * @param[out] N/A
 * @return  N/A
 * @note
 */
+ (void)openEmail:(NSString*)email {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"mailto:%@",email]]];
}

/**
 * @brief 打开系统电话
 *
 * Detailed
 * @param[in]  拨号号码
 * @param[out] N/A
 * @return  N/A
 * @note
 */
+ (void)openPhone:(NSString *)number {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",number]]];
}

/**
 * @brief 打开google地图
 *
 * Detailed
 * @param[in]  地址
 * @param[out] N/A
 * @return  N/A
 * @note
 */
+ (void)openGoogleMaps:(NSString *)address {
    address =  [address stringByAddingPercentEscapesUsingEncoding: NSASCIIStringEncoding];
    NSString* urlText = [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", address];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlText]];
}

@end

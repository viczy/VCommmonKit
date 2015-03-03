//
//  VCOpenURL.h
//  VCommonKit_Example
//
//  Created by Vic Zhou on 3/3/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VCOpenURL : NSObject

//跳转到电子市场页面
+ (void)goToAppStoreHomePage:(NSInteger)appid;

//跳转到电子市场评论页面
+ (void)goToAppStoreCommentPage:(NSInteger)appid;

//打开浏览器
+ (void)openBrowse:(NSString *)url;

//跳到短信页面
+ (void)openSmsPage:(NSString *)phonenumber;

//打开EMAIL
+ (void)openEmail:(NSString *)email;

//打开电话
+ (void)openPhone:(NSString *)number;

//打开Google地图
+ (void)openGoogleMaps:(NSString *)address;

@end

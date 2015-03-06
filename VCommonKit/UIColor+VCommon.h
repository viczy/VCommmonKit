//
//  UIColor+VCommon.h
//  VCommonKit_Example
//
//  Created by Vic Zhou on 3/3/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (VCommon)

+ (UIColor*)instanceWithString:(NSString*)rgba;

+ (UIColor*)instanceWithIntRed:(NSInteger)red intGreen:(NSInteger)green intBlue:(NSInteger)blue andAlpha:(CGFloat)alpha;

@end

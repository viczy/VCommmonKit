//
//  UIColor+VCommon.m
//  VCommonKit_Example
//
//  Created by Vic Zhou on 3/3/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

#import "UIColor+VCommon.h"

@implementation UIColor (VCommon)

/**
 * @brief
 *
 * Detailed
 * @param[in]
 * @param[out] N/A
 * @return
 * @note
 */

+ (UIColor*)instanceWithString:(NSString*)rgba {
    CGFloat red = 0,green = 0,blue = 0,alpha = 1.0;
    if ([rgba hasPrefix:@"#"]) {
        // #rrggbb or #rrggbbaa
        uint32_t colorValue = 0;
        sscanf(rgba.UTF8String, "#%x", &colorValue);
        if (rgba.length < 9) {
            colorValue <<= 8;
            colorValue |= 0xFF;
        }
        red     = ((colorValue & 0xFF000000) >> 24) / 255.0;
        green   = ((colorValue & 0x00FF0000) >> 16) / 255.0;
        blue    = ((colorValue & 0x0000FF00) >>  8) / 255.0;
        alpha   =  (colorValue & 0x000000FF) / 255.0;
    } else if ([rgba hasPrefix:@"rgb("]) {
        // rgb(1,2,3)
        int r,g,b;
        sscanf(rgba.UTF8String, "rgb(%d,%d,%d)", &r, &g, &b);
        red = r / 255.0;
        green = g / 255.0;
        blue = b / 255.0;
    } else if ([rgba hasPrefix:@"rgba("]) {
        // rgba(1,2,3,0.75)
        int r,g,b;
        sscanf(rgba.UTF8String, "rgba(%d,%d,%d,%lg)", &r, &g, &b, &alpha);
        red = r / 255.0;
        green = g / 255.0;
        blue = b / 255.0;
    }

    return [[UIColor alloc] initWithRed:red green:green blue:blue alpha:alpha];
}

/**
 * @brief
 *
 * Detailed
 * @param[in]
 * @param[out] N/A
 * @return
 * @note
 */

+ (UIColor*)instanceWithIntRed:(NSInteger)red intGreen:(NSInteger)green intBlue:(NSInteger)blue andAlpha:(CGFloat)alpha {
    CGFloat fRed = (CGFloat)red/255.f;
    CGFloat fGreen = (CGFloat)green/255.f;
    CGFloat fBlue = (CGFloat)blue/255.f;
    return [[UIColor alloc] initWithRed:fRed green:fGreen blue:fBlue
                                  alpha:alpha];
}


@end

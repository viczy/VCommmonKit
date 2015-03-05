//
//  UIImage+VCommon.h
//  VCommonKit_Example
//
//  Created by Vic Zhou on 3/5/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (VCommon)

//拍照翻转调整
- (UIImage *)fixOrientation;

//缩放
- (UIImage *)scaleFitSize:(CGSize)fitSize;

@end

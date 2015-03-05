//
//  UIImage+VCommon.m
//  VCommonKit_Example
//
//  Created by Vic Zhou on 3/5/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

#import "UIImage+VCommon.h"

@implementation UIImage (VCommon)

/**
 * @brief
 *  拍照图片翻转调整
 * Detailed
 * @param[in] N/A
 * @param[out] N/A
 * @return  UIImage
 * @note
 */
- (UIImage *)fixOrientation
{

    // No-op if the orientation is already correct
    if (self.imageOrientation == UIImageOrientationUp) {
        return self;
    }

    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;

    switch (self.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;

        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;

        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }

    switch (self.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }

    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                             CGImageGetBitsPerComponent(self.CGImage), 0,
                                             CGImageGetColorSpace(self.CGImage),
                                             CGImageGetBitmapInfo(self.CGImage));
    CGContextConcatCTM(ctx, transform);

    switch (self.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0, 0, self.size.height, self.size.width), self.CGImage);
            break;

        default:
            CGContextDrawImage(ctx, CGRectMake(0, 0, self.size.width, self.size.height), self.CGImage);
            break;
    }

    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

/**
 * @brief
 *  图片缩放
 * Detailed
 * @param[in]
 * @param[out] N/A
 * @return  UIImage
 * @note
 */
- (UIImage *)scaleFitSize:(CGSize)fitSize {
    CGSize imageSize = self.size;
    CGRect contrainerRect;
    if (imageSize.width <= fitSize.width) {//width longer
        if (imageSize.height <= fitSize.height) {//height longer
            return self;
        }else {
            contrainerRect = CGRectMake(0.f, (imageSize.height-fitSize.height)/2, fitSize.width, fitSize.height);
        }
    }else {
        if (imageSize.height <= fitSize.height) {
            contrainerRect = CGRectMake((imageSize.width-fitSize.width)/2, 0.f, fitSize.width, fitSize.height);
        }else {
            contrainerRect = CGRectMake((imageSize.width-fitSize.width)/2, (imageSize.height-fitSize.height)/2, fitSize.width, fitSize.height);
        }
    }
    CGImageRef imageRef = self.CGImage;
    CGImageRef fitImageRef = CGImageCreateWithImageInRect(imageRef,contrainerRect);
    UIImage *fitImage = [[UIImage alloc]initWithCGImage:fitImageRef];
    return fitImage;
}


@end

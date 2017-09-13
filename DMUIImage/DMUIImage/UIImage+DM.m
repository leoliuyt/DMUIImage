//
//  UIImage+DM.m
//  DMUIImage
//
//  Created by lbq on 2017/9/13.
//  Copyright © 2017年 lbq. All rights reserved.
//

#import "UIImage+DM.h"

@implementation UIImage (DM)
#pragma mark 调整图片分辨率/尺寸（等比例缩放）
- (UIImage *)cropImageToMaxSize:(CGSize)size scale:(BOOL)scale{
    CGSize newSize = CGSizeMake(self.size.width, self.size.height);
    
    CGFloat tempHeight = newSize.height / size.height;
    CGFloat tempWidth = newSize.width / size.width;
    
    if (tempWidth > 1.0 && tempWidth >= tempHeight) {
        newSize = CGSizeMake(self.size.width / tempWidth, self.size.height / tempWidth);
    }
    else if (tempHeight > 1.0 && tempWidth <= tempHeight){
        newSize = CGSizeMake(self.size.width / tempHeight, self.size.height / tempHeight);
    }
    
    CGFloat ascale = scale ? self.scale : 1;
    UIGraphicsBeginImageContextWithOptions(newSize, NO, ascale);
    [self drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end

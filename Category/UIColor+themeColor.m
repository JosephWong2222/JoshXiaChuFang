//
//  UIColor+themeColor.m
//  JoshXiaChuFang
//
//  Created by JacksonWong on 2017/7/23.
//  Copyright © 2017年 JosephWong2. All rights reserved.
//

#import "UIColor+themeColor.h"

@implementation UIColor (themeColor)
//250 102 80
+ (UIColor *)tabbarItemSelectedColor {
    CGFloat red = 250/255.0;
    CGFloat green = 102/255.0;
    CGFloat blue = 80/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
}

+ (UIColor *)themeColor {
    return [self tabbarItemSelectedColor];
}

+ (UIColor *)backgoundColor {
    return [UIColor whiteColor];
}


+ (UIColor *)tableViewBackgroundColor {
    return [UIColor colorRed:250 Green:250 Blue:248 alpha:1.0];
}

+ (UIColor *)colorRed:(NSInteger)red Green:(NSInteger)green Blue:(NSInteger)blue alpha:(CGFloat)alpha{
    CGFloat Red = red / 255.0;
    CGFloat Green = green / 255.0;
    CGFloat Blue = blue / 255.0;
    return [UIColor colorWithRed:Red green:Green blue:Blue alpha:alpha];
}

+ (UIColor *)pageControllTintColor {
    return [UIColor colorRed:229 Green:229 Blue:229 alpha:1.0];
}


@end

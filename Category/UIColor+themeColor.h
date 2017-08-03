//
//  UIColor+themeColor.h
//  JoshXiaChuFang
//
//  Created by JacksonWong on 2017/7/23.
//  Copyright © 2017年 JosephWong2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (themeColor)

+ (UIColor*)tabbarItemSelectedColor;
+ (UIColor *)themeColor;
+ (UIColor *)backgoundColor;
+ (UIColor *)tableViewBackgroundColor;
+ (UIColor *)pageControllTintColor;

+ (UIColor *)colorRed:(NSInteger)red Green:(NSInteger)green Blue:(NSInteger)blue alpha:(CGFloat)alpha;
@end

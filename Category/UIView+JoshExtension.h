//
//  UIView+JoshExtension.h
//  JoshXiaChuFang
//
//  Created by JacksonWong on 2017/7/25.
//  Copyright © 2017年 JosephWong2. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIView (JoshExtension)

@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGSize size;
@property (assign, nonatomic) CGFloat centerX;
@property (assign, nonatomic) CGFloat centerY;
@property (assign, nonatomic) CGPoint origin;
- (BOOL)isShowingOnKeyWindow;

+ (instancetype)viewFromXib;

@end


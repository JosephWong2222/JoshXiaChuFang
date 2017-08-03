//
//  JoshVeriticalButton.m
//  JoshXiaChuFang
//
//  Created by JacksonWong on 2017/7/25.
//  Copyright © 2017年 JosephWong2. All rights reserved.
//

#import "JoshVeriticalButton.h"
#import <UIImageView+WebCache.h>
#import <SDWebImageManager.h>
#import <UIButton+WebCache.h>

@implementation JoshVeriticalButton



+ (JoshVeriticalButton *)buttonWithImageName:(NSString *)imageName title:(NSString *)title Target:(id)target action:(SEL)action {
    JoshVeriticalButton *button = [[JoshVeriticalButton alloc] init];
    [button setTitle:title  forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [button addGestureRecognizer:tap];
    return button;
    return button;
}

+ (JoshVeriticalButton *)buttonWithImageURL:(NSString *)imageURL title:(NSString *)title Target:(id)target action:(SEL)action {
    JoshVeriticalButton *button = [[JoshVeriticalButton alloc] init];
    [button setTitle:title  forState:UIControlStateNormal];
    [button sd_setImageWithURL:[NSURL URLWithString:imageURL] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [button addGestureRecognizer:tap];
    return button;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    for (UIView *childView in self.subviews) {
        if ([childView isKindOfClass:[UIImageView class]]) {
            childView.frame = CGRectMake(0, 0, self.width, self.height*0.8);
            childView.contentMode = UIViewContentModeCenter;
        } else {
            UILabel *text = (UILabel *)childView;
            text.frame = CGRectMake(0, self.height * 0.8, self.width, self.height * 0.2);
            text.textAlignment = NSTextAlignmentCenter;
        }
    }
}

@end

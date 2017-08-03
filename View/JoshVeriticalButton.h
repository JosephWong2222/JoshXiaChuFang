//
//  JoshVeriticalButton.h
//  JoshXiaChuFang
//
//  Created by JacksonWong on 2017/7/25.
//  Copyright © 2017年 JosephWong2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JoshVeriticalButton : UIButton

+ (JoshVeriticalButton *)buttonWithImageName:(NSString *)imageName title:(NSString *)title Target:(id)target action:(SEL)action;

+ (JoshVeriticalButton *)buttonWithImageURL:(NSString *)buttonWithImageURL title:(NSString *)title Target:(id)target action:(SEL)action ;


@end

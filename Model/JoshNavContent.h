//
//  JoshNavContent.h
//  JoshXiaChuFang
//
//  Created by JacksonWong on 2017/7/25.
//  Copyright © 2017年 JosephWong2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JoshKitchenNav.h"
@interface JoshNavContent : NSObject

/**早餐午餐晚餐的数据*/
@property (strong, nonatomic) NSArray *pop_events;

/**导航按钮的数据*/
@property (strong ,nonatomic ) NSArray<JoshKitchenNav *> *navs;

/**本周流行菜谱以及好友趋势*/
@property (copy, nonatomic) NSString *pop_recipe_picurl;

@end

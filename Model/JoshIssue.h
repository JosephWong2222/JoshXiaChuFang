//
//  JoshIssue.h
//  JoshXiaChuFang
//
//  Created by JacksonWong on 2017/7/30.
//  Copyright © 2017年 JosephWong2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JoshDishItem.h"

@interface JoshIssue : NSObject

@property (copy, nonatomic) NSString *title;

@property (assign, nonatomic) NSInteger items_count;

@property (strong, nonatomic) NSArray<JoshDishItem *> *items;

@property (assign ,nonatomic) NSInteger issue_id;

@property (strong, nonatomic) NSString *publish_date;

@end

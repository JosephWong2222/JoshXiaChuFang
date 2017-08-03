//
//  JoshSearchBar.h
//  JoshXiaChuFang
//
//  Created by JacksonWong on 2017/7/25.
//  Copyright © 2017年 JosephWong2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JoshSearchBar : UISearchBar


//点击取消时候的回调
@property (copy, nonatomic) void(^searchBarDidClickCancelButtonBlock)();

//点击搜索时候的回调
@property (copy, nonatomic) void(^searchBarDidSearch)();

+ (JoshSearchBar *) searchBarInitWithPlaceholder:(NSString *)placeholder;

@end

//
//  JoshSearchBar.m
//  JoshXiaChuFang
//
//  Created by JacksonWong on 2017/7/25.
//  Copyright © 2017年 JosephWong2. All rights reserved.
//

#import "JoshSearchBar.h"

@interface JoshSearchBar() <UISearchBarDelegate>

@end

@implementation JoshSearchBar

#pragma mark <Init>

+ (JoshSearchBar *) searchBarInitWithPlaceholder:(NSString *)placeholder {
    JoshSearchBar *searchBar = [[JoshSearchBar alloc] init];
        searchBar.placeholder = placeholder;
        searchBar.delegate = searchBar;
    for (UIView *childView in searchBar.subviews) {
    }
    return searchBar;
}


#pragma mark <UISearchBarDelegate>

//点击取消按钮时候执行的操作
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    !self.searchBarDidClickCancelButtonBlock ? : self.searchBarDidClickCancelButtonBlock();
}

//点击搜索按钮时候执行的操作
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    !self.searchBarDidSearch ? : self.searchBarDidSearch();
}





@end

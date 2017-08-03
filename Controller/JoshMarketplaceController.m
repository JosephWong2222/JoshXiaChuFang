//
//  JoshMarketplaceController.m
//  JoshXiaChuFang
//
//  Created by JacksonWong on 2017/7/28.
//  Copyright © 2017年 JosephWong2. All rights reserved.
//

#import "JoshMarketplaceController.h"
#import "JoshMarketplaceHeaderView.h"
#import "JoshSearchBar.h"
@interface JoshMarketplaceController ()

@end

@implementation JoshMarketplaceController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNaviBar];
//    [self setupTableViewHeaderView];
    
    }

- (void)setupNaviBar {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftPageButtonBackgroundNormal"] style:UIBarButtonItemStylePlain target:self action:@selector(positionAction)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"shoppingCart"] style:UIBarButtonItemStylePlain target:self action:@selector(shoppingCart)];
    self.navigationItem.titleView = [JoshSearchBar searchBarInitWithPlaceholder:@"搜索食材"];
    [self.navigationItem.titleView resignFirstResponder];
}

//- (void)setupTableViewHeaderView {
//    JoshMarketplaceHeaderView *headerView = [[JoshMarketplaceHeaderView alloc] initWithFrame:CGRectMake(0, 0, JoshScreenW, JoshScreenH * )]
//}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

#pragma mark - <按钮点击事件>

- (void)positionAction
{
    JoshLog(@"positionAction");
}

- (void)shoppingCart {
    JoshLog(@"shoppingCart");
}

@end

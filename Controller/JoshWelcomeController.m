//
//  JoshWelcomeController.m
//  JoshXiaChuFang
//
//  Created by JacksonWong on 2017/7/22.
//  Copyright © 2017年 JosephWong2. All rights reserved.
//

#import "JoshWelcomeController.h"
#import <AFNetworking.h>
#import <Masonry.h>
#import <MJRefresh.h>
#import <MJExtension.h>
#import "JoshSearchBar.h"
#import "JoshWelcomeHeaderView.h"
#import "JoshRequestURL.h"
#import "JoshIssue.h"
#import "JoshNavContent.h"
#import "JoshRecipeCell.h"
@interface JoshWelcomeController ()

@property (strong, nonatomic)JoshWelcomeHeaderView *headerView;
@property (strong, nonatomic)NSArray<JoshIssue *> *issuesArr;

@end

@implementation JoshWelcomeController

static NSString *JoshRecipeCellID = @"receipe";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self setupNaviBar];
//    [self setupRefresh];
    [self loadNewData];
    [self loadNavData];
}

#pragma  mark - <懒加载 >


-(NSArray<JoshIssue *> *)issuesArr
{
    if(_issuesArr == nil) {
        _issuesArr = [[NSArray<JoshIssue *> alloc] init];
    }
    return _issuesArr;
}

-(JoshWelcomeHeaderView *)headerView
{
    if(_headerView == nil) {
#warning 创建headerView 记得给headerView设置尺寸
        _headerView = [[JoshWelcomeHeaderView alloc] initWithFrame:self.view.frame];
        self.tableView.tableHeaderView = _headerView;
    }
    return _headerView;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"%lu",(unsigned long)self.issuesArr.count);
    return  self.issuesArr.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return [self.issuesArr[section] items_count];
}

//去除分割线
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//   
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, JoshScreenW, JoshWelcomeHeaderForSectionHeight)];
//    JoshIssue *issue = self.issuesArr[section];
//    NSString *publishDate = issue.publish_date;
//    label.text = publishDate;
//    label.text = [self getDate];
//    label.textAlignment = NSTextAlignmentCenter;
//    return label;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return JoshWelcomeHeaderForSectionHeight;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    JoshIssue *issue = self.issuesArr[indexPath.section];
    JoshDishItem *item = issue.items[indexPath.row];
    return  item.cellHeight;
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    JoshIssue *issue = self.issuesArr[indexPath.section];
//    JoshDishItem *item = issue.items[indexPath.row];
////    一定要先注册，这样就不用判断是否为空
    JoshRecipeCell *cell = [[JoshRecipeCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:JoshRecipeCellID];
//    cell.item = item;
    return cell;
    
}

#pragma mark - <初始化操作>

- (void)setupTableView {
    self.tableView.backgroundColor = JoshTableViewBackgroundColor;
    [self.tableView registerClass:[JoshRecipeCell class] forCellReuseIdentifier:JoshRecipeCellID];
}

- (void)setupNaviBar {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"homepageCreateRecipeButton"] style:UIBarButtonItemStylePlain target:self action:@selector(createRecipes)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"buylistButtonImage"] style:UIBarButtonItemStylePlain target:self action:@selector(shoppingBasket)];
    self.navigationItem.titleView = [JoshSearchBar searchBarInitWithPlaceholder:@"搜索食物、菜谱"];
    [self.navigationItem.titleView resignFirstResponder];
}

- (void)setupRefresh {
//    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
//    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}


#pragma mark -<刷新>




#pragma mark - <加载数据>

- (void)loadNewData {
    [[AFHTTPSessionManager manager] GET:JoshKitchenCellURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        self.issuesArr = [JoshIssue mj_objectArrayWithKeyValuesArray:responseObject[@"content"][@"issues"]];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        JoshLog(@"加载首页数据失败");
    }];
}

- (void)loadMoreData {
#warning 修改一下获得数据结构
    [[AFHTTPSessionManager manager] GET:JoshKitchenCellMoreURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        self.issuesArr = [JoshIssue mj_objectArrayWithKeyValuesArray:responseObject[@"content"][@"issues"]];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        JoshLog(@"加载更多首页数据失败");
    }];
    
}

- (void)loadNavData {
    [[AFHTTPSessionManager manager] GET:JoshKitchenNavURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
       JoshNavContent *navContent = [JoshNavContent mj_objectWithKeyValues:responseObject[@"content"]];
        [self headerView];
        self.headerView.navContent = navContent;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        JoshLog(@"加载导航栏数据失败");
    }];
}

#pragma mark - <点击时间的处理>

- (NSString *)getDate {
    NSDate *date = [NSDate date];
    unsigned unitFlag = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear |NSCalendarUnitWeekday ;
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [cal components:unitFlag fromDate:date];
    NSString *currentDate = [NSString stringWithFormat:@"%ld月%ld日 ",(long)comps.month,(long)comps.day];
#warning 搞不出来星期几
    switch (comps.weekday) {
        case 1:
            [currentDate stringByAppendingString:@" ASDASD"];
            break;
        case 2:
             [currentDate stringByAppendingString:@" 星期二"];
            break;
        case 3:
             [currentDate stringByAppendingString:@" 星期三"];
            break;
        case 4:
             [currentDate stringByAppendingString:@" 星期四"];
            break;
        case 5:
             [currentDate stringByAppendingString:@" 星期五"];
            break;
        case 6:
             [currentDate stringByAppendingString:@" 星期六"];
            break;
        default:
             [currentDate stringByAppendingString:@" 星期天"];
            break;
    }
    JoshLog(@"%@",currentDate);
    return currentDate;
}


- (void)createRecipes {
    
}

- (void)shoppingBasket {
    
}

@end

//
//  JoshWelcomeHeaderView.m
//  JoshXiaChuFang
//
//  Created by JacksonWong on 2017/7/24.
//  Copyright © 2017年 JosephWong2. All rights reserved.
//

#import "JoshWelcomeHeaderView.h"
#import "JoshVeriticalButton.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "JoshKitchenNav.h"
#import <MJExtension.h>

@interface JoshWelcomeHeaderView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIView *navButtonView;
@property (nonatomic, strong) UIImageView *recipeTendencyView;
@property (nonatomic, strong) UIImageView *friendView;
@property (nonatomic, strong) UIPageControl *pageControll;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *mealsView;

@end

@implementation JoshWelcomeHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor backgoundColor];
        
        //headerView的组成为：按钮+本周流行菜谱 +好友分享 +三餐
        
        //创建导航按钮的父view
        UIView *navButtonView = [[UIView alloc] init];
        self.navButtonView = navButtonView;
        [self addSubview:_navButtonView];
        [_navButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.width.equalTo(self);
            make.height.equalTo(@(JoshWelcomePageNavButtonHeight));
        }];
        
        //本周流行菜谱
        UIImageView *recipeTendencyView = [[UIImageView alloc] init];
        self.recipeTendencyView = recipeTendencyView;
        [self addSubview:_recipeTendencyView];
        [_recipeTendencyView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(navButtonView.mas_bottom).offset(JoshNavGap);
            make.left.equalTo(self).offset(10);
            make.height.equalTo(@(JoshWelcomeTendencyViewHeight));
            make.width.equalTo(self).multipliedBy (0.5).offset(-5);
        }];
    
        //好友关注
        UIImageView *friendView = [[UIImageView alloc] init];
        self.friendView = friendView;
        [self addSubview:_friendView];
        [_friendView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(navButtonView.mas_bottom).offset(JoshNavGap);
            make.left.equalTo(self).offset(10);
            make.height.equalTo(@(JoshWelcomeTendencyViewHeight));
            make.width.equalTo(self).multipliedBy (0.5).offset(-5);
        }];
        
        //三餐导航
        UIView *mealsView = [[UIView alloc] init];
        self.mealsView = mealsView;
        [self addSubview:_mealsView];
        [_mealsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.equalTo(friendView).offset(JoshNavGap);
            make.height.equalTo(@(JoshWelcomeTendencyViewHeight));
            
        }];
        
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        self.scrollView = scrollView;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
        [_mealsView addSubview:_scrollView];
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_mealsView);
        }];
        
        //分页控制器
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        self.pageControll = pageControl;
        _pageControll.hidesForSinglePage = YES;
        _pageControll.pageIndicatorTintColor = [UIColor pageControllTintColor];
        _pageControll.currentPageIndicatorTintColor = [UIColor themeColor];
        self.pageControll = _pageControll;
        [_mealsView addSubview:_pageControll];
        [_pageControll mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_mealsView);
            make.bottom.equalTo(_mealsView).offset(-10);
                  }];
    }
    return self;
}


//设置headerView 上面的东西
- (void)setNavContent:(JoshNavContent *)navContent {
    _navContent = navContent;
    
    //设置顶部导航按钮
#warning 这个地方的图片不知道为什么设置不出来
    NSArray<JoshKitchenNav *> *navs = navContent.navs;
    for (int i = 0; i < navs.count; i ++) {
        JoshKitchenNav *kitchenNav = [JoshKitchenNav mj_objectWithKeyValues:navs[i]];
        
        
        CGFloat y = 0;
        CGFloat width = JoshKeyWindow.width / navs.count;
        CGFloat x = width * i;
        CGFloat height = JoshWelcomePageNavButtonHeight;
        JoshVeriticalButton *btn = [JoshVeriticalButton buttonWithImageURL:kitchenNav.picurl title:kitchenNav.name Target:self action:@selector(buttonDidClicked:)];
        btn.frame = CGRectMake(x, y, width, height);
       
        [self.navButtonView addSubview:btn];
    };
    
    //本周流行菜谱 和 查看好友并关注
#warning 抓不了数据
    [self.recipeTendencyView sd_setImageWithURL:[NSURL URLWithString:navContent.pop_recipe_picurl]];
    
    //早餐午餐晚餐
    
    
    
    
}


#pragma mark - <UIScollViewDelegate>
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat width = self.scrollView.width;
    //拉到一半的时候就要要换页了
    self.pageControll.currentPage = (scrollView.contentOffset.x + width * 0.5) / width;
}

#pragma mark - <按钮点击事件>

- (void)buttonDidClicked:(UIButton *)button {
    
}


@end

//
//  JoshConst.h
//  JoshXiaChuFang
//
//  Created by JacksonWong on 2017/7/24.
//  Copyright © 2017年 JosephWong2. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    JoshCellTemplateGoods = 1,           // 推广的商品
    JoshCellTemplateRecipe = 2,          // 菜谱
    JoshCellTemplateSharePics = 4,       // 分享作品的图片
    JoshCellTemplateDish = 5,            // 作品
    JoshCellTemplateWeeklyMagazine = 6 , // 周刊
    JoshCellTemplateDiscussion = 9,      // 讨论或者问答
    JoshCellTemplateAdvertisement = 10 , //广告
    JoshCellTemplateLeture = 11,         //教程
} JoshCellTemplate;


/** 下厨房欢迎页面顶部导航按钮的高度*/
UIKIT_EXTERN NSInteger const JoshWelcomePageNavButtonHeight;

/** 顶部导航部件的间距*/
UIKIT_EXTERN NSInteger const JoshNavGap;

/** 本周流行菜谱的高度*/
UIKIT_EXTERN NSInteger const JoshWelcomeTendencyViewHeight;

/** 下厨房 - tableView - headerForSection 高度*/
UIKIT_EXTERN NSInteger const JoshWelcomeHeaderForSectionHeight;

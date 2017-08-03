//
//  JoshRecipeCell.m
//  JoshXiaChuFang
//
//  Created by JacksonWong on 2017/7/31.
//  Copyright © 2017年 JosephWong2. All rights reserved.
//

#import "JoshRecipeCell.h"

@interface JoshRecipeCell()


/**作品的照片*/
@property (strong, nonatomic)UIImageView *recipeImage;

@property (strong, nonatomic)UILabel *title;
@property (strong, nonatomic)UILabel *imgTitle;
@property (strong, nonatomic)UILabel *imgSubTitle;
@property (strong, nonatomic)UILabel *desc;
@property (strong, nonatomic)UIImageView *authorIcon;
@property (strong, nonatomic)UILabel *authorName;
@property (strong, nonatomic)UILabel *recipeInfo;
@property (strong, nonatomic)UILabel *subTitle;

@end

@implementation JoshRecipeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier  {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.origin = CGPointMake(10, 10);
    self.backgroundColor = [UIColor redColor];
    //图片
    
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

//- (void)setItem:(JoshDishItem *)item {
//    self.item = item;
//}

@end

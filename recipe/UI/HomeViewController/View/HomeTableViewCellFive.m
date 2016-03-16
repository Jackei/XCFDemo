//
//  HomeTableViewCellFive.m
//  recipe
//
//  Created by qizhijian on 16/3/16.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import "HomeTableViewCellFive.h"
#import "UIImageView+AddCorner.h"

@implementation HomeTableViewCellFive

- (void)fillData:(id)objc
{
    HomeContentIssuesDetailInfo *info = (HomeContentIssuesDetailInfo *)objc;
    
    CGFloat height = Screen_Width / [info.contents.image.width floatValue] * [info.contents.image.height floatValue];
    _imageHeightConstant.constant = (int)height;
    [self setNeedsUpdateConstraints];
    
    NSString *str = info.contents.image.url;
    [_backImageView sd_setImageWithURL:[NSURL URLWithString:str]];
    
    [_userHeaderImageView sd_setImageWithURL:[NSURL URLWithString:info.contents.author.photo] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [_userHeaderImageView addCornerWithRadious:50];
    }];
    
    _titleLabel.text = info.contents.title;
    _subLabel.text = info.contents.desc;
    _scoreLabel.text = [NSString stringWithFormat:@"%.1f分·%@人做过",[info.contents.score floatValue],info.contents.n_cooked];
    _nameLabel.text = info.contents.author.name;
}

@end

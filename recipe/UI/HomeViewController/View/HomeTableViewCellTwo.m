//
//  HomeTableViewCellTwo.m
//  recipe
//
//  Created by qizhijian on 16/3/16.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import "HomeTableViewCellTwo.h"

@implementation HomeTableViewCellTwo

- (void)fillData:(id)objc
{
    HomeContentIssuesDetailInfo *info = (HomeContentIssuesDetailInfo *)objc;
    
    CGFloat height = Screen_Width / [info.contents.image.width floatValue] * [info.contents.image.height floatValue];
    _constant.constant = (int)height;
    [self setNeedsUpdateConstraints];
    
    NSString *str = info.contents.image.url;
    [_backImageView sd_setImageWithURL:[NSURL URLWithString:str]];
    _titleLabel.text = info.contents.title_1st;
    _subLabel.text = info.contents.title_2nd;
}

@end

//
//  HomeTableViewCellThree.m
//  recipe
//
//  Created by qizhijian on 16/3/16.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import "HomeTableViewCellThree.h"

@implementation HomeTableViewCellThree

- (void)fillData:(id)objc
{
    HomeContentIssuesDetailInfo *info = (HomeContentIssuesDetailInfo *)objc;
    NSString *str = info.contents.image.url;
    [_backImageView sd_setImageWithURL:[NSURL URLWithString:str]];
    
    CGFloat height = Screen_Width / [info.contents.image.width floatValue] * [info.contents.image.height floatValue];
    _constant.constant = (int)height;
    [self setNeedsUpdateConstraints];
}

@end

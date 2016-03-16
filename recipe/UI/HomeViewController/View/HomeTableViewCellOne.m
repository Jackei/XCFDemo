//
//  HomeTableViewCellOne.m
//  recipe
//
//  Created by qizhijian on 16/3/16.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import "HomeTableViewCellOne.h"

@implementation HomeTableViewCellOne

- (void)fillData:(id)objc
{
    HomeContentIssuesDetailInfo *info = (HomeContentIssuesDetailInfo *)objc;
    NSString *str = info.contents.image.url;
    [_backImageView sd_setImageWithURL:[NSURL URLWithString:str]];
    _titleLabel.text = info.contents.title;
    _subLabel.text = info.contents.desc;
}

@end

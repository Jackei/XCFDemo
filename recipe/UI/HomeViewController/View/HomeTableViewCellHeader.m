//
//  HomeTableViewCellHeader.m
//  recipe
//
//  Created by qizhijian on 16/3/16.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import "HomeTableViewCellHeader.h"

@implementation HomeTableViewCellHeader

- (void)fillData:(id)objc
{
    HomeContentIssuesInfo *info = (HomeContentIssuesInfo *)objc;
    _titleLabel.text = info.title;
}

@end

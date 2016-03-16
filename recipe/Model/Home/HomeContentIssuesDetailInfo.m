//
//  HomeContentIssuesDetailInfo.m
//  recipe
//
//  Created by qizhijian on 16/3/16.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import "HomeContentIssuesDetailInfo.h"

@implementation HomeContentIssuesDetailInfo

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"template":@"detailTemplate",@"id":@"detailID"}];
}

@end

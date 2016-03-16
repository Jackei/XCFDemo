//
//  HomeContentIssuesDetailContentAuthorInfo.m
//  recipe
//
//  Created by qizhijian on 16/3/16.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import "HomeContentIssuesDetailContentAuthorInfo.h"

@implementation HomeContentIssuesDetailContentAuthorInfo

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"authorID"}];
}

@end

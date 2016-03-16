//
//  HomeContentIssuesInfo.h
//  recipe
//
//  Created by qizhijian on 16/3/16.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "HomeContentIssuesDetailInfo.h"

@protocol HomeContentIssuesInfo
@end

@interface HomeContentIssuesInfo : JSONModel

@property (nonatomic,strong) NSString <Optional>*items_count;
@property (nonatomic,strong) NSString <Optional>*title;
@property (nonatomic,strong) NSMutableArray <Optional,HomeContentIssuesDetailInfo>*items;

@end

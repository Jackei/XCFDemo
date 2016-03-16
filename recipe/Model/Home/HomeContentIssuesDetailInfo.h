//
//  HomeContentIssuesDetailInfo.h
//  recipe
//
//  Created by qizhijian on 16/3/16.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "HomeContentIssuesDetailContentInfo.h"

@protocol HomeContentIssuesDetailInfo
@end

@interface HomeContentIssuesDetailInfo : JSONModel

@property (nonatomic,strong) NSString <Optional>*publish_time;
@property (nonatomic,strong) NSString <Optional>*url;
@property (nonatomic,strong) NSString <Optional>*detailTemplate;
@property (nonatomic,strong) NSString <Optional>*detailID;
@property (nonatomic,strong) HomeContentIssuesDetailContentInfo <Optional>*contents;

@end

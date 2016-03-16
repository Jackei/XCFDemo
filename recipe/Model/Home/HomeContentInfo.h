//
//  HomeContentInfo.h
//  recipe
//
//  Created by qizhijian on 16/3/16.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "HomeContentCursorInfo.h"
#import "HomeContentIssuesInfo.h"

@interface HomeContentInfo : JSONModel

@property (nonatomic,strong) HomeContentCursorInfo <Optional>*cursor;
@property (nonatomic,strong) NSString <Optional>*count;
@property (nonatomic,strong) NSMutableArray <Optional,HomeContentIssuesInfo>*issues;

@end

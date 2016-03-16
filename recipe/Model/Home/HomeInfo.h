//
//  HomeInfo.h
//  recipe
//
//  Created by qizhijian on 16/3/16.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "HomeContentInfo.h"

@interface HomeInfo : JSONModel

@property (nonatomic,strong) NSString <Optional>*status;
@property (nonatomic,strong) HomeContentInfo <Optional>*content;

@end

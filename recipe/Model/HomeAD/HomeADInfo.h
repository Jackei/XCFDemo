//
//  HomeADInfo.h
//  recipe
//
//  Created by qizhijian on 16/3/17.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "HomeADDetailInfo.h"

@interface HomeADInfo : JSONModel

@property (nonatomic,strong) NSString <Optional>*status;
@property (nonatomic,strong) HomeADDetailInfo <Optional>*content;

@end

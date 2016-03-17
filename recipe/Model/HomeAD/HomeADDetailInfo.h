//
//  HomeADDetailInfo.h
//  recipe
//
//  Created by qizhijian on 16/3/17.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "HomeADDetailadInfo.h"

@interface HomeADDetailInfo : JSONModel

@property (nonatomic,strong) NSString <Optional>*start_time;
@property (nonatomic,strong) NSString <Optional>*ad_type;
@property (nonatomic,strong) NSString <Optional>*expose_tracking_url;
@property (nonatomic,strong) NSString <Optional>*end_time;
@property (nonatomic,strong) NSString <Optional>*click_tracking_url;
@property (nonatomic,strong) HomeADDetailadInfo <Optional>*ad_info;


@end

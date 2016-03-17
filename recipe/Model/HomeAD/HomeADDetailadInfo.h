//
//  HomeADDetailadInfo.h
//  recipe
//
//  Created by qizhijian on 16/3/17.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "HomeContentIssuesDetailContentImageInfo.h"

@interface HomeADDetailadInfo : JSONModel

@property (nonatomic,strong) NSString <Optional>*url;
@property (nonatomic,strong) HomeContentIssuesDetailContentImageInfo <Optional>*image;
@property (nonatomic,strong) NSString <Optional>*pic_url;


@end

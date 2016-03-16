//
//  HomeContentIssuesDetailContentInfo.h
//  recipe
//
//  Created by qizhijian on 16/3/16.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "HomeContentIssuesDetailContentImageInfo.h"
#import "HomeContentIssuesDetailContentAuthorInfo.h"

@interface HomeContentIssuesDetailContentInfo : JSONModel

@property (nonatomic,strong) NSString <Optional>*title_2nd;
@property (nonatomic,strong) NSString <Optional>*title_1st;
@property (nonatomic,strong) NSString <Optional>*column_name;
@property (nonatomic,strong) NSString <Optional>*video_url;
@property (nonatomic,strong) NSString <Optional>*title;
@property (nonatomic,strong) NSString <Optional>*n_cooked;
@property (nonatomic,strong) NSString <Optional>*n_dishes;
@property (nonatomic,strong) NSString <Optional>*score;
@property (nonatomic,strong) NSString <Optional>*recipe_id;
@property (nonatomic,strong) NSString <Optional>*desc;
@property (nonatomic,strong) NSString <Optional>*whisper;
@property (nonatomic,strong) HomeContentIssuesDetailContentAuthorInfo <Optional>*author;
@property (nonatomic,strong) HomeContentIssuesDetailContentImageInfo <Optional>*image;


@end

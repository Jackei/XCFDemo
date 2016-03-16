//
//  HomeContentCursorInfo.h
//  recipe
//
//  Created by qizhijian on 16/3/16.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface HomeContentCursorInfo : JSONModel

@property (nonatomic,strong) NSString <Optional>*has_next;
@property (nonatomic,strong) NSString <Optional>*has_prev;
@property (nonatomic,strong) NSString <Optional>*prev;
@property (nonatomic,strong) NSString <Optional>*next;

@end

//
//  QSMetatadaUrlProvider.h
//  QSNetworkRequest
//
//  Created by qizhijian on 15/9/23.
//  Copyright © 2015年 qizhijian. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol QSMetadataUrlProvider <NSObject>

@end

@interface QSMetadataUrlProvider : NSObject

@property (nonatomic,strong) NSDictionary *mappings;

@end

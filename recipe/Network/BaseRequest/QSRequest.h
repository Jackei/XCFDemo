//
//  QSRequest.h
//  QSNetworkRequest
//
//  Created by qizhijian on 15/9/23.
//  Copyright © 2015年 qizhijian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QSRequest : NSObject

+ (instancetype)sharedClient;

- (void)requestWithName:(NSString *)urlName withParameters:(NSMutableDictionary *)dict successCallBack:(void(^)(id))successCallback failCallback:(void(^)(NSString *))failCallback;

@end

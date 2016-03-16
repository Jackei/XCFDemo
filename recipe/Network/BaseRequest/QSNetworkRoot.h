//
//  QSNerworkRoot.h
//  QSNetworkRequest
//
//  Created by qizhijian on 15/9/23.
//  Copyright © 2015年 qizhijian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QSNetworkMethod;

@interface QSNetworkRoot : NSObject

+ (QSNetworkMethod *)findMethod:(NSString *)methodName;

@end

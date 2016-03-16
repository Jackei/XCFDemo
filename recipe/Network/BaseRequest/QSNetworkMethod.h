//
//  QSNetworkMethod.h
//  QSNetworkRequest
//
//  Created by qizhijian on 15/9/23.
//  Copyright © 2015年 qizhijian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QSNetworkMethod : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *url;
@property (nonatomic,strong) NSString *method;
@property (nonatomic,strong) NSString *message;
@property (nonatomic) int timeout;
@property (nonatomic,strong) NSString *returnType;
@property (nonatomic,strong) NSString *timeoutMessage;
@property (nonatomic,strong) NSString *fallbackMessage;

@end

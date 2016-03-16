//
//  QSRequest.m
//  QSNetworkRequest
//
//  Created by qizhijian on 15/9/23.
//  Copyright © 2015年 qizhijian. All rights reserved.
//

#import "QSRequest.h"
#import "QSNetworkRoot.h"
#import "QSNetworkMethod.h"
#import "AFHTTPSessionManager.h"

static AFHTTPSessionManager *manager = nil;

@implementation QSRequest

+ (instancetype)sharedClient
{
    static QSRequest *r = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        r = [[QSRequest alloc] init];
    });
    
    return r;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        manager = [AFHTTPSessionManager manager];
        AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
        manager.requestSerializer = serializer;
    }
    return self;
}

- (void)requestWithName:(NSString *)urlName withParameters:(NSMutableDictionary *)dict successCallBack:(void(^)(id))successCallback failCallback:(void(^)(NSString *))failCallback
{
    QSNetworkMethod *m = [QSNetworkRoot findMethod:urlName];
    
    manager.requestSerializer.timeoutInterval = m.timeout;
    
    if ([m.method isEqualToString:@"GET"])
    {
        [manager GET:m.url parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            Class cla = NSClassFromString(m.returnType);
            id object = [(JSONModel *)[cla alloc] initWithDictionary:responseObject error:nil];
            successCallback(object);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            failCallback(m.fallbackMessage);
            
        }];
    }
    else if ([m.method isEqualToString:@"POST"])
    {
        // do POST
        
//        [manager POST:m.url parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
//            
//            Class cla = NSClassFromString(method.returnType);
//            id object = [(JSONModel *)[cla alloc] initWithDictionary:responseObject error:nil];
//            successCallback(object);
//            
//        } failure:^(NSURLSessionDataTask *task, NSError *error) {
//            
//            failCallback(m.fallbackMessage);
//            
//        }];
    }
}

@end

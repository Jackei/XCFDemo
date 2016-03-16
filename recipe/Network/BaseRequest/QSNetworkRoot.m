//
//  QSNerworkRoot.m
//  QSNetworkRequest
//
//  Created by qizhijian on 15/9/23.
//  Copyright © 2015年 qizhijian. All rights reserved.
//

#import "QSNetworkRoot.h"
#import "QSMetadataUrlProvider.h"
#import "QSNetworkMethod.h"
#import "TBXML.h"

static NSMutableDictionary *methods;
static id <QSMetadataUrlProvider> _urlProvider;

@implementation QSNetworkRoot

+ (void)load
{
    [QSNetworkRoot loadNetWorkMethod];
}

+ (void)loadNetWorkMethod
{
    NSError *error;
    TBXML *root = [TBXML tbxmlWithXMLFile:@"NetworkMetadata.xml" error:&error];
    
    TBXMLElement *rootElement = root.rootXMLElement;
    
    _urlProvider = (id<QSMetadataUrlProvider>)[[NSClassFromString([TBXML valueOfAttributeNamed:@"UrlProvider" forElement:rootElement]) alloc] init];

    NSString *httpMethod;
    NSString *message;
    int timeout = 0;
    NSString *timeoutMessage;
    NSString *fallbackMessage;
    
    if (rootElement)
    {
        TBXMLElement *defaults = [TBXML childElementNamed:@"Defaults" parentElement:rootElement];
        if (defaults)
        {
            httpMethod = [TBXML valueOfAttributeNamed:@"Method" forElement:defaults];
            message = [TBXML valueOfAttributeNamed:@"Message" forElement:defaults];
            timeout = [[TBXML valueOfAttributeNamed:@"Timeout" forElement:defaults] intValue];
            timeoutMessage = [TBXML valueOfAttributeNamed:@"TimeoutMessage" forElement:defaults];
            fallbackMessage = [TBXML valueOfAttributeNamed:@"FallbackMessage" forElement:defaults];
        }
    }
    
    if ([[_urlProvider class] isSubclassOfClass:[QSMetadataUrlProvider class]])
    {
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        
        TBXMLElement *urls = [TBXML childElementNamed:@"Urls" parentElement:rootElement];
        
        TBXMLElement *url = urls->firstChild;
        
        while (url) {
            
            [dict setObject:[NSString stringWithCString:url->text encoding:NSUTF8StringEncoding] forKey:[TBXML valueOfAttributeNamed:@"Name" forElement:url]];
            
            url = url->nextSibling;
            
        }
        
        ((QSMetadataUrlProvider *)_urlProvider).mappings = dict;
    }
    
    methods = [[NSMutableDictionary alloc] init];
    
    TBXMLElement *ServiceMethods = [TBXML childElementNamed:@"ServiceMethods" parentElement:rootElement];
    
    TBXMLElement *serviceMethod = ServiceMethods->firstChild;
    
    while (serviceMethod) {
        
        QSNetworkMethod *method = [[QSNetworkMethod alloc] init];
        
        method.name = [TBXML valueOfAttributeNamed:@"UrlDomain" forElement:serviceMethod];
        
        method.method = [TBXML valueOfAttributeNamed:@"Method" forElement:serviceMethod]?[TBXML valueOfAttributeNamed:@"Method" forElement:serviceMethod]:httpMethod;
        
        method.message = [TBXML valueOfAttributeNamed:@"Message" forElement:serviceMethod] ? [TBXML valueOfAttributeNamed:@"Message" forElement:serviceMethod] : message;
        
        method.timeout = [[TBXML valueOfAttributeNamed:@"Timeout" forElement:serviceMethod] intValue] ? [[TBXML valueOfAttributeNamed:@"Timeout" forElement:serviceMethod] intValue] : timeout;
        
        method.returnType = [TBXML valueOfAttributeNamed:@"ReturnType" forElement:serviceMethod];
        
        method.timeoutMessage = [TBXML valueOfAttributeNamed:@"TimeoutMessage" forElement:serviceMethod] ? [TBXML valueOfAttributeNamed:@"TimeoutMessage" forElement:serviceMethod] : timeoutMessage;
        
        method.fallbackMessage = [TBXML valueOfAttributeNamed:@"FallbackMessage" forElement:serviceMethod] ? [TBXML valueOfAttributeNamed:@"FallbackMessage" forElement:serviceMethod] : fallbackMessage;
        
        method.url = [NSString stringWithFormat:@"%@%@",[((QSMetadataUrlProvider *)_urlProvider).mappings objectForKey:[TBXML valueOfAttributeNamed:@"Url" forElement:serviceMethod]],[TBXML valueOfAttributeNamed:@"UrlDomain" forElement:serviceMethod]];
        
        [methods setObject:method forKey:method.name];
        
        serviceMethod = serviceMethod->nextSibling;
    }
}

+ (QSNetworkMethod *)findMethod:(NSString *)methodName
{
    return [methods objectForKey:methodName];
}

@end

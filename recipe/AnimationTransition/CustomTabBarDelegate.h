//
//  CustomTabBarTransition.h
//  recipe
//
//  Created by qizhijian on 16/3/18.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomTabBarDelegate : NSObject <UITabBarControllerDelegate>

@property (nonatomic,assign) BOOL interactive;
@property (nonatomic,strong)     UIPercentDrivenInteractiveTransition *interactionController;

@end

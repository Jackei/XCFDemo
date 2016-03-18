//
//  CustomTabBarAnimationTransition.h
//  recipe
//
//  Created by qizhijian on 16/3/18.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, TabOperationDirection) {
    TabOperationDirectionLeft,
    TabOperationDirectionRight,
};

typedef NS_ENUM(NSUInteger, ModalOperation) {
    ModalOperationPresentation,
    ModalOperationDismissal
};

@class SDETransitionType;

@interface CustomTabBarAnimationTransition : NSObject <UIViewControllerAnimatedTransitioning>

- (id)initWithSDETransitionType:(SDETransitionType *)type;

@end

@interface SDETransitionType : NSObject

- (id)initWithTabOperation:(TabOperationDirection)direction;

@end



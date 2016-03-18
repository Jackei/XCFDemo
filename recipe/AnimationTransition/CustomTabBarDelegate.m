//
//  CustomTabBarTransition.m
//  recipe
//
//  Created by qizhijian on 16/3/18.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import "CustomTabBarDelegate.h"
#import "CustomTabBarAnimationTransition.h"

@implementation CustomTabBarDelegate

- (id)init
{
    self = [super init];
    if (self)
    {
        self.interactionController = [[UIPercentDrivenInteractiveTransition alloc] init];
    }
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    NSInteger fromIndex = [tabBarController.viewControllers indexOfObject:fromVC];
    NSInteger toIndex = [tabBarController.viewControllers indexOfObject:toVC];
    TabOperationDirection direction = toIndex < fromIndex ? TabOperationDirectionLeft : TabOperationDirectionRight;
    SDETransitionType *type = [[SDETransitionType alloc] initWithTabOperation:direction];
    CustomTabBarAnimationTransition *animaiton = [[CustomTabBarAnimationTransition alloc] initWithSDETransitionType:type];
    return animaiton;
}

- (id<UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return self.interactive ? self.interactionController : nil;
}

@end

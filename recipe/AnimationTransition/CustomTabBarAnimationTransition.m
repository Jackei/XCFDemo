//
//  CustomTabBarAnimationTransition.m
//  recipe
//
//  Created by qizhijian on 16/3/18.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import "CustomTabBarAnimationTransition.h"

@interface SDETransitionType ()

@property (nonatomic,assign) UINavigationControllerOperation operation;
@property (nonatomic,assign) TabOperationDirection direction;
@property (nonatomic,assign) ModalOperation modalOperation;

@end

@implementation SDETransitionType

- (id)initWithTabOperation:(TabOperationDirection)direction
{
    self = [super init];
    if (self)
    {
        self.direction = direction;
    }
    return self;
}
//
//- (id)initWithControllerOperation:(UINavigationControllerOperation)operation withTabOperation:(TabOperationDirection)direction withModalOperation:(ModalOperation)modalOperation
//{
//
//}

@end

@interface CustomTabBarAnimationTransition ()

@property (nonatomic,strong) SDETransitionType *transitionType;

@end

@implementation CustomTabBarAnimationTransition

- (id)initWithSDETransitionType:(SDETransitionType *)type
{
    self = [super init];
    if (self)
    {
        self.transitionType = type;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;

    
    CGFloat translation = [transitionContext containerView].frame.size.width;
    CGAffineTransform toViewTransform = CGAffineTransformIdentity;
    CGAffineTransform fromViewTransform = CGAffineTransformIdentity;

//    translation = self.transitionType.operation == UINavigationControllerOperationPush ? translation : -translation;
//    toViewTransform = CGAffineTransformMakeTranslation(translation,0);
//    fromViewTransform = CGAffineTransformMakeTranslation(-translation, 0);
    
    translation = self.transitionType.direction == TabOperationDirectionLeft ? translation : -translation;
    fromViewTransform = CGAffineTransformMakeTranslation(translation, 0);
    toViewTransform = CGAffineTransformMakeTranslation(-translation, 0);
    
//    translation =  [transitionContext containerView].frame.size.height;
//    toViewTransform = CGAffineTransformMakeTranslation(0, (self.transitionType.modalOperation == ModalOperationPresentation ? translation : 0));
//    fromViewTransform = CGAffineTransformMakeTranslation(0, (self.transitionType.modalOperation == ModalOperationPresentation ? 0 : translation));

    if (self.transitionType.modalOperation == ModalOperationDismissal)
    {
        
    }
    else
    {
        [[transitionContext containerView] addSubview:toView];
    }
    
    toView.transform = toViewTransform;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        fromView.transform = fromViewTransform;
        toView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
        fromView.transform = CGAffineTransformIdentity;
        toView.transform = CGAffineTransformIdentity;
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];

    }];
}

@end

//
//  CustomTabBarController.m
//  HuiJiaYou
//
//  Created by qizhijian on 16/3/11.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import "CustomTabBarController.h"
#import "CustomTabBarDelegate.h"

@interface CustomTabBarController ()

@property (nonatomic,strong) UIPanGestureRecognizer *panGesture;
@property (nonatomic,strong) CustomTabBarDelegate *tabBarDelegate;
@property (nonatomic) NSInteger subViewControllerCount;

@end

@implementation CustomTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpBaseViewController];
}

- (void)setUpBaseViewController
{
    self.subViewControllerCount = self.viewControllers.count;
    
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:self.panGesture];
    
    self.tabBarDelegate = [[CustomTabBarDelegate alloc] init];
    self.delegate = self.tabBarDelegate;
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: RGB_COLOR(kWord_Color_Event)} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: RGB_COLOR(k_Button_Color)} forState:UIControlStateSelected];
}

- (void)handlePan:(UIPanGestureRecognizer *)pan
{
    CGFloat translationX = [pan translationInView:self.view].x;
    CGFloat translationABS = translationX > 0 ? translationX : -translationX;
    CGFloat progress = translationABS / self.view.frame.size.width;
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.tabBarDelegate.interactive = true;
            CGFloat velocityX = [pan velocityInView:self.view].x;
            if (velocityX < 0) {
                if (self.selectedIndex < self.subViewControllerCount - 1)
                {
                    self.selectedIndex += 1;
                }
            } else {
                if (self.selectedIndex > 0)
                {
                    self.selectedIndex -= 1;
                }
            }
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            [self.tabBarDelegate.interactionController updateInteractiveTransition:progress];
        }
            break;
        case UIGestureRecognizerStateCancelled:
        {
            if (progress > 0.3 ) {
                self.tabBarDelegate.interactionController.completionSpeed = 0.99;
                [self.tabBarDelegate.interactionController finishInteractiveTransition];
            } else {
                self.tabBarDelegate.interactionController.completionSpeed = 0.99;
                [self.tabBarDelegate.interactionController cancelInteractiveTransition];
            }
            self.tabBarDelegate.interactive = NO;
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            if (progress > 0.3 ) {
                self.tabBarDelegate.interactionController.completionSpeed = 0.99;
                [self.tabBarDelegate.interactionController finishInteractiveTransition];
            } else {
                self.tabBarDelegate.interactionController.completionSpeed = 0.99;
                [self.tabBarDelegate.interactionController cancelInteractiveTransition];
            }
            self.tabBarDelegate.interactive = NO;
        }
            break;
        default:
            break;
    }
}

@end

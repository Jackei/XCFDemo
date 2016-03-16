//
//  CustomTabBarController.m
//  HuiJiaYou
//
//  Created by qizhijian on 16/3/11.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import "CustomTabBarController.h"

@interface CustomTabBarController ()

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
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: RGB_COLOR(kWord_Color_Event)} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: RGB_COLOR(k_Button_Color)} forState:UIControlStateSelected];
}

@end

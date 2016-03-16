//
//  BaseViewController.m
//  HuiJiaYou
//
//  Created by qizhijian on 16/3/11.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self configUI];
}

- (void)configUI
{
    self.customNav = [[CustomNavigationView alloc] initWithFrame:CGRectMake(0, 0, [CustomNavigationView barSize].width, [CustomNavigationView barSize].height)];
    self.customNav.VC = self;
    self.customNav.delegate = self;
    
    if (self.navigationController.viewControllers.count == 1)
    {
        [self.customNav setBackNavButton:nil];
    }
    [self.view addSubview:self.customNav];
    
    self.view.backgroundColor = RGB_COLOR(k_ViewBack_Color);
}

- (void)backBtnClick
{
    
}

@end

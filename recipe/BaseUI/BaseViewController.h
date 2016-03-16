//
//  BaseViewController.h
//  HuiJiaYou
//
//  Created by qizhijian on 16/3/11.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomNavigationView.h"

@interface BaseViewController : UIViewController <CustomNavigationViewDelegate>

@property (nonatomic,strong) UIView *kuView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *kuImage;
@property (nonatomic,strong) CustomNavigationView *customNav;

@end

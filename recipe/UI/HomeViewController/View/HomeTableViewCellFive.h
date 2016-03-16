//
//  HomeTableViewCellFive.h
//  recipe
//
//  Created by qizhijian on 16/3/16.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeTableViewCellBase.h"

@interface HomeTableViewCellFive : HomeTableViewCellBase

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeightConstant;
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak, nonatomic) IBOutlet UIImageView *userHeaderImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

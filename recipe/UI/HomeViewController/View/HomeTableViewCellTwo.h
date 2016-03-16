//
//  HomeTableViewCellTwo.h
//  recipe
//
//  Created by qizhijian on 16/3/16.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeTableViewCellBase.h"

@interface HomeTableViewCellTwo : HomeTableViewCellBase

@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constant;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;

@end

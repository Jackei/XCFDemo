//
//  UIImageView.m
//  recipe
//
//  Created by qizhijian on 16/3/16.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import "UIImageView+AddCorner.h"
#import "UIImage+AddCorner.h"

@implementation UIImageView(AddCorner)

- (void)addCornerWithRadious:(CGFloat)radious
{
    self.image = [self.image addCornerWithRadious:radious withImageSize:self.image.size];
}

@end

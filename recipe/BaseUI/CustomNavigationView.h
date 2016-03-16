//
//  CustomNavigationView.h
//  HuiJiaYou
//
//  Created by qizhijian on 16/3/11.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomNavigationViewDelegate <NSObject>

- (void)backBtnClick;

@end

@interface CustomNavigationView : UIView

@property (nonatomic, strong) UIButton *leftButton;

@property (nonatomic, strong) UIButton *rightButton;

@property (nonatomic,weak)    UIViewController *VC;

@property (nonatomic,strong)  UIColor *currentVCColor;

@property (nonatomic,assign)  CGFloat imageAlpha;

@property (nonatomic,assign)  BOOL bottomViewHidden;

@property (nonatomic, strong) UIButton *backButton;

@property (nonatomic,assign)  BOOL isHiddenCover;

@property (nonatomic,weak)    id <CustomNavigationViewDelegate>delegate;

+ (CGRect)rightBtnFrame;
+ (CGSize)barBtnSize;
+ (CGSize)barSize;
+ (CGRect)titleViewFrame;

/**
 * 使用title创建一个导航条按钮
 */
+ (UIButton *)createNavButttonByTitle:(NSString *)strTitle target:(id)target action:(SEL)action;

/**
 * 使用自定义图片创建一个导航条按钮
 */
+ (UIButton *)createNavButtonByImageNormal:(NSString *)strNormal imageSelected:(NSString *)strSelected target:(id)target action:(SEL)action;

/**
 * 使用自定义按钮和标题替换默认内容
 */
- (void)setBackNavButton:(UIButton *)butt;
- (void)setBackNavButtonImage:(UIImage *)image;
- (void)setRightNavButton:(UIButton *)butt;
- (void)setRightNavButtonImage:(UIImage *)image;
- (void)setNavTitle:(NSString *)strTitle;
- (void)setRightNavTwoButtonLeftButton:(UIButton *)leftbutt rightButton:(UIButton *)rightButt;

/**
 *在导航条上覆盖一层自定义视图。example：搜索框..
 */
- (void)showCoverView:(UIView *)view;
- (void)showCoverView:(UIView *)view animation:(BOOL)isAnimation;
- (void)showCoverViewOnTitleView:(UIView *)view;
- (void)hideCoverView:(UIView *)view;

- (NSString *)titleText;

@end

//
//  CustomNavigationView.m
//  HuiJiaYou
//
//  Created by qizhijian on 16/3/11.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import "CustomNavigationView.h"

static CGFloat kEndPoint = 1.5;

@interface CustomNavigationView ()
{
    UIView *_bottomView;
}

@property (nonatomic, strong, readonly) UIImageView *bgImageView;

@property (nonatomic, strong, readonly) UILabel *titleLabel;

@property (nonatomic, assign, readonly) BOOL isBlur;

@end

@implementation CustomNavigationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self uiConfig];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self uiConfig];
}

- (void)uiConfig
{
    _backButton = [[self class] createNavButtonByImageNormal:@"backImage" imageSelected:@"backImage" target:self action:@selector(backButtonClicked:)];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:20.0f];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    
    _bgImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    UIImage *bgImage  = [self imageWithColor:[UIColor whiteColor]];
    _bgImageView.image = [bgImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    _bgImageView.alpha = 0.95f;
    
    if (_isBlur) {
        _bgImageView.alpha = 0.0f;
        UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:self.bounds];
        [self addSubview:navBar];
    }
    
    _titleLabel.frame = [[self class] titleViewFrame];
    _bgImageView.frame = self.bounds;
    
    [self addSubview:_bgImageView];
    [self addSubview:_titleLabel];
    
    [self setDefaultNavButton:_backButton];
    _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, _bgImageView.bounds.size.height - 0.5f, [[self class] barSize].width, 0.5f)];
    _bottomView.backgroundColor = RGB_COLOR(k_TraceLine_Color);
    _bottomView.alpha = 0.6f;
    [_bgImageView addSubview:_bottomView];
}

- (void)backButtonClicked:(id)sender
{
    if (self.VC)
    {
        [self.VC.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        if ([self.delegate respondsToSelector:@selector(backBtnClick)]) {
            [self.delegate backBtnClick];
        }
    }
}

+ (CGSize)screenSize
{
    return [UIScreen mainScreen].bounds.size;
}

+ (CGRect)rightBtnFrame
{
    return CGRectMake([[self class] barSize].width - [[self class] barBtnSize].width - 10, 22.0f, [[self class] barBtnSize].width, [[self class] barBtnSize].height);
}

+ (CGRect)leftBtnFrame
{
    return CGRectMake([[self class] barSize].width - 2 * [[self class] barBtnSize].width - 20, 22.0f, [[self class] barBtnSize].width, [[self class] barBtnSize].height);
}

+ (CGSize)barBtnSize
{
    return CGSizeMake(40.0f, 40.0f);
}

+ (CGSize)barSize
{
    return CGSizeMake([self screenSize].width, 64.0f);
}

+ (CGRect)titleViewFrame
{
    return CGRectMake([[self class] barBtnSize].width + 5.0f, 22.0f, [[self class] barSize].width - 2 * [[self class] barBtnSize].width - 10.0f, 40.0f);
}

/**
 *使用title创建一个导航条按钮
 */
+ (UIButton *)createNavButttonByTitle:(NSString *)strTitle target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:strTitle forState:UIControlStateNormal];
    [button setTintColor:RGB_COLOR(kWord_Color_High)];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    return button;
}

/**
 *使用自定义图片创建一个导航条按钮
 */
+ (UIButton *)createNavButtonByImageNormal:(NSString *)strNormal imageSelected:(NSString *)strSelected target:(id)target action:(SEL)action
{
    UIImage *imageNormal = [UIImage imageNamed:strNormal];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setImage:imageNormal forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:(strSelected ? strSelected : strNormal)] forState:UIControlStateSelected];
    
    CGFloat leftInset = ([[self class] barBtnSize].width - imageNormal.size.width) / 2.0f;
    CGFloat topInset = ([[self class] barBtnSize].height - imageNormal.size.height) / 2.0f;
    leftInset = (leftInset >= 2.0f) ? leftInset / 2.0f : 0.0f;
    topInset = (topInset >= 2.0f) ? topInset / 2.0f : 0.0f;
    [button setImageEdgeInsets:UIEdgeInsetsMake(topInset, leftInset, topInset, leftInset)];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(topInset, -imageNormal.size.width, topInset, leftInset)];
    return button;
}

/**
 *使用自定义按钮和标题替换默认内容
 */
- (void)setBackNavButton:(UIButton *)butt
{
    if (_backButton)
    {
        [_backButton removeFromSuperview];
        _backButton = nil;
    }
    _backButton = butt;
    if (_backButton)
    {
        _backButton.frame = CGRectMake(10.0f, 22.0f, [[self class] barBtnSize].width, [[self class] barBtnSize].height);
        [self addSubview:_backButton];
    }
}

- (void)setDefaultNavButton:(UIButton *)butt
{
    if (_backButton)
    {
        [_backButton removeFromSuperview];
        _backButton = nil;
    }
    _backButton = butt;
    if (_backButton)
    {
        _backButton.frame = CGRectMake(0.0f, 22.0f, [[self class] barBtnSize].width, [[self class] barBtnSize].height);
        [self addSubview:_backButton];
    }
}

- (void)setBackNavButtonImage:(UIImage *)image
{
    if (image)
    {
        [_backButton setImage:image forState:UIControlStateNormal];
        [_backButton setImage:image forState:UIControlStateSelected];
        
        CGFloat leftInset = ([[self class] barBtnSize].width - image.size.width) / 2.0f;
        CGFloat topInset = ([[self class] barBtnSize].height - image.size.height) / 2.0f;
        leftInset = (leftInset >= 2.0f) ? leftInset / 2.0f : 0.0f;
        topInset = (topInset >= 2.0f) ? topInset / 2.0f : 0.0f;
        [_backButton setImageEdgeInsets:UIEdgeInsetsMake(topInset, leftInset, topInset, leftInset)];
        [_backButton setTitleEdgeInsets:UIEdgeInsetsMake(topInset, -image.size.width, topInset, leftInset)];
    }
}

- (void)setRightNavButton:(UIButton *)butt
{
    if (_rightButton)
    {
        [_rightButton removeFromSuperview];
        _rightButton = nil;
    }
    _rightButton = butt;
    if (_rightButton)
    {
        _rightButton.frame = [[self class] rightBtnFrame];
        [self addSubview:_rightButton];
    }
}

- (void)setRightNavButtonImage:(UIImage *)image
{
    if (image)
    {
        [_rightButton setImage:image forState:UIControlStateNormal];
        [_rightButton setImage:image forState:UIControlStateSelected];
    }
}

- (void)setNavTitle:(NSString *)strTitle
{
    [_titleLabel setText:strTitle];
}

- (void)setRightNavTwoButtonLeftButton:(UIButton *)leftbutt rightButton:(UIButton *)rightButt
{
    if (leftbutt)
    {
        if (_leftButton)
        {
            [_leftButton removeFromSuperview];
            _leftButton = nil;
        }
        _leftButton = leftbutt;
        if (_leftButton)
        {
            _leftButton.frame = [[self class] leftBtnFrame];
            [self addSubview:_leftButton];
        }
    }
    
    if (rightButt)
    {
        if (_rightButton)
        {
            [_rightButton removeFromSuperview];
            _rightButton = nil;
        }
        _rightButton = rightButt;
        if (_rightButton)
        {
            _rightButton.frame = [[self class] rightBtnFrame];
            [self addSubview:_rightButton];
        }
    }
}

- (void)setCurrentVCColor:(UIColor *)currentVCColor
{
    if (currentVCColor) {
        UIImage *image = [self imageWithColor:currentVCColor];
        _bgImageView.image = image;
    }
}

- (void)setImageAlpha:(CGFloat)imageAlpha
{
    _bgImageView.alpha = imageAlpha;
}

- (void)setBottomViewHidden:(BOOL)bottomViewHidden
{
    _bottomView.hidden = bottomViewHidden;
}

/**
 *在导航条上覆盖一层自定义视图。ps：搜索框..
 */
- (void)showCoverView:(UIView *)view
{
    [self showCoverView:view animation:NO];
}

- (void)showCoverView:(UIView *)view animation:(BOOL)isAnimation
{
    if (view)
    {
        [self hideOriginalBarItem:YES];
        [view removeFromSuperview];
        
        view.alpha = 0.4f;
        [self addSubview:view];
        if (isAnimation)
        {
            [UIView animateWithDuration:0.2f animations:^{
                view.alpha = 1.0f;
            }];
        }else
        {
            view.alpha = 1.0f;
        }
    }
}

- (void)showCoverViewOnTitleView:(UIView *)view
{
    if (view)
    {
        if (_titleLabel)
        {
            _titleLabel.hidden = YES;
        }
        [view removeFromSuperview];
        view.frame = _titleLabel.frame;
        [self addSubview:view];
    }
}

- (void)hideCoverView:(UIView *)view
{
    [self hideOriginalBarItem:NO];
    if (view && (view.superview == self))
    {
        [view removeFromSuperview];
    }
}

#pragma mark -

- (void)hideOriginalBarItem:(BOOL)isHide
{
    if (_leftButton)
    {
        _leftButton.hidden = isHide;
    }
    if (_rightButton)
    {
        _rightButton.hidden = isHide;
    }
    if (_titleLabel)
    {
        _titleLabel.hidden = isHide;
    }
    if (_backButton)
    {
        _backButton.hidden = isHide;
    }
}

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor) {
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    CGPoint startPoint = CGPointMake(rect.size.width/2, 0);
    CGPoint endPoint = CGPointMake(rect.size.width/2, rect.size.height/kEndPoint);
    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextSetStrokeColorWithColor(context, [[UIColor clearColor] CGColor]);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    if (!color)
    {
        color = [UIColor clearColor];
    }
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)imageWithGradients:(NSArray *)colours
{
    
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor * beginColor = [UIColor clearColor];
    UIColor * endColor = [UIColor clearColor];
    if (colours.count > 0) {
        beginColor = [colours objectAtIndex:0];
    }
    if (colours.count > 1) {
        endColor = [colours objectAtIndex:1];
    }
    drawLinearGradient(context, rect, beginColor.CGColor, endColor.CGColor);
    CGContextRestoreGState(context);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)setIsHiddenCover:(BOOL)isHiddenCover
{
    _isHiddenCover = isHiddenCover;
    if (_isHiddenCover) {
        _bottomView.hidden = YES;
    }
}

- (NSString *)titleText
{
    return _titleLabel.text;
}

@end

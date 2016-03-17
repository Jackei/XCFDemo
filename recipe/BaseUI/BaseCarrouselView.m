//
//  BaseCarrouselView.m
//  recipe
//
//  Created by qizhijian on 16/3/17.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import "BaseCarrouselView.h"

static NSTimeInterval SWITCH_PICTURE_INTERVAL = 5.0;

@implementation BaseCarrouselView
{
    BOOL isStopBrooksView;
}

@synthesize scrollView = _scrollView;
@synthesize currentPage = _curPage;
@synthesize datasource = _datasource;
@synthesize delegate = _delegate;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
    
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake(self.bounds.size.width * 3, self.bounds.size.height);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.contentOffset = CGPointMake(self.bounds.size.width, 0);
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.scrollsToTop = NO;
        [self addSubview:_scrollView];
        
        _curPage = 0;

        [self performSelector:@selector(switchImageItems) withObject:nil afterDelay:SWITCH_PICTURE_INTERVAL];
    }
    return self;
}

- (void)setDataource:(id<BaseCarrouselViewDatasource>)datasource
{
    _datasource = datasource;
    [self reloadData];
}

- (void)reloadData
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    isStopBrooksView = YES;
    _totalPages = [_datasource numberOfViewPages];
    
    if (_totalPages == 0) {
        return;
    }
    _curPage = 0;
    [self loadData];
    [self isStopAutomaticSliding:NO];
}

- (void)loadData
{
    if(_totalPages <= 0) {
        return;
    }
    
    NSArray *subViews = [_scrollView subviews];
    if([subViews count] != 0) {
        [subViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
    [self getDisplayImagesWithCurpage:_curPage];
    
    for (int i = 0; i < 3; i++)
    {
        UIView *v = [_curViews objectAtIndex:i];
        v.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [v addGestureRecognizer:singleTap];
        v.frame = CGRectOffset(v.frame, v.frame.size.width * i, 0);
        [_scrollView addSubview:v];
    }
    
    [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width, 0)];
}

- (void)getDisplayImagesWithCurpage:(NSInteger)page
{
    NSInteger pre = [self validPageValue:_curPage-1];
    NSInteger last = [self validPageValue:_curPage+1];
    
    if (!_curViews) {
        _curViews = [[NSMutableArray alloc] init];
    }
    
    [_curViews removeAllObjects];
    
    [_curViews addObject:[_datasource viewAtPageIndex:pre]];
    [_curViews addObject:[_datasource viewAtPageIndex:page]];
    [_curViews addObject:[_datasource viewAtPageIndex:last]];
}

- (NSInteger)validPageValue:(NSInteger)value
{
    if(value == -1) value = _totalPages - 1;
    if(value == _totalPages) value = 0;
    
    return value;
}

- (void)handleTap:(UITapGestureRecognizer *)tap
{
    if ([_delegate respondsToSelector:@selector(didClickViewPage:atPageIndex:)]) {
        [_delegate didClickViewPage:self atPageIndex:_curPage];
    }
}

- (void)setViewContent:(UIView *)view atPageIndex:(NSInteger)index
{
    if (index == _curPage)
    {
        [_curViews replaceObjectAtIndex:1 withObject:view];
        for (int i = 0; i < 3; i++)
        {
            UIView *v = [_curViews objectAtIndex:i];
            v.userInteractionEnabled = YES;
            UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
            [v addGestureRecognizer:singleTap];
            v.frame = CGRectOffset(v.frame, v.frame.size.width * i, 0);
            [_scrollView addSubview:v];
        }
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView
{
    int x = aScrollView.contentOffset.x;
    
    if(x >= (2*self.frame.size.width)) {
        _curPage = [self validPageValue:_curPage+1];
        [self loadData];
    }
    
    if(x <= 0) {
        _curPage = [self validPageValue:_curPage-1];
        [self loadData];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)aScrollView
{
    [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width, 0) animated:YES];
    
    if (_totalPages != 1)
    {
        [self isStopAutomaticSliding:NO];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self isStopAutomaticSliding:YES];
}

#pragma mark - 定时滚动视图

- (void)moveToTargetPosition:(CGFloat)targetX
{
    int x = _scrollView.contentOffset.x;
    
    if(x >= (2*self.frame.size.width)) {
        _curPage = [self validPageValue:_curPage+1];
        [self loadData];
    }
    
    if(x <= 0) {
        _curPage = [self validPageValue:_curPage-1];
        [self loadData];
    }
    
    [_scrollView setContentOffset:CGPointMake(targetX, 0) animated:YES];
}

- (void)switchImageItems
{
    if (_totalPages == 0) {
        [self performSelector:@selector(switchImageItems) withObject:nil afterDelay:SWITCH_PICTURE_INTERVAL];
        return;
    }
    CGFloat targetX = _scrollView.contentOffset.x + _scrollView.frame.size.width;
    [self moveToTargetPosition:targetX];
    
    [self performSelector:@selector(switchImageItems) withObject:nil afterDelay:SWITCH_PICTURE_INTERVAL];
}

- (void)isStopAutomaticSliding:(BOOL)isStop
{
    if (isStopBrooksView != isStop)
    {
        if (isStop)
        {
            [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(switchImageItems) object:nil];
        }
        else
        {
            [self performSelector:@selector(switchImageItems) withObject:nil afterDelay:SWITCH_PICTURE_INTERVAL];
        }
        
        isStopBrooksView = isStop;
    }
}

- (void)dealloc
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(switchImageItems) object:nil];
    self.delegate = nil;
    self.datasource = nil;
}

@end

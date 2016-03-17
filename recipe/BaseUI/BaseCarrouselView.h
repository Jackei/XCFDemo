//
//  BaseCarrouselView.h
//  recipe
//
//  Created by qizhijian on 16/3/17.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BaseCarrouselViewDelegate;
@protocol BaseCarrouselViewDatasource;

@interface BaseCarrouselView : UIView<UIScrollViewDelegate>
{
    UIScrollView  *_scrollView;
    
    id<BaseCarrouselViewDelegate> _delegate;
    id<BaseCarrouselViewDatasource> _datasource;
    
    NSInteger _totalPages;
    NSInteger _curPage;
    
    NSMutableArray *_curViews;
}

@property (nonatomic,readonly) UIScrollView *scrollView;
@property (nonatomic,assign) NSInteger currentPage;

@property (nonatomic,retain,setter = setDataource:) id<BaseCarrouselViewDatasource> datasource;
@property (nonatomic,retain,setter = setDelegate:) id<BaseCarrouselViewDelegate> delegate;

- (void)reloadData;
- (void)setViewContent:(UIView *)view atPageIndex:(NSInteger)index;
- (void)switchImageItems;

- (void)isStopAutomaticSliding:(BOOL)isStop;

@end

@protocol BaseCarrouselViewDelegate <NSObject>

@optional
- (void)didClickViewPage:(BaseCarrouselView *)csView atPageIndex:(NSInteger)index;

@end

@protocol BaseCarrouselViewDatasource <NSObject>

@required
- (NSInteger)numberOfViewPages;
- (UIView *)viewAtPageIndex:(NSInteger)index;

@end

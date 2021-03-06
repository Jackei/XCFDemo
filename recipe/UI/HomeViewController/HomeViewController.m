//
//  HomeViewController.m
//  recipe
//
//  Created by qizhijian on 16/3/15.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCellHeader.h"
#import "HomeTableViewCellOne.h"
#import "HomeTableViewCellTwo.h"
#import "HomeTableViewCellThree.h"
#import "HomeTableViewCellFour.h"
#import "HomeTableViewCellFive.h"
#import "HomeADInfo.h"
#import "HomeInfo.h"

static NSString *one = @"HomeTableViewCellOne";
static NSString *two = @"HomeTableViewCellTwo";
static NSString *three = @"HomeTableViewCellThree";
static NSString *four = @"HomeTableViewCellFour";
static NSString *five = @"HomeTableViewCellFive";
static NSString *header = @"HomeTableViewCellHeader";

@interface HomeViewController () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *homeTableView;

@end

@implementation HomeViewController
{
    HomeInfo *item;
    UIRefreshControl *headerControl;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.homeTableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self registerTableViewCell];
    
    self.homeTableView.estimatedRowHeight = 280;
    self.homeTableView.rowHeight = UITableViewAutomaticDimension;
    self.homeTableView.tableFooterView = [UIView new];
    
    
    headerControl = [[UIRefreshControl alloc] init];
    [headerControl addTarget:self action:@selector(headerRefresh) forControlEvents:UIControlEventValueChanged];
    [self.homeTableView addSubview:headerControl];
    
//    [self requestAD];
    [self requestData];
}

- (void)registerTableViewCell
{
    [self.homeTableView registerNib:[UINib nibWithNibName:@"HomeTableViewCellOne" bundle:nil] forCellReuseIdentifier:one];
    [self.homeTableView registerNib:[UINib nibWithNibName:@"HomeTableViewCellTwo" bundle:nil] forCellReuseIdentifier:two];
    [self.homeTableView registerNib:[UINib nibWithNibName:@"HomeTableViewCellThree" bundle:nil] forCellReuseIdentifier:three];
    [self.homeTableView registerNib:[UINib nibWithNibName:@"HomeTableViewCellFour" bundle:nil] forCellReuseIdentifier:four];
    [self.homeTableView registerNib:[UINib nibWithNibName:@"HomeTableViewCellFive" bundle:nil] forCellReuseIdentifier:five];
    [self.homeTableView registerNib:[UINib nibWithNibName:@"HomeTableViewCellHeader" bundle:nil] forCellReuseIdentifier:header];
}

- (void)headerRefresh
{
    [headerControl endRefreshing];
}

- (void)requestAD
{
//    http://api.xiachufang.com/v2/init_page_v5.json?timezone=Asia%2FShanghai&api_sign=e8563b3a69791fcf1b56c994d057169d&api_key=0f9f79be1dac5f003e7de6f876b17c00&origin=iphone&version=5.2.3
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    dict[@"slot_name"] = @"homepage_banner_ad1";
    dict[@"height"] = @"172.5";
    dict[@"width"] = @"690";
    dict[@"origin"] = @"iphone";
    dict[@"api_sign"] = @"36aeb8b73678ac908731fb409dc4be1b";
    dict[@"supported_types"] = @"1";
    dict[@"version"] = @"5.2.3";
    dict[@"api_key"] = @"0f9f79be1dac5f003e7de6f876b17c00";
    
    [[QSRequest sharedClient] requestWithName:AD withParameters:dict successCallBack:^(HomeADInfo *adInfo) {
        
        NSLog(@"%@",adInfo);
        
    } failCallback:^(NSString *error) {
        
    }];
}

- (void)requestData
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    dict[@"cursor"] = @"";
    dict[@"origin"] = @"iphone";
    dict[@"api_sign"] = @"bf5ff1b24f0cf1a190633edb475534ef";
    dict[@"size"] = @"2";
    dict[@"timezone"] = @"Asia/Shanghai";
    dict[@"version"] = @"5.2.3";
    dict[@"api_key"] = @"0f9f79be1dac5f003e7de6f876b17c00";
    
    [[QSRequest sharedClient] requestWithName:Home withParameters:dict successCallBack:^(HomeInfo *info) {
       
        item = info;
        [self.homeTableView reloadData];
        
    } failCallback:^(NSString *error) {
        
        NSLog(@"%@",error);
        
    }];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return item.content.issues.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((HomeContentIssuesInfo *)item.content.issues[section]).items.count+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableViewCellBase *baseCell = nil;
    if (indexPath.row == 0)
    {
        baseCell = [tableView dequeueReusableCellWithIdentifier:header];
        [baseCell fillData:((HomeContentIssuesInfo *)item.content.issues[indexPath.section])];
    }
    else
    {
        HomeContentIssuesDetailInfo *info = ((HomeContentIssuesInfo *)item.content.issues[indexPath.section]).items[indexPath.row-1];
        switch ([info.detailTemplate integerValue]) {
            case 1:
                baseCell = [tableView dequeueReusableCellWithIdentifier:one];
                break;
            case 2:
                baseCell = [tableView dequeueReusableCellWithIdentifier:two];
                break;
            case 3:
                baseCell = [tableView dequeueReusableCellWithIdentifier:three];
                break;
            case 4:
                baseCell = [tableView dequeueReusableCellWithIdentifier:four];
                break;
            case 5:
                baseCell = [tableView dequeueReusableCellWithIdentifier:five];
                break;
            default:
                baseCell = [[HomeTableViewCellBase alloc] init];
                break;
        }
        [baseCell fillData:info];
    }
    
    return baseCell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 54;
    }
    else
    {
        HomeContentIssuesDetailInfo *info = ((HomeContentIssuesInfo *)item.content.issues[indexPath.section]).items[indexPath.row-1];
        switch ([info.detailTemplate integerValue]) {
            case 1:
                return 299;
                break;
            case 2:
                return 299;
                break;
            case 3:
                return 299;
                break;
            case 4:
                return 299;
                break;
            case 5:
                return 299;
                break;
            default:
                return 44;
                break;
        }
    }
}

- (UITableView *)homeTableView
{
    if (_homeTableView == nil)
    {
        
    }
    return _homeTableView;
}

@end

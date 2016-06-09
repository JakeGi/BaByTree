//
//  SecondViewController.m
//  BaByTree
//
//  Created by 萝卜 on 16/6/8.
//  Copyright © 2016年 萝卜. All rights reserved.
//

#import "SecondViewController.h"
#import "UIView+sengMent.h"
#import "oneTableView.h"
#import "twoTableView.h"



@interface SecondViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UISegmentedControl *segment;

@property (nonatomic, strong) UIScrollView *scrollView;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self settingScrollView];
    [self settingSegment];
}

- (void)settingScrollView{
    
    oneTableView *tableView = [[oneTableView alloc] initWithFrame:CGRectMake(self.view.width,64, self.view.width, self.view.height-64-49)];
    twoTableView *tableViewOne = [[twoTableView alloc] initWithFrame:CGRectMake(0,64, self.view.width, self.view.height-64-49)];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    
    scrollView.delegate = self;
    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    scrollView.directionalLockEnabled = YES;
    
    scrollView.contentInset = UIEdgeInsetsMake(-64, 0, -49, 0);
        scrollView.contentSize = CGSizeMake(2 *self.view.width, self.view.height);
    scrollView.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:scrollView];
    [scrollView addSubview:tableView];
    [scrollView addSubview:tableViewOne];
    _scrollView = scrollView;
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.x;
    
    self.segment.selectedSegmentIndex = offset/self.view.width;
}

- (void)settingSegment{
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"热帖",@"我的圈"]];
    
    self.navigationItem.titleView = segment;
    
    segment.width = 120;
    segment.selectedSegmentIndex = 0;
    
    [segment addTarget:self action:@selector(segmentBtnClick) forControlEvents:UIControlEventValueChanged];
    _segment = segment;
    
    
}

- (void)segmentBtnClick{
    NSLog(@"切换页面");
    self.scrollView.contentOffset = CGPointMake(self.segment.selectedSegmentIndex * self.view.width, 0);
}




@end

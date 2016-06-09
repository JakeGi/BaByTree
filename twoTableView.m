//
//  twoTableView.m
//  BaByTree
//
//  Created by 萝卜 on 16/6/8.
//  Copyright © 2016年 萝卜. All rights reserved.
//

#import "twoTableView.h"

@interface twoTableView ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation twoTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //self.backgroundColor = [UIColor redColor];
        self.delegate = self;
        self.dataSource = self;
        self.bounces = NO;
    }
    return self;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    cell.textLabel.text = @"反复";
    cell.detailTextLabel.text = @"分别为北京";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //cell.backgroundColor = [UIColor redColor];
    return cell;
    
}
@end

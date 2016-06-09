//
//  oneTableView.m
//  BaByTree
//
//  Created by 萝卜 on 16/6/8.
//  Copyright © 2016年 萝卜. All rights reserved.
//

#import "oneTableView.h"

@interface oneTableView () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation oneTableView

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
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellOne"];
    cell.textLabel.text = @"名字";
    cell.detailTextLabel.text = @"这是我我的签名";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //cell.backgroundColor = [UIColor redColor];
    return cell;
    
}

@end

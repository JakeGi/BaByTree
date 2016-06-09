//
//  ViewController.m
//  BaByTree
//
//  Created by 萝卜 on 16/6/4.
//  Copyright © 2016年 萝卜. All rights reserved.
//

#import "ViewController.h"
#import "AnimationViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 当视图对象的userInteractionEnabled设置为NO的时候，用户触发的事件，如触摸，键盘等，将会被该视图忽略（其他视图照常响应），并且该视图对象也会从事件响应队列中被移除。 当userInteractionEnabled设为YES时，则事件可以正常的传递给该视图对象。 userInteractionEnabled的属性默认值就是YES。
    [[self imageViews] setUserInteractionEnabled:YES];
    
    _myscrollview.backgroundColor = [UIColor cyanColor];
    
    [self addRotationGestureToView:[self imageViews]];
    [self addTapGestureToView:[self imageViews] numberOfTaps:1];

}
- (void)addRotationGestureToView:(UIView *)view
{
    AnimationViewController *rotation = [[AnimationViewController alloc] initWithTarget:self action:@selector(rotating:)];
    [view addGestureRecognizer:rotation];
}

//单击次数
- (void)addTapGestureToView:(UIView *)view numberOfTaps:(NSInteger)numberOfTaps
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [tap setNumberOfTapsRequired:numberOfTaps];
    [view addGestureRecognizer:tap];
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
}

- (void)rotating:(AnimationViewController *)recognizer
{
    UIView *view = [recognizer view];
    [view setTransform:CGAffineTransformRotate([view transform], [recognizer rotation])];
}
@end

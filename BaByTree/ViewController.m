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
    
    //   [self addRotationGestureToView:[self view]];
    //   [self addTapGestureToView:[self view] numberOfTaps:1];

    
    
    myscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 44,self.view.frame.size.width, 100)];
    myscrollview.directionalLockEnabled = YES; //只能一个方向滑动
    myscrollview.pagingEnabled = YES; //是否翻页
//    myscrollview.backgroundColor = [UIColor blackColor];
    myscrollview.showsVerticalScrollIndicator = NO; //垂直方向的滚动指示
    myscrollview.indicatorStyle = UIScrollViewIndicatorStyleWhite;//滚动指示的风格
    myscrollview.showsHorizontalScrollIndicator = YES;//水平方向的滚动指示
    myscrollview.delegate = self;
    CGSize newSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height + 1);
    [myscrollview setContentSize:newSize];
    
    float x=0;
    float y=0;
    float width =self.view.frame.size.width;
    float height = 100;
    
    UIImageView *myimage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pregnancy_progress_btn"]];
    [myimage setContentMode:UIViewContentModeScaleAspectFill];
    [myimage setFrame:CGRectMake(x, y, width, height)];
    
    [self addRotationGestureToView:[self imageViews]];
    [self addTapGestureToView:[self imageViews] numberOfTaps:1];
    
//    [self.view addSubview:myscrollview];
    [myscrollview addSubview:myimage];
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

- (void)tapped:(UITapGestureRecognizer *)recognizer
{
    UIView *view = [recognizer view];
    [view setTransform:CGAffineTransformMakeRotation(0)];
}


@end

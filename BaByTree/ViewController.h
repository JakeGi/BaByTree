//
//  ViewController.h
//  BaByTree
//
//  Created by 萝卜 on 16/6/4.
//  Copyright © 2016年 萝卜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>
{
    UIScrollView *myscrollview;
}
@property (nonatomic,retain) IBOutlet UIScrollView *myscrollview;
@property (weak, nonatomic) IBOutlet UIImageView *imageViews;


@end


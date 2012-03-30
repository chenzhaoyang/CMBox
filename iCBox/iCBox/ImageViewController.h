//
//  ImageViewController.h
//  iCBox
//
//  Created by Zhao Yang Chen on 12-03-29.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController
{
    IBOutlet UIPageControl *pageControl;
    IBOutlet UIImageView *imageView1;
    IBOutlet UIImageView *imageView2;
    UIImageView *tempImageView, *bgImageView;
    int prevPage;
}

@property (strong, nonatomic) UIPageControl *pageControl;
@property (strong, nonatomic) UIImageView *imageView1;
@property (strong, nonatomic) UIImageView *imageView2;

- (void) pageTurning: (UIPageControl *) pageController;

@end

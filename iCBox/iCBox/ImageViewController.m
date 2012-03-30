//
//  ImageViewController.m
//  iCBox
//
//  Created by Zhao Yang Chen on 12-03-29.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ImageViewController.h"

@implementation ImageViewController

@synthesize pageControl;
@synthesize imageView1, imageView2;

- (void)viewDidLoad
{
    //---initialize the first imageview to display an image---
    [imageView1 setImage:[UIImage imageNamed:@"girl.jpg"]];
    tempImageView = imageView2;
    
    //---make the first imageview visible and hide the second---
    [imageView1 setHidden:NO];
    [imageView2 setHidden:YES];
    
    //---add the event handler for the page control---
    [pageControl addTarget:self
                    action:@selector(pageTurning:)
          forControlEvents:UIControlEventValueChanged];    
    
    prevPage = 0;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//---when the page control's value is changed---
- (void) pageTurning: (UIPageControl *) pageController {
    //---get the page number you can turning to---
    NSInteger nextPage = [pageController currentPage];
    switch (nextPage) {
        case 0:
            [tempImageView setImage:
             [UIImage imageNamed:@"girl.jpg"]];
            break;
        case 1:
            [tempImageView setImage:
             [UIImage imageNamed:@"evening.jpg"]];
            break;
        case 2:
            [tempImageView setImage:
             [UIImage imageNamed:@"eye.jpg"]];
            break;
        case 3:
            [tempImageView setImage:
             [UIImage imageNamed:@"Stars.jpg"]];
            break;
        case 4:
            [tempImageView setImage:
             [UIImage imageNamed:@"tigger.jpg"]];
            break;
        case 5:
            [tempImageView setImage:
             [UIImage imageNamed:@"woo.jpg"]];
            break;            
        default:
            break;
    }
    
    //---switch the two imageview views---
    if (tempImageView.tag == 0) { //---imageView1---
        tempImageView = imageView2;
        bgImageView = imageView1;
    }
    else {                        //---imageView2---
        tempImageView = imageView1;
        bgImageView = imageView2;
    }
    
    UIViewAnimationOptions transitionOption;
    
    if (nextPage > prevPage) 
        //---if moving from left to right--- 
        transitionOption = UIViewAnimationOptionTransitionFlipFromLeft;
    else
        //---if moving from right to left---
        transitionOption = UIViewAnimationOptionTransitionFlipFromRight;
    
    //---animate by flipping the images---
    [UIView transitionWithView:tempImageView    
                      duration:2.5          
                       options:transitionOption      
                    animations:^{         
                        [tempImageView setHidden:YES];
                    }
                    completion:NULL];    
    
    [UIView transitionWithView:bgImageView    
                      duration:2.5          
                       options:transitionOption     
                    animations:^{         
                        [bgImageView setHidden:NO];
                    }
                    completion:NULL];    
    
    prevPage = nextPage;    
}

@end

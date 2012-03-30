//
//  ViewController.m
//  iCBox
//
//  Created by Zhao Yang Chen on 12-03-29.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize txtName;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setTxtName:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)btnClicked:(id)sender {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Hello"
                                                    message:@"Here I come!"
                                                   delegate:self 
                                          cancelButtonTitle:@"OKay"
                                          otherButtonTitles:@"Option 1", @"Option 2", nil];

    [alert show];
}

- (IBAction)btnOkay:(id)sender {
    NSString* str = [[NSString alloc]initWithFormat:@"Hello, %@", txtName.text];
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Hello"
                                                    message:str
                                                   delegate:self 
                                          cancelButtonTitle:@"OKay"
                                          otherButtonTitles:nil];
    
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"%d", buttonIndex);
}

- (IBAction)btnActionSheet:(id)sender {
    UIActionSheet *action = 
    [[UIActionSheet alloc] initWithTitle:@"Title of Action Sheet"
                                delegate:self
                       cancelButtonTitle:@"OK"
                  destructiveButtonTitle:@"Delete Message"
                       otherButtonTitles:@"Option 1", @"Option 2", nil];
    [action showInView:self.view];
}

- (void) actionSheet:(UIActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%d", buttonIndex);
}

@end

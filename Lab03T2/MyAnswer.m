//
//  MyAnswer.m
//  Lab03T2
//
//  Created by a1 on 27/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyAnswer.h"
#import "Lab03T1AppDelegate.h"

@implementation MyAnswer

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void) viewDidAppear:(BOOL)animated{
    Lab03T1AppDelegate *delegate = (Lab03T1AppDelegate *)[[UIApplication sharedApplication] delegate];

    if (delegate.urAnswer==[delegate.a result]) {
        msg.text = @"Correct!";
        delegate.CorrectCount++;
        //[delegate addCorrect:[delegate.a expression:delegate.urAnswer]];
    }else
    {
        msg.text = @"Wrong";
        expression.text = [delegate.a expression:delegate.urAnswer];
        delegate.WrongCount++;
        //[delegate addWrong:[delegate.a expression:delegate.urAnswer]];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

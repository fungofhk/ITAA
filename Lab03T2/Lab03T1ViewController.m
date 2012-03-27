//
//  Lab03T1ViewController.m
//  Lab03T2
//
//  Created by a1 on 27/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Lab03T1ViewController.h"
#import "MyAnswer.h"
#import "Lab03T1AppDelegate.h"
#import "Arithmetic.h"
#import "sqlite3.h"

@implementation Lab03T1ViewController

-(void)insertRecord{
    Lab03T1AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    int temp;
    
    if(delegate.urAnswer==[delegate.a result]){
        temp = 1;
    }else {
        temp = 0;
    }
    
    NSString *sqlString = [NSString stringWithFormat:@"insert or replace into '%@' ('%@', '%@') values (?, ?)", @"arithmetic", @"result", @"correct", [delegate.a expression:delegate.urAnswer], temp];
    
    const char *sql = [sqlString UTF8String];
    sqlite3_stmt *statement;
    
    if(sqlite3_prepare_v2(delegate.db, sql, -1, &statement, nil) == SQLITE_OK){
        sqlite3_bind_text(statement, 1, [[delegate.a expression:delegate.urAnswer] UTF8String], -1, NULL);
        sqlite3_bind_int(statement, 2, temp);
    }
    
    if(sqlite3_step(statement)!=SQLITE_DONE){
        NSAssert(0,@"Error updating table.");
    } else {
        sqlite3_close(delegate.db);
       // NSString *msg 
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"My Answer" style:UIBarButtonItemStyleBordered target:self action:@selector(goToAnswer)];
    self.navigationItem.title = @"Calculate";
    self.navigationItem.rightBarButtonItem = barButtonItem;
    [barButtonItem release];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)goToAnswer
{
    MyAnswer *myAnswer = [[MyAnswer alloc] init];    
    [self.navigationController pushViewController:myAnswer animated:YES];   
    [self insertRecord];
    [myAnswer release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    Lab03T1AppDelegate *delegate = (Lab03T1AppDelegate *)[[UIApplication sharedApplication] delegate];
    char tempOper;
    
    switch (oper.selectedSegmentIndex) {
        case 0:
            tempOper = '+';
            break;
        case 1:
            tempOper = '-';
            break;
        case 2:
            tempOper = '*';
            break;
        case 3:
            tempOper = '/';
            break;
        default:
            break;
    }
    
    if([operand1.text length] !=0 && [operand2.text length]!=0){
        [delegate.a setAll:[operand1.text intValue] Operand2:[operand2.text intValue] Operator:tempOper];    
        delegate.urAnswer = [urAnswer.text intValue]; 
    }
    operand1.text = nil;
    operand2.text = nil;
    urAnswer.text=nil;
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
   	[super viewDidDisappear:animated];
}
- (BOOL) textFieldShouldReturn:(UITextField *)theTextField
{
    [theTextField resignFirstResponder];
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end

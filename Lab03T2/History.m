//
//  History.m
//  Lab03T2
//
//  Created by a1 on 9/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "History.h"
#import "Lab03T1AppDelegate.h"
#import "sqlite3.h"

@implementation History

-(void)getAllRowsFromTable:(NSString *)tableName{
    Lab03T1AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSString *correctSql = [NSString stringWithFormat:@"select result from %@ where correct = 1", tableName];
    NSString *wrongSql = [NSString stringWithFormat:@"select result from %@ where correct = 0", tableName];
    
    sqlite3_stmt *statement;
    
    if(sqlite3_prepare_v2(delegate.db, [correctSql UTF8String], -1, &statement, nil)==SQLITE_OK){
        while (sqlite3_step(statement) == SQLITE_ROW){
            char *result = (char *)sqlite3_column_text(statement, 0);
            NSString *resultString = [[NSString alloc] initWithUTF8String:result];
            [correctArray addObject:resultString];
            [resultString release];
        }
        sqlite3_finalize(statement);
    }
    
    if(sqlite3_prepare_v2(delegate.db, [wrongSql UTF8String], -1, &statement, nil)==SQLITE_OK){
        while (sqlite3_step(statement) == SQLITE_ROW){
            char *result = (char *)sqlite3_column_text(statement, 0);
            NSString *resultString = [[NSString alloc] initWithUTF8String:result];
            [wrongArray addObject:resultString];
            [resultString release];
        }
        sqlite3_finalize(statement);
    }
    tableArray = [[NSArray alloc] initWithObjects:correctArray, wrongArray, nil];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(NSString *)itemForIndexPath:(NSIndexPath *)indexPath{
    //Lab03T1AppDelegate *delegate = (Lab03T1AppDelegate *)[[UIApplication sharedApplication] delegate];
    return [[tableArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
}

- (void)viewWillAppear:(BOOL)animated
{       
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    correctArray = [[NSMutableArray alloc] init];
    wrongArray = [[NSMutableArray alloc] init];
    [self getAllRowsFromTable:@"arithmetic"];    
    
    [self.tableView reloadData];
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    //Lab03T1AppDelegate *delegate = (Lab03T1AppDelegate *)[[UIApplication sharedApplication] delegate];
    return [[tableArray objectAtIndex:section] count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section){
        case 0:
            return @"Correct";
            break;
        case 1:
            return @"Incorrect";
            break;
        default:
            return nil;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    NSString *cellValue = [self itemForIndexPath:indexPath];
    cell.textLabel.text = cellValue;
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end

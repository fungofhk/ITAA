//
//  Lab03T1AppDelegate.m
//  Lab03T2
//
//  Created by a1 on 27/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Lab03T1AppDelegate.h"

#import "Lab03T1ViewController.h"

#import "MyAnswer.h"
#import "Statistic.h"
#import "History.h"

@implementation Lab03T1AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize a;
@synthesize urAnswer;
@synthesize CorrectCount;
@synthesize WrongCount;
@synthesize history;
@synthesize correctArray, wrongArray;
@synthesize tableArray;
@synthesize db;

- (void)dealloc
{
    [navController release];
    [_window release];
    [_viewController release];
    [super dealloc];
}

-(NSString *)filePath:(NSString *)fileName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *fileDirectory = [[paths objectAtIndex:0] stringByAppendingPathComponent:fileName];
    NSLog(@"%@", fileDirectory);
    return fileDirectory;
}

-(void)openDB{
    if(sqlite3_open([[self filePath:@"db1.sql"] UTF8String], &db) != SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0,@"Database filed to open.");
    }
}

-(void)createTable:(NSString *)field1 field2:(NSString *)field2 field3:(NSString *)field3{
    char *error;

    NSString *sql = [NSString stringWithFormat:@"create table if not exists arithmetic ('%@' integer primary key, '%@' text, '%@' int);", field1, field2, field3];
    if(sqlite3_exec(db,[sql UTF8String], NULL, NULL, &error)){
        sqlite3_close(db);
        NSAssert(0,@"Table failed to create.");
    }
}

-(void)addCorrect:(NSString *)expr{
    [correctArray addObject:expr];
}

-(void)addWrong:(NSString *)expr{    
    [wrongArray addObject:expr];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{    
    [self openDB];
    [self createTable:@"aid" field2:@"result" field3:@"correct"];
    //correctArray = [[NSMutableArray alloc] init];
    //wrongArray = [[NSMutableArray alloc] init];
    //tableArray = [[NSArray alloc] initWithObjects:correctArray, wrongArray, nil];
    
    CorrectCount = 0;
    WrongCount = 0;
    a = [[Arithmetic alloc] init];
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[Lab03T1ViewController alloc] initWithNibName:@"Lab03T1ViewController" bundle:nil] autorelease];
    Lab03T1ViewController *begin = [[Lab03T1ViewController alloc] init];
    navController = [[UINavigationController alloc] init];
    [navController pushViewController:begin animated:NO];
    navController.title=@"Calculate";
    
    
    Statistic *statistic = [[Statistic alloc] init];
    statistic.title=@"Statistic";
    History *history = [[History alloc]init];
    history.title=@"History";
    tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = [NSArray arrayWithObjects:navController, statistic, history,nil];
    [self.window addSubview:tabBarController.view];
    //self.window.rootViewController = self.viewController;
    
    [self.window makeKeyAndVisible];
    [begin release];
    [statistic release];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end

//
//  Lab03T1AppDelegate.h
//  Lab03T2
//
//  Created by a1 on 27/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "History.h"
#import "sqlite3.h"
#import "Arithmetic.h"

@class Lab03T1ViewController;

@interface Lab03T1AppDelegate : UIResponder <UIApplicationDelegate>
{
    UINavigationController *navController;
    UITabBarController *tabBarController;
    sqlite3 *db;
    Arithmetic *a;
    int urAnswer;
    int CorrectCount;
    int WrongCount;
    History *history;
    /*NSArray *tableArray;
    NSMutableArray *correctArray;
    NSMutableArray *wrongArray;*/
}

-(void)addCorrect:(NSString *)expr;

-(void)addWrong:(NSString *)expr;

-(NSString *)filePath:(NSString *) fileName;

-(void)openDB;

-(void)createTable:(NSString *)field1
            field2:(NSString *)field2
            field3:(NSString *)field3;

@property (readwrite) sqlite3 *db;

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) Lab03T1ViewController *viewController;

@property (readwrite) int urAnswer;

@property (readwrite) int CorrectCount;

@property (readwrite) int WrongCount;

@property (strong, nonatomic) Arithmetic *a;

@property (strong, nonatomic) History *history;

@property (strong, nonatomic) NSMutableArray *correctArray, *wrongArray;

@property (strong, nonatomic) NSArray *tableArray;

@end

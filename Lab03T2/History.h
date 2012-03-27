//
//  History.h
//  Lab03T2
//
//  Created by a1 on 9/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface History : UITableViewController <UITableViewDataSource, UITabBarDelegate>{
    NSArray *tableArray;
    NSMutableArray *correctArray;
    NSMutableArray *wrongArray;
}

-(void)getAllRowsFromTable:(NSString *)tableName;

@end

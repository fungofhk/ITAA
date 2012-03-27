//
//  testAppDelegate.h
//  Testing
//
//  Created by Lucifer on 12/3/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class testViewController;

@interface testAppDelegate : UIResponder <UIApplicationDelegate>{
    int *gg;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) testViewController *viewController;

@end

//
//  Lab03T1ViewController.h
//  Lab03T2
//
//  Created by a1 on 27/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@interface Lab03T1ViewController : UIViewController
{
    IBOutlet UITextField *operand1;
    IBOutlet UITextField *operand2;
    IBOutlet UITextField *urAnswer;
    IBOutlet UISegmentedControl *oper;
}

-(void)insertRecord;
@end

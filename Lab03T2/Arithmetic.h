//
//  Arithmetic.h
//  Lab03T2
//
//  Created by a1 on 27/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Arithmetic : NSObject
{
    int operand1;
    int operand2;
    char _operator;
}

-(int) result;
-(void) setAll:(int)op1 Operand2:(int)op2 Operator:(char)oper;
-(NSString *) expression:(int)ans;
@end

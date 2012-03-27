//
//  Arithmetic.m
//  Lab03T2
//
//  Created by a1 on 27/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Arithmetic.h"

@implementation Arithmetic

- (int) result
{
    switch (_operator)
    {
		case '+':
			return operand1 + operand2;
			break;
		case '-':
			return operand1 - operand2;
			break;
		case '*':
			return operand1 * operand2;
			break;
		case '/':
			return operand1 / operand2;
			break;
		default:
			NSLog(@"Error in operator!");
			break;
	}
	return 0;
}

- (void) setAll:(int)op1 Operand2:(int)op2 Operator:(char)oper
{
    operand1 = op1;
	operand2 = op2;
	_operator = oper;
}
- (NSString *) expression:(int)ans
{
    NSString *expr;
    expr = [NSString stringWithFormat:@"%d %c %d = %d", operand1, _operator, operand2, [self result]];
    return expr;
}

@end
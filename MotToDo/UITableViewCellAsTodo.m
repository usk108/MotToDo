//
//  UITableViewCellAsTodo.m
//  MotToDo
//
//  Created by 鳥羽 祐輔 on 2014/07/10.
//  Copyright (c) 2014年 Yusuke Toba. All rights reserved.
//

#import "UITableViewCellAsTodo.h"
#import <objc/runtime.h>

@implementation UITableViewCell (Action)

static char stateKey; // 状態用のキー

@dynamic state;

#pragma mark - Setter/Getter

- (void)setState:(int)state
{
    NSLog(@"in setState state = %d",state);
    NSNumber *statenumber =[NSNumber numberWithInt:state];
    NSLog(@"in setState NSNumber = %@",statenumber);
    objc_setAssociatedObject(self, &stateKey,statenumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (int)state
{
    return [objc_getAssociatedObject(self,&stateKey) intValue];
}

@end

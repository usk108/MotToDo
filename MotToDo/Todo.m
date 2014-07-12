//
//  Todo.m
//  MotToDo
//
//  Created by 鳥羽 祐輔 on 2014/07/13.
//  Copyright (c) 2014年 Yusuke Toba. All rights reserved.
//

#import "Todo.h"

@implementation Todo

static char todoid;

@synthesize text = _text;
@synthesize state = _state;

-(char *)getTodoKey{
    NSLog(@"todoid is %c",todoid);
    NSLog(@"todoid is %s",&todoid);
    return &todoid;
}

+(id)initTodo{
    return[[self alloc] init];
}


@end

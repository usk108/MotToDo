//
//  Todo.h
//  MotToDo
//
//  Created by 鳥羽 祐輔 on 2014/07/13.
//  Copyright (c) 2014年 Yusuke Toba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (strong,nonatomic) NSString *text;
@property (nonatomic) int state;

-(char *)getTodoKey;
+(id)initTodo;

@end

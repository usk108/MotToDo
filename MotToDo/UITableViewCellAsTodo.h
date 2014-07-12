//
//  UITableViewCellAsTodo.h
//  MotToDo
//
//  Created by 鳥羽 祐輔 on 2014/07/10.
//  Copyright (c) 2014年 Yusuke Toba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@interface UITableViewCell (Action)

//@property NSInteger state;
//@property (nonatomic,readwrite,getter = getState, setter=setState:)int state;
@property (nonatomic)int state;
@property (nonatomic)Todo* todo;

@end

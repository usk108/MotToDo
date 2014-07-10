//
//  UITableViewCellAsTodo.m
//  MotToDo
//
//  Created by 鳥羽 祐輔 on 2014/07/10.
//  Copyright (c) 2014年 Yusuke Toba. All rights reserved.
//

#import "UITableViewCellAsTodo.h"
#import <objc/runtime.h>

@implementation UITableViewCellAsTodo
static char stateKey; // 状態用のキー

@dynamic state;

#pragma mark - Setter/Getter

// 表示フレームの保持
- (void)setState:(int)state
{
    //NSValue *value = [NSValue valueWithCGRect:inFrame];
    objc_setAssociatedObject(self, &stateKey,
                             [NSNumber numberWithInt:state], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// 保持された表示時フレームの取得
- (int)getState
{
    return [objc_getAssociatedObject(self, &stateKey) state];
}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  Sound.h
//  MotToDo
//
//  Created by 鳥羽 祐輔 on 2014/07/10.
//  Copyright (c) 2014年 Yusuke Toba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface Sound : NSObject

+(id)initSound;
-(id)init;
-(void)setSound;
-(void)cheerPlay;
-(void)praisePlay;

@end

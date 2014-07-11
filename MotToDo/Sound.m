//
//  Sound.m
//  MotToDo
//
//  Created by 鳥羽 祐輔 on 2014/07/10.
//  Copyright (c) 2014年 Yusuke Toba. All rights reserved.
//

#import "Sound.h"

@implementation Sound{
    //音のファイルの所在を示すURL
    CFURLRef soundURL;
    //サウンドIDを生成、iOSはこの値をもとに再生する音を識別する
    SystemSoundID soundID;
    NSMutableArray *praiseSoundIDs;
    NSMutableArray *cheerSoundIDs;

}

-(void)setSound{
    praiseSoundIDs = [NSMutableArray array];
    cheerSoundIDs = [NSMutableArray array];
    
    int i;
    NSArray *cheerSoundFiles = @[@"ganbareganbare",@"oikaketemasuka",@"ganbareyo",@"atsukunareyo"];
    NSArray *praiseSoundFiles = @[@"chancegakuru",@"fujisanda",@"fight-shibasaki"];
    CFBundleRef mainBundle = CFBundleGetMainBundle();
    
    for(i=0;i<cheerSoundFiles.count;i++){
        soundURL = CFBundleCopyResourceURL(mainBundle,(__bridge CFStringRef)cheerSoundFiles[i],CFSTR("wav"),nil);
        //soundURLをもとに、soundIDを生成
        AudioServicesCreateSystemSoundID(soundURL, &soundID);
        [cheerSoundIDs addObject:@(soundID)];
    }
    for(i=0;i<praiseSoundFiles.count;i++){
        soundURL = CFBundleCopyResourceURL(mainBundle,(__bridge CFStringRef)praiseSoundFiles[i],CFSTR("wav"),nil);
        //soundURLをもとに、soundIDを生成
        AudioServicesCreateSystemSoundID(soundURL, &soundID);
        [praiseSoundIDs addObject:@(soundID)];
    }
    
    
    
}

//soundIDが示す音を再生する
-(void)cheerPlay{
    int i = arc4random()%4;
    soundID = [[cheerSoundIDs objectAtIndex:i] unsignedLongValue];
    AudioServicesPlaySystemSound(soundID);
}

//soundIDが示す音を再生する
-(void)praisePlay{
    int i = arc4random()%3;
    soundID = [[praiseSoundIDs objectAtIndex:i] unsignedLongValue];
    AudioServicesPlaySystemSound(soundID);
}

+(id)initSound{
    return[[self alloc] init];
}

-(id)init{
    self = [super init];
    [self setSound]; //「-(void)setSound」を呼び、音を設定
    return self;
}

@end
